# Position statement: Per-structure mutability rules

## Core argument

Mutability is not a system-level concern. It is a domain-level concern that each structure type must define for itself, because the conditions under which data should become immutable are determined by the meaning of that data -- not by a universal lifecycle abstraction.

The journal freezes entries when a new entry is created, because the journal is an append-only reasoning record: its integrity depends on past entries being stable while the current entry remains editable. The investigation freezes when it reaches a terminal status, because an investigation is a bounded inquiry whose value lies in the permanence of its conclusion. A design freezes individual decisions when ratified, because a design is a composite artifact whose parts reach maturity independently -- some decisions are settled while others remain under active discussion. These are three different answers to the same question, and they are three different answers because they arise from three different domains of meaning.

A uniform freeze-on-close rule would require every structure to conform to a single abstraction: the open/closed binary. This abstraction is accurate for the investigation, approximately accurate for the journal (if you squint at "entry creation" as a kind of "close"), and actively misleading for the design. Designs contain decisions at multiple stages of maturity. Forcing the entire design to be either open or closed collapses a rich, compositionally meaningful state space into a binary that cannot express what the designer actually needs: "this decision is settled, that one is not, and the design as a whole is still in progress."

The strongest form of the argument is this: mutability semantics are part of a structure's domain contract, not part of the system's infrastructure contract. Pushing them down into a uniform system rule forces every structure to either (a) contort its natural lifecycle into the system's binary, losing expressive precision, or (b) layer structure-specific exceptions on top of the uniform rule, recreating per-structure semantics but with the added complexity of an exception system. Per-structure mutability rules avoid this false economy by placing the authority where the knowledge lives: in the structure definitions themselves.

## Tension points

### 1. Metadata vs. content mutability

Per-structure mutability rules accommodate the metadata/content distinction naturally, because the distinction itself is structure-specific.

For the journal, content freezes on new-entry creation but metadata on past entries -- tags, cross-references, annotations -- may remain mutable. This is not an awkward exception to a rule; it is the journal's own rule, arising from its domain semantics. The content of a past journal entry is the historical record of what was thought at that time. Modifying it would falsify history. But discovering after the fact that entry #47 is relevant to investigation X is new knowledge about entry #47, not a revision of entry #47. Tagging is annotation, not mutation of the reasoning record. The journal's mutability rule can express this: content freezes, metadata does not.

For an investigation, the calculus may differ. When an investigation reaches "complete," both its content (findings, evidence chain) and its metadata (status, conclusion summary) arguably freeze together, because the metadata is part of the formal output. A tag added after completion is an external annotation, and the investigation's mutability rule can distinguish between internal metadata (frozen with the structure) and external annotations (always mutable).

For a design, decisions carry metadata (status: proposed, ratified, superseded) that is load-bearing for the design's own lifecycle. A decision's metadata must remain mutable until the decision is ratified, and perhaps change again if the decision is later superseded. The design's mutability rule governs this.

The uniform model faces a dilemma here. If metadata follows the same freeze rule as content, the researcher cannot annotate frozen objects -- a practical requirement the primer identifies. If metadata is exempted from the freeze rule, the system has already introduced a per-category mutability distinction within every structure. At that point, the "uniform" rule is uniform only for content, and metadata follows... what rule? If the metadata rule is also uniform ("metadata is always mutable on any object"), you get a two-tier system that still cannot express the investigation's need to freeze its own metadata on completion. The per-structure model avoids this by not pretending the distinction is uniform in the first place.

### 2. Completion semantics

Per-structure mutability rules are at their most expressive on this point, because completion means fundamentally different things for different structures.

For the journal, "completion" is not a meaningful concept at the journal level. The journal does not complete; it accumulates. Individual entries freeze implicitly when a successor is created. There is no journal-level freeze event, and inventing one to satisfy a uniform model would be artificial.

For an investigation, completion is a well-defined terminal event. When status transitions to "complete" or "abandoned," the investigation's content freezes as a unit. The entries within it may have been individually immutable before this point -- research entries finalized during the investigation's active phase -- or they may all freeze together at completion. The investigation's mutability rule defines this, and it can be as simple as "all entries freeze when the investigation does" or as nuanced as "entries freeze when marked final; completion freezes anything remaining."

For a design, completion is compositional. Individual decisions are ratified independently. The design itself may reach a terminal state when all decisions are ratified, or it may persist indefinitely as a living document with some settled decisions and some open questions. The design's mutability rule can express sub-object-level freezing: a ratified decision is immutable even while the design is still active.

The uniform model cannot express sub-object freezing without becoming a per-structure model in disguise. If the rule is "open things are mutable, closed things are not," then a ratified decision within an open design is... mutable? The uniform model must either (a) treat the design as a single indivisible unit whose parts have no independent freeze state, losing the ability to express "this decision is settled," or (b) introduce a notion of sub-object status transitions, at which point each structure is defining its own sub-object freeze semantics and the uniformity is cosmetic.

