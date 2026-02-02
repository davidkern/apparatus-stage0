# Prior Art Synthesis: What Git-Plumbing Tools Teach Us

Synthesis of findings from 12 source-available tools that extend git or use git-like content-addressable storage. Organized by apparatus design concern rather than by tool.

## Tools examined

| Tool | What it stores in git | Scale |
|------|----------------------|-------|
| **git-bug** | Bug entities as operation DAGs | Thousands of bugs, production use |
| **git-annex** | File location tracking, metadata | Millions of files, 14+ years production |
| **git-appraise** | Code review data as git notes | Google-internal + open source |
| **Gerrit NoteDb** | Code review lifecycle as commits | Millions of changes, Google/Android-scale |
| **Jujutsu (jj)** | VCS metadata alongside git objects | Growing adoption, replaces git porcelain |
| **DVC** | ML experiment tracking via custom refs | Wide ML ecosystem adoption |
| **git-dit** | Issues as commit chains with trailers | Proof of concept |
| **Dolt** | SQL tables in prolly trees (git-like CAS) | Production SQL database |
| **Noms** | Structured data in prolly trees | Research prototype, predecessor to Dolt |
| **Fossil** | SCM + tickets + wiki in SQLite-backed Merkle DAG | SQLite project's own SCM |
| **GitDocumentDB** | JSON documents via isomorphic-git | Research/library |
| **lakeFS** | Data lake versioning via prolly trees | Exabyte-scale production |

## 1. Separate store vs. shared `.git/`

The apparatus design uses a separate bare repo at `$DEVENV_STATE/apparatus/store/`. How does this compare?

| Tool | Approach | Why |
|------|----------|-----|
| git-bug | Shared `.git/`, custom refs | Simpler; accepts `git log --all` pollution |
| git-annex | Shared `.git/`, orphan branch + `.git/annex/` | Branch is invisible to porcelain; object store is in `.git/annex/` |
| Gerrit | Shared repo, custom refs | Server-controlled; users don't interact directly |
| DVC | Shared `.git/` for refs; `.dvc/cache/` for data | Refs hidden from porcelain; large data is external |
| Jujutsu | Three modes: internal (`.jj/repo/store/git/`), colocated, external | Internal mode = separate bare repo, like apparatus |
| Fossil | Entirely separate (SQLite file, not git at all) | Different substrate entirely |

**Finding**: The separate-store approach is validated by Jujutsu (internal mode) and is the strongest isolation. git-bug and git-annex accept the ergonomic costs of sharing `.git/` because their use case requires the data to travel with `git clone`. The apparatus design's configurable remote resolves this -- the store is separate locally, but data can share a remote.

**No tool has solved the IDE visibility problem declaratively.** git-bug, git-annex, and DVC all suffer from IDE tools rendering their custom refs in graph visualizations. The separate-store approach eliminates this entirely.

## 2. Ref namespace design

| Tool | Pattern | Granularity |
|------|---------|-------------|
| git-bug | `refs/bugs/<entity-id>` | One ref per entity |
| git-annex | `refs/heads/git-annex` | Single branch for all metadata |
| git-appraise | `refs/notes/devtools/{reviews,discuss,ci,analyses}` | One ref per data type |
| Gerrit | `refs/changes/YZ/XYZ/{N,meta}` | One ref per change + sharding |
| DVC | `refs/exps/<hash>/<name>` | One ref per experiment, keyed by baseline |
| Jujutsu | `refs/jj/keep/*` | GC protection refs only |
| Apparatus | `refs/apparatus/{journal,investigation,design}/<id>` | One ref per structure instance |

**Finding**: The apparatus design's per-structure-instance refs are closest to git-bug's per-entity refs and Gerrit's per-change refs. This is the proven pattern for data with independent lifecycles. git-annex's single-branch approach works because its data (location logs) has uniform structure; the apparatus's heterogeneous structure types argue against a single branch.

**Gerrit's ref sharding** (`refs/changes/YZ/XYZ/`) prevents filesystem performance degradation when ref counts reach tens of thousands. The apparatus won't hit this scale soon, but the pattern is worth noting for the future.

