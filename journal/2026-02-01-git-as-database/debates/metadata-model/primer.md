# Metadata model debate: priming document

## Context

We are designing a data storage layer for the Apparatus, a design-with-traceability system. An apparatus CLI mediates all access to data stored in `.apparatus/`, a separate bare git repo.

Resolved design elements constraining this debate:

- Four substrate primitives: hierarchical containment, content-addressable identity, atomic snapshots, enumeration with metadata
- Three-layer architecture: storage substrate, structure layer, system layer
- The CLI is the sole interface and enforces access policy
- **Mutability**: terminal status means immutable. Each structure defines its own lifecycle. Annotations are separate objects.
- **Identity**: two-layer model. Content-addressing at the substrate; assigned identifiers at the system layer (embedded in content). Citations record (assigned-id, content-SHA). The derived index is keyed by assigned identifier.

## The question

Is there a common metadata shape that all structures share, or does each structure define metadata appropriate to its domain?

**Side A: Common base schema** -- every object carries: assigned identifier, created-at, status, schema-version, and type discriminator. Structures extend this base with domain-specific fields.

**Side B: Per-structure schemas** -- each structure defines its own metadata. If structures share fields, that is convention, not contract.

## Dependencies from Wave 1

1. **Every object has a status.** The uniform freeze mechanism requires a status field on every object -- "terminal status means immutable" is the system-wide invariant.
2. **Every object has an assigned identifier.** The two-layer identity model requires this, embedded in content.
3. **Schema versioning is cross-cutting.** Each piece of stored data must carry the schema version it was written under.
4. **The derived index must extract metadata from any object** to build its entries.
5. **Annotations are separate objects** that reference their target and carry their own metadata.

## Tension points

1. **CLI implementation complexity.** Does a common shape simplify the CLI (one code path for base fields) or create unnecessary abstraction? Does per-structure metadata require the CLI to understand each schema for basic operations?

2. **Querying across structures.** The derived index serves cross-structural queries. Does it require a common metadata shape, or can it work with heterogeneous schemas?

3. **Schema evolution.** Does a common base make evolution easier (one place to version the base) or harder (base changes ripple everywhere)?

4. **Metadata on citations.** Citations record (assigned-id, content-SHA). What additional metadata do they carry, and does that shape share anything with other objects?

5. **Instantiation metadata.** Does the instantiation carry metadata (creator, purpose, source)? Is it a first-class object with the same shape as other objects?

## Your task

Argue one assigned position. Address each tension point. Evaluate against criteria you believe most important. Close with concrete consequences.
