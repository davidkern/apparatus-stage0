# 2026-02-01: Git as a database for apparatus storage

Picking up the triad design work from yesterday. The plan (`journal/2026-01-31-module-reusability-and-process/triad-design/plan.md`) identified "git plumbing as storage layer" as a research topic for today's session, with the framing:

> All apparatus consumers are git repos. Git's porcelain presents a file-and-directory abstraction, but underneath it's a content-addressable store and database (git plumbing). There may be significant utility in using git more directly rather than treating `apparatus.store/` as a conventional directory tree.

The specific capabilities to investigate:

- **Structural enforcement at the storage layer** — append-only semantics, immutability of closed entries, and mutation rules as properties of how data is committed, not skill-level rules an agent is told to follow
- **Worktrees for constrained views** — present exactly the right files for a given activity, enforcing structure through visibility rather than permission
- **CAS properties** — content-addressable storage gives deduplication, integrity verification, and precise references between artifacts
- **Cross-repo references** — git's native object model for cleaner cross-triad references than file paths

The directory-based `apparatus.store/` plan from yesterday serves dual purpose: it's the baseline implementation we can ship immediately, and it's the requirements specification for what a git-native approach would need to replace.

Exploration notes: `journal/2026-02-01-git-as-database/git-exploration-notes.md`

## Behavioral requirements phase

Before evaluating git or any other technology, we needed an operational definition of what the storage layer must support. We extracted behavioral requirements for each structure type, deliberately stated without implementation assumptions (no files, directories, or git objects — just behaviors).

Key reframing: the original triad design plan's requirements were carry-over from the informal file-based implementation. We moved up a level of abstraction to define requirements as behaviors (e.g., "chronological append" rather than "date-prefixed markdown files").

This led to several design-level discoveries:

**Three concerns, not one.** The storage design must address storage semantics, isolation boundaries, and access policy as distinct layers. Easy to conflate.

**Enforcement philosophy.** The system doesn't prevent a knowledgeable engineer from modifying state. It makes normal operating paths structurally sound. Administrator tooling for repairs is desirable.