### 3. Reopening closed structures

Per-structure mutability rules handle reopening by allowing each structure to define whether reopening is a meaningful operation and what it means for previously frozen content.

For the journal, reopening is not a concept. Entries freeze forward; there is no journal-level close to reopen. If a past entry needs correction, the researcher writes a new entry that references and corrects it. The journal's mutability rule makes this the only path, which preserves the append-only integrity that gives the journal its value.

For an investigation, reopening is a domain question. A completed investigation whose finding is invalidated could be reopened -- status transitions from "complete" back to "researching." The investigation's mutability rule must specify what happens: previously frozen content remains frozen (the original evidence chain is preserved as-is, and new entries are appended), or the investigation is fully thawed (previous content becomes editable again). I argue the former is correct for investigations: the original evidence chain is historical fact, and reopening means "add new evidence and revise the conclusion," not "rewrite history." But this is the investigation's rule to define, not the system's.

For a design, reopening is even more granular. A ratified decision may be revisited without reopening the entire design. The design's mutability rule can support "supersede decision X" -- creating a new decision that replaces it while preserving the original as a historical record, with its ratification intact. This is different from reopening; it is additive revision. The design expresses this through its own lifecycle semantics.

The uniform model faces a structural problem with reopening. If "closed means frozen," then reopening means unfreezing, which means previously frozen content becomes mutable. This undermines the guarantee that frozen content is permanent. The uniform model must either forbid reopening (forcing new investigations for every revision, which is wasteful) or allow it (breaking the freeze guarantee, which undermines the entire model). Per-structure rules avoid this dilemma because each structure can define reopening semantics that are consistent with its own freeze guarantees.

### 4. History retention of mutable state

Per-structure mutability rules and history retention are genuinely independent concerns, and this independence is a strength of the model.

Git provides history at the object level: every committed state is retained. The question is what the CLI commits and when. This is an operational concern, not a mutability concern. Whether the system retains intermediate edits to the current journal entry, or only the final state at freeze time, is a policy the journal structure can define: "commit on every save" vs. "commit on entry creation." Similarly, whether metadata changes to frozen objects are retained as history is a journal-level (or investigation-level, or design-level) decision.

The uniform model implies a particular history policy -- "capture state at the freeze boundary" -- because the freeze event is the only structurally significant transition. But the journal's significant transitions are entry creations, the investigation's are status changes, and the design's are decision ratifications. A uniform history policy keyed to a uniform freeze event misses the structure-specific moments that matter. Per-structure rules let each structure define its own commit granularity in terms of its own lifecycle events.

That said, per-structure history policies do increase the surface area the CLI must manage. Each structure type's commit policy must be implemented and maintained. This is a real cost. The mitigation is that the CLI already dispatches operations per structure type -- it knows how to create a journal entry differently from how it creates an investigation entry. Adding structure-specific commit semantics to this dispatch is incremental, not architectural.

### 5. Enforcement mechanism

Git provides content-addressable immutability at the object level, and the CLI is the sole access interface. Per-structure mutability rules align naturally with both of these facts.

The CLI already dispatches operations by structure type. It knows what a journal entry is, what an investigation is, what a design decision is. Adding mutability enforcement to this dispatch is a matter of checking the structure's current state before permitting a write. For the journal: "is this the current entry?" For an investigation: "is the status non-terminal?" For a design decision: "is this decision unratified?" These checks are local to the structure and require no cross-structure coordination.

The enforcement burden is proportional to the number of structure types, not to the number of mutability rules, because each structure type has one mutability rule (even if that rule has internal nuance like the metadata/content distinction). Adding a new structure type means adding its mutability rule to the CLI's dispatch. This is comparable to the enforcement cost of the uniform model, where adding a new structure type means ensuring it implements the open/closed interface.

The deeper point is that git's substrate makes the enforcement cost of either model low. The CLI does not need to prevent writes at the storage level -- git blobs are already immutable. The CLI prevents writes at the semantic level: it refuses to update a frozen object's representation by refusing to create a new commit that modifies it. Whether the freeze check is "is this object closed?" or "does this structure's rule permit this modification?" is a conditional in the CLI's write path, not a storage-layer mechanism. The enforcement cost difference between the two models is marginal.

What per-structure rules gain in enforcement is precision. The uniform model enforces a binary (open/closed) that may be too coarse, leading to workarounds: metadata-only updates that bypass the freeze check, sub-object status fields that shadow the structure-level status. These workarounds are enforcement surface area that the uniform model did not budget for. Per-structure rules budget for the actual semantics up front.

## Evaluation

The qualities I consider most important for this decision, evaluated honestly:

