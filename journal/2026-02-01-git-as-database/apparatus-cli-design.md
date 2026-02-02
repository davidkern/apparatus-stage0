# Apparatus CLI Design Specification

## 1. Overview

The Apparatus is a structured knowledge system for tracking design reasoning across software projects. It maintains three core structures -- journals, investigations, and designs -- that together form a traceable chain from daily research observations through evidence gathering to ratified design decisions. The system's defining property is that every design decision can be traced back to the findings and assumptions it relies upon, and every assumption can be traced forward to every decision it affects.

The Apparatus CLI is the sole supported interface for reading and writing apparatus data. It mediates all access to the underlying storage, enforces mutability rules, maintains a derived index for queries, and provides hermetic instantiation for isolated experimentation. The CLI is both the enforcement boundary for data integrity and the user's primary interaction surface.

Apparatus data is stored in the **apparatus store**, a bare git repository at `$DEVENV_STATE/apparatus/store/`. The store lives inside devenv's state directory, invisible to the project's git tooling and IDE. Project git operations never discover apparatus data, and apparatus operations never see project data. The CLI derives the store path from `$DEVENV_STATE` at runtime and accesses it by setting `GIT_DIR=$DEVENV_STATE/apparatus/store` using git plumbing commands exclusively -- no porcelain. All writes go through `git hash-object`, `git mktree`, `git commit-tree`, and `git update-ref`. All reads go through `git cat-file`, `git ls-tree`, and `git for-each-ref`.

The design documented here is the product of six adversarial debates (on mutability boundaries, identity, metadata model, granularity, querying, and versioning) and two validation experiments (git substrate capabilities and store isolation). Each section states resolved decisions as facts. Unresolved tensions are collected in Section 12.

## 2. Architecture

The system follows a three-layer architecture accepted during the containment debate:

**Storage substrate.** The apparatus store (`$DEVENV_STATE/apparatus/store/`), a bare git repo. Provides four primitives: hierarchical containment (trees), content-addressable identity (SHA-based object store), atomic snapshots (commits and `update-ref --stdin` transactions), and enumeration with metadata (`for-each-ref`, `ls-tree`). The substrate is a standard git repository. No custom object types or storage extensions are used.

**Structure layer.** Domain-specific logic for each structure type (journal, investigation, design). Each structure defines its own object schemas, lifecycle states, state transitions, and which states are terminal. The structure layer maps domain operations (add an entry, ratify a decision) onto substrate primitives (hash a blob, build a tree, create a commit, update a ref).

**System layer.** Cross-structure orchestration. Responsible for the derived index, citation staleness detection, reverse-citation traversal, mutability enforcement, instantiation, and the CLI boot sequence. The system layer operates on all structures uniformly through the required metadata contract.

Layer interaction follows a strict direction: the system layer calls into structure layers, which call into the substrate. The substrate has no knowledge of structures. Structures have no knowledge of each other. Cross-structural operations (citation checking, impact analysis) live exclusively in the system layer, mediated by the derived index.

## 3. Storage Format Specification

### The store directory

A bare git repository at `$DEVENV_STATE/apparatus/store/`, initialized with `git init --bare "$DEVENV_STATE/apparatus/store"`. The store lives inside devenv's state directory, which is already gitignored by the standard `.devenv*` pattern. The apparatus has its own independent remote for push/fetch operations, configured separately from the project's remotes.

### The meta ref

`refs/apparatus/meta` points to a blob (not a commit) containing a single line:

```
format: 1
```

This is the storage format version. It is an integer that increments when structural conventions change (ref namespace patterns, tree layouts, commit chain semantics, index organization). It does not track per-object schema changes or metadata contract changes. The meta ref is created during `apparatus init` and included in instantiation bundles.

### Ref namespace convention

Each structure instance occupies its own ref under `refs/apparatus/`:

| Structure | Ref pattern | Example |
|-----------|-------------|---------|
| Journal | `refs/apparatus/journal/<topic-slug>` | `refs/apparatus/journal/latency-investigation` |
| Investigation | `refs/apparatus/investigation/<id>` | `refs/apparatus/investigation/inv-001` |
| Design | `refs/apparatus/design/<id>` | `refs/apparatus/design/cache-strategy` |
| Meta | `refs/apparatus/meta` | (singleton) |