**The single-ref alternative** (discussed in the design's `002 - recommendation` document) was independently validated by git-annex's success with a single branch. However, git-annex's use case (append-only logs with union merge) differs fundamentally from apparatus (structured objects with lifecycle states). The per-structure ref design is correct for apparatus.

## 3. Serialization and the canonical representation problem

This is where the prior art provides the sharpest lessons.

| Tool | Format | Canonical? | Why |
|------|--------|-----------|-----|
| git-bug | JSON (one blob per OperationPack) | Yes (single serializer, Go's json.Marshal) | Content-addressed entity IDs depend on stable serialization |
| git-annex | Custom line format (timestamp + status + UUID) | Yes (trivially: one value per line, fixed format) | Union merge requires line-level deduplication |
| git-appraise | Single-line JSON | Yes (by constraint: one complete JSON object per line) | cat_sort_uniq merge requires identical lines to deduplicate |
| Gerrit | Commit footers (key: value) + JSON for comments | Footers are canonical (git's own commit format); JSON varies | Server serializes; no distributed merge of JSON blobs |
| Dolt | Binary prolly tree chunks | Yes (by construction: content-defined boundaries) | Content-addressing of tree nodes requires history independence |
| Noms | Binary chunks with type headers | Yes (by construction) | Same as Dolt |
| Apparatus (proposed) | YAML | **No** | Problem identified in critique; unresolved |

**Finding**: Every tool that uses content-addressed identity for its stored data has solved the canonical serialization problem. The approaches cluster into three strategies:

1. **Canonical by construction** (Noms, Dolt): Binary formats where the representation IS the canonical form. No alternative serialization exists.
2. **Canonical by constraint** (git-annex, git-appraise): Text formats so simple that variation is impossible. One value per line. Fixed field order. No optional syntax.
3. **Canonical by convention** (git-bug): Use a single serializer (Go's `json.Marshal` with sorted keys) and never reserialize from parsed data.

The apparatus design uses YAML, which falls into none of these categories. YAML has optional quoting, multiple string representations, optional document markers, and no defined key order. The critique document (001) already identified this. The prior art strengthens the argument: **switch to JSON with sorted keys, or define a byte-level canonical form for YAML**.

git-appraise's approach is instructive: timestamps are zero-padded 10-digit strings placed first in the JSON, so lexicographic sort of serialized lines approximates chronological order. This dual-purpose design (human-readable AND machine-sortable) is elegant.

## 4. Merge and concurrent access

| Tool | Model | Mechanism |
|------|-------|-----------|
| git-bug | Operation-based CRDT | Lamport clocks for ordering; deterministic replay |
| git-annex | Union merge | Concatenate + deduplicate lines; timestamps resolve conflicts |
| git-appraise | cat_sort_uniq | Git's built-in notes merge strategy |
| Gerrit | Server-serialized | Rebase meta commits; no concurrent writes |
| Dolt | Cell-level three-way merge | Field-by-field comparison; conflicts stored as data |
| Apparatus (proposed) | `update-ref --stdin` with verify | Compare-and-swap; second writer fails and retries |

**Finding**: The apparatus assumes single-writer sequential access, which is appropriate for stage 0-1. If distributed editing is ever needed, the prior art identifies two proven paths:

- **Operation-based** (git-bug, Fossil tickets): Store operations, not state. Deterministic replay produces convergent state. Requires Lamport clocks or similar ordering mechanism. Natural fit for append-heavy data.
- **Field-level merge** (Dolt): Three-way merge at the granularity of individual fields rather than files or lines. Conflicts are stored as first-class data, not text markers.

git-annex's union merge is the simplest approach but requires data designed for concatenation — every line must be self-contained with a timestamp. This constrains the data model significantly.

**The compare-and-swap pattern** (`update-ref --stdin` with `verify`) used by the apparatus design is the correct foundation. It's what Gerrit does for its centralized case. The question is what happens after CAS failure — retry, merge, or error. For now, error is sufficient.

## 5. Metadata encoding in git's own structures

Several tools encode metadata in git structures themselves, not just in blob content:

| Technique | Tool | How |
|-----------|------|-----|
| **Empty blobs as metadata carriers** | git-bug | Tree entries named `edit-clock-17`, `version-2` pointing to shared empty blob |
| **Commit trailers** | Gerrit, git-dit | Structured key-value pairs in commit messages, parseable by `git interpret-trailers` |
| **Commit footers queryable via for-each-ref** | Gerrit | `--format='%(trailers:key=Patch-set)'` extracts structured data from commit messages |
| **Tree entry names as data** | git-bug | Clock values and version numbers encoded in filenames |
| **Custom commit headers** | Jujutsu | `change-id` header in commit objects (non-standard but preserved by git) |
| **Git config sections** | Gerrit | `[label "Code-Review"]` sections in `project.config` on `refs/meta/config` |

**Finding**: The apparatus design stores all metadata in blob content (YAML `_meta.yaml` files). This is correct for the primary data model, but the design should leverage git's own metadata channels for operational data:

- **Commit trailers** (from recommendation document 002) for the audit log. Each apparatus commit could carry `Apparatus-Op: add-entry`, `Object-Id: <id>`, `Status-Transition: open -> closed`. This makes `git log` on any ref a human-readable operation history without parsing trees. Gerrit validates this at scale with 29 footer key types.
- **Git config** (from recommendation document 002) for local-only state like index generation counters and gc thresholds. Avoids inventing a custom config format.
- **Empty-blob-as-metadata** (git-bug) is clever but fragile — it couples metadata to tree structure in ways that make tree manipulation harder. Not recommended for apparatus.

## 6. Derived data and index design

| Tool | Authoritative state | Derived caches | Rebuild mechanism |
|------|-------------------|----------------|-------------------|
| git-annex | git-annex branch | SQLite databases in `.git/annex/` | Delete and rebuild from branch; staleness detected by comparing stored ref SHA to branch HEAD |
| Gerrit | NoteDb commit chains | In-memory caches, Lucene indexes | Reindex from NoteDb; no persistent derived files in git |
| Jujutsu | Git objects + `.jj/repo/store/extra/` | Commit graph index in `.jj/repo/index/` | Rebuild from git objects |
| DVC | `.dvc` files + `dvc.lock` in git | SQLite hash cache in `.dvc/tmp/` | Rebuild by rehashing files |
| Apparatus (proposed) | Git objects under `refs/apparatus/` | `$GIT_DIR/info/apparatus-index.json` | `apparatus rebuild-index` walks all refs |

**Finding**: Every tool follows the same pattern: **git objects are authoritative; everything else is a cache with a rebuild path**. The apparatus design already embodies this. git-annex provides the most detailed validation:

- Caches store the ref SHA they were built from, enabling incremental updates via diff rather than full rebuild.
- Schema version mismatches trigger full rebuild (delete + regenerate), not migration.
- Atomic updates: the ref SHA is stored in the same transaction as the cached data.
- All caches are explicitly documented as deletable without data loss.

The apparatus should adopt git-annex's **staleness detection via stored ref SHA**. The current design mentions a "generation counter" but doesn't specify how it relates to ref state. Storing the SHA of each ref's tip commit at index-build time, then comparing on read, is more robust.

## 7. The journal/write-ahead-log pattern

git-annex's journal (`.git/annex/journal/`) is a write-ahead log that batches metadata changes before committing to the git-annex branch. Changes are written as files to the journal directory. Reads check the journal first (overlay semantics), then fall back to `git cat-file`. Periodically, the journal is flushed to a git commit.

**Finding**: The apparatus design commits directly on every write operation. This is simpler but means every `apparatus journal add` or `apparatus investigation add-entry` involves the full git plumbing pipeline (hash-object, mktree, commit-tree, update-ref). For single operations this is fine. For batch operations (importing existing research, bulk status transitions), a journal/WAL pattern would amortize the cost.

This is an optimization, not an architectural concern. The apparatus can add a WAL later without changing the storage format — it's purely a write-path optimization that's invisible to readers.

## 8. GC and object lifecycle

| Tool | GC approach |
|------|-------------|
| git-bug | Relies on git's auto-gc (triggered by porcelain commands it doesn't use) |
| git-annex | Runs `git gc` explicitly during sync operations |
| Jujutsu | Creates `refs/jj/keep/*` refs to prevent GC of reachable-only-from-operation-log commits |
| Gerrit | Server-managed; separate packing for NoteDb vs. code objects |
| Apparatus (proposed) | Unspecified (critique point #4) |

**Finding**: Jujutsu's `refs/jj/keep/*` pattern is relevant. The apparatus creates commits reachable only from custom refs under `refs/apparatus/`. Since the store is a separate bare repo, all objects are apparatus objects, so git gc will preserve everything reachable from any ref. But if the apparatus ever deletes a structure (removing its ref), all its objects become unreachable and will be collected by gc. This is probably the desired behavior, but should be documented.

The recommendation document (002) suggests `git maintenance register` for automated gc scheduling. This is the cleanest approach — no custom gc triggers needed.

## 9. Identity model

| Tool | Primary identity | Secondary identity |
|------|-----------------|-------------------|
| git-bug | Content hash of first operation | None (entity ID IS the content hash) |
| git-annex | Backend-specific key (e.g., `SHA256E-s71983--4a55...`) | Repository UUID for location tracking |
| Gerrit | Server-assigned change number | Change-Id (content hash of initial commit message) |
| Jujutsu | Git commit SHA (substrate) | Change ID (random 16-byte, persists across rewrites) |
| Dolt | Primary key (user-defined) | Content hash (prolly tree node addresses) |
| Apparatus (proposed) | Assigned ID (UUID v7 candidate) | Content SHA (git blob hash) |

**Finding**: The apparatus design's two-layer identity (assigned ID for logical continuity + content SHA for precision) is independently validated by Jujutsu (change ID + commit SHA) and implicitly by Gerrit (change number + patchset commit SHA). This is the universal pattern: a stable identifier for "what logical thing is this?" and a content-addressed identifier for "what exactly does it contain right now?"

git-bug's pure-content-addressed approach (no assigned IDs) works because bug entities never need stable identity across content changes — the entity is its history, and the history is append-only. The apparatus's finding/assumption objects DO need stable identity across potential edits, so assigned IDs are correct.

## 10. Novel techniques worth noting

### git-bug: Empty blobs as metadata carriers
Tree entries named `edit-clock-17` pointing to the same empty blob exploit content-addressable deduplication. All such entries across all trees share a single blob object. Clever, but couples metadata to tree structure in ways that complicate tree manipulation.

### git-annex: Lines designed for union merge
Every file on the git-annex branch is structured so that concatenation of any two valid versions produces a valid version. Each line is self-contained, timestamped, and represents a complete fact. "Deletion" is addition of a superseding line. This is the most elegant distributed merge strategy in the survey — zero configuration, zero conflicts, built on git's native merge infrastructure.

### git-appraise: cat_sort_uniq as zero-conflict merge
By constraining each datum to exactly one JSON line, git-appraise gets conflict-free distributed merge from git's built-in notes merge strategy. No custom merge logic. The format constraint IS the merge strategy.

### Gerrit: 29 structured footer keys in commit messages
Gerrit demonstrates that git commit messages can carry rich structured metadata via trailers/footers while remaining human-readable. The `for-each-ref --format='%(trailers:key=...)'` query path means this metadata is efficiently queryable without parsing tree contents.

### Jujutsu: Conflict algebra on trees
Conflicts represented as `A+(C-B)+(E-D)` — algebraic expressions over trees that simplify when rebased. This prevents "nested conflict markers" and enables automated conflict resolution through algebraic cancellation. A fundamentally different approach to merge conflicts.

### Dolt: Cell-level three-way merge with conflicts as data
When the same row is modified on both branches, each column is checked independently. Conflicts are stored in a separate prolly tree recording all three versions (into, from, ancestor). Conflicts are queryable via SQL. This is what "structured data merge" should look like.

### Noms: Prolly trees for history-independent content addressing
The canonical serialization problem — making tree shape depend only on content, not mutation history — solved via content-defined chunk boundaries using a rolling hash. Same data always produces same tree, regardless of insertion order.

### git-annex: Journal as overlay with deferred commit
Write-ahead log that batches metadata changes. Reads check journal first, fall back to git objects. Flushes periodically. Amortizes git plumbing overhead across many operations.

## Sources

See individual documents for full source lists:
- `003 - prior art - code review in git.md` (git-appraise, Gerrit NoteDb)
- `004 - prior art - git as structured data store.md` (git-dit, git-bug, Noms, Dolt, Git LFS, Fossil, GitDocumentDB, lakeFS, IPFS)
- git-bug research: https://github.com/git-bug/git-bug, DeepWiki analysis
- git-annex research: https://git-annex.branchable.com/internals/
- Jujutsu research: https://docs.jj-vcs.dev/latest/technical/architecture/
- DVC research: https://dvc.org/blog/experiment-refs
