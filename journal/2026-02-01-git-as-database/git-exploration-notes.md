# Git as a database: exploration notes

## Starting question

Can git plumbing replace the conventional directory tree (`apparatus.store/`) as the storage layer for apparatus data? What do we gain, what do we lose, and what's the minimal proving slice?

## Design principles

### Three concerns

The storage design must address three distinct concerns that are easy to conflate:

1. **Storage semantics** — what properties the data has (append-only, content-addressed, immutable after close, etc.)
2. **Isolation boundaries** — what a given actor can see and reference (their information horizon)
3. **Access policy** — what a given actor can do within their boundary

These are layered: storage provides the structural properties, isolation controls visibility, policy controls operations within the visible scope.

### Enforcement philosophy

There will always be a position in the system where invariants can be violated (e.g., direct write access to `.git` makes all history mutable). The goal is not to prevent a knowledgeable engineer from modifying state — in fact, administrator-level tooling for repairs is desirable. The goal is to make the *normal operating paths* structurally sound, so that actors using the provided tooling cannot accidentally or casually violate invariants.

## Discussion order (ephemeral — remove when done)

Resolve open questions by cluster, ordered by smallest design space × highest impact:

- [ ] **1. Containment** — composition vs. association. Affects investigation, design, snapshotting, data model shape. Two real options; instantiation requirement likely decides it.
- [ ] **2. Mutability boundaries** — generalize journal's freeze-on-close pattern. Affects what the storage enforces and the CLI checks. Includes metadata vs. content mutability.
- [ ] **3. Identity** — how objects are identified and referenced across structures and instantiations. More options to evaluate; depends partly on 1 and 2.
- [ ] **4. Metadata model** — common base vs. per-structure. Downstream of 1–3.
- [ ] **5. Granularity** — what constitutes an entry, how structures interrelate. Refinement after structural decisions.
- [ ] **6. Querying** — deferrable. Confirm chosen storage can support it; don't design fully now.
- [ ] **7. Versioning** — deferrable. Confirm the design can accommodate it.

## Behavioral requirements

Requirements stated in terms of behaviors, not implementation form. Each could be satisfied by files, git objects, database rows, or something else.

---

### Journal

The journal is the append-only reasoning record. It is the simplest structure and the most well-understood from existing usage in the research space.

**Established behaviors:**

1. **Chronological append**: new entries are added in time order; no insertion into the past
2. **Entry immutability**: once an entry is no longer the most recent, its content cannot be modified
3. **Structured metadata**: each entry carries machine-readable metadata (status, tags, etc.) that can be read and updated programmatically
4. **Artifact association**: an entry can have associated artifacts (code, data, images) grouped with it
5. **Current-entry mutability**: the most recent entry (and its artifacts) is open for modification; closing happens implicitly when a new entry is created

**Open questions:**

- [ ] **Querying**: can the CLI retrieve entries by date range? By metadata value (e.g., all entries tagged X)? Or is enumeration (list all, in order) sufficient? The answer affects whether the storage needs indexing or whether sequential scan is acceptable.
- [ ] **Metadata mutability on closed entries**: entry immutability says content can't change, but what about metadata? Can a researcher tag or annotate a past entry without violating immutability? If so, metadata lives in a different mutability class than content.
- [ ] **Entry granularity**: what constitutes one entry? In current practice, one file per day of work. Is that a behavioral requirement (one entry per day) or an artifact of the file-based approach? Could entries be finer-grained (per-session, per-topic)?
- [ ] **Metadata on closed entries vs. content**: structured metadata appears in both the cross-cutting requirements and journal-specific behaviors. Should the cross-cutting version subsume the journal one, with journal adding only the immutability constraint? Or is journal metadata meaningfully different?

---

### Investigation

An investigation is a bounded inquiry: question in, recommendation out, with accumulated evidence in between. The gregarious investigation skill is the most mature implementation reference.

**Established behaviors:**

1. **Scoped inquiry**: an investigation is a bounded unit with a defined question and completion criteria
2. **Evidence accumulation**: entries (research, experiments) are added over time within the investigation — chronological append scoped to a topic rather than global
3. **Status lifecycle**: an investigation transitions through states (researching, experimenting, complete, abandoned); the CLI reads and advances status
4. **Recommendation output**: an investigation produces a recommendation that addresses the original question and evaluation criteria
5. **Artifact association**: research entries and experiments have associated artifacts (code, data, results)

