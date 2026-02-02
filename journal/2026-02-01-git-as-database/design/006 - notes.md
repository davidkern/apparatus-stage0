# Design revision notes

Commentary and reasoning for changes tracked in `006 - design.md` revision log.

## 1. Implementation language: Rust

New decision, not present in original design.

## 2. Canonical binary serialization

The original design specifies YAML throughout: blob format, `_meta.yaml` files,
forward index entries, reverse-citation entries, findings, parameters, measurements.
Prior art synthesis found "canonical serialization is non-negotiable" and YAML fits
none of the three viable strategies (canonical by construction, by constraint, by
convention). Content-addressed identity requires byte-level determinism. YAML's
whitespace flexibility, comment handling, and multiple equivalent representations
for the same data make it unsuitable.

Sections affected: 3 (blob format, tree structure), 4 (all object schemas), 7
(index specification). All `.yaml` extensions, YAML code examples, and references
to YAML serialization need replacement once the binary format is specified.

## 3. State dir and store location

Original design: `$DEVENV_STATE/apparatus/store/`, relying on devenv's `.devenv*`
gitignore pattern for isolation. Index stored inside the bare repo directory.

Proposed: `.git/apparatus/` as the state directory, with the bare git repo at
`.git/apparatus/store/`. The state directory holds ephemeral derived state (index,
caches) alongside but outside the bare repo. Git ignores unknown subdirectories of
`.git/` by design, so no gitignore needed. Removes the devenv dependency for store
discovery. The apparatus store doesn't survive `git clone` (`.git/` internals aren't
cloned), but that's fine — the apparatus has its own remote/sync mechanism.

