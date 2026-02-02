# Prior Art: Tools That Use Git (or Git-like CAS) for Structured Data

Researched how other projects have solved the "git as a database" problem. The apparatus design uses git plumbing as a content-addressable substrate for structured knowledge artifacts. These projects span a spectrum from minimal (git-dit: issues are just commits) to maximalist (Dolt: a full SQL database reimplemented on a git-like Merkle DAG). The relevant design lessons cluster around four themes: object modeling, content-defined chunking, merge semantics, and the boundary between git-native storage and purpose-built CAS.

## 1. git-dit -- Distributed Issue Tracker

[git-dit](https://github.com/git-dit/git-dit) takes the most minimal possible approach: an issue *is* a commit. A comment *is* a commit. There are no structured data files -- no JSON, YAML, or schemas. Metadata is attached via git trailers (`git interpret-trailers`), the same mechanism used for `Signed-off-by` lines. Issues live as orphan commit chains under custom refs, separate from the project's commit history.

**Storage model:** Each issue is a chain of commits. The initial commit creates the issue (its message is the issue body). Subsequent commits in the chain are comments. Tags/labels are trailer key-value pairs in commit messages. No tree objects are populated -- the commits carry only messages, not file content.

**What it gets right for our purposes:** Demonstrates that git commits can carry structured metadata without any blob/tree content. The trailer mechanism is a lightweight key-value store already built into git. Custom refs (`refs/dit/`) provide namespace isolation.

**What it gets wrong:** No structured data means no schema evolution, no machine-readable queries, no validation. The commit-message-as-database approach makes programmatic access painful. It's a proof of concept that git *can* do this, not a demonstration that it *should* do it this way.

**Relevance to apparatus:** The apparatus design already surpasses this -- we use blobs for structured content and trees for hierarchy, not just commit messages. But git-dit validates our ref-namespace isolation approach and demonstrates that the commit chain (our per-structure ref) is a viable organizational primitive.

## 2. git-bug -- Distributed Bug Tracker (operation-based model)

[git-bug](https://github.com/git-bug/git-bug) is architecturally more sophisticated than git-dit. It stores bug data as git objects (*not* files), using an operation-based model with Lamport clocks for distributed ordering.

**Storage model:**

- **Operations, not state.** Rather than storing the current state of a bug, git-bug stores a sequence of operations (Create, AddComment, SetTitle, SetStatus, etc.). The current state is computed by replaying operations in order. This is essentially event sourcing in git.
- **OperationPacks as blobs.** Operations from a single author session are grouped into an `OperationPack`, serialized as JSON, and stored as a git blob. Multiple operations can share a single blob.
- **Tree structure.** Each commit's tree contains: an `ops` directory (blobs of serialized operations), optional media attachments, and Lamport clock entries stored as *empty blobs whose filenames encode the clock value* (e.g., `create-clock-14`, `edit-clock-137`). This is a clever abuse of the git tree -- using filenames as data rather than blob content.
- **Commit DAG.** Commits form a DAG per entity, supporting concurrent edits from multiple authors. A merge commit combines divergent operation histories.
- **Ref namespace.** `refs/bugs/<entity-id>` for bugs, `refs/identities/<entity-id>` for identities. Remote tracking uses `refs/remotes/<remote>/bugs/<entity-id>`.
- **Identity model.** Entity IDs are the hash of the first operation (content-addressed identity). Operations are individually addressable by `hash(json(op))`.

**Lamport clocks for ordering:** git-bug explicitly rejects timestamps for ordering (clocks can be wrong or gamed) and uses Lamport logical clocks instead. Each operation carries a monotonically increasing counter. The invariant: a parent commit's clock must be strictly less than its child's. Violations cause the commit to be rejected. This gives deterministic ordering within the DAG without relying on wall-clock time.

**Conflict resolution:** Deterministic rules based on operation types. The DAG structure plus Lamport clocks establish a total order. No manual merge resolution needed -- the operation replay always converges to the same state.

**Relevance to apparatus:** Several direct lessons:

- The operation-based model is an interesting alternative to our state-based approach. We store the current content of each object; git-bug stores the history of changes. Our approach is simpler (read the blob, get the current state) but git-bug's is more naturally suited to distributed conflict resolution.
- The Lamport clock technique could be valuable if apparatus data is ever edited concurrently across clones. Our current design assumes sequential access through the CLI.
- The "empty blob with data in the filename" trick is worth noting -- it encodes metadata in the tree structure without needing additional blobs. We could potentially use this for lightweight metadata.
- The `hash(json(op))` identity model is essentially what our (assigned-id, SHA) citation system does at the citation layer -- content-addressing for precision.

## 3. Noms -- The Versioned, Forkable, Syncable Database

[Noms](https://github.com/attic-labs/noms) (by Attic Labs, now defunct) was the intellectual predecessor to Dolt. It is the origin of the prolly tree and represents the most thorough attempt to build a general-purpose content-addressable database with git semantics.

**Core insight:** Noms asked: "What if we applied git's storage model not to files, but to arbitrary structured data?" The answer required solving the *canonical serialization problem* -- making the storage representation deterministic regardless of mutation history.

**Content-addressable chunks:**

- All data is decomposed into chunks, each addressed by truncated SHA-512.
- Each chunk encodes a single logical value.
- Chunks are immutable and deduplicated.
- A database is just a key-value store of `hash -> chunk`, plus named dataset pointers (analogous to git refs).
- The entire database rolls up to a single 20-byte hash representing its complete state at any moment.

**The canonical serialization problem:**

The fundamental challenge: B-trees (the standard data structure for sorted data) are *not* history-independent. The internal structure of a B-tree depends on the order of insertions and deletions. Two B-trees containing identical data can have completely different internal layouts. This means you cannot content-address B-tree nodes -- the same logical data would produce different hashes depending on how it was constructed. This is the problem that prolly trees solve.

**Prolly trees (invented by the Noms team):**

A prolly tree is a search tree where chunk boundaries are determined by a *rolling hash* of the data content, not by fixed size limits or insertion order:

1. Sort key-value pairs and serialize them into a byte stream.
2. Slide a 64-byte window through the byte stream, computing a rolling hash (buzhash) at each position.
3. When the hash exhibits a specific pattern (12 high bits all set to 1, probability ~1/4096), mark a chunk boundary.
4. Store each chunk in the content-addressable store.
5. Build an index of (last-key, chunk-address) pairs for the chunks.
6. Repeat the chunking process on the index, recursively, until a single root chunk remains.

The result is a B-tree-like structure where the shape is determined entirely by the data content, not mutation history. Same data = same tree = same root hash, always. Average chunk size is ~4KB, with the boundary probability tunable.

**Key properties:**

- **History independence.** The same set of key-value pairs always produces the same tree, regardless of insertion order. This is the property that makes content-addressing work for mutable collections.
- **Structural sharing.** Two versions of a dataset that differ in a few values share almost all their chunks. Storage cost is proportional to the diff, not the total size.
- **Efficient diff.** Comparing two prolly trees: if a node's hash matches, its entire subtree is identical -- skip it. Only walk into nodes where hashes differ. Diff scales with the size of the difference, not the size of the data.
- **Mutation cost.** A single value change affects ~1.016 chunks per tree level on average (the 0.016 comes from the ~1.6% chance of moving a boundary). A 4-level tree (~281TB capacity) requires ~4 chunk writes per mutation.

**Type system:** Noms has a built-in type system (Boolean, Number, String, Blob, Set\<T\>, List\<T\>, Map\<K,V\>, Ref\<T\>, Struct, Union). Collections are automatically chunked. Types are self-describing -- every chunk carries its type in a header. This means any chunk can be decoded without external schema information.

**Type accretion:** Schema evolution occurs through union expansion. Committing `Set<Number>` creates a commit typed for that structure. Later committing `Set<String>` to the same dataset yields a union type `Set<Number|String>` in the commit metadata, creating self-documenting schema history without rewriting existing data.

**Chunk store abstraction:** Noms can run on any key-value backend: local filesystem (NBS files), S3, or decentralized stores like IPFS. The chunk store interface is minimal: `Get(hash) -> chunk`, `Put(chunk)`, `Has(hash) -> bool`.

**Limitations that led to Dolt:**

- Noms had no SQL interface -- you worked with its type system directly via Go APIs.
- The buzhash rolling hash performed poorly on low-entropy data (ordered keys, time series). Chunk sizes became wildly uneven.
- Both keys and values were included in the rolling hash calculation, meaning value updates could shift chunk boundaries unnecessarily.
- Chunk size followed a geometric distribution (high variance), causing read performance problems with large chunks.

**Relevance to apparatus:** The prolly tree is not directly applicable to our scale (hundreds to low thousands of objects), but the *principles* are:

- **History independence** is why content-addressing works for structured data. Our design inherits this from git's own object model (blobs are content-addressed, trees are content-addressed from their entries), but we should be aware that this only holds because we're storing immutable snapshots, not mutable collections.
- **The canonical serialization problem** doesn't bite us directly because we're not building indexes as Merkle trees -- our index is a derived file, not a content-addressed structure. But if we ever wanted content-addressed indexes (for citation graph snapshots, for instance), we'd need a prolly-tree-like approach.
- **The chunk store abstraction** validates our decision to use git as a "dumb" CAS. Git's object store is just `hash -> blob` with some structure on top. The store is separable from the semantics.

## 4. Dolt -- SQL Database with Git Versioning

[Dolt](https://github.com/dolthub/dolt) is the production successor to Noms. It implements a MySQL-compatible SQL database where table data is stored in prolly trees, and the entire database is organized as a git-style commit graph.

**Architecture:** Three open-source components:

- **Noms-derived storage engine** -- prolly trees for table data, content-addressable chunk store for persistence
- **go-mysql-server** -- SQL query engine
- **Vitess (fork)** -- MySQL wire protocol and parsing

**How table data becomes a Merkle tree:**

1. A table's rows are sorted by primary key.
2. Keys and values are serialized as byte arrays.
3. The byte stream is chunked using a rolling hash with content-defined boundaries (~4KB average).
4. Each chunk is stored in a content-addressable block store (table files with binary-searchable indexes).
5. Internal nodes map (highest-key-in-child, child-address) pairs, chunked the same way.
6. The root hash represents the entire table's content.
7. Table schema is stored in a separate prolly tree.
8. Schema hash + data hash = table hash.
9. All table hashes combined = database hash (root value).
10. Root values are organized into a commit graph (Merkle DAG of commits).

**Improvements over Noms:**

- **Key-only hashing.** Dolt only considers keys (not values) when computing chunk boundaries. This guarantees that value updates never shift boundaries -- a significant write-amplification improvement.
- **Size-aware chunking.** Instead of a fixed probability pattern, Dolt uses a probability distribution function that considers current chunk size. This produces normally-distributed chunk sizes (vs. Noms' geometric distribution), giving more consistent read performance.
- **Better hash function.** Noms' buzhash was replaced with a stronger hash that handles low-entropy key sequences (e.g., timestamps) without degenerate behavior.

**Three-way merge at the data level:**

This is Dolt's most distinctive capability and the most relevant to apparatus design:

- **Three inputs:** the "into" branch head, the "from" branch head, and their common ancestor.
- **Diff-based.** Compute two diffs: ancestor-to-into and ancestor-to-from. Stream both diffs in primary key order.
- **Cell-level granularity.** When the same row is modified on both branches, Dolt checks each *column* independently. If different columns changed, both changes apply (no conflict). Conflict only arises when the same (row, column) pair was changed to different values on both branches.
- **Conflict storage.** Conflicts are stored in a separate prolly tree alongside the table data. Each conflict row records the value from all three commits (into, from, ancestor), enabling programmatic resolution.
- **Conflict blocking.** Unresolved conflicts prevent commits -- you must resolve before committing. Resolution options: `--ours`, `--theirs`, or manual per-row SQL updates.
- **Schema merge.** Dolt also merges schemas three-way. Non-overlapping column changes merge cleanly. Conflicting schema changes (e.g., both branches rename the same column differently) produce schema conflicts.

**Fast merge (2025):** The original merge algorithm scaled with the number of changed rows on *both* branches. The new algorithm operates on prolly tree *nodes* directly -- if a subtree's hash matches the ancestor, skip it entirely. Patches are generated at the node level and applied structurally. This is an asymptotic improvement: merge time now scales with the size of the diff, not the size of the changed-rows set.

**Relevance to apparatus:**

- **Cell-level merge** is the right mental model for structured data merge. Git merges files as text (line-level). Dolt merges tables as cells (row, column). Apparatus would merge objects as fields -- if two branches modify different fields of the same finding, both changes should apply. This is beyond our current scope (we assume sequential CLI access) but is the correct direction if we ever need concurrent apparatus editing.
- **Conflict-as-data** (storing all three versions in a queryable structure) is superior to git's conflict markers. If apparatus ever needs merge, conflicts should be first-class objects, not text annotations.
- **The commit graph wrapping prolly trees** is structurally identical to what we're building: git commits wrapping structured data in trees/blobs, with refs as named pointers. Dolt validates this architecture at massive scale.

## 5. Other notable approaches

### Git LFS -- Clean/smudge filters as an indirection layer

[Git LFS](https://git-lfs.com/) solves a different problem (large binary files) but its mechanism is architecturally interesting. It uses git's [clean/smudge filter](https://www.kenmuse.com/blog/secret-life-of-git-lfs/) protocol to intercept file operations:

- **Clean filter** (on `git add`): replaces file content with a small pointer file (containing a SHA-256 OID), stores the actual content in `.git/lfs/objects/` keyed by that hash.
- **Smudge filter** (on checkout): reads the pointer file, retrieves actual content from `.git/lfs/objects/` or downloads from a remote.
- **Pointer file format**: a plain-text key-value blob that commits into git's object store in place of the actual content.

This is a *two-tier CAS*: git's SHA-1 object store holds pointer files, while a separate SHA-256 store holds the actual content. The filter protocol is the bridge. This pattern could be relevant if apparatus ever needs to store large artifacts (diagrams, datasets) without bloating the git object store.

### Git notes -- Metadata without history rewriting

[Git notes](https://www.kenmuse.com/blog/storing-data-in-git-objects-with-notes/) (`refs/notes/`) store annotations on existing git objects without changing their hashes. Internally, a notes ref points to a tree where filenames are object SHAs and blob content is the note. Gerrit uses `refs/notes/review` for code review data. Notes support namespacing (`--ref`), allowing multiple metadata layers (e.g., `refs/notes/junit`, `refs/notes/sonarqube`).

Relevance: our "annotation" mechanism (post-hoc metadata on frozen objects) could potentially use git notes rather than separate sub-objects. The advantage: annotations wouldn't change the annotated object's tree or commit hash. The disadvantage: notes have weaker tooling support and aren't automatically transferred between remotes. Our current design (annotations as separate objects) is likely better for apparatus, but notes remain an option for truly lightweight metadata.

### lakeFS -- Prolly trees for object storage versioning

[lakeFS](https://lakefs.io/) applies git semantics to data lake object storage (S3, GCS, Azure). It uses a two-layer prolly tree: leaf nodes are "ranges" (1-8MB SSTable files mapping logical paths to object addresses), grouped into "meta-ranges" that form a Merkle tree. Commits are sets of meta-ranges. This is essentially Dolt's architecture applied to file-path-keyed object storage rather than row-keyed table data.

Relevance: validates that prolly-tree-based Merkle DAGs scale to exabyte-class data. The range/meta-range two-layer structure is an interesting optimization we don't need at our scale but demonstrates how the pattern generalizes.

### Fossil -- SQLite as the git alternative

[Fossil SCM](https://fossil-scm.org/) takes the opposite approach from all of the above: instead of using git's object model for structured data, it uses SQLite as the object store. Same Merkle DAG of artifacts, same content-addressing, but stored in SQL tables rather than git's packfile format. Tickets are stored as sequences of change artifacts (key-value deltas applied to build current state -- similar to git-bug's operation model). The SQL backing enables rich querying that git's object store cannot provide natively.

Relevance: Fossil validates a point our design already embraces -- the storage substrate and the query layer are separable concerns. Fossil uses SQL for both; we use git for storage and a derived index for queries. The key lesson from Fossil is that their ticket system (operation-based change artifacts, like git-bug) emerged independently from git-bug's design, suggesting this is a natural pattern for structured data in version-controlled stores.

### GitDocumentDB -- Git as a CRDT

[GitDocumentDB](https://gitddb.com/) frames git itself as a conflict-free replicated data type (CRDT). It identifies two CRDT properties in git: (1) MV-Register -- a single piece of data can have multiple concurrent revisions without data loss, and (2) add-only monotonic DAG -- the commit graph only grows, never shrinks, making merge structurally safe. GitDocumentDB builds a JSON document database API on top of isomorphic-git, using a "Git-CRDT" layer for deterministic conflict resolution.

Relevance: the CRDT framing is theoretically interesting for apparatus. Our commit-per-structure model is already an append-only DAG. If we ever need distributed conflict resolution, the Git-CRDT approach (deterministic merge rules applied to the operation history) is a viable path that doesn't require changing the storage substrate.

### IPFS -- Content-addressable storage as a network primitive

[IPFS](https://docs.ipfs.tech/concepts/merkle-dag/) generalizes git's Merkle DAG into a network-level content-addressing system. Data is chunked, each chunk addressed by a CID (content identifier using multihash), and chunks are distributed across a peer-to-peer network. IPFS uses IPLD (InterPlanetary Linked Data) as a data model layer on top of the raw DAG, supporting multiple codecs (dag-pb, dag-cbor, dag-json).

Key differences from git: IPFS uses configurable hash functions (via multihash), has a maximum block size (~4MB vs. git's effectively unlimited blobs), supports multiple serialization codecs for the same logical data, and includes built-in content discovery via DHT. Noms was explicitly designed to work with decentralized chunk stores like IPFS as backends.

Relevance: IPFS validates that content-addressable Merkle DAGs are a general-purpose distributed data primitive, not just a version-control mechanism. The multihash approach (self-describing hash function) is worth noting -- git's SHA-1 is baked in, which is a long-term concern (the SHA-256 transition is still incomplete). If apparatus ever needs to interoperate with non-git CAS systems, the IPLD data model is the closest thing to a standard.

## Summary of design lessons for apparatus

| Concern | Lesson | Source |
|---------|--------|--------|
| Namespace isolation | Custom ref namespaces (`refs/apparatus/`) work; no tool discovers them by default | git-dit, git-bug, our own experiments |
| Object identity | Content-addressed IDs (hash of content) are the natural primitive; assigned IDs are a layer on top | git-bug, Noms |
| Canonical representation | Content-addressing requires history-independent serialization; our immutable-blob approach sidesteps this, but prolly trees solve it for mutable collections | Noms, Dolt |
| Merge granularity | Cell-level (field-level) merge is the correct granularity for structured data, not line-level | Dolt |
| Operation vs. state | Storing operations (event sourcing) enables better distributed conflict resolution; storing state is simpler for sequential access | git-bug, Fossil, GitDocumentDB |
| Ordering without timestamps | Lamport clocks provide causal ordering in distributed systems without wall-clock trust | git-bug |
| Two-tier CAS | Clean/smudge filters can bridge between git's object store and external storage | Git LFS |
| Metadata without mutation | Git notes annotate objects without changing their hashes | Git notes, Gerrit |
| Storage/query separation | The storage substrate (CAS) and the query layer (index/SQL) are independent concerns | Fossil, Dolt, our own design |
| Append-only DAG as CRDT | Git's commit graph is naturally a CRDT; deterministic merge rules make it a distributed database primitive | GitDocumentDB |

## Sources

- [git-dit -- GitHub](https://github.com/git-dit/git-dit)
- [git-bug -- GitHub](https://github.com/git-bug/git-bug)
- [git-bug data model -- DeepWiki](https://deepwiki.com/git-bug/git-bug)
- [Noms -- GitHub](https://github.com/attic-labs/noms)
- [Noms intro](https://github.com/attic-labs/noms/blob/master/doc/intro.md)
- [Noms decentralized architecture](https://github.com/attic-labs/noms/blob/master/doc/decent/about.md)
- [Dolt -- GitHub](https://github.com/dolthub/dolt)
- [Dolt storage engine docs](https://docs.dolthub.com/architecture/storage-engine)
- [Dolt architecture overview](https://docs.dolthub.com/architecture/architecture)
- [How Dolt stores table data](https://www.dolthub.com/blog/2020-04-01-how-dolt-stores-table-data/)
- [How to chunk your database into a Merkle tree](https://www.dolthub.com/blog/2022-06-27-prolly-chunker/)
- [Prolly trees -- Dolt docs](https://docs.dolthub.com/architecture/storage-engine/prolly-tree)
- [Prolly trees -- DoltHub blog](https://www.dolthub.com/blog/2024-03-03-prolly-trees/)
- [Cell-level three-way merge in Dolt](https://www.dolthub.com/blog/2020-07-15-three-way-merge/)
- [Three-way merge in a SQL database](https://www.dolthub.com/blog/2024-06-19-threeway-merge/)
- [Announcing fast merge](https://www.dolthub.com/blog/2025-07-16-announcing-fast-merge/)
- [Git LFS internals](https://www.kenmuse.com/blog/secret-life-of-git-lfs/)
- [How Git LFS works](https://jaredkhan.com/blog/how-git-lfs-works)
- [Storing data in git objects with notes](https://www.kenmuse.com/blog/storing-data-in-git-objects-with-notes/)
- [lakeFS](https://lakefs.io/)
- [Fossil technical overview](https://fossil-scm.org/home/doc/tip/www/tech_overview.wiki)
- [Fossil ticket system](https://fossil-scm.org/home/doc/trunk/www/tickets.wiki)
- [Fossil vs. Git](https://fossil-scm.org/home/doc/tip/www/fossil-v-git.wiki)
- [GitDocumentDB](https://gitddb.com/blog/)
- [IPFS Merkle DAG docs](https://docs.ipfs.tech/concepts/merkle-dag/)
- [Git's database internals -- GitHub blog](https://github.blog/open-source/git/gits-database-internals-i-packed-object-store/)