Each ref points to the head commit of that structure instance's commit chain. The commit chain provides the built-in audit trail: each commit represents a state transition (entry added, status changed, decision ratified).

### Tree structure within commits

Each commit's tree organizes the structure's content:

```
# Investigation tree example (refs/apparatus/investigation/inv-001)
.
+-- _meta.yaml          # Structure-level metadata (id, type, status, schema-version, created-at)
+-- entries/
|   +-- entry-001/
|   |   +-- _meta.yaml  # Entry metadata (id, type=research, status, schema-version, created-at)
|   |   +-- content.md  # Entry content
|   |   +-- findings/
|   |   |   +-- f-001.yaml   # Finding sub-object (id, type=finding, status, ...)
|   |   |   +-- f-002.yaml
|   |   +-- assumptions/
|   |       +-- a-001.yaml   # Assumption sub-object
|   |   +-- artifacts/
|   |       +-- dataset.csv  # Artifacts are blobs, not independent objects
|   +-- entry-002/
|       +-- _meta.yaml  # Entry metadata (type=experiment)
|       +-- content.md
|       +-- parameters.yaml
|       +-- measurements.yaml
```

Container-level metadata lives in `_meta.yaml` at each level. Sub-objects (findings, assumptions, decisions) live in typed subdirectories. Artifacts are plain blobs within their parent entry's tree; they do not receive assigned identifiers.

### Blob format

Object content is serialized as YAML. Each object blob begins with the five required contract fields, followed by type-specific fields:

```yaml
# Example: a finding sub-object (f-001.yaml)
id: "f-7a3b2c1d-4e5f-6789-abcd-ef0123456789"
type: "finding"
status: "active"
schema-version: 1
created-at: "2026-02-01T14:30:00Z"

summary: "Connection pooling reduces p99 latency by 40% under load"
confidence: "high"
supporting-evidence:
  - "Benchmark results in entry-002 measurements"
```

The `_meta.yaml` blobs at structure and entry levels follow the same convention: five contract fields first, then structure-specific fields.

### The five required contract fields

Every object in the system carries these fields:

| Field | Type | Semantics |
|-------|------|-----------|
| `id` | string (assigned identifier) | Stable logical identity. Generated at creation time. Never changes across edits. |
| `type` | string | Structure type discriminator. Authoritative -- overrides structural position on conflict. |
| `status` | string | Current lifecycle state. Valid values defined per-type. |
| `schema-version` | integer | Version of this type's schema. Enables forward readability. |
| `created-at` | ISO 8601 timestamp | Creation time. Immutable after initial write. |

The contract is versioned independently from individual type schemas. The current contract version is 1.

### Assigned identifier embedding

The assigned identifier (`id` field) is stored as part of the object's content. This means it is content-addressed along with everything else -- it participates in SHA computation, survives bundling, and is versioned in the commit chain. The CLI generates the identifier at object creation time. The identifier format is deferred (UUID v7 is the default candidate). Users never type or read identifiers directly; the CLI translates between human-readable names and assigned identifiers.

## 4. Object Types and Schemas

### Journal entry

**Parent structure:** Journal (one ref per topic).
**Required fields:** `id`, `type: "journal-entry"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `topic` (required string), `structure-ref` (optional reference to investigation or design), `content` (markdown body in `content.md`).
**Lifecycle:** `open` -> `closed`. Terminal state: `closed`. Transition is implicit: creating the next entry on the same topic ref closes the previous entry. The status field reflects this transition explicitly even though the trigger is implicit.
**Sub-objects:** None. Journal entries do not produce citable sub-objects.
**Citations:** A journal entry may contain prose references but does not carry structured citation metadata.

### Investigation

**Parent structure:** None (top-level container).
**Required fields:** `id`, `type: "investigation"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `title`, `question`, `completion-criteria`.
**Lifecycle:** `active` -> `complete` | `abandoned`. Terminal states: `complete`, `abandoned`. Both are irreversible.
**Sub-objects:** Contains typed entries (research, experiment, evidence).

### Research entry