**Open questions:**

- [ ] **Containment model**: is an investigation a container that *owns* its entries, or a label applied to otherwise-independent entries? This matters for snapshotting — if you snapshot an investigation, do the entries come with it? Assumption: yes, it's a self-contained unit, which means the storage needs to express containment, not just association.
- [ ] **Entry types within an investigation**: the gregarious skill distinguishes research entries from experiment entries (different templates, different lifecycle). Is that a storage-level distinction (different schemas) or a metadata-level distinction (same schema, different type tag)?
- [ ] **Completion semantics**: when an investigation reaches "complete," does it become immutable like a closed journal entry? Can it be reopened? The gregarious skill has "abandoned" as a terminal state — is that storage-level (frozen) or just a status value?
- [ ] **Relationship to journal**: does work within an investigation also appear in the journal (dual-write), or does the investigation's internal log serve as its own journal? In current research practice, journal entries reference investigations but the data is separate.

---

### Design

A design is scoped architecture work with tracked decisions. Less mature than journal or investigation — apparatus.md defined the structure but experiments revealed the framing was wrong (noun-oriented rather than verb-oriented). The behavioral requirements here are less validated.

**Established behaviors:**

1. **Scoped architecture**: a design is a bounded unit with a problem statement
2. **Decision tracking**: a design contains decisions, each with rationale and evidence references
3. **Assumption chains**: decisions rest on stated assumptions; the system can answer "which decisions depend on assumption X?"
4. **Status lifecycle**: designs move through states
5. **Cross-reference**: decisions reference investigations (as evidence); assumptions can reference other designs or investigations that would invalidate them

**Open questions:**

- [ ] **Containment model**: same question as investigation — does a design own its decisions, or are decisions independent objects linked to a design? Assumption: owned, same reasoning as investigation.
- [ ] **Reverse lookup / indexing**: assumption chains require answering "which decisions depend on assumption X?" — this is a reverse-lookup capability. Does the storage need to support indexing, or does the CLI build an index at query time by scanning? At small scale scanning is fine; at larger scale it may not be.
- [ ] **Invalidation as a storage event**: when an assumption is invalidated, what happens at the storage level? Is it a metadata update on the assumption? A new entry that supersedes the old decision? Both? The invalidation workflow (from research-guide.md) is defined procedurally but not yet in storage terms.
- [ ] **Design lifecycle states**: what are they? Investigation has a clear set (researching, experimenting, complete, abandoned). Design states are less defined — drafting, proposed, decided, superseded? This needs to be settled before we can define what lifecycle transitions mean for the storage.
- [ ] **Relationship between design and investigation**: a design spawns investigations to answer questions. Is that a storage-level link (the design contains references to investigations) or a behavioral convention (the CLI knows to look for investigations related to a design)? This has implications for snapshotting — do linked investigations come with the design?

---

### Multi-repo portability

The apparatus is adopted into external projects (gregarious, and eventually others). The data storage implications are not about cross-repo linking but about the system operating coherently across independent repositories.

**Established behaviors:**

1. **Portable schema**: the data model is the same regardless of which repo hosts it. The CLI operates identically in apparatus, gregarious, or the research space.
2. **Independent instantiation**: each repo's apparatus data is a primary instantiation — not a replica, not a subset, not a branch of a shared repo. They share the contract, not the data.
3. **Observable from outside**: a researcher can inspect another repo's apparatus data (read gregarious's journal, review its investigation outputs) without the observed repo needing to do anything special. This is a read path, not a sync mechanism.
4. **No cross-instance data dependencies**: an investigation in gregarious doesn't structurally depend on an object in the research space. Cross-instance references are prose citations, not storage-level links.
5. **Schema versioning**: each piece of stored data carries (or can be associated with) the schema version it was written under. The adopting project controls when it upgrades.
6. **Forward readability**: the CLI at version N+1 can read data written at version N (and earlier). Old data is legible without in-place migration.
7. **Migration optionality**: upgrading the schema version of existing data is a deliberate operation, not a side effect of updating the CLI. A repo can run the new CLI against old data indefinitely.

