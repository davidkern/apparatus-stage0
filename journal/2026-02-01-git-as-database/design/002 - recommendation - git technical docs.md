# Recommendations from git technical docs

## Commit trailers for operation metadata

Git has a well-established convention for structured key-value metadata in commit messages, parsed by git interpret-trailers and queryable
through for-each-ref --format='%(trailers:key=...)':

add-entry: research entry-003 to inv-001

Apparatus-Op: add-entry
Object-Id: f-7a3b2c1d-4e5f-6789-abcd-ef0123456789
Target-Type: research-entry
Status-Transition: none -> open

This gives the design three things it currently lacks or implements custom:

1. Human-readable audit trail. git log on any structure ref produces a readable operation history without parsing tree contents.
2. Efficient status extraction. for-each-ref can extract the latest commit's trailers for every ref in a single call. The query "what is the
status of each top-level structure?" becomes one process invocation instead of N cat-file calls to read _meta.yaml blobs.
3. Structured commit messages that the design currently leaves unspecified (critique point #9).

The trailer values don't replace _meta.yaml — the tree remains the source of truth for current state. But trailers make the commit chain itself
queryable, which reduces the load on the custom index for common queries.

## Git notes for annotations

  refs/notes/ is git's native mechanism for attaching metadata to objects without modifying their content or SHA. Notes:

- Live in their own ref namespace, completely separate from the annotated object's containing tree
- Map object SHA → note content (a blob)
- Support multiple note namespaces (refs/notes/apparatus-tags, refs/notes/apparatus-comments)
- Transfer via push/fetch like any other ref
- Have built-in merge strategies (cat_sort_uniq, union) for concurrent note additions
- Are queryable via git log --notes=<namespace> and git notes list

  This replaces the entire annotation type (section 4), resolves unresolved question #15 (annotation storage mechanism), and eliminates the
  lifecycle contradiction where adding annotations to terminal structures causes their refs to advance. With notes, a ratified design's ref truly
  stops moving. Annotations live in refs/notes/apparatus/* and the note ref advances independently.

  The five contract fields still apply to annotation content — the note blob is still a YAML/JSON object with id, type, status, schema-version,
  created-at. But the storage and lifecycle machinery comes free from git.

# update-ref --stdin with verify as the universal write primitive

The design already mentions update-ref --stdin for migrations but doesn't specify it as the standard write pattern. The verify directive within
a transaction provides exactly the compare-and-swap semantics needed to prevent concurrent write corruption (critique point #5):

start
verify refs/apparatus/investigation/inv-001 <expected-old-sha>
update refs/apparatus/investigation/inv-001 <new-sha>
prepare
commit

If another process updated the ref between read and write, prepare fails and nothing changes. This is a single process invocation that handles  
both the ref update and the concurrency check. It should be the only ref-write mechanism the CLI uses, not a special case for migrations.

For cascading operations (investigation complete freezes everything), the transaction can batch multiple ref updates atomically. For single-ref
operations (add entry), it provides compare-and-swap. Same codepath, same error handling.

## cat-file --batch as the read substrate

Rather than individual cat-file blob <sha> calls, the design should specify cat-file --batch as the standard read primitive. A single long-lived
  process accepts SHAs on stdin and streams contents on stdout:

echo "<sha1>\n<sha2>\n<sha3>" | git cat-file --batch

This is how git's own tooling (including fsck, index-pack, rev-list) performs bulk reads. It eliminates per-object process overhead entirely.
For the index rebuild case (walk all refs, read all objects), this transforms ~500 process invocations into 1.

Pair with --batch-check for operations that only need object existence or type verification (e.g., validating citation targets exist before
recording a citation):

echo "<sha>" | git cat-file --batch-check='%(objectname) %(objecttype) %(objectsize)'

This pattern isn't just an optimization — it's the way plumbing-based tools are expected to read from the object store.

## $GIT_DIR/info/ for derived data

The design stores the index at $DEVENV_STATE/apparatus/store/index.json, alongside the bare repo's standard directories. Git has an established
convention for this: $GIT_DIR/info/ is where derived, non-transferred metadata lives. info/refs (for dumb HTTP), info/packs, info/commit-graph,
info/grafts — all follow this pattern.

Storing the index at $GIT_DIR/info/apparatus-index.json follows the convention. More importantly, git gc and git repack are aware that info/
contains derived data and don't treat it as corruption. Placing files directly in $GIT_DIR risks future git versions complaining about
unexpected files.

## Repository config for local-only metadata

Git config ($GIT_DIR/config in a bare repo) stores per-repo settings. For metadata that should NOT transfer with bundles/push — like the index  
generation counter, gc thresholds, or the apparatus remote URL — config is the right location:

[apparatus]
    indexGeneration = 47
    gcInterval = 100

Readable via git config --get apparatus.indexGeneration, writable via git config apparatus.indexGeneration 48. No custom file parsing needed.

This doesn't replace the meta ref (format version MUST transfer, so it belongs in a ref). But it eliminates any temptation to store local-only  
state in the object store or in ad-hoc files.

## Reflog for operation auditing

In a bare repo, reflogs are disabled by default. Enabling them provides a free operation log:

git config core.logAllRefUpdates always

Every update-ref call then records a timestamped entry in logs/refs/apparatus/.... This is lightweight (append-only file writes), local-only
(reflogs don't transfer), and gives debugging visibility into what operations modified each ref and when. The design's commit chains provide the
  permanent, transferable audit trail. Reflogs provide the ephemeral, per-machine operation trace.

## merge-base --is-ancestor for sync conflict detection

For the sync push path, before invoking git push, the CLI can check locally whether the push would be fast-forward:

git merge-base --is-ancestor <remote-sha> <local-sha>

If the remote SHA is not an ancestor of the local SHA, the push will be rejected as non-fast-forward. Detecting this locally lets the CLI
produce a domain-appropriate error message ("investigation inv-001 has diverged from remote; both sides have new entries since ") rather than
surfacing git's generic push rejectio

What this simplifies in aggregate
Design concern: Annotations
Current approach: Custom type, unresolved storage
Git-native pattern: refs/notes/apparatus/*
What's eliminated: Annotation type definition, storage mechanism, lifecycle contradiction
────────────────────────────────────────
Design concern: Concurrent writes
Current approach: Unaddressed
Git-native pattern: update-ref --stdin + verify
What's eliminated: Custom locking or silent data loss
────────────────────────────────────────
Design concern: Bulk reads
Current approach: Per-object cat-file
Git-native pattern: cat-file --batch
What's eliminated: ~N process invocations per bulk operation
────────────────────────────────────────
Design concern: Operation audit
Current approach: Commit chains only
Git-native pattern: Commit chains + reflogs
What's eliminated: Gap between permanent history and operation debugging
────────────────────────────────────────
Design concern: Derived data location
Current approach: Ad-hoc file in $GIT_DIR
Git-native pattern: $GIT_DIR/info/
What's eliminated: Risk of conflict with future git versions
────────────────────────────────────────
Design concern: Local-only config
Current approach: Not addressed
Git-native pattern: git config sections
What's eliminated: Custom config file format
────────────────────────────────────────
Design concern: Sync conflict detection
Current approach: Unspecified
Git-native pattern: merge-base --is-ancestor
What's eliminated: Push-and-hope failure mode
────────────────────────────────────────
Design concern: Commit semantics
Current approach: Unspecified messages
Git-native pattern: Trailers convention
What's eliminated: Custom metadata query paths for common operations
The largest wins are notes (eliminates an entire object type and its unresolved questions) and cat-file --batch (changes the performance profile
  of every read-heavy operation). The trailer and update-ref --stdin patterns don't eliminate code so much as replace ad-hoc approaches with
git's own conventions, which makes the CLI's git usage idiomatic rather than novel.

❯ A previous design iteration extracted the store for apparatus into its own bare repo, instead of sharing the .git directory with the
  containing code repo. There was a concern that the use of custom refs would show in `git log --all` and be interspersed with the user's own
  application commits. Because this system will generate refs at a much greater rate than code commits the ergonomics were a concern. Was
  moving to a standalone bare-repo a logical decision, or based on a misunderstanding of git capabilities?

● The concern about git log --all is real but addressable. The stronger justification for a separate bare repo comes from problems that can't be  
  solved by filtering.

  What --all actually does

  --all means "pretend all refs in refs/ are listed on the command line." Apparatus refs under refs/apparatus/* would be included. Since apparatus
   commits have no ancestry relationship to the project's commit graph, they appear as disconnected chains interspersed chronologically with
  project commits.

  Git provides --exclude:

  git log --exclude='refs/apparatus/*' --all

  Available since Git 2.13 (2017). An alias makes this transparent:

  git config alias.lg "log --exclude='refs/apparatus/*' --all --oneline --graph"

  So the git log --all concern, taken literally, is solvable without a separate repo.

  What --exclude doesn't solve

  Git GUIs and IDE integrations. VS Code's Git extension, GitKraken, Sourcetree, gitk --all, GitHub Desktop — these all enumerate refs to build
  their commit graph visualization. Most don't expose --exclude as a configuration option. They would render hundreds of disconnected apparatus
  commit chains floating alongside the project's history. At the rate the apparatus generates commits (every journal entry, every finding, every  
  status transition), apparatus commits would visually dominate the project's actual history. There's no user-facing configuration to fix this in
  most GUIs.

  Remote-side contamination. With a shared .git, pushing apparatus data means:

  git push origin 'refs/apparatus/*:refs/apparatus/*'

  The remote repository now contains apparatus refs alongside code refs. If the remote is GitHub, the GitHub UI's commit visualization, network
  graph, and various API endpoints would encounter these disconnected commits. GitHub doesn't support --exclude in its web UI. Other developers
  cloning the repo wouldn't get apparatus refs by default (standard refspecs only fetch refs/heads/*and refs/tags/*), but the remote itself is
  polluted.

  A separate bare repo means the apparatus remote is an entirely different repository. Clean separation at both ends.

  Object store mixing. git gc, git repack, git fsck, and git prune operate on all objects in the store. With a shared repo, apparatus
  blobs/trees/commits are repacked alongside project objects. Delta compression across the two object populations is wasted work (an apparatus
  YAML blob will never delta well against a source code file). Pack heuristics sort by (type, basename hash, size) — apparatus objects would be
  interleaved with project objects in pack ordering, reducing delta chain efficiency for both. The performance impact is minor at expected scale,
  but it's waste with no upside.

  Gc tuning conflicts. The project and apparatus have different gc profiles. Project repos benefit from aggressive repacking after large merges.  
  Apparatus data is append-heavy with many small objects. A shared repo forces one gc configuration to serve both patterns.

  What a shared repo would have gained

- No GIT_DIR environment variable management on every operation.
- No separate init/remote/gc configuration.
- Simpler mental model (one repo, one set of refs).
- git clone naturally ignores apparatus refs (standard refspecs exclude custom namespaces), so collaborators wouldn't accidentally receive
  apparatus data.

  Assessment

  The decision was logical and actually understated its justification. The git log --all concern was the most visible symptom but the weakest
  argument, since --exclude handles it at the command line. The real case for separation is:

  1. GUI/IDE tools have no filtering mechanism for custom ref namespaces.
  2. Remote repositories should not carry apparatus objects alongside code objects.
  3. Object store and gc behavior should be independently tunable.

  These three are not solvable within a shared .git directory. The separate bare repo is the correct design choice — it was made for a real
  reason, even if the stated reason (log output) was only the tip of the iceberg.

✻ Churned for 1m 8s

❯ Given the additional justifications you've elaborated would using a combined remote for the two purposes be a bad idea?

● No. The remote-side concerns are weaker than they appear.

  A git remote is just a URL plus refspecs. Two local repos can share the same remote repository if their ref namespaces don't collide — and they
  don't. Project refs live under refs/heads/* and refs/tags/*. Apparatus refs live under refs/apparatus/*. The remote stores both, but each client
   only fetches what its refspecs request. A standard git clone of the remote fetches heads and tags; apparatus refs are invisible unless
  explicitly requested.

  The "contamination" concern I raised — GitHub UI showing disconnected commits, network graph pollution — is real for GitHub's web interface
  specifically, but it's a GitHub UI limitation, not a git limitation. A self-hosted bare remote (gitolite, plain SSH, etc.) has no web UI to
  pollute. Even on GitHub, the disconnected apparatus commits wouldn't appear in the default branch view, pull requests, or blame. They'd only
  surface in the rarely-used network graph and in API calls that enumerate all refs.

  The practical advantages of a shared remote are significant:

- One access control boundary. Apparatus data travels with the project. Anyone with repo access has apparatus access. No second set of deploy
  keys, SSH configs, or access grants.
- One backup target. A single git clone --mirror captures everything.
- Atomic availability. If the remote is reachable, both project and apparatus data are reachable. No partial-availability states where you can  
  push code but not apparatus data (or vice versa).
- Simpler onboarding. A new team member clones the project. When they need apparatus data, GIT_DIR=$STORE git fetch origin
  'refs/apparatus/*:refs/apparatus/*' pulls it from the same remote they already have credentials for.

  The separation that matters is local — keeping apparatus objects out of the project's .git so that local tools (GUIs, gc, log) aren't affected.
  That separation is achieved by the standalone bare repo at $DEVENV_STATE/apparatus/store/. The remote doesn't need to mirror this separation
  because the problems that motivated local separation (GUI confusion, gc tuning, --all pollution) don't apply to a bare remote that no one
  interacts with directly.

  If the project does live on GitHub and the team cares about a clean network graph, a separate remote is a reasonable choice. But it's a
  hosting-specific UX preference, not an architectural requirement. The design should support configurable remotes (it already does — section 9
  says the apparatus remote is configured independently) without mandating that they differ from the project remote.

❯ Are there any other extension points available to get refs-like support without actually using refs? I presume git only transfers the
  structures it knows about between local and remote repos?

● Your presumption is correct. Git's transfer protocol is fundamentally ref-based. The server advertises <sha> <refname> pairs, the client selects
   which refs it wants, and the server computes a packfile containing objects reachable from the negotiated refs. There is no mechanism to
  transfer data that isn't reachable from a ref. This isn't a limitation that can be configured around — it's the protocol's core model in both
  v0/v1 and v2.

  Things that explicitly don't transfer: config, hooks, info/ directory contents, reflogs, the index. The shallow file (.git/shallow) is a narrow
  exception handled by special protocol logic, not a general extension point.

  Protocol v2 is capability-extensible — new capabilities like partial-clone and object-format have been added over time. But adding a custom
  capability requires patching git on both client and server. That's not an extension point the apparatus should depend on.

  So the design space is: how to organize data under refs to minimize the costs of ref proliferation while retaining the properties the design
  needs.

  The single-ref alternative

  Instead of one ref per structure, use one ref for the entire apparatus:

  refs/apparatus/root  →  commit  →  tree
                                       ├── meta.yaml
                                       ├── journal/
                                       │   └── latency-investigation/
                                       │       ├── _meta.yaml
                                       │       └── entries/...
                                       ├── investigation/
                                       │   └── inv-001/
                                       │       ├──_meta.yaml
                                       │       └── entries/...
                                       └── design/
                                           └── cache-strategy/
                                               ├── _meta.yaml
                                               └── decisions/...

  One ref. One commit chain. Every operation produces a new commit whose tree is the full apparatus state. What this gives you:

  Global operation ordering for free. The commit chain is a total order over all apparatus operations. The current multi-ref design has no global
  ordering — commits on different refs are causally unrelated. With a single ref, "what happened between Tuesday and Thursday" is git log
  --since=Tuesday --until=Thursday.

  Path-scoped history replaces per-structure refs. git log -- investigation/inv-001/ shows only commits that touched that investigation. Git's
  pathspec filtering on log is well-optimized — it walks the commit chain but only diffs the specified subtree. This recovers per-structure
  history without per-structure refs.

  Trivial transfer. One refspec fetches everything. No glob patterns, no risk of missing a ref.

  The meta ref problem disappears. meta.yaml is just a file in the root tree. No special ref, no blob-vs-commit question.

  Commit trailers become the primary query surface. With one commit chain carrying trailer metadata for every operation, git log
  --format='%(trailers)' refs/apparatus/root is a complete operation index. The forward index becomes derivable from commit metadata alone,
  without reading tree contents.

  What the single-ref approach costs

  Selective instantiation becomes harder. The current design bundles individual investigation refs to create minimal instantiations. With a single
   ref, the bundle contains the full commit history. Extracting a subtree requires either git log -- <path> with tree reconstruction (complex) or
  accepting that instantiation always carries the full history (simpler but larger).

  Every write serializes on one ref. Two concurrent operations on different structures now conflict — both try to advance the same ref. With
  per-structure refs, concurrent writes to different structures can't conflict. At human interaction rates this is irrelevant. If the apparatus
  later supports automated tooling making rapid concurrent writes, it matters.

  Tree rebuild depth. Modifying a deeply nested object requires rebuilding every tree from the leaf to the root. With per-structure refs, the
  rebuild starts at the structure's root tree, which is shallower. The additional depth in the single-ref model is 2-3 levels (the root tree, the
  structure-type directory, the structure instance directory). At expected object counts, this adds microseconds.

  The two-ref compromise

  If selective instantiation is important, a middle ground:

- refs/apparatus/root — the full state (single commit chain, global ordering).
- refs/apparatus/bundle/<name> — lightweight refs created on-demand for instantiation, pointing to synthetic commits whose trees contain only
  the selected structures. Created at bundle time, deleted after. These are ephemeral, never pushed.

  This retains the single-ref model for normal operation while enabling selective bundling without protocol extensions.

  Answering the direct question

  There are no extension points in git that provide ref-like transfer semantics without using refs. Git transfers objects reachable from refs, and
   nothing else. The design choice is between many refs (current design) or few refs with richer tree structures. The single-ref model trades
  selective instantiation convenience for simpler transfer semantics, global ordering, and elimination of several design complications (meta ref  
  format, ref proliferation, absence of cross-structure temporal ordering). Whether that trade is worth it depends on how central selective
  instantiation is to the workflow.

❯ Do you have any information regarding serialization of any of git's structures in the technical documentation you read? I'd like to
  contrast versus the yaml serialization proposed for this

● Yes — several of the technical documents describe binary serialization formats in detail. The relevant ones:

  Reftable — block-based binary format. Each block has a header (block type, padding to alignment boundary), then a sorted sequence of records
  with prefix compression (shared prefix length as a varint, then the suffix). Restart points at regular intervals enable binary search within a  
  block. Variable-length integers throughout. Trailing block-level checksums. The file has a footer with offset to the first ref block, first log
  block, and a file-level checksum.

  Commit-graph — chunk-based binary format. File starts with a signature (CGPH), version byte, hash algorithm ID, number of chunks, then a chunk  
  table of contents (each entry is a 4-byte chunk ID + 8-byte offset). Chunks include: OID fanout (256 × 4-byte counters for O(1) first-byte
  lookup), OID lookup (sorted fixed-size hash entries), commit data (fixed-size records: tree OID + first two parents + generation + commit
  timestamp), extra edges list (for octopus merges), generation data v2 (corrected committer dates), bloom filter data.

  Multi-pack-index — same chunk-based pattern as commit-graph. Signature, version, chunk TOC, then chunks: packfile name list, OID fanout, OID
  lookup, object offset table, optional large offset table (for packs > 4GB).

  Bitmap format — EWAH-compressed bitsets. Header with magic, version, option flags, entry count, then one bitmap per entry. Each bitmap maps a
  commit position to a bitset over the pack/MIDX object ordering. Type-specific index bitmaps (commits, trees, blobs, tags) for fast type
  filtering.

  Pack format — object entries with type+size encoded in a variable-length header, then zlib-compressed content. Delta objects store a base
  reference (by offset or SHA) plus delta instructions (copy-from-base and insert-new operations).

  The patterns across all of these

  Every git serialization format shares these properties:

- Magic number / signature for format identification (not content sniffing)
- Canonical representation — there is exactly one byte sequence for a given logical state. No serializer variation.
- Fixed-size records where possible for O(1) indexed access (commit-graph commit data, fanout tables)
- Sorted keys enabling binary search (OID lookups in MIDX/commit-graph, ref names in reftable)
- Integrity checksums at block and/or file level
- Chunk-based TOC pattern — a table of contents mapping chunk IDs to byte offsets, so readers can skip to the relevant section without parsing  
  everything before it

  The contrast with the proposed YAML
  ┌────────────────────────┬────────────────────────────────────────────────────┬────────────────────────────────────────────────────────────────┐
  │        Property        │                    Git formats                     │                           YAML blobs                           │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Canonical              │ By definition — one byte sequence per state        │ Not inherent — key order, quoting, whitespace vary             │
  │ serialization          │                                                    │                                                                │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Random access          │ O(1) via fanout + binary search                    │ Must parse from the start                                      │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Integrity checking     │ Built-in checksums                                 │ None (relies on git's object-level SHA)                        │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Schema evolution       │ Version byte in header; reader checks before       │ schema-version field inside the document; must parse to        │
  │                        │ parsing                                            │ discover                                                       │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Parse cost             │ Memory-mapped, no parsing for fixed-size records   │ Full text parse, YAML library, type coercion                   │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Human readability      │ None                                               │ High                                                           │
  ├────────────────────────┼────────────────────────────────────────────────────┼────────────────────────────────────────────────────────────────┤
  │ Cross-language support │ Requires purpose-built readers                     │ Every language has a YAML library                              │
  └────────────────────────┴────────────────────────────────────────────────────┴────────────────────────────────────────────────────────────────┘
  The most relevant observation: git's formats are canonical by construction, and the apparatus design depends on canonical serialization for
  citation integrity but chose a format that doesn't provide it. Git didn't solve this problem by adding canonicalization rules to a text format —
   it used binary formats where canonicalization is structural. The representation is the canonical form because there's no alternative
  representation.

  That said — git's binary formats are acceleration structures and transfer formats. They sit over the object store, not in it. The actual content
   of blob objects is opaque bytes — git imposes no serialization format on blob content. The apparatus YAML lives at that level (blob content),  
  where git doesn't have an opinion. The question is whether the apparatus's own needs (particularly citation SHAs being stable across
  serialization cycles) demand something more disciplined than YAML.

  One thing I don't have from the technical docs: the core object serialization format (how commit, tree, and tag objects themselves are
  serialized within the object store). That's documented in git's main docs, not in the technical/ directory. If you want me to pull that in for  
  comparison, I can — those formats are notably simple, line-based text with fixed field ordering, and canonically serialized. They'd be a more
  direct analog to what apparatus object blobs need than the binary acceleration structures are.

❯ Got it. Is there anything else in the technical documentation you feel is relevant to point out in relation to the intent of this design
  which we have not covered?

● Three things from the technical documentation that bear on this design and haven't come up:

  Hash function transition. Git is migrating from SHA-1 to SHA-256. The transition design (which I read in detail) describes a four-mode
  operational model with bidirectional hash mapping tables. The apparatus citation model stores raw git blob SHAs inside YAML content — sha:
  "a1b2c3d4...". Those SHAs are hash-algorithm-specific. The same blob content produces a different SHA under SHA-256 than SHA-1. If the apparatus
   store is ever migrated (or if a bundle is created from a SHA-1 store and fetched into a SHA-256 store), every citation SHA becomes invalid —
  not because content changed, but because the hash function did. The design should either record which hash algorithm a citation SHA uses, or
  treat hash migration as a format version bump that rewrites all citation SHAs atomically. This isn't urgent (SHA-256 adoption is slow), but the
  citation model has a latent coupling to hash algorithm that should be acknowledged.

  Replace refs. refs/replace/<sha> makes git transparently substitute one object for another. Any command reading the original SHA silently
  returns the replacement object's content instead. This is a footgun for the immutability guarantee. If someone creates a replace ref targeting a
   frozen finding's blob SHA, every cat-file call returns the replacement content, but the original SHA (recorded in citations) still resolves —  
  it just resolves to different content. Staleness detection wouldn't catch this because the SHA in the citation still "exists" and the blob still
   "has that SHA" as far as the reader knows. The CLI should either operate with --no-replace-objects (the git flag that disables replace ref
  resolution) or at minimum document that replace refs subvert the integrity model. --no-replace-objects is the safer default — the apparatus
  should never want transparent substitution.

  git maintenance as the gc solution. Rather than implementing custom gc triggers (after N operations, or an apparatus gc subcommand), the
  apparatus could register its store with git's built-in maintenance scheduler: git maintenance register adds the repo to
  ~/.config/git/maintenance, and git maintenance start installs a system-level schedule (cron/launchd/systemd) that periodically runs gc,
  commit-graph, incremental-repack, and other tasks. This is how Scalar-managed repos handle gc. The apparatus store would get automatic
  background repacking without custom scheduling code. The CLI's init command would run git maintenance register as part of store setup.

  Beyond these three, I don't see remaining material in the technical documentation that the design hasn't already accounted for or that our
  discussion hasn't addressed.

● Git is a defensible substrate here, but the fit is uneven. The honest breakdown:

  Where git is doing exactly what it was built to do

  Content-addressable storage. The apparatus wants objects identified by content hash, immutable once written, with integrity verification. That  
  is literally what git's object store is. No adaptation required — hash-object writes, cat-file reads, SHAs verify.

  Atomic ref updates. The apparatus wants atomic state transitions that either fully succeed or fully fail. update-ref --stdin with
  start/prepare/commit provides exactly this, with compare-and-swap semantics.

  Transfer without infrastructure. This is the strongest argument. Push, fetch, and bundle give the apparatus sync, sharing, and selective
  extraction over any git-compatible transport — SSH, HTTPS, local filesystem, S3-backed remotes. Building a transfer protocol that handles
  authentication, compression, delta transfer, integrity checking, and works across hosting providers is a large engineering effort. Git provides
  all of it. And the hosting is ubiquitous: any SSH server, any GitHub/GitLab instance, any machine with git installed. The apparatus never needs
  its own server, its own protocol, or its own authentication system.

  Durability. If the apparatus project is abandoned, the data remains accessible with standard git tools. cat-file, ls-tree, log — anyone can
  inspect the contents without the apparatus CLI. The storage format is backed by one of the most widely maintained systems in software. A
  purpose-built store ties data accessibility to the apparatus software's continued existence.

  Where git is neutral

  Schema enforcement and validation. Git doesn't know what's inside blobs. All lifecycle rules, type checking, status validation — 100% custom.
  But this would be custom with any storage backend. SQLite gives you column types and constraints, but apparatus lifecycle rules (terminal means
  frozen, cascading freeze, citation staleness) are application logic regardless.

  The index. Forward lookup, reverse citations, staleness detection — entirely custom. Git's own acceleration structures (commit-graph, MIDX,
  bitmaps) solve different problems. But a derived index rebuilt from authoritative data is a standard pattern in any architecture. The
  implementation work is comparable whether the authoritative data lives in git objects, SQLite rows, or files on disk.

  Where git is being forced

  Tree construction. This is the real friction. Adding a finding to an investigation requires: hash the finding blob, read the current entry tree,
   build new findings/ subtree, build new entry tree, build new entries/ tree, build new root tree, create commit, update ref. Eight plumbing
  calls with sequential dependencies (each mktree depends on the previous one's SHA). With SQLite, the equivalent is one INSERT. With a
  filesystem, one file write.

  This cost is containable — the "rebuild tree path from leaf to root" operation is implemented once as a helper, and every write command calls
  it. It's boilerplate, not fundamental complexity. But it means every write operation is a pipeline of process invocations where a simpler
  substrate would need one. The single-ref model deepens the tree by 2-3 levels, making this worse.

  Canonical serialization. Git doesn't care about blob content format, but the citation model demands that the same logical content always
  produces the same SHA. This forces the apparatus to solve a problem git never had to solve (git's own serialization formats are canonical by
  construction — there's one way to serialize a commit object). YAML serialization is not canonical. The apparatus must either enforce canonical  
  serialization rules, choose a format with inherent canonicality (like sorted-key JSON), or accept fragile citation integrity. A purpose-built
  system could store structured data natively and compute citation hashes over a canonical representation it controls.

  Querying commit history by path. In the single-ref model, per-structure history requires git log -- <path>, which walks the full commit chain
  and diffs trees at each commit. Git optimizes this with tree-diff short-circuiting, but it's fundamentally an O(total commits) scan filtered by
  path, not an indexed lookup. With per-structure refs, git log <ref> is O(structure commits). With a database, querying by structure ID is O(1)  
  with an index.

  The assessment

  The apparatus is using git as a content-addressable object store with built-in network transfer. That is what git is. The design is not trying  
  to make git do relational queries, full-text search, or real-time event streaming. The custom layers (schema, index, citations) would exist
  regardless of storage backend.

  The cost is write-path verbosity (tree construction) and a canonicalization requirement that git doesn't help with. These are real but bounded —
   they live in a small number of helper functions in the CLI, not spread across the architecture.

  The benefit is that transfer, integrity, durability, and hosting come free. The alternative — SQLite or a custom store — would be simpler for
  writes and queries but would require building a transfer protocol, a sync mechanism, a bundling/instantiation system, and integrity verification
   from scratch. That's a larger and riskier engineering surface than wrapping mktree in a helper function.

  The one scenario where git becomes the wrong choice: if the apparatus evolves to need rich querying (full-text search across findings, graph
  traversal of citation networks, aggregation queries) as a primary workflow rather than an occasional operation. At that point the derived index
  becomes the real system and git becomes an inconvenient persistence layer. But the design's current query needs — status filtering, date ranges,
   reverse citation lookup — are well within what a simple derived index can handle.