**Parent structure:** Investigation.
**Required fields:** `id`, `type: "research-entry"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `summary`, `methodology`, `content` (markdown body).
**Lifecycle:** `open` -> `closed`. Terminal state: `closed`. Freezes when the next entry is added or when the investigation reaches a terminal state.
**Sub-objects:** Findings, assumptions.
**Citations:** May cite findings or assumptions from other structures.

### Experiment entry

**Parent structure:** Investigation.
**Required fields:** `id`, `type: "experiment-entry"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `hypothesis`, `parameters` (structured YAML in `parameters.yaml`), `measurements` (structured YAML in `measurements.yaml`), `content` (markdown body).
**Lifecycle:** `open` -> `closed`. Terminal state: `closed`.
**Sub-objects:** Findings.

### Evidence entry

**Parent structure:** Investigation.
**Required fields:** `id`, `type: "evidence-entry"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `source`, `relevance`, `content` (markdown body).
**Lifecycle:** `open` -> `closed`. Terminal state: `closed`.
**Sub-objects:** None.

### Finding

**Parent structure:** Research entry or experiment entry.
**Required fields:** `id`, `type: "finding"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `summary`, `confidence`, `supporting-evidence` (list of prose references to parent entry content).
**Lifecycle:** `active` -> `frozen`. Terminal state: `frozen`. Freezes when the parent entry freezes (the conservative default).
**Sub-objects:** None.
**Citability:** Findings are the primary citation target. Design decisions cite findings via `(finding-id, content-SHA)` pairs.

### Assumption

**Parent structure:** Research entry, or design (assumptions can originate in either).
**Required fields:** `id`, `type: "assumption"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `statement`, `basis` (why this is assumed), `invalidation-conditions` (what would falsify it).
**Lifecycle:** `active` -> `frozen`. Terminal state: `frozen`. Freezes when the parent entry or design freezes.
**Sub-objects:** None.
**Citability:** Assumptions are cited by design decisions. Invalidating an assumption triggers impact analysis across all citing decisions.

### Design

**Parent structure:** None (top-level container).
**Required fields:** `id`, `type: "design"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `title`, `problem-statement`, `scope`.
**Lifecycle:** `active` -> `ratified` | `abandoned`. Terminal states: `ratified`, `abandoned`.
**Sub-objects:** Decisions, assumptions.

### Decision

**Parent structure:** Design.
**Required fields:** `id`, `type: "decision"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `statement`, `rationale` (markdown), `citations` (list of `(assigned-id, content-SHA)` pairs pointing to findings and assumptions).
**Lifecycle:** `draft` -> `ratified` | `rejected`. Terminal states: `ratified`, `rejected`. A decision can be ratified while the parent design remains active. This is recursive application of the terminal-means-frozen rule.
**Sub-objects:** None.

### Annotation

**Parent structure:** Stored alongside the annotated object but as a separate blob.
**Required fields:** `id`, `type: "annotation"`, `status`, `schema-version`, `created-at`.
**Type-specific fields:** `target-id` (assigned ID of the annotated object), `kind` (tag, cross-reference, comment), `content`.
**Lifecycle:** `active` -> `closed`. Terminal state: `closed`. Annotations have their own lifecycle independent of the annotated object.
**Purpose:** Annotations allow post-hoc metadata on frozen objects without modifying the frozen object's content or SHA. The frozen object's content-addressable identity is unaffected.

## 5. Identity and Citation Model

### Two-layer identity

**Substrate layer:** Every git object has a SHA, computed from its content. This provides cryptographic integrity verification, deduplication, and historical precision. The SHA changes on any content edit.

**System layer:** Every logical object receives an assigned identifier at creation time. This identifier is embedded in the object's content (the `id` field), making it part of the content-addressed representation. The identifier does not change when other content is edited. It provides stable join keys for index queries, staleness detection, cross-instantiation comparison, and user-facing reference resolution.

### Citation format

A citation is a pair: `(assigned-id, content-SHA)`.

- The **assigned ID** answers: "what logical object did I rely on?"
- The **content SHA** answers: "what exactly did it contain when I relied on it?"

Example citation in a decision's metadata:

```yaml
citations:
  - id: "f-7a3b2c1d-4e5f-6789-abcd-ef0123456789"
    sha: "a1b2c3d4e5f6..."
  - id: "a-9f8e7d6c-5b4a-3210-fedc-ba9876543210"
    sha: "f6e5d4c3b2a1..."