Forward readability is particularly important for the researcher observation case — the researcher may run the latest CLI while reviewing data from a gregarious instance that hasn't upgraded.

Schema evolution is constrained: additive changes (new optional fields) are cheap; structural changes (reorganizing how data is stored) are expensive because they require either migration tooling or indefinite backward compatibility in the CLI's read path.

**Open questions:**

- [ ] **Storage format versioning vs. schema versioning**: if we change how data is laid out (different ref structure, different tree layout), that's a storage-level migration distinct from schema-level changes (new fields, new metadata). Are these the same versioning concern or two separate ones? A CLI upgrade that changes the git ref layout is a different beast than one that adds an optional metadata field.
- [ ] **Observation mechanism**: "observable from outside" is stated as a read path. Concretely, how? Does the researcher clone the repo, point the CLI at a local copy, use a remote read protocol? The storage design affects what observation looks like.
- [ ] **Coexistence with project data**: apparatus data lives alongside the project's own code and data. How does the storage avoid collisions? The `apparatus.store/` directory convention was one answer. A git-native approach (refs, notes) might not need a directory at all, or might need a different namespace strategy.
- [ ] **Initial adoption**: when a project adopts apparatus for the first time, what does bootstrapping look like? Is there a migration from "no apparatus data" to "apparatus initialized"? What's the minimum the storage needs to support for a cold start?

---

### Instantiation

The ability to create independent copies of the data model for experiments, self-modification testing, and parallel exploration. Described in detail in the Instantiation Model section above; behavioral requirements collected here for completeness.

**Established behaviors:**

1. **Snapshot creation**: create a new instantiation from the current state of any existing instantiation (primary or another)
2. **Hermetic isolation**: an actor within an instantiation cannot see, reference, or discover content outside its boundary
3. **API identity**: the interface within any instantiation is indistinguishable from the primary
4. **Capture**: all changes within an instantiation are retained as a complete record
5. **Retention**: instantiations are preserved indefinitely; experiments are never deleted

**Open questions:**

- [ ] **Selective snapshotting**: must instantiation always copy the entire data model, or can the researcher create an instantiation with only specific structures (e.g., a journal with 3 entries and no investigations)? The experiment scenario suggests selective provisioning is needed.
- [ ] **Instantiation lifecycle**: does an instantiation have its own status? (active, frozen, archived?) Can it be "closed" like a journal entry — made immutable after the experiment concludes?
- [ ] **Instantiation metadata**: does the instantiation itself carry metadata? (who created it, when, for what purpose, linked to which experiment?) Or is that tracked externally by the experiment structure?
- [ ] **Nesting**: can an instantiation create its own sub-instantiation? The self-modification scenario suggests yes — the system tests a modified version of itself, which might include testing instantiation capabilities. What are the limits?

---

### Cross-cutting

Behaviors that apply uniformly to all structures.

**Established behaviors:**

1. **Snapshotable**: the current state of any structure can be captured as a point-in-time snapshot for instantiation
2. **Enumerable**: the CLI can list all instances of a structure within an instantiation
3. **Structured metadata**: all structures carry machine-readable metadata the CLI can operate on programmatically

**Open questions:**

- [ ] **Metadata schema**: is there a common metadata shape across structures (every object has an id, created-at, status, schema-version) or does each structure define its own? A common base simplifies CLI implementation and querying.
- [ ] **Identity**: how are individual objects (a journal entry, an investigation, a decision) identified? Sequential IDs? Content hashes? UUIDs? Needs to be stable across snapshots (the same entry in the primary and in an instantiation should be recognizably the same object).
- [ ] **Ordering**: journal has explicit chronological ordering. Do investigation entries? Design decisions? Is ordering a cross-cutting requirement or specific to certain structures?
- [ ] **History**: should the storage retain the history of changes to mutable objects (metadata updates, content changes to the current journal entry)? Or is only the current state needed?

## Instantiation model

### Why instantiation is universal

All apparatus structures need to be instantiable, not just for experiments. The system's goal is to participate in its own extension — exploring modifications to itself requires constructing an isolated copy, applying a mutation, executing the mutated version, and observing behavior from outside while retaining control.