The git technical docs critique cautioned against potential name conflicts with
future git internals, but the prior art survey showed this is a common pattern
(Jujutsu's `.jj/repo/store/git/`, etc.), including placing git artifacts inside
such directories.

Layout:
```
.git/apparatus/          # state directory
├── store/               # bare git repo (refs, objects, etc.)
├── index.json           # derived index (not in git object store)
└── ...                  # other ephemeral state as needed
```

Sections affected: 1 (overview), 3 (store directory, index storage location),
7 (index storage location), 8 (instantiation paths), 9 (sync/remote),
11 (init command, boot sequence).

## 4. Git notes for annotations — RESOLVED

Original design leaves annotation storage as unresolved (Section 12, item 15).
Section 4 defines annotations as "stored alongside the annotated object but as a
separate blob" and Section 6 describes them as "separate objects with their own
lifecycle."

### Sources

- 001 critique (lines 107-108): git notes is "exactly the use case git notes was
  designed for." Identified lifecycle contradiction — ratified design refs should
  stop moving, annotations would keep advancing them.
- 002 recommendation (lines 25-38): strongest endorsement. Says notes "replaces the
  entire annotation type," resolves unresolved #15, eliminates lifecycle
  contradiction.
- 003 prior art (lines 13-24, 99-152): git-appraise uses `refs/notes/devtools/*`
  with `cat_sort_uniq` merge. One-line-per-datum JSON, conflict-free by format
  constraint. Gerrit uses NoteMap pattern (notes-like structure in commit trees).
- 004 prior art (lines 158-162): notes don't change annotated object's hash.
  Initially cautious ("current design likely better") but this was written before
  the lifecycle contradiction and concurrency analyses.
- 005 synthesis (lines 181-185): git-appraise's `cat_sort_uniq` is "zero-conflict
  merge" — "the format constraint IS the merge strategy."
- Mutability debate synthesis (line 55-63): flagged one-note-per-namespace and
  merge conflicts as limitations. Recommended prototyping.

### Objections evaluated

**"Weaker tooling support"** — Irrelevant. The apparatus CLI is the sole consumer
and producer. Notes being invisible to external git tooling is the same isolation
property we want.

**"One note per object per namespace, merge conflicts"** — Dissolved by the op-log
model. The constraint is only a problem if the note represents current state. If it
is an append-only operation log, one blob per annotated object is the right
granularity. Multiple annotations = multiple op lines. `cat_sort_uniq` makes
concurrent appends conflict-free by construction:
- Concurrent adds: different lines, both preserved
- Concurrent closes of same annotation: identical lines, deduplicated
- Cross-type concurrent ops: different lines, both preserved

### Design: op-log notes in `refs/notes/apparatus`

Single namespace: `refs/notes/apparatus`. Merge strategy: `cat_sort_uniq`.

Each annotated object gets one note blob containing an append-only operation log.
One line per operation, timestamp-prefixed for deterministic sort order:

```
1738400000 create-annotation ann-001 tag f-7a3b2c1d blob:a1b2c3d4
1738403600 create-annotation ann-002 comment f-7a3b2c1d blob:e5f6a7b8
1738407200 close-annotation ann-001
```

- Structured content (tag values, comment text, cross-ref metadata) lives in blobs
  in the git object store, referenced by SHA. Op lines are small and sortable.
- State is derived by replaying the log. The CLI resolves which annotations are
  active/closed.
- Format is line-oriented text, not binary. This is a principled exception to item
  #2: the format is dictated by the merge strategy, which is dictated by the
  concurrency requirement (item #8).

### Broader implication: op-log as general pattern

The op-log model may not be specific to annotations. If the system moves toward
operation-based modeling (aligned with git-bug's CRDT approach, git-annex's
location logs), then annotations are the first instance of a general pattern, not a
special case. Binary serialization (item #2) applies to object content blobs; the
op-log format handles state transitions. This separation (content in blobs,
operations in logs) may apply to structure-level state transitions too — a question
for further design work.

## Op-log applicability analysis (per structure)

The annotation design (item #4) uses an append-only op log with `cat_sort_uniq`
merge. Question: does this model generalize to other structures, or is it specific
to annotations?

Important: timestamps are unreliable for ordering across machines. For each
structure we need to determine: does operation ordering matter? If so, what
provides the ordering guarantee? The answer is per-domain-object, not global.

### Ordering mechanisms available

- **Commit chain on a ref**: git provides total ordering within a single ref's
  history. This is causal ordering for free — each commit knows its parent.
- **Wall-clock timestamps**: unreliable across machines, but cheap. Fine when
  ordering doesn't affect correctness (e.g., "when was this created" for display).
- **Lamport clocks**: causal ordering across refs. git-bug uses these. Requires
  coordination (read counter, increment, write).
- **Vector clocks**: full causal history. Complex. Probably overkill for us.
- **Accept bifurcation**: concurrent conflicting ops represent a real disagreement.
  Surface it rather than auto-resolve. This might be the right answer for some
  structures.

### Per-structure analysis

**Journal entry** — Append-only within a topic. New entry implicitly closes
previous. The commit chain on the topic ref provides ordering. Concurrent "add
entry to same topic" is a real conflict (which one closes the other?). CAS on the
topic ref is correct here — second writer fails, retries against new state. The
commit chain IS the op log. No separate op-log needed.
- Ordering: commit chain (sufficient)
- Concurrency model: CAS on topic ref

**Investigation (container)** — Status transitions: active -> complete|abandoned.
Adding entries is sequential within the investigation. Same as journal — the commit
chain on the investigation ref is the op log. Concurrent "add entry" is CAS.
Concurrent "complete" + "add entry" is a semantic conflict that should surface, not
auto-resolve.
- Ordering: commit chain (sufficient)
- Concurrency model: CAS on investigation ref
- Semantic conflicts: complete vs. add-entry should fail, not merge

**Research/Experiment/Evidence entries** — Sub-objects within investigations. Their
lifecycle is governed by the parent commit chain. No independent ref, no independent
op log. Created and frozen via operations on the investigation ref.
- Ordering: inherited from parent investigation's commit chain
- Concurrency model: inherited (CAS on investigation ref)

**Finding** — Sub-object within an entry. Created as an op on the investigation ref.
Frozen when parent freezes. Citable via (assigned-id, content-SHA). No independent
lifecycle once frozen. Same as entries — commit chain covers it.
- Ordering: inherited
- Concurrency model: inherited
- Note: the citability requirement means the content blob must be stable. The commit
  chain provides the history of when it was created/frozen.

**Assumption** — Same structure as finding, but with a cross-structural wrinkle:
assumptions are discovered in investigations but cited by designs. The assumption's
content lives in the investigation ref's commit chain. The citation lives in the
design ref's commit chain. Invalidation is a query operation (reverse-citation
lookup), not a mutation. No ordering problem here — it's read-only traversal.
- Ordering: inherited from parent
- Concurrency model: inherited
- Cross-structural: citation is a recorded snapshot, not a live link. No ordering
  issue.

**Design (container)** — Status transitions: active -> ratified|abandoned. Contains
decisions and assumptions. Commit chain on the design ref is the op log. Same CAS
model as investigation.
- Ordering: commit chain (sufficient)
- Concurrency model: CAS on design ref
- Semantic conflicts: ratify vs. add-decision should surface

**Decision** — Sub-object within design. Draft -> ratified|rejected. Created and
transitioned via ops on the design ref. Ratification is a terminal transition — CAS
prevents double-ratify. Concurrent "ratify decision A" + "ratify decision B" within
the same design: these are independent ops on the same ref. CAS means one succeeds,
one retries. After retry, the second sees updated state and can proceed (both
decisions can be independently ratified).
- Ordering: inherited from parent design's commit chain
- Concurrency model: CAS, retry-safe for independent sub-object mutations

**Annotation** — ALREADY DECIDED (item #4). Op-log in git notes, `cat_sort_uniq`.
Ordering: timestamp for display, but correctness doesn't depend on order. Create
and close are both idempotent after dedup.
- Ordering: timestamps for display only, not for correctness
- Concurrency model: `cat_sort_uniq` (conflict-free)

### Summary

| Structure | Op log mechanism | Ordering | Concurrency |
|-----------|-----------------|----------|-------------|
| Journal entry | commit chain on topic ref | causal (git) | CAS |
| Investigation | commit chain on inv ref | causal (git) | CAS |
| Entries (R/E/Ev) | inherited from investigation | inherited | inherited |
| Finding | inherited | inherited | inherited |
| Assumption | inherited | inherited | inherited |
| Design | commit chain on design ref | causal (git) | CAS |
| Decision | inherited from design | inherited | inherited |
| Annotation | notes op-log | timestamps (display) | cat_sort_uniq |

**Key finding**: the commit chain on each structure ref already IS an op log with
causal ordering provided by git. Only annotations need a separate op-log mechanism,
because they must not advance structure refs. The op-log-in-notes pattern is
specific to the annotation use case, not a general system pattern.

**Timestamp conclusion**: wall-clock timestamps are fine for `created-at` (display/
informational) but must not be used for ordering that affects correctness. The
commit chain provides correctness ordering for all structures. Annotations don't
need correctness ordering — create and close are idempotent.

**Semantic conflicts**: some concurrent operations represent real disagreements
(complete + add-entry, ratify + modify). These should fail at the CAS level and
surface to the user, not auto-merge. But see items #10 and #11 below — the CAS
model only covers local concurrency. Distributed divergence requires a different
analysis.

## 5. Index staleness: stored ref SHA

Original design (Section 7): "A generation counter embedded in the index detects
staleness relative to git refs."

Prior art synthesis: git-annex stores the branch HEAD SHA at index-build time and
compares on read. More robust than a generation counter — directly tied to the
actual state of the refs rather than an incrementing number that could drift.

## 6. Structured commit trailers

Original design is silent on commit message format. Prior art synthesis: Gerrit uses
29 structured footer keys in commit messages, queryable via
`for-each-ref --format='%(trailers:key=...)'`. The apparatus audit trail could use
trailers to record operation type, affected objects, and state transitions without
requiring the index to reconstruct history.

## 7. Containment model

The containment debate concluded that composition vs. association "reduced to an
ontological disagreement" and "experimental resolution is indicated." Wave 4
experiments were skipped. The design assumes composition throughout. This assumption
hasn't been validated.

## 8. Concurrent mutations required (BREAKING)

The design assumes a single researcher making sequential updates. This is wrong.
Multiple sources (local CLI invocations, remote collaborators, automated processes)
will mutate the store concurrently. The "one researcher" model was never stated as
an assumption — it was implicit in how the write path, sync protocol, and index
updates were described.

Sections affected by this assumption:
- Section 6: write-path enforcement assumes read-check-modify-write without
  contention. Needs compare-and-swap or equivalent.
- Section 7: index updates assume single-writer. A concurrent write can invalidate
  the index between read and write.
- Section 9: sync protocol describes push/fetch but doesn't address concurrent
  modification. The critique (001) flagged this as unspecified conflict resolution.
- Section 12 item 8: already notes the index/ref two-phase consistency hazard but
  frames it as an edge case, not the normal operating mode.

The recommendation document (002) already identified `update-ref --stdin` with
`verify` as the compare-and-swap primitive. This becomes mandatory, not optional.

For git notes specifically: concurrent annotation of the same object by two sources
creates a merge conflict on the note blob. git-appraise solved this by constraining
note content to one-JSON-line-per-datum so `cat_sort_uniq` merge works
automatically. This is a format constraint that interacts with item #2 (binary
serialization) — annotations may need a text-based line-oriented format to get
conflict-free merge for free.

## 9. Scale: ~300k objects (BREAKING)

The design assumes "hundreds to low thousands of objects" and uses this to justify:
- Sequential scans for all index queries (Section 7)
- No secondary indexes (Section 7)
- Single-file index (Section 7)

The revised estimate is ~300,000 objects within months. This is derived from: the
current system is informal and manual; the apparatus is designed to bootstrap
automated self-design; multiple machines will collaborate; the low-volume assumption
was based on observing a partial system operating below its intended capacity.

The design says "simple path first, design in scalability." Concretely:
- The single-file index with sequential scan is fine for early operation
- The index design must not preclude migration to a more capable structure
- Query patterns (Section 7) need to be evaluated against 300k objects
- The forward index keyed by assigned-id may need partitioning or a real database
  (git-annex uses SQLite caches for exactly this reason)

## 10. Distributed divergence (CRITICAL)

### The problem

CAS (compare-and-swap on refs) handles local concurrency: two processes racing on
the same repo. It does NOT handle distributed divergence: two users working offline
for hours, both mutating the same structure, then pushing.

When A and B both create commits on `refs/apparatus/investigation/inv-001` from the
same common ancestor, the second push is rejected as non-fast-forward. The design
has no mechanism for what happens next.

Worse: cross-ref dependencies mean resolving one ref in isolation isn't safe. If B's
design decisions cite findings from B's version of the investigation, and the remote
has A's version, B's citations point to content SHAs that aren't reachable from any
ref on the remote. They become orphaned objects subject to garbage collection.

### Divergence classification

Not all divergences are the same. The resolution strategy depends on what diverged.

**Compatible divergence (auto-mergeable):**
A closes the investigation, B independently adds evidence that supports A's
conclusions. Resolution: auto-merge. B's evidence is added to the closed
investigation as a late arrival. Downstream decisions are annotated to note the
event. The investigation remains closed; the new evidence strengthens rather than
challenges its conclusions.

Characteristics: one side made a state transition, the other added content that
doesn't contradict the transition. The operations are semantically independent
even though they touch the same ref.

**Incompatible divergence (branch):**
A resolves investigation with result X, B independently resolves with result Y.
Both go on to make design decisions and perhaps implementations based on their
respective outcomes.

This is not a merge problem — it's a research finding. The investigation was
underspecified or the problem space has genuine ambiguity. Two researchers
independently reached different conclusions from the same starting point. That is
valuable information.

Resolution: a new design process starts to resolve the conflict at the application
layer. The apparatus handles its own conflicts using its own machinery. Both
research paths are preserved. Both sets of design decisions remain traceable to
their respective evidence. The conflict itself becomes an input to the next round
of investigation.

This is caught at push/fetch time. Both researchers must go online to ship their
work, which is where the divergence surfaces. As long as it's detected before
downstream consequences (deployment, etc.), the system has done its job.

### Architectural principle: divergence is a feature

The apparatus exists to preserve research reasoning. Silently discarding one
researcher's work is the one thing it must not do. Incompatible divergence is not
a failure of the storage system — it's the storage system faithfully recording that
two independent research paths reached different conclusions. The resolution lives
at the knowledge layer (new investigation, new design), not the storage layer
(merge strategy).

This means the system needs:
- **Detection**: identify diverged refs on fetch/push. Classify the divergence.
- **Compatible merge**: auto-merge when operations are semantically independent
  (additive content + state transition, independent sub-object mutations).
- **Incompatible fork**: preserve both lineages. Surface the divergence. The
  citation model already supports this — (assigned-id, content-SHA) pairs tell you
  exactly which version of which finding was relied upon.
- **Resolution protocol**: the apparatus's own design/investigation machinery is
  the resolution mechanism. Not a git merge. A new investigation into why the
  previous one produced divergent outcomes.

### What the citation model gives us

The (assigned-id, content-SHA) citation format is more important than the original
design realized. In a divergence scenario:
- A's design decisions cite findings at specific SHAs from A's investigation path
- B's design decisions cite findings at different SHAs from B's investigation path
- Both sets of citations remain valid — they point to the exact content that was
  relied upon, and that content exists in the object store
- The system can show: "Decision D1 relies on finding F1 at version X (from path A);
  Decision D2 relies on finding F1 at version Y (from path B)" — the divergence is
  fully traceable

This is why assigned-id + content-SHA was the right identity design. Assigned ID
tells you "these are two versions of the same logical finding." Content SHA tells
you "they contain different things." Together they make divergence visible rather
than hidden.

## 11. Interim: claim mechanism + remote atomic updates

During development, prevent incompatible divergence rather than resolving it.

- **Claim mechanism**: a lightweight coordination protocol. Before starting work on
  a structure, claim it. Other users see the claim and either wait or coordinate.
  Claims don't need to be heavyweight locks — they're social signals backed by the
  system. Expired claims (user went offline and didn't release) are overridable.
- **Remote atomic updates**: for critical state changes (complete, ratify, abandon),
  require online push as part of the operation. The CLI does: local commit, push,
  verify. If push fails (non-fast-forward), surface the conflict immediately rather
  than letting the user continue building on a diverged base.
- **Scope**: not every operation needs to go through this gate. Adding an entry to
  an active investigation you own is low-risk. Completing an investigation or
  ratifying a design decision is high-risk. The claim/gate mechanism applies to
  terminal state transitions, not to all writes.
- **Owner semantics**: structures could have an explicit owner field. The owner has
  implicit claim. Others can contribute (add entries, findings) but terminal
  transitions require the owner or explicit handoff. This scales with the right
  structure — most structures have a natural owner.