**Universal instantiation.** All structures need to be instantiable — not just for experiments but for self-modification testing. The apparatus/apparatus-stage0 split is an artificial workaround for the lack of an isolation boundary. The most demanding scenario (practitioner in a hermetic sandbox using apparatus tooling, unable to tell it's a sandbox) drives the architecture.

**The apparatus CLI as boundary enforcer.** We assume a CLI that is the sole interface, mediates all access, maintains isolation, enforces policy. Our job is to design the storage so the CLI's job is easy — not to make the storage enforce policy itself.

**Environment interface spectrum.** The environment doesn't need to see git at all. If the CLI is the only interface, the storage is an implementation detail. This makes the storage format and environment boundary questions separable.

Full behavioral requirements with open questions documented in the exploration notes.

## Containment debate

We identified seven clusters of open design questions, prioritized by design space size × impact. Containment (composition vs. association) was first: smallest space, highest impact.

Rather than discuss it collaboratively (which the retrospective identified as convergence-prone), we ran a structured adversarial debate:

- **Shared priming document** reviewed for neutrality by both a fresh agent and the researcher (arguing composition). Both found bias — in different directions on specific points — and the primer was revised.
- **Independent position statements**: researcher argued composition (against natural lean toward association), fresh agent argued association (against originating agent's lean toward composition).
- **Parallel rebuttals**: two fresh agents, each given primer + their position + opponent's position.
- **Joint evaluation**: originating agent and researcher assessed all four documents.

The debate did not resolve the containment question — it reduced to an ontological disagreement about whether knowledge artifacts have intrinsic identity independent of context (association) or whether context is constitutive of identity (composition). This is a modeling choice, not derivable from requirements. Experimental resolution is indicated.

### Design findings (independent of containment resolution)

1. **Three-layer architecture** — substrate (4 primitives: hierarchy, CAS identity, atomic snapshots, enumeration), structure layer (domain semantics), system layer (cross-structure orchestration). Both sides accepted this. Resolved.

2. **Data model / query model separation** — storage layout optimizes for write coherence and provisioning; a separate index layer optimizes for cross-structural queries. Decouples two decisions we were conflating. Resolved.

3. **Citations as cross-structural mechanism** — a structure records "I relied on finding Y from investigation X at version Z" as owned data, not a live pointer. May work under either containment model. Needs validation.

4. **Assumption discovery** — neither model cleanly handles "find everything affected by this change." Key experimental test case.

5. **Containment** — unresolved. Both positions internally consistent. Experiment needed: implement both minimally against the four substrate primitives, run the same task (journal/investigation overlap, cross-structural citation, assumption impact analysis, selective provisioning).

### Process findings

The adversarial debate protocol directly addresses the retrospective feedback from the previous session:

- **Convergence rate**: committed positions prevent drift; fresh agents produce orthogonal challenge
- **Abstraction management**: primer scope, tension points, and prescribed structure keep the debate bounded; "experiment indicated" is a named exit condition
- **Conceptual origination skew**: researcher originated the three-layer architecture (from composition position, against their natural lean); origination distributed because each side must construct, not just respond
- **Knowledge preservation**: both positions and rebuttals are retained as artifacts — the rejected reasoning is preserved alongside the findings

The protocol itself is a candidate investigation protocol type (`experiment-adversarial`). Full process notes: `journal/2026-02-01-git-as-database/debate-process-notes.md`

## Artifacts

```
journal/2026-02-01-git-as-database/
├── git-exploration-notes.md          # Design notes: requirements, findings, open questions
├── debate-process-notes.md           # Process notes: protocol design, execution, findings
├── containment-debate-primer-v1.md   # Original primer (preserved, read-only)
├── containment-debate-primer.md      # Revised primer (used for debate)
├── composition/
│   ├── primer-review.md              # Researcher's neutrality review
│   ├── position.md                   # Composition position statement
│   └── rebuttal.md                   # Composition rebuttal to association
└── association/
    ├── primer-review.md              # Fresh agent's neutrality review
    ├── position.md                   # Association position statement
    └── rebuttal.md                   # Association rebuttal to composition
```

## Git substrate experiments

With the behavioral requirements and debate findings established, we shifted to experimental validation of git as the storage substrate.

### Experiment 001: Can git do this at all?

Tested five capabilities against actual git plumbing: custom ref namespaces, data model construction, hermetic instantiation via bundle, atomic multi-ref transactions, selective instantiation. All passed. Git is viable. One limitation: `git log --all` includes commits from custom refs, and no declarative git config option exists to exclude them from traversal.

### The ergonomic question

The `git log --all` limitation led to a research detour into how IDE tools (VS Code/GitLens, GitKraken, JetBrains) and prior art (git-bug, DVC, Gerrit, GitHub) handle custom ref visibility. Finding: no tool has solved this declaratively. IDE tools show whatever refs exist in `.git/`, and there's no pattern-based exclusion setting.

The exposure surface narrowed to: only IDE users working directly in the repo where apparatus data is created locally. Clones, CI, remotes, and web UIs are unaffected because custom refs aren't fetched by default.

### Experiment 002: Separate git database

Rather than mitigating the ergonomic issue, we dissolved it. Apparatus data lives in `.apparatus/`, a separate bare git repo alongside the project's `.git/`. Complete bidirectional isolation — no git tool discovers `.apparatus/` because it's not `.git/`. IDE invisibility is total.

This also opens a significant design opportunity: the apparatus remote is configurable independently of the project's code remote. A project defaults to "origin" but can override it. This enables:

- **Access control separation** — different permissions for code vs. apparatus data
- **Selective observation** — a researcher fetches apparatus data from a project without needing code access
- **Centralized research data** — multiple projects push apparatus data to a single remote for cross-project observation

### Resolved

- Git is the storage substrate
- `.apparatus/` (separate bare git repo) is the storage location
- Configurable remote for apparatus data
- All four substrate primitives (hierarchy, CAS identity, atomic snapshots, enumeration) confirmed working
- Hermetic instantiation via `git bundle`, atomic transactions via `git update-ref --stdin`

## Design debate series

With the substrate validated and the containment model selected (composition), six open question clusters remained. We ran structured adversarial debates on each, organized in dependency waves.

### Wave 1: Foundational (parallel)

**Mutability boundaries** — When does data freeze? Side A argued uniform freeze-on-close (terminal status = immutable, one rule for all structures). Side B argued per-structure mutability rules (each structure defines its own freeze semantics). Resolution: both sides were describing nearly the same system. The **uniform mechanism** won (terminal status means immutable, enforced once in the CLI write path), but with **per-structure lifecycles** (each structure defines its own states, transitions, and which states are terminal). Sub-objects with independent mutability get their own status. Annotations are separate objects for post-hoc metadata on frozen content. Reopening is forbidden — revision means creating a new structure referencing the old one.

**Identity** — How are objects identified? This was the sharpest disagreement. Side A argued for pure content-addressed identity (SHAs, cryptographic integrity, self-verifying citations). Side B argued for assigned identity (UUIDs for logical object continuity, stable index keys). Neither side won cleanly. Resolution: a **layered hybrid** — content-addressing at the substrate for integrity and historical precision, assigned identifiers at the system layer for logical object tracking. Citations record both: `(assigned-id, content-SHA)`. The assigned ID provides durability ("what did I cite?"), the SHA provides precision ("what exactly did it contain?"). Users never see UUIDs — the CLI translates between human-readable names and internal identifiers.

### Wave 2: Dependent (parallel)

**Metadata model** — Is there a common metadata shape? Side A proposed a common base schema. Side B proposed per-structure schemas with validation. Resolution: **required interface contract** — every object carries five fields (`id`, `type`, `status`, `schema-version`, `created-at`), but the contract is semantic, not serialization-specific. Each structure defines its own complete schema (no inheritance). The CLI validates the contract at creation/modification time. The contract is versioned independently from structure schemas.

**Granularity** — What constitutes an entry? The most consequential debate for implementation. Side A argued coarse-grained (minimize object count). Side B argued fine-grained (maximize traceability). Resolution: **fine-grained at traceability joints, coarse elsewhere**. The decisive argument: the identity synthesis designed citations as (id, SHA) pairs, which implicitly requires fine-grained objects to produce actionable staleness signals. Citing an entire investigation makes staleness noisy to the point of uselessness.

Concrete decisions: journal entries are per-topic (not per-day), investigation entries are typed at the storage level (research, experiment, evidence), findings and assumptions are independent sub-objects with their own identifiers, design decisions are independent sub-objects. But artifacts stay inside parent entries — they don't participate in the reasoning chain. The standing principle for future decisions: the "citable-unit test" determines whether something becomes a first-class object.

### Wave 3: Deferrable (parallel, lighter treatment)

**Querying** — Side A argued for minimal querying (scan the index). Side B argued for dedicated secondary indexes. Resolution: **single index file with two sections** — a forward index (keyed by assigned-id, scanned for date/status/type queries) and a reverse-citation index (keyed by cited-id, direct lookup for assumption invalidation). Temporal and type-status indexes rejected as premature at the expected scale (hundreds to low thousands of objects). The reverse-citation structure was the one query pattern that justified dedicated structure, because transitive invalidation (multi-hop traversal of the citation graph) is the system's core traceability operation.

**Versioning** — Side A argued a single version concern (per-object schema-version is sufficient). Side B argued for dual versioning (separate storage-format-version). Resolution: **three independent versioning concerns** — per-object schema-version (content evolution), metadata contract version (cross-cutting), and per-apparatus storage format version (structural conventions). The format version is stored as a plain-text blob at `refs/apparatus/meta`, read once during the CLI boot sequence. Forward compatibility: an older CLI encountering a newer format produces an actionable error rather than silently misinterpreting data.

### Wave 4: Experiments — skipped

No sharp disagreements required experimental resolution. All six debates reached clear architectural decisions. The experiments identified across syntheses (finding lifecycle prototyping, index performance benchmarks, meta ref boot sequence) are implementation-level validation, not architectural blockers.

## CLI design document

Synthesized all six debate resolutions plus both experiment results into `journal/2026-02-01-git-as-database/apparatus-cli-design.md` (5200 words). The document is a complete technical specification covering:

- **Architecture**: three-layer model mapped to implementation
- **Storage format**: `.apparatus/` layout, ref namespace, tree structure, blob format, the five contract fields
- **Object types**: 10 types across 3 structures, each with fields, lifecycle states, sub-objects, citation fields
- **Identity and citation model**: two-layer identity, (assigned-id, SHA) citations, staleness detection
- **Mutability enforcement**: terminal status = immutable, implicit transitions, annotations
- **Index specification**: two-section index (forward + reverse-citation), query patterns, rebuild mechanism
- **Instantiation**: hermetic copies via git bundle, selective instantiation, index regeneration
- **Sync/remote protocol**: independent apparatus remotes, full round-trip workflow
- **Versioning strategy**: three concerns, meta ref bootstrap, CLI boot sequence, atomic migration
- **Subcommand reference**: 16 commands with synopsis, behavior, and git plumbing used

The document consolidates 16 unresolved questions from all six debates, grouped by theme and labeled as architectural or implementation-level.

## Unresolved issues

**Architectural** (may need future debate):
- Assumption ownership across structures — lives in the investigation that discovered it, but lifecycle governed by design decisions that cite it
- Historical index snapshots — how to answer "what did the citation graph look like when this decision was made?"
- Garbage collection and object lifetime — what happens to assigned identifiers when objects are deleted?
- Schema complexity budget — 10+ object types, each needing schema, CLI support, and lifecycle definition

**Implementation-level** (resolvable during development):
- Assigned identifier format (UUID v7 is the candidate)
- Finding lifecycle timing (freeze with parent entry, or independently?)
- Annotation storage mechanism (git notes vs. separate subtrees)
- Index update atomicity (two-phase interaction between git refs and index file)
- User-facing name resolution (how the CLI maps human names to assigned IDs)
- Citation role typing (should citations carry semantic roles?)

None are blocking. The design is firm enough to begin implementation.

## Artifacts

```
journal/2026-02-01-git-as-database/
├── ... (earlier artifacts)
├── apparatus-cli-design.md               # CLI design document (5200 words)
├── debates/
│   ├── mutability-boundaries/
│   │   ├── primer.md
│   │   ├── side-a/position.md
│   │   ├── side-b/position.md
│   │   └── synthesis.md
│   ├── identity/
│   │   ├── primer.md
│   │   ├── side-a/position.md
│   │   ├── side-b/position.md
│   │   └── synthesis.md
│   ├── metadata-model/
│   │   ├── primer.md
│   │   ├── side-a/position.md
│   │   ├── side-b/position.md
│   │   └── synthesis.md
│   ├── granularity/
│   │   ├── primer.md
│   │   ├── side-a/position.md
│   │   ├── side-b/position.md
│   │   └── synthesis.md
│   ├── querying/
│   │   ├── primer.md
│   │   ├── side-a/position.md
│   │   ├── side-b/position.md
│   │   └── synthesis.md
│   └── versioning/
│       ├── primer.md
│       ├── side-a/position.md
│       ├── side-b/position.md
│       └── synthesis.md
```

## Reviewed design with git technical docs

Had agent read contents of all git/Documentation/technical content and then critique the design.

- original design draft - `design/000 - design.md`
- critique from git technical documentation - `design/001 - critique - git technical docs.md`
- questions and recommendations - `design/002 - recommendation - git technical docs.md`

## Prior art: code review systems storing data in git

Researched two production systems that use git as a database for code review metadata, to inform the apparatus storage design.

**git-appraise** (Google) -- Fully distributed code review with no server. Stores review data as git notes under `refs/notes/devtools/{reviews,discuss,ci,analyses}`. Each datum is a single line of JSON, enabling automatic conflict-free merge via git's built-in `cat_sort_uniq` notes merge strategy (concatenate, sort, deduplicate). Four JSON schemas (request, comment, CI, analysis) with a `v` field for format evolution. Key insight: format-constrained serialization (one JSON line per datum) makes distributed merge trivial but limits data to flat structures.

**Gerrit NoteDb** -- Migrated from SQL to pure git storage in Gerrit 3.0. Each change's metadata is a linear DAG of commits on `refs/changes/YZ/XYZ/meta`, where commit messages use structured footers (`Patch-set:`, `Label:`, `Status:`, `Reviewer:`, etc. -- 29 footer keys total). Inline comments stored as JSON blobs in a NoteMap within the commit tree, keyed by patchset commit SHA. Account data on per-user branches in All-Users (`refs/users/CD/ABCD`). External IDs as git notes with git-config-format blobs. Project config on `refs/meta/config` (INI-format `project.config` + `groups` TSV). Ref sharding (`refs/changes/YZ/...`) for performance at scale. Server serializes writes; concurrent modifications resolved by rebasing meta commits.

Comparative finding: git-appraise optimizes for distributed conflict-free merge (flat data, append-only lines); Gerrit optimizes for auditability and rich structure (commit DAG as event log, NoteMap for comments, tree objects for hierarchy). Apparatus needs elements of both: distributed merge (like git-appraise) with hierarchical structure (like Gerrit).

- prior art research - `design/003 - prior art - code review in git.md`

## Prior art survey: git-like CAS for structured data (databases, issue trackers, data lakes)

Surveyed tools that use git or git-like content-addressable storage for structured data beyond code review. Full writeup: `design/004 - prior art - git as structured data store.md`

Tools examined: git-dit (issues as commits), git-bug (operation-based model with Lamport clocks), Noms (origin of prolly trees, content-addressable database), Dolt (SQL database on prolly trees with cell-level three-way merge), Git LFS (two-tier CAS via clean/smudge filters), git notes (metadata without hash mutation), lakeFS (prolly trees for object storage), Fossil (SQLite as git alternative with integrated tickets), GitDocumentDB (git as CRDT), IPFS (network-level CAS).

Key design validations for apparatus: ref-namespace isolation is well-established prior art, content-addressed identity as substrate with assigned IDs as a layer on top is the standard pattern, our immutable-blob approach sidesteps the canonical serialization problem that Noms/Dolt solve with prolly trees, and the storage/query separation we adopted is independently validated by Fossil and Dolt. Primary future concern identified: if apparatus ever needs distributed concurrent editing, field-level merge (Dolt's approach) and operation-based models (git-bug's approach) are the two proven paths.

## Prior art synthesis: cross-cutting findings

Synthesized findings from all 12 tools examined (git-bug, git-annex, git-appraise, Gerrit NoteDb, Jujutsu, DVC, git-dit, Dolt, Noms, Fossil, GitDocumentDB, lakeFS) into a single document organized by apparatus design concern rather than by tool.

Additional tools examined in this pass: **git-annex** (union-mergeable log format on an orphan branch, journal-as-WAL with overlay reads, SQLite caches with stored-ref-SHA staleness detection), **Jujutsu** (operation log as append-only DAG for undo/concurrent access, `refs/jj/keep/*` for GC protection, change-id commit header standardized jointly with GitButler and adopted by Gerrit, algebraic conflict representation on trees), **DVC** (experiment tracking via `refs/exps/<hash>/<name>`, invisible to porcelain, promotable to branches).

Key findings that affect the apparatus design:

1. **Canonical serialization is non-negotiable.** Every tool that uses content-addressed identity has solved this. Three strategies: canonical by construction (binary formats), canonical by constraint (trivially simple text), canonical by convention (single serializer, never reserialize). YAML fits none. This strengthens the case for JSON with sorted keys.

2. **Separate store validated.** Jujutsu's internal mode (bare repo at `.jj/repo/store/git/`) independently validates the apparatus approach. No tool has solved IDE visibility of custom refs declaratively; separate store is the only complete solution.

3. **Index staleness via stored ref SHA.** git-annex stores the branch HEAD SHA at index-build time and compares on read. More robust than a generation counter for detecting when the index needs updating. Apparatus should adopt this.

4. **Commit trailers for operational metadata.** Gerrit uses 29 structured footer keys in commit messages, queryable via `for-each-ref --format='%(trailers:key=...)'`. The apparatus design should use trailers for the audit trail rather than leaving commit messages unspecified.

5. **git notes for annotations on frozen objects.** Resolves the lifecycle contradiction (annotations advancing terminal structure refs). Notes live in separate refs, don't affect annotated objects' SHAs, and have built-in merge strategies. Both git-appraise and Gerrit use notes in production.

6. **Two-layer identity is the universal pattern.** Jujutsu (change ID + commit SHA), Gerrit (change number + patchset SHA), apparatus (assigned ID + content SHA) — all independently arrived at the same design. Stable logical identity + content-addressed precision.

- synthesis document - `design/005 - prior art - synthesis.md`
- detailed git-bug research (operation DAG model, Lamport clocks, empty-blob metadata, JSON serialization)
- detailed git-annex research (union merge, journal/WAL, SQLite caches, location log format, hashed subdirectories)
- detailed Jujutsu research (operation log, GC protection refs, conflict algebra, split storage model)
- detailed DVC research (experiment refs, baseline-keyed hierarchy, porcelain invisibility)