```

### Staleness detection

A citation is stale when the cited object's current SHA differs from the SHA recorded in the citation. Detection is a batch operation: for each citation pair in the index, compare the recorded SHA against the current SHA for that assigned ID. This is O(n) in citation count using the forward index.

The CLI surfaces staleness when displaying decisions and during explicit `apparatus check` runs. Staleness is a derived property, not stored state -- it is computed at display time from the index.

### Identifier generation

The CLI generates assigned identifiers at object creation time. The identifier is written into the object's `id` field before the blob is hashed. The identifier must be unique within the apparatus instance. The format is deferred (UUID v7 is the default candidate: time-sortable, low collision risk). Users refer to objects by human-readable names (entry topics, investigation titles, decision numbers); the CLI resolves these to assigned identifiers internally.

## 6. Mutability Enforcement

### The uniform rule

Terminal status means immutable. This is the single system-wide invariant. The CLI enforces it on every write path: before modifying any object, check its status. If the status is terminal for that type's lifecycle, reject the modification with a clear error.

This rule applies recursively to sub-objects. A ratified decision within an active design is immutable even though its parent is not. A frozen finding within a closed research entry is immutable. The enforcement code is one check, applied uniformly.

### Write-path enforcement

Every CLI write operation follows this sequence:

1. Resolve the target object by human-readable name to assigned ID.
2. Read the target object's current status from the index (or from the git object if the index is stale).
3. If the status is terminal for this type, reject the operation.
4. Perform the modification (hash new blob, build new tree, create new commit, update ref).
5. Update the index.

### Implicit transitions

The journal's freeze-on-next-entry pattern is the primary implicit transition. When the CLI creates a new entry on a topic ref, it simultaneously transitions the previous entry's status to `closed`. Internally, this means the new commit's tree contains an updated `_meta.yaml` for the previous entry (with `status: closed`) alongside the new entry. The status field reflects reality: inspection always reveals when and why an entry was frozen.

Investigation entries follow the same pattern: adding a new entry implicitly closes the previous one. When an investigation reaches a terminal state (`complete` or `abandoned`), all open entries and their sub-objects transition to their terminal states in a single atomic commit.

### Why reopening is forbidden

Closed structures stay closed. If a finding needs revision, the researcher creates a new investigation (or a new entry in an active investigation) that references the original. This preserves the traceability guarantee: a cited finding's content at the time of citation is cryptographically verifiable, and no subsequent operation can silently alter it. The friction of creating new structures is a feature -- it produces an explicit record of why the revision was necessary.

### Annotations as the post-hoc mechanism

When a researcher needs to attach metadata to a frozen object (tags, corrections, cross-references), they create an annotation. The annotation is a separate object with its own lifecycle, stored alongside but not inside the frozen object. The frozen object's SHA is unaffected. The index tracks annotations via the `target-id` field, enabling queries like "show me all annotations on this finding."

## 7. Index Specification

### Structure

The index is a single derived file with two sections: a forward index and a reverse-citation index.

### Forward index

Keyed by assigned ID. Each entry contains:

```yaml
# Forward index entry schema
id: "f-7a3b2c1d..."
type: "finding"
status: "frozen"
schema-version: 1
created-at: "2026-02-01T14:30:00Z"
structural-path: "investigation/inv-001/entries/entry-001/findings/f-001"
current-sha: "a1b2c3d4..."
citations:
  - id: "..."
    sha: "..."
```

The forward index serves: direct object lookup by assigned ID, date range queries (scan with `created-at` filter), status filtering (scan with `type` + `status` predicate), and forward citation resolution.

### Reverse-citation section

Keyed by cited assigned ID. Each entry is a list of citing assigned IDs:

```yaml
# Reverse-citation entry
"f-7a3b2c1d...":
  - "d-abcdef01..."   # decision that cites this finding
  - "d-12345678..."   # another decision
