  Critique: Apparatus CLI Design Specification

  1. Meta ref as blob breaks bundle instantiation

  Severity: design-breaking.

  Section 3 defines refs/apparatus/meta as pointing to a blob. Section 8 bundles this ref with git bundle create. These two decisions are
  incompatible.

  git bundle create delegates to git rev-list to compute the set of objects to pack. rev-list walks commit ancestry — it does not know how to
  handle a blob ref. Given a ref pointing to a blob, rev-list will either skip the object or error. The blob will not appear in the bundle's
  packfile, even though the ref name and SHA appear in the bundle header. On the receiving end, git fetch from the bundle will try to resolve the
  ref to an object that doesn't exist in the pack.

  Two fixes:

- Wrap the meta blob in a commit. Make refs/apparatus/meta point to a commit whose tree contains a single format blob. This is consistent with  
  how every other ref in the system works. The commit chain on the meta ref then serves as a migration history, which is actually useful (you can
  see when format versions changed). This also resolves unresolved question #11 ("meta ref as blob vs. commit") in favor of commit.
- Use git pack-objects directly instead of git bundle create, feeding it explicit object SHAs. This bypasses rev-list but means reimplementing  
  bundle header construction and losing the well-tested bundle verification pathway.

  The first option is strongly preferable.

  1. YAML serialization must be canonical or citation integrity breaks

  Severity: high.

  The citation model (section 5) uses (assigned-id, content-SHA) pairs for staleness detection. The content SHA is the git blob hash, which is
  computed over the raw byte content of the serialized YAML. If the CLI ever reserializes the same logical content with different key ordering,
  quoting, whitespace, or flow style, the SHA changes and every citation to that object becomes stale — a false positive that erodes trust in the
  staleness signal.

  The design needs to specify canonical serialization rules: fixed key order (contract fields first, then type-specific fields in a defined order
  per schema), consistent quoting (e.g., always double-quote strings), no trailing whitespace, newline-terminated, no YAML document markers.
  Alternatively, the design could specify that the CLI never reserializes existing blobs — it reads them with cat-file, modifies only the bytes
  that change, and writes back. This is fragile. Canonical serialization is the better constraint.

  This also argues for JSON over YAML for stored blobs (not just the index). JSON has simpler canonicalization (sorted keys, no optional quoting  
  variations). The design already uses index.json for the index; the blob format could follow the same choice.

  1. Bulk reads need cat-file --batch, not per-object invocations

  Severity: performance, medium.

  The rebuild-index command (section 11) walks all refs, then reads all objects via git cat-file blob <sha>. For an apparatus with 500 objects,
  this means ~500 process invocations of git cat-file. Each invocation pays process startup, git config parsing, and object store lookup costs.

  Git provides git cat-file --batch (and --batch-check for metadata-only queries), which accepts SHA inputs on stdin and streams object contents  
  on stdout in a single long-running process. This reduces 500 process invocations to 1. The performance difference is dramatic: on Linux, process
   creation overhead is ~2ms per fork/exec, so 500 invocations cost ~1 second in overhead alone. --batch eliminates this entirely.

  The design should specify cat-file --batch as the read primitive for any operation that touches more than a handful of objects: rebuild-index,  
  cascading freeze (investigation complete), apparatus check, and apparatus impact. Similarly, hash-object --stdin-paths (or --batch in newer git
  versions) could batch write operations.

  1. No garbage collection or repack strategy

  Severity: operational, medium.

  Every write creates loose objects (blobs, trees, commits). Over hundreds of operations, loose object count grows into the thousands. Git's
  auto-gc normally handles this, but auto-gc is triggered by porcelain commands (git commit, git merge, etc.). Since the design uses only
  plumbing, auto-gc never fires.

  Without periodic repacking:

- Loose object storage is ~2x larger than packed storage (no delta compression).
- Object lookup degrades: loose objects require filesystem stat calls, while packed objects use the MIDX or pack index for O(log N) binary
  search.
- Bundles created from loose objects are larger than necessary (no delta compression applied during bundling — actually bundle create does pack,
   so bundle size is fine, but local storage is wasteful).

  The design should specify when git gc or git repack -d runs. Options: after every N operations (a counter in the index), as a separate apparatus
   gc subcommand, or opportunistically after expensive operations like rebuild-index.

  1. Concurrent access is unaddressed

  Severity: correctness, medium.

  The write path (section 6) reads current state, modifies, and writes back. If two CLI processes operate on the same ref simultaneously, both
  read the same current commit, both build new commits with that commit as parent, and both call update-ref. The second update-ref will succeed
  only if it provides the correct old-value for compare-and-swap — but the design doesn't mention providing old-value to update-ref.

  Without compare-and-swap, the second writer silently overwrites the first writer's commit. With compare-and-swap, the second writer gets a clean
   failure and can retry.

  The design should specify that every update-ref call provides the expected old SHA (the one read at step 2 of the write path). This turns a
  silent data loss into a retriable error. For the update-ref --stdin transaction path, the verify directive serves this purpose.

  1. Annotations in terminal structures create a lifecycle contradiction

  Severity: architectural.

  Section 6 states: "Terminal status means immutable. This is the single system-wide invariant." Section 4 states annotations can be added to
  frozen objects. If an annotation lives within the tree of a terminal structure (say, a ratified design), adding the annotation creates a new
  commit on that structure's ref. The ref advances. The structure's tree changes. The terminal structure has been modified — not the frozen object
   (its blob SHA is preserved), but the structure's commit chain continues to grow after reaching a terminal state.

  This is technically defensible (the invariant applies to objects, not commit chains), but it undermines the intuitive meaning of "terminal means
   immutable." A ratified design's ref should stop moving once ratified. If it keeps receiving annotation commits, the commit chain no longer
  cleanly separates pre-ratification evolution from post-ratification commentary.

  Alternatives:

- Separate annotation namespace. Annotations get their own refs (e.g., refs/apparatus/annotations/<target-id>), completely outside the annotated
   structure's commit chain. Terminal structures' refs truly stop advancing.
- Git notes. git notes is git's built-in mechanism for attaching metadata to objects without modifying them. Notes live in refs/notes/ and don't
   affect the annotated object's SHA or containing tree. This is exactly the use case git notes was designed for.

  1. Sync conflict resolution is unspecified

  Severity: operational, medium.

  Section 9 describes push/fetch but doesn't address what happens when two researchers modify the same structure independently. If researcher A
  pushes, then researcher B pushes (having fetched before A's push), B's push is rejected as non-fast-forward.

  Options:

- Last-writer-wins with force push. Simple, loses data.
- Merge commits. The structure layer would need to define merge semantics for trees — which sub-objects take priority when both sides modified  
  the same entry. This is complex.
- Divergence detection. The CLI detects non-fast-forward and surfaces it as an error with diagnostic information, requiring manual resolution.  
  This is the honest approach.

  The design should at least state which model it intends. Given the append-heavy, rarely-concurrent nature of research data, divergence detection
   with manual resolution is likely sufficient.

  1. Tree rebuilding cost compounds with structure depth

  Severity: performance, low-medium.

  Adding a finding to an experiment entry inside an investigation requires: read the current root tree, read the entries/ tree, read the specific
  entry tree, read/create the findings/ subtree, write the new finding blob, write new findings/ tree, write new entry tree, write new entries/
  tree, write new root tree, write new commit. That's 4-5 cat-file + 4-5 mktree + 1 hash-object + 1 commit-tree + 1 update-ref = ~12 plumbing
  calls for a single object addition.

  With cat-file --batch and mktree accepting input from stdin (which it does — mktree reads tree entries from stdin), this can be pipelined, but  
  the design should acknowledge the cost and specify that the implementation should minimize process invocations by batching where possible.

  Alternatively, consider flattening the tree structure. Instead of entries/entry-001/findings/f-001.yaml, store entry-001.findings.f-001.yaml at
  the root. Fewer tree levels means fewer intermediate tree objects to rebuild. This trades structural elegance for write performance. Probably
  not worth it at expected scale, but worth noting.

  1. Commit metadata is unspecified

  Severity: completeness, low.

  The design doesn't specify what commit-tree should use for:

- Commit messages. Each commit represents a state transition (entry added, status changed, decision ratified). The commit message could carry a
  structured summary: add-entry: research entry-003 to investigation inv-001. This makes git log on a structure's ref a readable audit trail
  without parsing tree contents.
- Author/committer identity. commit-tree requires GIT_AUTHOR_NAME, GIT_AUTHOR_EMAIL, GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL (or -author flag).
  The design should specify whether this uses the researcher's git identity, a fixed apparatus identity, or something else.

  These aren't blocking but they affect debuggability and auditability.

  1. for-each-ref format strings could eliminate many cat-file calls

  Severity: performance optimization, low.

  git for-each-ref supports --format strings that can dereference objects and extract content. For example, %(objecttype), %(objectname), and with
   %(*objectname) for dereferenced tags. For the boot sequence (section 10), the CLI could use for-each-ref --format='%(refname) %(objectname)' to
   get all ref→SHA mappings in a single call, then use cat-file --batch to read the metadata blobs in bulk. The design's boot sequence makes
  individual calls where batch operations would suffice.

  ---
  Summary of recommendations
  ┌─────┬────────────────────────────────────┬──────────────────────────────────────────────────────────┐
  │  #  │               Issue                │                          Action                          │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 1   │ Meta ref as blob                   │ Change to commit-based ref                               │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 2   │ YAML canonicalization              │ Specify canonical serialization rules, or switch to JSON │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 3   │ Per-object cat-file                │ Specify --batch for bulk reads                           │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 4   │ No gc/repack                       │ Add gc strategy                                          │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 5   │ No compare-and-swap                │ Specify old-value in all update-ref calls                │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 6   │ Annotations in terminal structures │ Separate annotation refs or use git notes                │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 7   │ Sync conflicts                     │ Specify divergence handling                              │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 8   │ Tree rebuild cost                  │ Acknowledge and specify batching                         │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 9   │ Commit metadata                    │ Specify message format and author identity               │
  ├─────┼────────────────────────────────────┼──────────────────────────────────────────────────────────┤
  │ 10  │ for-each-ref optimization          │ Use format strings + batch reads                         │
  └─────┴────────────────────────────────────┴──────────────────────────────────────────────────────────┘
  Issues 1 and 2 should be resolved before implementation begins — they affect correctness. Issues 3-5 should be addressed in the design — they
  affect reliability. Issues 6-10 can be resolved during implementation but should be flagged as known concerns.