The current split between the apparatus repo and the research space (apparatus-stage0) is an artificial workaround for the lack of a sufficient isolation boundary. With correct tooling, these could be a single system that constructs experimental spaces for self-modification.

### Primary and additional instantiations

The data model has a **primary instantiation** — the living journal, active investigations, current designs. This is the "real" state of the project.

The system supports **simultaneous additional instantiations** created for specific purposes (experiments, self-modification testing, parallel exploration). Each additional instantiation:

- Shares the same schema and behavioral contracts as the primary
- Is created from a snapshot of existing state (primary or another instantiation)
- Is an independent data space — no requirement to merge back at the data level
- What flows back is *findings about* the instantiation, not the data itself

Conceptually similar to branches, but without the merge expectation. Each is a fork, not a divergence-to-be-reconciled.

### The apparatus CLI as boundary enforcer

We assume the existence of an apparatus CLI tool that:

- Is the **sole supported interface** for reading and writing apparatus data
- Is the **direct consumer** of the data model
- **Maintains the isolation boundary** between instantiations
- **Enforces access policy** (what an actor can do within their instantiation)

The CLI is not in scope for this exploration. But its existence is a load-bearing assumption: the storage layer does not need to enforce policy itself. The design question is: **how does the storage make isolation and policy enforcement a natural, low-effort operation for the CLI?**

This shifts the optimization target. Rather than "how does the storage prevent violation," we ask "how does the storage minimize the work the CLI must do to construct an isolated environment and enforce data access policy."

### Experimental space (most demanding scenario)

The most demanding isolation scenario: running an experiment against a practitioner who will use apparatus tooling (e.g., making journal entries), but within a controlled sandbox.

The experimental space must support these behaviors:

- **Provisioning**: the researcher creates the space with a controlled initial state (specific journal entries, investigation state, etc.) as part of experiment setup
- **Hermetic isolation**: the practitioner cannot see, reference, or discover the existence of content outside the sandbox. The information horizon is the boundary of the experimental space. (This rules out git worktrees within a shared repo — the `.git` pointer lets the practitioner traverse back to the full repository.)
- **API identity**: the practitioner's interface to apparatus structures within the sandbox is indistinguishable from the "real" one. The practitioner cannot tell it is in a sandbox.
- **Capture**: everything the practitioner produces is retained as part of the experimental record
- **Retention**: the experimental space is preserved indefinitely for analysis, reference, or replication in future experiments

This scenario drives a key architectural constraint: the isolation boundary must control the *information horizon*, not just write access. Read isolation is as important as write isolation.

## Cross-cutting behavioral requirements

These apply to all structures (journal, investigation, design):

1. **Snapshotable**: the current state of any structure can be captured as a point-in-time snapshot for instantiation
2. **Enumerable**: the CLI can list all instances of a structure within an instantiation
3. **Structured metadata**: all structures carry machine-readable metadata the CLI can operate on programmatically

## Environment interface spectrum

A key design variable: how does an environment (primary or additional instantiation) interact with the underlying storage? This is a spectrum, not a binary:

| Approach | What the environment sees | Isolation mechanism | Provisioning cost | CLI complexity |
|----------|--------------------------|---------------------|-------------------|----------------|
| **Full repo per environment** | Own `.git` directory, `git` tool available | Filesystem separation | Highest (copy/reconstruct entire repo) | Lowest (just point at a directory) |
| **Curated view** | Filtered projection of a single `.git` | CLI constructs restricted view (e.g., sparse-checkout, filtered refs, restricted alternates) | Low (shared object store) | Highest (must ensure no path leaks to full object store) |
| **No git exposure** | No `.git`, no `git` tool. Only the apparatus CLI | Application-level API is the information horizon | Variable (CLI chooses internally) | Moderate (mediates all access, but no leakage surface to guard) |

The "no git exposure" option is significant because it dissolves the isolation problem at the interface layer. If the environment never sees `git` or `.git`, the storage can be anything — a single shared repo with ref namespaces, a database, flat files — and the CLI handles mapping. The information horizon is defined entirely by what the CLI exposes through application-level operations (e.g., `apparatus journal entry ...`).

This means the environment boundary question and the storage format question are separable. The CLI can use git internally regardless of whether the environment sees git.

## Evaluation criteria