**Semantic precision.** The per-structure model represents the actual mutability semantics of each structure type. The journal's append-only-with-mutable-head is not the same as the investigation's freeze-on-terminal, which is not the same as the design's freeze-on-ratification. These are different invariants arising from different domains, and the system should express them as such rather than collapsing them into a binary that loses information. Semantic precision reduces the gap between what the system enforces and what the user expects, which reduces surprise and error.

**Extensibility.** When a new structure type is added, it brings its own mutability rule. There is no negotiation with a system-wide freeze abstraction, no contortion to fit a lifecycle that may not apply. The new structure defines its own lifecycle, its own freeze triggers, and its own metadata/content boundaries. This is additive extension, not modification of existing infrastructure.

**Alignment with resolved design decisions.** The three-layer architecture places domain logic at the structure layer, not the system layer. Mutability semantics are domain logic -- they arise from the meaning of the data, not from system-level policy. Per-structure rules are the natural expression of the structure layer's authority. A uniform freeze rule pushes domain logic down into the system layer, where it does not belong and where it constrains structures that have not yet been imagined.

**Composition with the git substrate.** Git provides immutability at the object level and history at the commit level. These are the raw materials. Per-structure rules compose with these materials naturally: each structure uses git's immutability and history to implement its own freeze semantics. The uniform model also composes with git, but it interposes an abstraction (the open/closed binary) between git's raw materials and the structure's needs. This abstraction adds a layer without adding capability.

**Honest cost: cognitive overhead.** Per-structure rules require the developer and the user to understand multiple mutability models rather than one. The journal works one way, the investigation another, the design a third. This is a real cost. I do not dismiss it. But the alternative is not "one simple rule" -- it is "one simple rule plus exceptions for metadata, plus workarounds for sub-object freezing, plus reopening policies that compromise the freeze guarantee." The uniform model's apparent simplicity is purchased by pushing complexity into edge cases that are harder to discover and reason about than explicitly stated per-structure rules.

## Consequences

### What becomes easier

**Expressing natural lifecycles.** Each structure type can define freeze semantics that match its actual domain behavior. The journal is append-only. The investigation freezes on completion. The design freezes decisions individually. No contortion, no workarounds, no exception systems.

**Metadata handling.** The metadata/content distinction is structure-specific. The journal can freeze content while keeping metadata mutable. The investigation can freeze both on completion. The design can use metadata (decision status) as the freeze trigger itself. Each structure defines the distinction that makes sense for its domain.

**Incremental evolution.** Modifying one structure's mutability rules does not affect other structures. If the investigation's lifecycle adds a new terminal state, only the investigation's mutability rule changes. The journal and design are unaffected. This is local reasoning about local concerns.

**Sub-object freezing.** Structures with internal sub-objects at varying stages -- the design being the primary example -- can express sub-object-level immutability without special system support. The structure's own rule handles it.

### What becomes harder

**Cross-structure reasoning about mutability.** A system-level question like "is this object frozen?" no longer has a system-level answer. The answer depends on the structure type and the structure's current state. Tooling that operates across structure types must understand each type's mutability rule, or delegate to structure-specific logic. This increases the surface area of the CLI's dispatch layer.

**Documentation and onboarding.** A new developer must learn multiple mutability models rather than one. The system's mutability behavior is distributed across structure definitions rather than centralized in one rule. This increases the time to full understanding.

**Testing.** Each structure type's mutability rule must be tested independently. The test surface is proportional to the number of structure types times the complexity of their individual rules, rather than proportional to one rule applied everywhere.

### What risks emerge

**Inconsistency.** Without a unifying principle, per-structure rules may diverge in ways that confuse users. The journal might freeze metadata on entry creation while the investigation keeps metadata mutable after completion, for reasons that are locally coherent but globally surprising. Mitigation: document the principle that each structure's mutability rule arises from its domain semantics, and review new rules for consistency of reasoning even if the rules themselves differ.

**Complexity creep.** Each structure type's mutability rule can become arbitrarily complex. Without the constraint of a uniform model, nothing prevents a structure from defining a mutability rule with many states, many transitions, and many exceptions. Mitigation: structure-level review that evaluates mutability rules for simplicity and coherence. The per-structure model needs a governance principle even though it rejects a governance mechanism.

**Implicit coupling through convention.** If multiple structure types independently converge on similar mutability patterns, those patterns become implicit conventions rather than explicit system rules. A change to one structure's rule might violate the convention without violating any formal constraint, leading to subtle inconsistency. Mitigation: when patterns recur across structures, extract them as named patterns (not enforced abstractions) that structure definitions can reference. "This structure uses the append-only-with-mutable-head pattern" is documentation, not enforcement, but it makes the convention visible.

The core bet of per-structure mutability rules is that the Apparatus structures have genuinely different lifecycle semantics, that these differences are not accidental but arise from the meaning of the data each structure manages, and that a system which expresses these differences directly will be more correct, more extensible, and ultimately more comprehensible than one which hides them behind a uniform abstraction that does not fit.
