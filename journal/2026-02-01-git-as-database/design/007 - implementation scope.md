# Implementation Scope: Dev-Quality First Build

Target: single researcher, low velocity, panic on conflict, JSON serialization.
Deferred: CAS writes, divergence handling, claims, auto-merge, binary serialization,
annotations (notes), secondary indexes, SQLite index.

Reference: `006 - design.md` (specification), `006 - notes.md` (revision commentary)

## Simplifying assumptions (temporary)

These are assumptions we know are wrong (see 006 revision log items #8, #9) but
accept for the first build to reduce scope. The design accommodates their eventual
removal.

- **Single writer.** No concurrent local mutations. Bare `update-ref` instead of
  CAS with `verify`. Add CAS later without changing any other code — it's one
  function signature change in the substrate layer.
- **Low object count.** Hundreds, not 300k. Flat-file JSON index with sequential
  scan. The index is a derived cache; migrating to SQLite changes the index
  implementation without affecting any command logic.
- **Panic on conflict.** `sync push` fails on non-fast-forward. `sync fetch`
  overwrites local refs. No merge, no fork detection, no claim mechanism.
  Divergence handling is a new feature, not a change to existing features.
- **JSON with sorted keys.** Canonical by convention (single serde_json serializer,
  compact format, sorted keys). Sufficient for single-writer content-addressing.
  Migration to binary: swap the serde serializer, bump format version.

## Dependency graph

```
Phase 1: Foundation
    |
    v
Phase 2: Journal  ──────────────────────┐
    |                                    |
    v                                    v
Phase 3: Index              (daily use begins)
    |
    v
Phase 4: Investigation ─────────────────┐
    |                                    |
    v                                    v
Phase 5: Design + Citations  (core value proposition)
    |
    ├───────────┐
    v           v
Phase 6:    Phase 7:
  Sync      Instantiation
```

Phases 6 and 7 are independent of each other. Annotations (Phase 8) are optional
and independent of phases 6-7.

## Phase 1: Foundation

### What gets built

- Rust project with `git2`, `clap`, `serde`, `serde_json`, `uuid` crates
- Substrate layer: thin wrapper over git2 for the four primitives
  - `hash_blob(bytes) -> Oid` — `git hash-object -w`
  - `build_tree(entries) -> Oid` — `git mktree`
  - `create_commit(tree, parent, message) -> Oid` — `git commit-tree`
  - `update_ref(name, oid)` — `git update-ref`
  - `read_blob(oid) -> bytes` — `git cat-file blob`
  - `read_tree(oid) -> Vec<TreeEntry>` — `git ls-tree`
  - `list_refs(pattern) -> Vec<(name, oid)>` — `git for-each-ref`
- Object serialization: serde traits for the five contract fields, JSON
  round-trip with sorted keys
- Store discovery: find `.git/apparatus/store/`, check it exists
- Boot sequence: read meta ref, check format version, error on mismatch
- `apparatus init`: create state dir, bare repo, meta ref, empty index

### What pops out

`apparatus init` works. A researcher can create an apparatus store. Nothing
else is usable yet, but the entire substrate is available for every subsequent
phase.

### Key decisions to make during this phase

- Exact crate versions and project structure (workspace? single crate?)
- Error handling strategy (anyhow? thiserror? custom?)
- How the CLI discovers the project root (walk up looking for `.git/`)

## Phase 2: Journal

### What gets built

- Journal entry struct: contract fields + `topic`, `structure-ref`, content
- Lifecycle: `open` -> `closed` (terminal)
- `apparatus journal add --topic <topic>`: create entry, implicit close of
  previous entry on same topic ref, atomic commit to
  `refs/apparatus/journal/<topic-slug>`
- `apparatus journal show <topic> [<entry-number>]`: read entry content and
  metadata from git objects (no index needed — walk the commit chain)
- `apparatus journal list [--topic <topic>]`: enumerate entries by walking
  refs and reading metadata (no index yet — `for-each-ref` + `cat-file`)

### Dependencies

- Phase 1 (substrate, serialization, init)

### What pops out

**A working research journal.** Daily use can begin. The researcher can record
observations, link entries to topics, and browse history. This is immediately
useful even without investigations or citations.

The implicit close-on-next-entry pattern is implemented here and reused by
investigation entries in Phase 4.

### Key decisions to make during this phase

- Content authoring workflow: does the CLI open `$EDITOR`? Accept stdin?
  Take a `--file` flag? (Likely `--file` for v1, editor integration later)
- Topic slug generation from topic string

## Phase 3: Index

### What gets built

- Forward index: `HashMap<AssignedId, IndexEntry>` where IndexEntry contains
  the five contract fields + structural path + current SHA + citations list
- Reverse-citation section: `HashMap<AssignedId, Vec<AssignedId>>`
- Serialized as a single JSON file at `.git/apparatus/index.json`
- Ref-SHA staleness detection: store `HashMap<RefName, Oid>` of all ref tips
  at build time; on read, compare against current tips; rebuild if stale
- `apparatus rebuild-index`: walk all refs, parse all objects, regenerate
- Atomic update: write to temp file, rename over existing
- Journal list/show now read from index when fresh, fall back to ref walking

### Dependencies

- Phase 1 (substrate)
- Phase 2 (journal — first type to index; also validates the index works)

### What pops out

Fast queries and the infrastructure for citation tracking. Not user-visible
as a feature — journal commands get faster, and the reverse-citation section
is ready (but empty until Phase 5 populates it).

### Key decisions to make during this phase

- Index file format details (how to represent the two sections in JSON)
- Whether rebuild-index is explicit-only or triggered automatically on stale

## Phase 4: Investigation

### What gets built

- Investigation container: contract fields + `title`, `question`,
  `completion-criteria`; lifecycle `active` -> `complete` | `abandoned`
- Three entry types: research, experiment, evidence — each with contract
  fields, type-specific fields, lifecycle `open` -> `closed`
- Finding sub-object: contract fields + `summary`, `confidence`,
  `supporting-evidence`; lifecycle `active` -> `frozen`
- Assumption sub-object: contract fields + `statement`, `basis`,
  `invalidation-conditions`; lifecycle `active` -> `frozen`
- Tree layout within investigation ref (entries/, findings/, assumptions/
  subdirectories as specified in design Section 3)
- `apparatus investigation create --title <t> --question <q>`
- `apparatus investigation add-entry <id> --type <research|experiment|evidence>`
  with implicit close of previous entry (reuses journal pattern)
- `apparatus investigation complete <id>`: cascading freeze — all open
  entries, findings, and assumptions transition to terminal in one commit
- `apparatus investigation abandon <id>`: same cascading freeze
- Commands for adding findings and assumptions to entries

### Dependencies

- Phase 1 (substrate, serialization)
- Phase 3 (index — findings and assumptions must be indexed for citation)

### What pops out

**Structured research workflow.** The researcher can create investigations,
add typed entries, record findings and assumptions, and close investigations.
Findings and assumptions are now indexed objects with assigned IDs — they
exist as citation targets, ready for Phase 5.

The cascading freeze on `complete`/`abandon` is the most complex single
operation. It touches every object in the investigation tree in one atomic
commit.

### Key decisions to make during this phase

- Finding/assumption creation UX: inline with entry creation? Separate command?
- How entries reference their content (embedded markdown vs. separate blob)

## Phase 5: Design + Citations

### What gets built

- Design container: contract fields + `title`, `problem-statement`, `scope`;
  lifecycle `active` -> `ratified` | `abandoned`
- Decision sub-object: contract fields + `statement`, `rationale`,
  `citations`; lifecycle `draft` -> `ratified` | `rejected`
- Citation recording: when creating or citing, resolve the cited object's
  current SHA and store `(assigned-id, content-SHA)` pair
- `apparatus design create --title <t> --problem <p>`
- `apparatus design add-decision <design-id> --statement <s> [--cite <id>...]`
- `apparatus design ratify-decision <design-id> <decision-id>`
- `apparatus cite <citing-id> <cited-id>`: general citation command
- `apparatus check [--verbose]`: iterate all citations in index, compare
  recorded SHA vs. current SHA, report stale citations
- `apparatus impact <id>`: walk reverse-citation index, output dependency tree
- Reverse-citation index now populated on every citation write

### Dependencies

- Phase 3 (index — reverse-citation section)
- Phase 4 (investigation — findings and assumptions to cite)

### What pops out

**The core value proposition.** Design decisions cite findings and assumptions.
Staleness detection tells the researcher when evidence has changed under a
decision. Impact analysis traces which decisions are affected when an
assumption breaks. This is the traceability chain: journal -> investigation ->
findings -> design decisions.

`apparatus check` and `apparatus impact` are the commands that justify the
system's existence. Everything before this phase is infrastructure to make
these two commands meaningful.

### Key decisions to make during this phase

- Citation UX: cite at creation time only, or add citations to existing
  draft decisions?
- `check` output format (human-readable table? structured output?)
- `impact` traversal depth (immediate citers only? full transitive closure?)

## Phase 6: Sync

### What gets built

- Remote configuration: `apparatus remote add <name> <url>`
- `apparatus sync push [<remote>]`: push `refs/apparatus/*` to remote;
  fail with clear error on non-fast-forward
- `apparatus sync fetch [<remote>]`: fetch `refs/apparatus/*` from remote;
  rebuild index after fetch
- Ref-SHA staleness detection triggers rebuild automatically after fetch

### Dependencies

- Phase 1 (substrate — remote operations via git2)
- Phase 3 (index — rebuild after fetch)

### What pops out

**Multi-machine workflow.** The researcher can push apparatus data from one
machine and fetch on another. Strictly single-writer: if push fails, the
researcher must manually reconcile (which in practice means: don't modify
on two machines without syncing between).

### Key decisions to make during this phase

- Default remote name (convention: `origin`? `apparatus`?)
- Whether to push/fetch notes refs too (yes, for future annotations)
- Push refspec: `refs/apparatus/*` and `refs/notes/apparatus`

## Phase 7: Instantiation

### What gets built

- `apparatus instantiate <target-path> [--ref <ref>...]`
- Bundle creation: `git bundle create` for specified refs + meta ref
- Target creation: `git init --bare` at target
- Fetch from bundle into target
- Index rebuild on target
- Without `--ref`: bundles everything. With `--ref`: selective.

### Dependencies

- Phase 1 (substrate)
- Phase 3 (index rebuild)

### What pops out

**Hermetic sandboxing.** The researcher can create isolated copies of
apparatus data for experiments. This is the mechanism that enables the
apparatus bootstrap: instantiate the apparatus's own data into a sandbox,
run a practitioner against it, observe results without contaminating the
source.

### Key decisions to make during this phase

- Target store layout (mirror the source: `<target>/store/` + `<target>/index.json`?)
- Whether the instantiated apparatus gets its own CLI config or inherits

## Phase 8: Annotations (optional for first build)

### What gets built

- Git notes integration: `refs/notes/apparatus` ref
- Line-oriented text format: one op per line, timestamp-prefixed
- Op types: `create-annotation`, `close-annotation`
- Content stored as git blobs, referenced by SHA in op lines
- `cat_sort_uniq` merge strategy configured on the notes ref
- `apparatus annotate <target-id> --kind <tag|comment|xref> [--content <c>]`
- `apparatus annotations <target-id>`: list annotations on an object
- Index integration: annotations indexed via target-id for reverse lookup

### Dependencies

- Phase 1 (substrate)
- Phase 3 (index)
- Something to annotate (any phase 2+ object)

### What pops out

**Post-hoc metadata on frozen objects.** Tags, comments, cross-references
that don't modify the frozen object's SHA or advance its structure ref.
Low priority for solo researcher — most useful when multiple people are
commenting on each other's frozen findings.

## Development order and feature milestones

| Milestone | After phase | What the researcher can do |
|-----------|-------------|---------------------------|
| Store exists | 1 | `apparatus init` — empty apparatus, ready to use |
| Research journal | 2 | Record daily observations, browse by topic |
| Fast queries | 3 | List and search operations are instant |
| Structured research | 4 | Create investigations, record findings and assumptions |
| Traced decisions | 5 | **Full forward flow**: observation -> evidence -> decision with citations, staleness, impact |
| Multi-machine | 6 | Push/fetch apparatus data between machines |
| Hermetic sandbox | 7 | Isolated copies for experiments |
| Post-hoc metadata | 8 | Annotate frozen objects without modifying them |

The first five phases form a critical path. The researcher gets incremental
value at each milestone but the system's core purpose — traced design decisions —
requires all five. Phases 6-8 are independent extensions.

## What we are explicitly not building

These are designed into the specification (006) but deferred from this build.
The design accommodates their addition without reworking existing features.

- **CAS writes** (item #8): `update-ref --stdin` with `verify`. One function
  change in substrate layer. No command logic changes.
- **Divergence detection/resolution** (item #10): new sync behavior. Additive.
- **Claim mechanism** (item #11): new commands + owner field enforcement. Additive.
- **Binary serialization** (item #2): swap serde serializer, bump format version.
  Existing data migrated via format migration (Section 10 of design).
- **SQLite index** (item #9): replace index implementation. No command changes.
- **Annotations** (item #4): Phase 8, independent of phases 1-7.
- **Auto-merge for compatible divergence** (item #10): requires divergence
  classification logic. Additive to sync.
- **Secondary indexes**: not needed until scale forces them. Index is a cache;
  its implementation is an internal detail.
