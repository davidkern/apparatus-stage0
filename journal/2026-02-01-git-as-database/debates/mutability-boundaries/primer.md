# Mutability boundaries debate: priming document

## Context

We are designing a data storage layer for a system called the Apparatus. The Apparatus is a design-with-traceability system that manages structured knowledge artifacts. An apparatus CLI tool mediates all access to data stored in `.apparatus/`, a separate bare git repo.

This document provides the shared evidence base for a structured debate about one foundational design question: mutability boundaries.

Resolved design elements that constrain this debate:

- Data lives in `.apparatus/`, a separate bare git repo alongside the project's `.git/`
- Four substrate primitives: hierarchical containment, content-addressable identity, atomic snapshots, enumeration with metadata
- Storage layout and query model are separate concerns
- Three-layer architecture: storage substrate, structure layer, system layer
- The CLI is the sole supported interface and enforces access policy

## The question

When does data become immutable? What determines whether a piece of stored data can still be modified, and what governs the transition from mutable to immutable?

**Side A: Uniform freeze-on-close** -- generalize the journal's existing pattern to all structures. A structure or sub-object becomes immutable when its status transitions to a terminal state (closed, complete, abandoned). The system has one mutability rule: open things are mutable, closed things are not. This applies uniformly across structure types.

**Side B: Per-structure mutability rules** -- each structure type defines its own freeze semantics based on its domain behavior. The journal freezes entries implicitly on new-entry creation. An investigation freezes on terminal status. Design decisions freeze individually when ratified. Metadata may follow different rules than content. There is no single system-wide freeze trigger.

## Structures in the system

### Journal

An append-only reasoning record. Entries added in chronological order. The most recent entry is open for modification; when a new entry is created, the previous entry's content becomes immutable. Each entry carries structured metadata (status, tags) and can have associated artifacts.

The journal has the clearest mutability pattern: content freezes implicitly on new-entry creation. Whether metadata on frozen entries can still be modified is an open question.

### Investigation

A bounded inquiry: question in, recommendation out, with accumulated evidence in between. Entries (research, experiments) are added over time. Status lifecycle: researching, experimenting, complete, abandoned.

The investigation's mutability pattern is less settled. The terminal states (complete, abandoned) suggest a freeze point, but whether that freeze applies to the entire investigation, only to certain sub-objects, or at all is not established.

### Design

Scoped architecture work with tracked decisions. Each decision has rationale and evidence references. Decisions rest on stated assumptions; the system needs to determine which decisions are affected when an assumption changes. Designs move through states, though the lifecycle is less defined than investigations.

Design has the most complex mutability surface. A design may contain decisions at different stages -- some ratified, some under discussion. Whether each decision freezes independently or the design freezes as a unit is unresolved.

### Behavioral linkages between structures

- A design spawns investigations to gather evidence for decisions
- Journal entries describe work done within investigations and designs
- Decisions use findings from investigations as supporting evidence
- When an assumption changes, affected decisions need to be identified

## System requirements bearing on this question

### The git substrate

`.apparatus/` is a bare git repo. Git provides content-addressable storage: once a blob is written, it cannot be modified -- only new blobs can be created. Commit chains record history naturally; every committed state remains accessible through parent commits. Refs point to the current state.

Git already provides immutability and history retention at the object level. The question is what the CLI and structure layer should enforce *on top of* what git provides, and whether the rules governing that enforcement are uniform or structure-specific.

### The CLI as boundary enforcer

The apparatus CLI is the sole supported interface. The storage layer does not enforce policy itself -- the CLI does. Direct git access to `.apparatus/` can bypass any CLI-imposed mutability constraint. The enforcement philosophy: make normal operating paths structurally sound so that actors using provided tooling cannot accidentally violate invariants. Administrator-level bypass for repairs is acceptable.

### Instantiation and isolation

The system supports creating hermetically isolated working environments with controlled initial states. The mutability state of provisioned data matters: if a completed investigation is provisioned into a new environment, can the actor within that environment modify it? The mutability model determines the constraints provisioned data carries with it.

### History and auditability

The system is a design-with-traceability tool. The reasoning record matters -- not just the current state, but how it got there. Git naturally retains committed history, but the CLI controls commit granularity. Whether intermediate states of mutable objects (metadata updates, content edits to the current journal entry) are preserved as history is a design decision.

## Tension points to address

These are known areas where the two positions produce different design outcomes. Your argument should engage with each:

1. **Metadata vs. content mutability.** A researcher wants to tag a past journal entry or annotate a completed investigation with a cross-reference discovered after the fact. The content is frozen. Should metadata modifications be permitted on frozen objects? If so, metadata and content have different mutability classes -- how does your model accommodate or reject this distinction?

2. **Completion semantics.** When an investigation reaches "complete" or "abandoned," what freezes? The entire investigation including all entries? Only the recommendation? Can individual entries within an active investigation become immutable before the investigation itself is complete? How does your model define what "frozen" means for a structure with internal sub-objects at varying stages?

3. **Reopening closed structures.** A completed investigation's finding is invalidated by new evidence. Must a new investigation be created, or can the old one be reopened? If reopened, what happens to the immutability of its previously frozen content? How does your model handle the tension between freeze guarantees and the practical need to revisit past conclusions?

4. **History retention of mutable state.** The current journal entry is mutable until a new entry is created. Metadata may be mutable on frozen objects. Should the system retain the history of changes to mutable objects, or is only the final state at freeze time preserved? Does your mutability model imply a particular history retention policy, or are these independent concerns?

5. **Enforcement mechanism.** Git's content-addressable storage provides object-level immutability. The CLI mediates all access. Given these facts, how much enforcement work does your mutability model require? Does a simpler model reduce enforcement burden, or does a more expressive model align better with what git already provides naturally?

## Your task

You are arguing **one assigned position** (uniform freeze-on-close or per-structure mutability rules). Write a structured position statement that:

1. Opens with the strongest version of your position's core argument
2. Addresses each of the five tension points above
3. Evaluates your position against whatever qualities and criteria you believe are most important -- you are not constrained to a predetermined evaluation framework
4. Closes with what you believe would be the concrete consequences of choosing your position -- what becomes easier, what becomes harder, what risks emerge

Argue genuinely. Do not strawman the opposing position. The goal is to produce the strongest possible version of your assigned argument.
