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
