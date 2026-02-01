# Side A: Coarse-grained entry model

## Core argument

The Apparatus should model structures at the coarsest granularity that respects the Wave 1 invariants. One journal entry per day. Investigations as monolithic documents with internal structure expressed as sections, not independent objects. Designs as single documents with inline decisions. Relationships between structures are citations recorded as metadata, not fine-grained inter-object links.

The reason is simple: every object the system creates carries a permanent cost. It gets an assigned identifier (identity synthesis). It gets a status lifecycle (mutability synthesis). It participates in the derived index. It must be enumerated, queried, snapshotted, bundled, and provisioned. The Wave 1 decisions are sound, but they create a per-object tax. Granularity determines how many times you pay that tax. Coarse granularity minimizes the object count and therefore minimizes the system's operational surface area.

## Position on each tension point

### 1. Journal entry scope: one per day

The journal's purpose is chronological narrative -- what happened, what was tried, what was learned. One entry per day is the natural unit because it matches the researcher's work rhythm and because it produces a comprehensible chronological record when read sequentially.

Per-topic entries fragment the narrative. A researcher who explored three topics on a given day would produce three entries, and the reader who wants to understand "what happened on Tuesday" must now assemble that picture from multiple objects. The journal's value is in its continuous narrative flow, not in its decomposability into topic atoms.

The mutability model already handles the journal cleanly at day granularity: the current day's entry is mutable, and creating tomorrow's entry implicitly freezes today's. This is natural and requires no sub-object status management. Going finer forces the system to define "when does a per-topic entry freeze?" -- on session end? On topic change? These are ambiguous boundaries that the CLI would struggle to detect automatically and that users would find annoying to manage manually.

### 2. Investigation entries: metadata-level distinction

Research entries and experiment entries within an investigation differ in template and intent, but they share the same structural role: evidence accumulated chronologically within a bounded inquiry. Making them different storage-level object types doubles the schema surface, doubles the CLI's type-dispatch logic, and gains nothing that a `type: research` or `type: experiment` metadata tag on a uniform entry object would not provide.

The mutability synthesis says "sub-objects with independent mutability get their own status." Investigation entries do have independent mutability -- an early research entry freezes when the next entry is created, same as journal entries. But this does not require type-level distinction. All investigation entries follow the same lifecycle regardless of whether they are research or experiment entries. The type tag is a query attribute, not a lifecycle differentiator.

### 3. Dual-write: convention, not mechanism

When a researcher does investigation work, the journal entry records the narrative and the investigation entry records the evidence. These serve different purposes even when they describe the same activity. The containment debate already established this: under composition, the journal entry and the investigation entry are two objects that happen to describe the same work.

Making this relationship a storage-level bidirectional link between fine-grained objects is over-engineering. The researcher writes a journal entry that mentions "continued investigation X." The investigation entry is created in the investigation's scope. The system-layer index can correlate them by date and by investigation reference in journal metadata. No fine-grained link is needed because the correlation is temporal and structural, not object-to-object.

### 4. Design-investigation relationship: citation in metadata

A design decision references investigation findings as evidence. Under coarse granularity, the design document's decision section includes a citation: "Based on finding Y from investigation X (SHA: abc123)." This follows the identity synthesis's citation model -- (assigned-id, content-SHA) pairs.

The citation does not need to point at an independent "finding object" within the investigation. It points at the investigation as a whole, optionally with a section reference or finding label within the investigation document. The investigation is the citable unit. If the reader needs to verify what was relied upon, the SHA provides the exact content state of the investigation at citation time.

Fine-grained finding objects would mean the investigation is not a document but a collection of dozens of small objects, each with its own identifier, status, and lifecycle. The citation gain (pointing at a finding object rather than an investigation section) is marginal. The cost (managing all those objects) is substantial.

### 5. Artifacts: collocated with parent

Artifacts belong to the entry that produced them. A code file generated during an investigation experiment is part of that experiment entry. An image included in a journal entry is part of that journal entry. Composition (the working containment model) says structures own their children. Artifacts are children of entries, and entries are children of structures. This is a two-level hierarchy, not a three-level one with artifacts as independent citizens.

Making artifacts independent objects with their own identity would only matter if artifacts were frequently referenced from multiple entries. In practice, artifacts are produced by a specific activity and consumed in the context of that activity's record. Shared reference is the exception, and it can be handled by citation (the same mechanism used for cross-structural references) rather than by making every artifact a first-class object.

## Addressing the decomposition pressure

The mutability synthesis warns about "decomposition pressure" -- the uniform model requires anything with independent mutability to be a separate object. Side A acknowledges this pressure but argues that at coarse granularity, the decomposition points are few and natural:

- **Journal**: entries are sub-objects of the journal. Each has a status. This is unavoidable and appropriate.
- **Investigation**: entries are sub-objects of the investigation. Each has a status. Same pattern as journal.
- **Design**: decisions are sub-objects of the design. Each has a status (the mutability synthesis explicitly blesses this). This is the one place where coarse granularity concedes internal decomposition, and it works because decisions are the natural joints of a design.

What coarse granularity avoids is decomposing entries themselves into sub-entry objects (findings, assumptions, evidence items). That second level of decomposition is where the cost explodes: an investigation with ten entries and three findings per entry goes from ten managed objects to forty. The identity and mutability tax on those thirty extra objects must be justified by a concrete operational benefit, and the fine-grained position has not demonstrated one that cannot be handled by metadata, search, or section references within documents.

## Summary

Coarse granularity aligns with Occam's razor: do not multiply objects beyond necessity. The Wave 1 decisions create real per-object costs. The system should pay those costs for objects that genuinely need independent identity and lifecycle (entries within structures, decisions within designs) and should not pay them for objects that are better modeled as content within a larger document (findings within investigation entries, assumptions within design decisions, artifacts within entries). The boundary between "independent object" and "content within a document" should be drawn at the highest level that respects the mutability invariant.