```

The reverse-citation section serves: assumption invalidation ("which decisions cite this assumption?"), evidence trail reconstruction (alternating forward and reverse lookups), and reverse staleness detection.

### Query patterns

| Query | Method |
|-------|--------|
| Date range | Sequential scan of forward index, filter on `created-at` |
| Status filter | Sequential scan, filter on `type` + `status` |
| Reverse citation lookup | Direct key lookup in reverse-citation section |
| Evidence trail traversal | Alternating forward (resolve citation targets) and reverse (find citers) lookups |
| Staleness check | For each citation in forward index, compare `sha` against `current-sha` of cited ID |

No temporal index or type-status index. At the expected scale (hundreds to low thousands of objects), sequential scans with predicate filters complete in single-digit milliseconds.

### Storage location

The index is stored as a file in the store directory outside the git object store (e.g., `$DEVENV_STATE/apparatus/store/index.json`). It is not a git blob. This avoids polluting the object store with derived data that changes on every operation. The index is not included in instantiation bundles; it is regenerated after instantiation.

### Rebuild mechanism

`apparatus rebuild-index` walks all refs under `refs/apparatus/`, reads all objects via `git cat-file`, parses metadata and citations, and regenerates both sections from scratch. This is the recovery path (after index corruption), the initialization path (after instantiation), and the verification path (cross-check forward and reverse sections for consistency).

### Atomic update

Index updates use write-then-rename: write the new index to a temporary file, then atomically rename it over the existing index. A generation counter embedded in the index detects staleness relative to git refs. If a CLI operation finds a stale generation counter, it triggers a rebuild before proceeding.

## 8. Instantiation Mechanism

### What instantiation means

Instantiation creates a hermetically isolated copy of apparatus data. The target is a fully independent git repository with no links (no remotes, no alternates, no filesystem path references) to the source. An actor within the instantiated environment cannot discover or access data outside it.

### The three-step sequence

```bash
STORE="$DEVENV_STATE/apparatus/store"

# 1. Bundle the desired refs from the source store
GIT_DIR="$STORE" git bundle create apparatus.bundle \
  refs/apparatus/meta \
  refs/apparatus/investigation/inv-001

# 2. Initialize an empty bare repo at the target
git init --bare /target/store

# 3. Fetch the bundle into the target
GIT_DIR=/target/store git fetch apparatus.bundle \
  'refs/apparatus/meta:refs/apparatus/meta' \
  'refs/apparatus/investigation/inv-001:refs/apparatus/investigation/inv-001'
```

Total overhead is approximately 30-40ms for small datasets. Cost scales with extracted data size, not source repo size.

### What gets bundled

Data refs (journal, investigation, design refs) plus the meta ref (`refs/apparatus/meta`). The meta ref is required so the target apparatus is self-describing. The index is NOT bundled -- it is derived data and is regenerated after fetch.

### Index regeneration on instantiation

After the fetch step, the CLI runs `apparatus rebuild-index` on the target to generate the index from the fetched objects. This ensures the index is consistent with the instantiated data.

### Selective instantiation

The bundle can include any subset of refs. Bundling only `refs/apparatus/investigation/inv-001` produces a target containing only that investigation's objects. Git's content-addressable storage guarantees that only objects reachable from the specified refs are included. Objects belonging to other structures are completely absent from the target -- not just unreferenced, but physically missing.

## 9. Sync / Remote Protocol

### Independence from project remotes

The apparatus remote is configured independently from the project's git remotes. A project may push code to `github.com/org/project` while pushing apparatus data to a different host, a different repo on the same host, or the same host with different access controls.

### The GIT_DIR access pattern

All remote operations set `GIT_DIR` to the store path:

```bash
STORE="$DEVENV_STATE/apparatus/store"

# Add a remote to the store
GIT_DIR="$STORE" git remote add origin git@host:apparatus-data.git

# Push all apparatus refs
GIT_DIR="$STORE" git push origin 'refs/apparatus/*:refs/apparatus/*'

