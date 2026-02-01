# Identity model debate: priming document

## Context

We are designing a data storage layer for a system called the Apparatus. The Apparatus is a design-with-traceability system that manages structured knowledge artifacts across multiple git repositories. An apparatus CLI tool mediates all access to the data.

The storage substrate has been validated: apparatus data lives in `.apparatus/`, a separate bare git repo alongside the project's `.git/`. Four substrate primitives have been accepted as the storage contract: hierarchical containment, content-addressable identity, atomic snapshots, and enumeration with metadata. A three-layer architecture separates concerns: the storage substrate handles physical organization, the structure layer implements domain semantics (journal, investigation, design), and the system layer orchestrates cross-structure operations, enforces isolation, and maintains derived indexes.

A prior debate on the containment model (composition vs. association) produced several design findings relevant to this question, including a proposed citation mechanism for cross-structural references and a clear separation between the storage layout and the query model. The containment question itself remains unresolved; this debate should not assume either containment outcome.

This document provides the shared evidence base for a structured debate about the identity model.

## The question

How are objects identified and referenced across structures and instantiations?

**Option A: Content-addressed identity** — objects are identified by a SHA derived from their content. Git provides this natively: every blob, tree, and commit has a content-based hash. An object's identity is what it contains. When content changes, the identity changes. The old version retains its identity; the new version receives a new one. References between objects use SHAs, pointing to a specific version of a specific piece of content.

**Option B: Assigned identity** — objects are identified by a persistent identifier (UUID, sequential ID, or similar) that is assigned at creation and does not change. The identifier survives content edits, metadata updates, structural moves, and re-instantiation. The same object across different versions of itself shares one identity. References between objects use assigned IDs, pointing to a logical entity rather than a specific version.

## Structures in the system

The system has three primary structures. Each produces objects that need to be identified and referenced.

### Journal

An append-only reasoning record. Entries are added in chronological order. Once an entry is no longer the most recent, its content is immutable. Each entry has associated artifacts and structured metadata. Journal entries often describe work done within an investigation or design.

### Investigation

A bounded inquiry: question in, recommendation out, with accumulated evidence in between. Has research entries and experiment entries added over time. Has a status lifecycle (researching, experimenting, complete, abandoned). Produces findings that other structures cite as evidence.

### Design

Scoped architecture work with tracked decisions. Decisions have rationale and supporting evidence. Decisions rest on stated assumptions. The system needs to support determining which decisions are affected when a given assumption changes. Designs spawn investigations to gather evidence.

### Behavioral linkages between structures

- A design spawns an investigation to gather evidence for a decision
- Journal entries describe work done within investigations and designs
- A design decision uses a finding from an investigation as supporting evidence
- When an assumption changes, affected decisions need to be identified across structures

## System requirements bearing on this question

### Instantiation

The system creates independent, hermetically isolated working environments from controlled initial states. A primary instantiation holds the living state. Additional instantiations are created for experiments, self-modification testing, and parallel exploration. Each instantiation is an independent data space. The CLI within any instantiation is indistinguishable from the primary.

Identity must survive instantiation: an entry in the primary and the same entry in a derived instantiation should be recognizably the same object. After the instantiation diverges (edits occur in the isolated environment), the relationship between the original entry and its edited descendant must be traceable.

### The CLI as boundary enforcer

The apparatus CLI is the sole supported interface for reading and writing data. It maintains isolation boundaries and enforces access policy. The CLI is not in scope for this debate, but its existence is a load-bearing assumption: the storage layer does not need to enforce identity policy itself. The question is how the storage makes identity management natural for the CLI.

### Multi-repo portability

Each repo has its own independent instantiation of the apparatus. They share the schema, not the data. There are no cross-instance data dependencies at the storage level. Cross-instance references are prose citations, not storage-level links. Identity within one repo has no obligation to be unique across repos.

### Cross-structural queries

The system layer maintains a derived index for cross-structural queries (e.g., "which decisions depend on assumption X?", "show me everything from Tuesday"). The index maps identities to locations and metadata. The identity model determines what the index keys are and how they behave when content changes.

### Citations

The containment debate proposed citations as a cross-structural reference mechanism: a structure records "I relied on finding Y from investigation X at version Z" as data owned by the citing structure. The citation is not a live pointer. It identifies both the source structure and the specific version that was cited. The identity model determines how the citation identifies its target.

## Evidence base

### Git substrate properties

The `.apparatus/` bare repo provides native content-addressed identity:

- Every object (blob, tree, commit) is identified by the SHA of its content. Two objects with identical content have identical SHAs. Any change to content produces a different SHA.
- Refs (`refs/heads/...`, custom namespaces) provide named mutable pointers to current state. A ref can be updated to point to a new SHA without changing the ref name.
- Commit SHAs encode the entire tree state at a point in time. A commit chain provides history: each commit points to its parent(s).
- `git bundle` preserves SHAs exactly. Objects in a bundle have the same content-addressed identity as in the source repo. Hermetic instantiation via bundle produces a repo where all object SHAs match the original.
- Git notes allow attaching metadata to any object by SHA. One note per object per namespace.
- Atomic multi-ref transactions (`git update-ref --stdin`) allow coordinated updates.

### What git does not provide natively

- There is no built-in concept of an assigned identifier that persists across content changes. If an entry's content changes, its blob SHA changes, the tree SHA changes, and the commit SHA changes. Git tracks history through commit parentage, not through stable object identity.
- Refs provide stable names for mutable pointers, but refs are repo-level constructs. They point to the latest version of something; they do not identify a specific version.
- There is no native mechanism to say "this new blob is a new version of that old blob." The relationship between versions exists only in the commit graph (the old blob was in the parent commit's tree; the new blob is in the child commit's tree).

### Prior design findings

- **Storage and query are separate concerns.** The storage layout optimizes for write coherence and integrity. A derived index optimizes for cross-structural queries. Identity affects both layers but differently: storage needs identity for integrity; the index needs identity for lookup.
- **Citations record provenance.** A citation identifies a source and its version at the time of citing. Under content-addressed identity, the SHA is both the identifier and the version. Under assigned identity, the citation must record both the ID and the version separately.
- **Four substrate primitives** are the storage contract. "Content-addressable identity" is one of them. This means the substrate provides content-addressing; the question is whether the system layers above use content-addressing alone or add an assigned identity layer on top.

## Tension points to address

These are areas where the two options produce different outcomes. Your argument should engage with each:

1. **Stability across instantiations.** An investigation is bundled into an isolated environment via `git bundle`. Under content-addressed identity, every object SHA is preserved; identity is automatically stable because content is identical. Under assigned identity, the UUID or equivalent must be stored in a way that survives bundling. After divergence (the isolated environment edits the investigation), content-addressed identity produces new SHAs for changed objects — the relationship between original and edited versions exists only in the commit graph. Assigned identity keeps the same ID, and the relationship is explicit. How does your option handle identity before and after divergence?

2. **Identity through content edits.** A journal entry's metadata is updated (e.g., a tag is added to a closed entry whose content is immutable but whose metadata is mutable). The content changes, so the content-address changes. Under content-addressing, the entry at the old SHA and the entry at the new SHA are different objects; the commit graph records that one replaced the other. Under assigned identity, the UUID stays the same and the entry is recognizably "the same entry" across the edit. How does your option handle the common case of metadata edits to existing objects?

3. **Cross-structure references.** A design decision cites an investigation finding as supporting evidence. Under content-addressed identity, the reference is a SHA: precise, pointing to exactly the version that was relied upon, but if the finding is later corrected, the citation points to the old version. Under assigned identity, the reference is a UUID: stable, pointing to the logical finding regardless of edits, but the specific version relied upon must be recorded separately. How does your option handle references that need both precision and durability?

4. **Identity in the citation mechanism.** The citation records "I relied on finding Y from investigation X at version Z." Under content-addressing, Y's SHA is both its identity and its version — the citation is a single SHA. Under assigned identity, Y's UUID is its identity and V is its version — the citation is a pair. How does your option serve the citation pattern? What happens when the citing structure needs to know whether the cited source has been updated since the citation was recorded?

5. **Identity in the query index.** The system layer maintains a derived index mapping identities to locations. Under content-addressing, the index maps SHAs to structural positions — but when content changes, the SHA changes and the index entry must be updated. Under assigned identity, the index maps UUIDs to current locations — the key is stable but the value (location, version) changes. How does your option affect index construction, maintenance, and staleness?

## Your task

You are arguing **one assigned position** (content-addressed identity or assigned identity). Write a structured position statement that:

1. Opens with the strongest version of your position's core argument
2. Addresses each of the five tension points above
3. Evaluates your position against whatever qualities and criteria you believe are most important — you are not constrained to a predetermined evaluation framework
4. Closes with what you believe would be the concrete consequences of choosing your position — what becomes easier, what becomes harder, what risks emerge

Argue genuinely. Do not strawman the opposing position. The goal is to produce the strongest possible version of your assigned argument.
