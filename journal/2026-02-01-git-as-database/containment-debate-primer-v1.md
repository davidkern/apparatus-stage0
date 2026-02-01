# Containment model debate: priming document

## Context

We are designing a data storage layer for a system called the Apparatus. The Apparatus is a design-with-traceability system that manages structured knowledge artifacts across multiple git repositories. An apparatus CLI tool mediates all access to the data.

This document provides the shared evidence base for a structured debate about one foundational design question: the containment model.

## The question

When a structure (investigation, design) has sub-objects (entries, decisions, artifacts), what is the relationship between the container and its children?

There are two options:

**Option A: Composition** — structures own their children. An investigation *contains* its entries and artifacts as part of itself. There is no notion of an entry existing outside the scope of its parent. Snapshotting is "copy the container."

**Option B: Association** — structures reference independent objects. An investigation points to entries that exist independently in the data model. Snapshotting requires traversing references and collecting the referenced objects.

## Structures in the system

The system has four primary structures. Each has sub-objects whose relationship to the parent is the question at hand.

### Journal

An append-only reasoning record. Entries are added in chronological order. Once an entry is no longer the most recent, its content is immutable. Each entry can have associated artifacts.

The journal is the simplest case — its entries don't obviously belong to any other structure. But in practice, journal entries often describe work done within an investigation or design.

### Investigation

A bounded inquiry: question in, recommendation out, with accumulated evidence in between. Contains research entries and experiment entries added over time. Has a status lifecycle (researching, experimenting, complete, abandoned).

The gregarious project has a mature investigation skill that treats investigations as self-contained directories with an index file, research entries, and experiment entries all within a single directory tree.

### Design

Scoped architecture work with tracked decisions. Contains decisions, each with rationale and evidence references. Decisions rest on stated assumptions. The system needs to answer "which decisions depend on assumption X?" (reverse lookup). Designs can spawn investigations to answer questions.

### Cross-structure relationships

- A design spawns investigations to gather evidence for decisions
- Journal entries describe work done within investigations and designs
- Decisions reference investigations as evidence
- Assumptions can reference investigations or designs that would invalidate them

## System requirements that bear on this question

### Instantiation

The system must support creating independent copies of the data model. A primary instantiation holds the "real" state. Additional instantiations are created for experiments, self-modification testing, and parallel exploration. Each instantiation is hermetically isolated — an actor within one cannot see content outside its boundary.

Key properties:
- Created from a snapshot of existing state
- Independent data space — no merge back at the data level
- Hermetically isolated — information horizon is the boundary
- Retained indefinitely

The most demanding scenario: a practitioner uses apparatus tooling within a sandbox, interacting with what appears to be a real data space but is actually a controlled copy. The practitioner cannot tell it is in a sandbox.

### The CLI as boundary enforcer

An apparatus CLI is the sole supported interface for reading and writing data. It maintains isolation boundaries and enforces access policy. The CLI is not in scope for this debate, but its existence is a load-bearing assumption: the storage layer does not need to enforce policy itself. The question is how the storage makes isolation and policy enforcement easy for the CLI.

### Multi-repo portability

The apparatus is adopted into external projects. Each repo has its own independent primary instantiation — they share the schema, not the data. No cross-instance data dependencies at the storage level.

## Evaluation criteria

Use these criteria to assess the strength of each option:

1. **Behavioral completeness**: does the option support all required behaviors without the CLI needing to simulate missing capabilities?
2. **Isolation cost**: how much work must the CLI do to construct a hermetically isolated environment?
3. **Provisioning performance**: time and space cost to create a new instantiation
4. **Retention efficiency**: cost of keeping instantiations indefinitely
5. **Structural alignment**: do the storage primitives naturally express the data model, or does the CLI constantly translate?
6. **Operational simplicity**: can a human understand and debug the storage?
7. **Incremental adoptability**: can the design be adopted into an existing repo without disruption?

## Tension points to address

These are known areas where the two options produce different outcomes. Your argument should engage with each:

1. **Journal/investigation overlap**: a researcher does work within an investigation and writes about it in the journal. Under composition, these are two separate objects. Under association, it could be one shared object. What are the consequences of each?

2. **Design-to-investigation links**: a design spawns an investigation. Under composition, the investigation is not inside the design — it's a sibling structure. But the design needs to reference the investigation's findings. How does each option handle cross-structure references?

3. **Assumption reverse lookup**: "which decisions depend on assumption X?" requires finding all decisions that reference a given assumption. Under composition, this is a scan within the design. Under association, assumptions could be independent objects with back-references. What are the tradeoffs?

4. **Selective snapshotting**: a researcher wants to create an instantiation with only specific structures (e.g., one investigation, three journal entries, no designs). How does each option handle partial snapshots?

5. **Future structure types**: if a new structure type is added to the system later, how does each option accommodate it? Does one require more rework than the other?

## Your task

You are arguing **one assigned position** (composition or association). Write a structured position statement that:

1. Opens with the strongest version of your position's core argument
2. Addresses each of the five tension points above
3. Acknowledges the strongest arguments for the opposing position and explains why your position is still preferable
4. Evaluates your position against each of the seven evaluation criteria
5. Closes with what you believe would be the concrete consequences of choosing your position — what becomes easier, what becomes harder, what risks emerge

Argue genuinely. Do not strawman the opposing position. The goal is to produce the strongest possible version of your assigned argument so that the decision-makers can evaluate the best case for each option.