# Fetch all apparatus refs from the remote
GIT_DIR="$STORE" git fetch origin 'refs/apparatus/*:refs/apparatus/*'
```

### Full round-trip workflow

1. **Source project:** Researcher creates apparatus data. Pushes with `apparatus sync push`.
2. **Shared remote:** Bare git repo receives apparatus refs.
3. **Target project:** Another researcher (or the same researcher on a different machine) runs `apparatus sync fetch`. This fetches refs into their local store and triggers an index rebuild.
4. **Observation:** A researcher can add another project's apparatus remote to their own store and fetch, enabling cross-project observation without modifying the observed project.

The CLI wraps these operations so users do not need to construct `GIT_DIR` commands manually.

## 10. Versioning Strategy

### Three versioning concerns

| Concern | Tracked by | Scope | Change frequency |
|---------|-----------|-------|-----------------|
| Per-object content schema | `schema-version` field in each object | Per-type | When a type's fields change |
| Metadata contract | Contract version (implicit in format) | System-wide | When the five required fields change |
| Storage format | `format` field in meta ref blob | Per-apparatus | When ref layout, tree structure, or index organization changes |

### The meta ref as bootstrap handshake

The meta ref (`refs/apparatus/meta`) is the first thing the CLI reads. Its content -- a single integer -- tells the CLI which structural conventions are in effect. This enables forward-compatible error messages: a CLI that supports format 1 encountering a format 2 apparatus produces "apparatus uses format 2; CLI supports format 1; upgrade required" rather than silently misinterpreting the data.

### CLI boot sequence

1. Set `GIT_DIR=$DEVENV_STATE/apparatus/store`.
2. `git rev-parse refs/apparatus/meta` -- does the meta ref exist?
3. **If yes:** `git cat-file blob <sha>` -- read the format version.
   - Recognized version: use the corresponding layout module.
   - Higher version: error with actionable upgrade message.
   - Lower version: offer migration.
4. **If no:** fall back to ref-namespace inspection.
   - `git for-each-ref refs/apparatus/` -- enumerate refs.
   - No refs: apparatus is empty, offer to initialize.
   - Refs exist without meta ref: legacy format 0, offer to add meta ref.

### Migration

Format migrations are atomic. All ref changes (layout restructuring plus meta ref update) are wrapped in a single `update-ref --stdin` transaction with `start`/`prepare`/`commit` phases. If any step fails, nothing changes. Migration can chain (format 1 -> 2 -> 3) but each step is individually atomic.

### Forward compatibility

Per-object: when the CLI encounters an object with a `schema-version` higher than what it understands for that type, it reads the five contract fields (guaranteed present) and displays a degraded view with a warning. The contract fields provide a minimum viable representation of any object.

Per-apparatus: when the CLI encounters an unrecognized format version, it produces an actionable error and refuses to operate. Silent misinterpretation is unacceptable.

## 11. CLI Subcommand Reference

### `apparatus init`

**Synopsis:** `apparatus init`

Initializes the apparatus store at `$DEVENV_STATE/apparatus/store/`. Runs `git init --bare "$DEVENV_STATE/apparatus/store"`, writes a blob containing `format: 1`, points `refs/apparatus/meta` at the blob via `update-ref`. Creates an empty index file.

**Git plumbing:** `git init --bare`, `git hash-object -w --stdin`, `git update-ref`.

### `apparatus journal add`

**Synopsis:** `apparatus journal add --topic <topic> [--ref <investigation-or-design-id>]`

Creates a new journal entry on the specified topic ref. If a previous entry on that topic is open, its status is transitioned to `closed` in the same commit. Generates an assigned identifier for the new entry, writes the entry blob and `_meta.yaml`, builds the new tree, creates a commit on `refs/apparatus/journal/<topic-slug>`, and updates the index.

**Git plumbing:** `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus journal list`

**Synopsis:** `apparatus journal list [--topic <topic>] [--since <date>] [--until <date>]`

Enumerates journal entries. Without filters, lists all entries across all topics in reverse chronological order. Reads from the forward index (sequential scan with date/topic predicates).

**Git plumbing:** None (index read only). Falls back to `git for-each-ref` + `git ls-tree` + `git cat-file` if the index is stale or missing.

### `apparatus journal show`

**Synopsis:** `apparatus journal show <topic> [<entry-number>]`

Displays a journal entry's content and metadata. Resolves the topic and entry number to an assigned ID via the index, then reads the blob from the git object store.

**Git plumbing:** `git cat-file blob`.

### `apparatus investigation create`

**Synopsis:** `apparatus investigation create --title <title> --question <question>`

Creates a new investigation. Generates an assigned identifier, writes `_meta.yaml` with `status: active` and empty entries directory, creates the initial commit, and points `refs/apparatus/investigation/<id>` at it.

**Git plumbing:** `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus investigation add-entry`

**Synopsis:** `apparatus investigation add-entry <investigation-id> --type <research|experiment|evidence>`

Adds a typed entry to an active investigation. Rejects the operation if the investigation is in a terminal state. Closes the previous open entry if one exists. Generates an assigned identifier for the new entry. For experiment entries, creates placeholder `parameters.yaml` and `measurements.yaml` files.

**Git plumbing:** `git cat-file` (read current tree), `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus investigation complete`

**Synopsis:** `apparatus investigation complete <investigation-id>`

Transitions an investigation to `complete` status. All open entries and their sub-objects (findings, assumptions) transition to their terminal states in the same commit. This is a single atomic operation.

**Git plumbing:** `git cat-file` (read all entry metadata), `git hash-object -w` (rewrite metadata blobs), `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus investigation abandon`

**Synopsis:** `apparatus investigation abandon <investigation-id>`

Transitions an investigation to `abandoned` status. Same cascading freeze behavior as `complete`.

### `apparatus design create`

**Synopsis:** `apparatus design create --title <title> --problem <problem-statement>`

Creates a new design container. Generates an assigned identifier, writes initial `_meta.yaml` with `status: active`, creates the initial commit on `refs/apparatus/design/<id>`.

**Git plumbing:** `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus design add-decision`

**Synopsis:** `apparatus design add-decision <design-id> --statement <statement> [--cite <id>...]`

Adds a decision sub-object to an active design. The decision starts in `draft` status. Citation references are resolved and recorded as `(assigned-id, content-SHA)` pairs. The CLI validates that each cited object exists and records its current SHA.

**Git plumbing:** `git cat-file` (read current tree, resolve cited objects), `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus design ratify-decision`

**Synopsis:** `apparatus design ratify-decision <design-id> <decision-id>`

Transitions a decision to `ratified` status. The decision becomes immutable. The parent design may remain active. This is a terminal transition.

**Git plumbing:** `git cat-file`, `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus cite`

**Synopsis:** `apparatus cite <citing-object-id> <cited-object-id>`

Adds a citation to an object's citation list. Resolves the cited object's current SHA and records the `(assigned-id, SHA)` pair. Rejects if the citing object is in a terminal state.

**Git plumbing:** `git cat-file` (resolve current SHA of cited object, read citing object), `git hash-object -w`, `git mktree`, `git commit-tree`, `git update-ref`.

### `apparatus check`

**Synopsis:** `apparatus check [--verbose]`

Runs staleness detection on all citations in the apparatus. For each citation pair in the forward index, compares the recorded SHA against the current SHA for that assigned ID. Reports stale citations grouped by citing object.

**Git plumbing:** None (index read only). Optionally `git cat-file` to verify SHA accuracy against live objects.

### `apparatus impact`

**Synopsis:** `apparatus impact <object-id>`

Traces the impact of a changed or invalidated object. Uses the reverse-citation section of the index to find all objects that cite the specified object, then recursively traces their citers. Outputs the full dependency tree.

**Git plumbing:** None (index read only).

### `apparatus instantiate`

**Synopsis:** `apparatus instantiate <target-path> [--ref <ref>...]`

Creates a hermetic copy of apparatus data at the target path. Without `--ref` flags, bundles all apparatus refs. With `--ref` flags, bundles only the specified structures. Always includes `refs/apparatus/meta`. After unbundling, runs index rebuild on the target.

**Git plumbing:** `git bundle create`, `git init --bare`, `git fetch`, then index rebuild via `git for-each-ref` + `git cat-file`.

### `apparatus sync push`

**Synopsis:** `apparatus sync push [<remote>]`

Pushes all apparatus refs to the configured apparatus remote. Defaults to `origin`.

**Git plumbing:** `GIT_DIR="$DEVENV_STATE/apparatus/store" git push <remote> 'refs/apparatus/*:refs/apparatus/*'`.

### `apparatus sync fetch`

**Synopsis:** `apparatus sync fetch [<remote>]`

Fetches all apparatus refs from the configured apparatus remote. Triggers an index rebuild after fetch.

**Git plumbing:** `GIT_DIR="$DEVENV_STATE/apparatus/store" git fetch <remote> 'refs/apparatus/*:refs/apparatus/*'`, then index rebuild.

### `apparatus rebuild-index`

**Synopsis:** `apparatus rebuild-index`

Regenerates the derived index from scratch. Walks all refs under `refs/apparatus/`, reads all objects, parses metadata and citations, builds both index sections, writes atomically via rename.

**Git plumbing:** `git for-each-ref refs/apparatus/`, `git ls-tree -r`, `git cat-file blob` (for each object).

## 12. Unresolved Questions and Deferred Decisions

### Identity and naming

1. **Assigned identifier format.** UUID v7 is the default candidate (time-sortable, low collision risk) but the format is deferred to implementation. The architectural commitment is that assigned identifiers exist and are embedded in content, not what format they take.

2. **Path-based identity vs. assigned identity.** Structural paths (`investigation/inv-001/entries/entry-001/findings/f-001`) provide a form of persistent identity. If objects rarely move, paths may suffice without UUIDs. Whether path stability is adequate depends on edit and reorganization patterns that have not been measured. This is an implementation-level question.

3. **User-facing name resolution.** The CLI must translate between human-readable names (topic names, investigation titles, decision numbers) and assigned identifiers. The resolution mechanism (substring matching, exact matching, numbered aliases) is a UX design question deferred to implementation.

### Mutability and lifecycle

4. **Decomposition granularity boundary.** The uniform model requires anything with independent mutability to be modeled as a separate object with its own status. This is architecturally clean but may force unnatural decomposition for structures where the mutable/immutable boundary cuts across what is naturally a single document. No concrete example has been produced, so this is theoretical. It is the most likely source of future architectural pressure.

5. **Finding lifecycle timing.** Findings freeze when their parent entry freezes (the conservative default). This may be too early (a finding might need refinement across sessions) or too late (a finding might need to be citable before the entry is complete). Requires practical experience to resolve. Implementation-level.

6. **Assumption ownership.** An assumption discovered during investigation X but cited by design decisions Y and Z lives in investigation X but has its lifecycle governed by its consumers. The tension between compositional ownership and cross-structural relevance is not fully resolved. Architectural.

7. **Implicit transition UX.** When journal entry 5 is implicitly closed by creating entry 6, should the CLI surface the transition ("Entry 5 is now closed") or keep it hidden? UX question, implementation-level.

### Index and querying

8. **Index storage vs. bundling.** The index lives outside the git object store as a file in the store directory. It is regenerated on instantiation. Whether the interaction between index file updates and `update-ref` transactions (a two-phase operation) creates consistency hazards needs implementation testing. Implementation-level.

9. **Citation role typing.** Should citation pairs include semantic role ("relies-on" vs. "supersedes")? Typed citations enable richer queries but add schema complexity. Deferred. Implementation-level.

10. **Historical index snapshots.** The index tracks current state only. Answering "what did the citation graph look like when this decision was made?" requires either index snapshots or reconstruction from commit history. The cost and need are unclear. Architectural.

### Versioning and evolution

11. **Meta ref as blob vs. commit.** Starting with a blob is simpler. Upgrading to a tree-based structure (if additional format metadata is needed) is itself a format version bump. Implementation-level.

12. **Contract version location.** The CLI's compiled-in format version implies a minimum contract version. This coupling is implicit. Whether the meta ref should carry the contract version explicitly may need future resolution. Architectural.

13. **Schema complexity budget.** The system defines types for: journal entries, research entries, experiment entries, evidence entries, findings, assumptions, decisions, designs, investigations, and annotations. That is ten types plus three container types. Each needs a schema, CLI support, and lifecycle definition. Whether future structures will strain this type system is unknown. Architectural.

### Storage model

14. **Containment resolution.** The containment question (composition vs. association) was not resolved by debate -- it reduced to an ontological modeling choice. The design in this document assumes composition (structures own their children). If practical implementation reveals cases where association is superior, the architecture may need revision. Architectural.

15. **Annotation storage mechanism.** Annotations are separate objects associated with frozen objects. The concrete storage mechanism (git notes, a separate subtree per annotated object, inline annotation objects in the containment hierarchy) needs implementation prototyping. Implementation-level.

16. **Garbage collection and object lifetime.** What happens when objects are deleted or archived? Under assigned identity, a deleted object's identifier must be removed from the index and its references handled (dangling? tombstoned?). The lifecycle model for assigned identifiers beyond terminal states is undesigned. Architectural.
