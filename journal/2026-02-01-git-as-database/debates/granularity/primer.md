# Granularity debate: primer

## The question

What constitutes an entry in the Apparatus system? How do structures relate to each other at the storage level?

This is the fifth design question in the resolution sequence. It operates downstream of containment (unresolved, but composition is the working assumption), mutability boundaries (resolved: terminal status means immutable, uniform mechanism), and identity (resolved: two-layer model with content-addressing at the substrate and assigned identifiers at the system layer). The granularity question takes those decisions as given and asks: what are the atoms of the system, and what are the molecules?

## What is at stake

The granularity choice determines the operational cost of every CLI interaction. Too coarse and the system forces the user to open, modify, and re-close large blobs when they only need to touch a small piece. Too fine and the system drowns in object management overhead -- more identifiers to generate, more status lifecycles to track, more relationships to maintain, more commits to produce for simple operations.

The choice also determines how the Wave 1 decisions actually manifest in practice. The mutability synthesis established that "sub-objects with independent mutability get their own status." But it deferred the question of what counts as a sub-object. The identity synthesis established that "every logical object gets an assigned identifier at creation time." But it deferred the question of what counts as a logical object. Granularity is where those deferrals come due.

## The two positions

**Side A: Coarse-grained.** One journal entry per day (matching current practice). Investigations as monolithic units where the investigation document is the primary artifact and internal entries are sections within it, not independent objects. Designs as single documents with decisions embedded inline. The unit of identity, status, and mutability is the top-level structure or its direct children. Relationships between structures are citations in prose or metadata fields -- not storage-level links between fine-grained sub-objects.

**Side B: Fine-grained.** Per-topic or per-session journal entries rather than one-per-day. Investigations as collections of small, independently typed entries (research entries, experiment entries, evidence entries) each with their own identity and lifecycle. Designs as collections of independent decision objects, each carrying its own rationale, assumptions, and status. Relationships between structures are explicit links between specific fine-grained objects -- a design decision cites a specific investigation finding, not the investigation as a whole.

## Tension points

1. **Journal entry scope.** One per day is current practice. Is that a design requirement or an artifact of working in flat files? Per-topic entries would let the system track which topics were explored on a given day and cross-reference them independently. But they would also mean more objects, more identifiers, more lifecycle management.

2. **Investigation entry types.** The investigation has research entries and experiment entries (from the gregarious skill). Is that distinction storage-level (different object types with different schemas) or metadata-level (same object type, different tag)? The answer determines how many object types the system must define and the CLI must handle.

3. **Dual-write between journal and investigation.** When a researcher does investigation work, the narrative goes in the journal and the evidence goes in the investigation. Under coarse granularity, these are two separate large documents and the relationship is a prose mention. Under fine granularity, these could be paired objects with an explicit bidirectional link. The granularity choice determines whether dual-write is a convention or a mechanism.

4. **Relationship between design and investigation.** A design spawns investigations; investigation findings feed back into design decisions. Is this a storage-level link (the design decision object references the investigation finding object) or a behavioral convention (the CLI knows to look for related content)? Fine granularity enables precise storage-level links. Coarse granularity makes them less useful because the link target is a large document rather than a specific finding.

5. **Artifact granularity.** Are artifacts (code, data, images) part of the entry that produced them, or independent objects associated with entries? Under coarse granularity, artifacts are embedded in or collocated with their parent entry. Under fine granularity, artifacts could be independent objects with their own identity, referenceable from multiple entries.

## Dependencies from Wave 1

The granularity debate must respect these resolved decisions:

- **Mutability**: terminal status means immutable. Sub-objects with independent mutability get their own status. Annotations are separate objects. Reopening is forbidden. (Mutability synthesis, decisions 1-6.)
- **Identity**: two-layer model. Every logical object gets an assigned identifier embedded in its content. Citations record both assigned ID and content SHA. The derived index is keyed by assigned identifier. (Identity synthesis, decisions 1-7.)
- **Containment**: unresolved, but composition is the working model. Structures own their children. Snapshotting is "copy the container."

The key downstream question: the mutability and identity syntheses both say "every logical object" and "sub-objects with independent mutability." Granularity determines what those phrases refer to concretely.