Criteria for assessing storage design options:

1. **Behavioral completeness**: does the storage support all required behaviors (journal, investigation, design, cross-repo references) without the CLI needing to simulate missing capabilities?
2. **Isolation cost**: how much work must the CLI do to construct a hermetically isolated environment from a snapshot of existing state?
3. **Provisioning performance**: time and space cost to create a new instantiation, especially when the primary has significant history
4. **Retention efficiency**: cost of keeping additional instantiations indefinitely (experiments are never deleted)
5. **Structural alignment**: do the storage primitives naturally express the data model (append-only logs, immutable closed entries, artifact association), or does the CLI constantly translate between mismatched models?
6. **Operational simplicity**: can a human (researcher, engineer) understand and debug the storage without specialized tools? Can standard git operations coexist without corrupting apparatus state?
7. **Incremental adoptability**: can the storage design be adopted into an existing git repo (like gregarious) without restructuring the repo or disrupting existing workflows?

## Git primitives to evaluate

| Primitive | What it does | Potential use |
|-----------|-------------|---------------|
| `git hash-object` | Store arbitrary content, get SHA | Content-addressable artifact storage |
| `git cat-file` | Retrieve objects by SHA | Read apparatus data by reference |
| `git update-index` / `git write-tree` | Build tree objects without touching worktree | Structural writes that bypass filesystem |
| `git commit-tree` | Create commits on arbitrary refs | Per-artifact or per-type commit histories |
| `git update-ref` | Manipulate refs (branches, tags, custom) | Custom ref namespaces (`refs/apparatus/journal/...`) |
| `git notes` | Attach metadata to commits | Annotation layer for apparatus metadata |
| `git worktree` | Multiple working directories from one repo | ~~Constrained views for practitioner sessions~~ Fails hermetic isolation (`.git` pointer exposes parent repo) |
| `git subtree` / submodules | Cross-repo composition | Cross-triad references |

## Design discussion: containment

### Problem

When a structure (investigation, design) has sub-objects (entries, decisions, artifacts), what is the relationship between the container and its children? This determines how snapshotting works, what isolation looks like, and how the CLI reasons about data boundaries.

### Option A: Composition

Structures own their children. An investigation *contains* its entries and artifacts as part of itself. There is no notion of an entry existing outside the scope of its parent.

- Snapshotting is "copy the container" — a single operation, no reference resolution
- The boundary of the container is the boundary of the data — hermetic isolation is structural
- Matches the conceptual model: an investigation's entries don't make sense outside it
- The CLI doesn't need a reference-resolution layer
- In git terms, maps naturally to a tree object: investigation is a tree, entries are subtrees/blobs within it

### Option B: Association

Structures reference independent objects. An investigation points to entries that exist independently in the data model.

- Snapshotting requires traversing references and collecting referenced objects (graph walk)
- An object could participate in multiple structures (e.g., one research entry relevant to two investigations)
- Objects have their own lifecycle independent of any container
- Flatter storage — no nesting depth to manage
- The CLI needs a reference-resolution and integrity layer

### Tension point: journal/investigation overlap

In current practice, a researcher writes a journal entry about investigation work. One act produces information relevant to two structures. Under composition, these are two separate objects (a journal entry recording narrative, an investigation entry recording evidence) that happen to describe the same work. Under association, it could be one shared object referenced from both places.

### Arguments for composition

- Instantiation is the defining requirement. Composition makes it a structural operation rather than a graph problem.
- The journal entry and the investigation entry serve different functions even when they arise from the same activity. The journal records the researcher's narrative; the investigation entry records evidence. Duplication of underlying facts is acceptable because the framing is different.
- The apparatus CLI is the sole interface. If the CLI wants to present a unified view across structures (e.g., "show me everything from Tuesday"), it can do that at the query layer without the storage needing shared objects.

### Arguments for association

- Avoids data duplication — a finding exists once, referenced from wherever it's relevant.
- More flexible for unanticipated relationships. If a future structure type needs to reference existing objects, association supports it without restructuring.
- Closer to how researchers actually think — "I did this work" is one event, not two parallel records.

### Discussion

(To be filled in as we argue positions)

## Exploration log

(Notes added as we investigate)

## Findings

(Conclusions and decisions recorded here)
