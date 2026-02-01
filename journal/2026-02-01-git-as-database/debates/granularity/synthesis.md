# Granularity debate: synthesis

## Key findings -- consensus points

Both sides agree on more than the framing suggests:

1. **Entries within structures are independent objects.** Neither side argues that the journal, investigation, or design should be a single monolithic object. Both accept that entries (in the journal and investigation) and decisions (in the design) are sub-objects with their own identity and lifecycle. The mutability synthesis already mandated this. The disagreement starts one level below: what is inside an entry.

2. **The derived index handles cross-structural queries regardless of granularity.** Both sides accept that the query layer is separate from the storage layout (established in the containment debate). Side A uses the index for temporal correlation; Side B uses it for typed-link traversal. Neither proposes that storage layout alone should answer cross-structural questions.

3. **Storage granularity and display granularity are independent.** Side A's "daily narrative" and Side B's "per-topic entries presented as daily digest" produce equivalent user experiences if the CLI is designed well. The user-facing model is not in dispute. The dispute is about what the storage optimizes for.

4. **The identity and mutability tax is real but modest.** Side A frames it as a cost to minimize. Side B frames it as a cost already committed to. Both acknowledge that the per-object overhead under the Wave 1 design (one identifier field, one status field, one index entry, one git blob) is small in absolute terms. The disagreement is about whether the cumulative cost across many objects is significant.

5. **Cross-structural citations need precise targets.** Side A proposes citing investigations with optional section references. Side B proposes citing individual finding objects. Both agree that "I relied on this" must be specific enough to verify. The question is whether that specificity lives in the object model or in prose conventions.

## The resolution

**Side B's traceability argument is decisive for the core object model, but Side A correctly identifies the decomposition boundary. The right design creates fine-grained objects at the traceability joints and stops there.**

### Where Side B wins

**Finding-level citation is the strongest argument in this debate.** Side B's analysis of citation staleness is unanswerable. Under coarse granularity, a citation to an investigation produces a staleness signal every time anything in the investigation changes. The researcher must manually determine relevance. Under fine granularity, a citation to a specific finding produces a staleness signal only when that finding changes. This is the difference between an actionable alert and noise.

The identity synthesis designed citations as (assigned-id, SHA) pairs. This design assumes the assigned-id refers to a specific citable unit. If the citable unit is an entire investigation document, the SHA changes on every edit to any section, and the staleness mechanism degrades. The identity model's citation architecture implicitly requires fine-grained citability to function as designed. Side B recognized this; Side A did not.

**Typed investigation entries are justified.** Research entries, experiment entries, and evidence entries have genuinely different structural requirements. An experiment has parameters and measurements. A research entry produces findings. These are not metadata variants of a uniform schema; they are different shapes. Modeling them as different types at the storage level lets the CLI enforce structural completeness (an experiment entry must have results) and lets the schema evolve per-type without affecting other types. The cost is a small number of additional schema definitions (three, not thirty).

**Per-topic journal entries improve the dual-write story.** The link between journal entries and investigation sessions is a concrete operational need. Per-topic entries make it structural rather than conventional. The CLI creates both entries simultaneously with bidirectional links. Under one-per-day granularity, this link must be extracted from prose, which is fragile.

### Where Side A wins

**The decomposition boundary should be drawn at the citable unit, not below it.** Side B argues that findings, decisions, and assumptions should be objects. This is correct -- these are the atoms of the traceability chain. But Side B's position, taken to its logical conclusion, would also make every sub-component of a finding (each piece of supporting evidence, each qualification, each confidence assessment) into an object. Side A's instinct to resist unbounded decomposition is sound. The question is where to stop, and the answer is: at the level where citations need to land.

**Artifacts should not be fully independent objects.** Side B's argument for artifact independence is the weakest part of its position. Artifact reuse across investigations is the exception, not the rule. Making every artifact (every code file, every image, every data dump) a first-class object with its own identifier and lifecycle creates significant object count expansion for minimal traceability benefit. Artifacts are not citable in the same way findings are -- no design decision says "I relied on dataset D-47." Artifacts support entries; they do not participate independently in the reasoning chain.

The correct model: artifacts are content within their parent entry, stored as blobs in the entry's tree (following the composition model). In the rare case where an artifact needs cross-entry reference, a citation to the parent entry plus a path within it is sufficient. Git's tree structure already provides sub-entry addressability without requiring independent object identity.

**One-per-day journal entries are acceptable if per-topic metadata is present.** Side A's calendar-based journal model is not inherently broken. The real requirement is that the system can associate journal content with specific investigations and topics. This can be achieved either by per-topic entries (Side B) or by per-topic metadata sections within a daily entry. The former is cleaner; the latter is simpler. This is a closer call than the other tension points.

### The resolution in detail

The system should define objects at the traceability joints: the points where citations land, where staleness matters, and where independent lifecycle is required. Below those joints, content is unstructured (or lightly structured) text within the parent object.

For the three structures:

- **Journal**: per-topic entries. Each entry has a topic, an optional investigation/design reference, and its own lifecycle. This is Side B's model. The cost is modest (a few entries per day rather than one), and the traceability benefit (structural links to investigations) is concrete.

- **Investigation**: entries are typed (research, experiment, evidence). Findings within research entries are independent sub-objects with their own identity. This is where the traceability chain requires fine granularity. Assumptions are also independent sub-objects (they are cited by design decisions and subject to invalidation). Other content within entries (narrative, methodology notes, intermediate observations) remains unstructured content within the entry.

- **Design**: decisions are independent sub-objects (already established in the mutability synthesis). Each decision contains its rationale as content and its citations as structured metadata. Assumption references within decisions are typed links to assumption objects (in the investigation or in the design itself).

## Unresolved tensions

1. **Finding identity lifecycle.** Findings are sub-objects of investigation entries with their own identity. When does a finding's status become terminal? When the parent entry freezes? When the investigation completes? When it is first cited by a design decision? The mutability synthesis says "sub-objects with independent mutability get their own status," but the natural lifecycle for findings is less obvious than for entries or decisions. The most conservative answer is: findings freeze when their parent entry freezes. But this may be too early (a finding might need refinement across multiple sessions) or too late (a finding might need to be citable before the entry is complete).

2. **Assumption ownership.** Assumptions are cited by design decisions and may originate in investigations. Where do they live in the composition hierarchy? An assumption discovered during investigation X but cited by design decisions Y and Z has a natural home in investigation X, but its lifecycle is governed by its consumers (the design decisions). This is a tension between compositional ownership and cross-structural relevance that neither granularity model fully resolves.

3. **Per-topic entry boundaries.** If journal entries are per-topic, the system needs a definition of "topic" that is precise enough for the CLI to enforce but flexible enough for researchers to use naturally. In practice, this likely means the researcher explicitly declares entry scope (naming the topic and optionally linking an investigation), and the CLI does not attempt to infer topic boundaries automatically. This is a UX design question downstream of the granularity decision.

4. **Schema complexity budget.** Fine-grained objects at the traceability joints means the system defines object types for: journal entries, research entries, experiment entries, evidence entries, findings, assumptions, decisions, designs, investigations. That is nine types (plus the three container types). Each needs a schema, CLI support, and lifecycle definition. This is manageable but not trivial. The question is whether future structures will add more types and whether the system can accommodate growth without the type system becoming a maintenance burden.

## Experiment needs

1. **Finding lifecycle prototype.** Implement an investigation with three research entries, each producing two findings. Freeze entries sequentially. Verify that finding-level citations from a design decision produce actionable staleness signals. Test the edge case: a finding refined across two entries (does it get a new identity or an updated version of the same identity?). This determines whether findings-as-sub-objects works in practice or requires findings to be promoted to entry-level objects.

2. **Per-topic journal entry workflow.** Implement a day's work with three topic entries. Verify that the CLI can present them as a daily digest, that bidirectional links to investigations work, and that the freeze-on-next-entry pattern operates correctly at topic scope. Test whether topic boundaries feel natural or forced in practice.

## Recommended design decisions

1. **Journal entries are per-topic, not per-day.** Each entry has a required topic field, an optional structure reference (investigation or design), and follows the standard entry lifecycle. The CLI presents daily digests for chronological reading. This makes the journal-investigation link structural rather than conventional.

2. **Investigation entries are typed at the storage level.** Three entry types: research, experiment, evidence. Each has a type-specific schema enforced by the CLI. The type is a storage-level distinction, not a metadata tag. This enables structural completeness checks and per-type schema evolution.

3. **Findings and assumptions are independent sub-objects within entries.** A research entry produces findings. Findings have their own assigned identifier and are citable via (finding-id, SHA) pairs. Assumptions discovered during research are also independent sub-objects with their own identity. Both freeze when their parent entry freezes (the conservative default; relaxed only if the experiment in item 1 above reveals a need).

4. **Design decisions are independent sub-objects within designs.** This is already established by the mutability synthesis. Decisions carry structured citation metadata pointing at specific findings and assumptions by assigned identifier. Staleness detection operates at the finding level.

5. **Artifacts are not independent objects.** Artifacts are content within their parent entry, stored as blobs in the entry's git tree. They do not receive assigned identifiers. Cross-entry artifact reference uses a citation to the parent entry plus a path. This avoids object count explosion for objects that do not participate in the traceability chain.

6. **Cross-structural relationships are typed links in metadata.** Journal entries link to investigations/designs via a structured reference field. Investigation findings are cited by design decisions via (assigned-id, SHA) citation pairs. These are stored in the citing object's metadata, not in a separate relationship table. The derived index makes them queryable in both directions.

7. **The citable-unit test determines object boundaries going forward.** When a new structure or sub-structure is proposed, the question "will other objects need to cite this independently?" determines whether it becomes a first-class object with its own identity or remains content within a parent object. This is the standing principle for future granularity decisions.
