# Containment model debate: priming document

## Context

We are designing a data storage layer for a system called the Apparatus. The Apparatus is a design-with-traceability system that manages structured knowledge artifacts across multiple git repositories. An apparatus CLI tool mediates all access to the data.

This document provides the shared evidence base for a structured debate about one foundational design question: the containment model.

## The question

When a structure (investigation, design) has sub-objects (entries, decisions, artifacts), what is the relationship between the parent and its children?

**Option A: Composition** — structures own their children. An investigation includes its entries and artifacts as part of itself. There is no notion of an entry existing outside the scope of its parent. Creating an independent copy of an investigation means copying the parent and everything within it.

**Option B: Association** — structures reference independent objects. An investigation links to entries that exist independently in the data model. Creating an independent copy requires identifying and collecting the relevant objects. An object can participate in multiple structures.

## Structures in the system

The system has four primary structures. Each has sub-objects whose relationship to the parent is the question at hand.

### Journal

An append-only reasoning record. Entries are added in chronological order. Once an entry is no longer the most recent, its content is immutable. Each entry has associated artifacts.

In practice, journal entries often describe work done within an investigation or design.

### Investigation

A bounded inquiry: question in, recommendation out, with accumulated evidence in between. Has research entries and experiment entries added over time. Has a status lifecycle (researching, experimenting, complete, abandoned).

### Design

Scoped architecture work with tracked decisions. Has decisions, each with rationale and supporting evidence. Decisions rest on stated assumptions. The system needs to support determining which decisions are affected when a given assumption changes. Designs can spawn investigations to gather evidence.

### Behavioral linkages between structures

- A design spawns investigations to gather evidence for decisions
- Journal entries describe work done within investigations and designs
- Decisions use findings from investigations as supporting evidence
- When an assumption changes, affected decisions need to be identified — this may span across designs and investigations

## System requirements that bear on this question

### Instantiation

The system must support creating independent working environments with controlled initial states. A primary instantiation holds the "real" state. Additional instantiations are created for experiments, self-modification testing, and parallel exploration. Each instantiation is hermetically isolated — an actor within one cannot see content outside its boundary.

Key properties:
- The researcher controls what initial state the new environment has
- Each environment is an independent data space — no merge back at the data level
- Hermetically isolated — the information horizon is the boundary
- Retained indefinitely

The most demanding scenario: a practitioner uses apparatus tooling within an isolated environment, interacting with what appears to be a real data space but is actually a controlled environment. The practitioner cannot tell it is in an isolated environment. Both options can achieve this property through different mechanisms.

### The CLI as boundary enforcer

An apparatus CLI is the sole supported interface for reading and writing data. It maintains isolation boundaries and enforces access policy. The CLI is not in scope for this debate, but its existence is a load-bearing assumption: the storage layer does not need to enforce policy itself. The question is how the storage makes isolation and policy enforcement easy for the CLI.

### Multi-repo portability

The apparatus is adopted into external projects. Each repo has its own independent primary instantiation — they share the schema, not the data. No cross-instance data dependencies at the storage level.

## Tension points to address

These are known areas where the two options produce different outcomes. Your argument should engage with each:

1. **Journal/investigation overlap**: a researcher does work within an investigation and writes about it in the journal. One act produces information relevant to two structures. How does your option handle this? What are the consequences?

2. **Design-to-investigation links**: a design spawns an investigation. The investigation is not inside the design — it's a sibling structure. But the design needs to use the investigation's findings as evidence. How does your option handle relationships between peer structures?

3. **Assumption impact analysis**: the system needs to determine which decisions are affected when an assumption changes. How does your option support this query? What are the tradeoffs?

4. **Selective provisioning**: a researcher wants to create an isolated environment with only specific structures (e.g., one investigation, three journal entries, no designs). How does your option handle partial environments?

5. **Future structure types**: if a new structure type is added later, how does your option accommodate it? What rework is needed?

## Your task

You are arguing **one assigned position** (composition or association). Write a structured position statement that:

1. Opens with the strongest version of your position's core argument
2. Addresses each of the five tension points above
3. Evaluates your position against whatever qualities and criteria you believe are most important — you are not constrained to a predetermined evaluation framework
4. Closes with what you believe would be the concrete consequences of choosing your position — what becomes easier, what becomes harder, what risks emerge

Argue genuinely. Do not strawman the opposing position. The goal is to produce the strongest possible version of your assigned argument.
