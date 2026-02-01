# Mutability boundaries debate: synthesis

## Key findings -- consensus points

Both sides agree on more than they disagree about. These points are settled:

1. **Git's object-level immutability is the foundation, not the policy.** Both sides treat git's content-addressable storage as raw material. Neither proposes that the CLI duplicate what git already provides. The debate is entirely about what semantic-level policy the CLI enforces on top of git's physical immutability.

2. **The CLI is the enforcement boundary, and enforcement cost is low either way.** Both sides agree that since the CLI is the sole supported interface and git handles storage-level immutability, the enforcement burden of either model is modest. Side B explicitly concedes the cost difference is "marginal." This means enforcement simplicity, while real, is not a decisive differentiator.

3. **Metadata and content have different mutability requirements.** Both sides accept that a researcher must be able to annotate frozen objects after the fact. Side A proposes modeling annotations as separate objects with their own lifecycle. Side B proposes structure-specific metadata rules. Neither side argues that metadata should freeze identically to content in all cases.

4. **History retention is independent of the mutability model.** Both sides agree that when and how the CLI commits intermediate states is a separate policy concern from when data becomes immutable. Neither model forces a particular history retention strategy.

5. **Frozen content should not be silently rewritten.** Both sides value traceability. Both agree that the reasoning record must be preserved. The disagreement is about mechanism, not principle.

6. **Reopening is dangerous and should be rare.** Side A forbids it (requiring new structures). Side B permits it per-structure but argues that previously frozen content should remain frozen even on reopen. Both sides treat history-rewriting as unacceptable. The gap between "create a new investigation that references the old one" and "reopen the old investigation but keep its frozen content frozen and append new entries" is narrower than it first appears.

## The resolution

**Side A (uniform freeze-on-close) presents the stronger overall framework, but Side B identifies a genuine structural problem that Side A does not fully resolve. The correct design is Side A's mechanism with an explicit accommodation for the sub-object freezing problem Side B raises.**

Here is why.

### Where Side A wins

Side A's central insight -- that uniformity should be in the *mechanism* (status-driven immutability) rather than in the *lifecycle* (which statuses exist and how they transition) -- is the stronger architectural move. It draws the right line: each structure defines its own states and transitions, but the rule "terminal status means immutable" is system-wide. This gives structures the expressiveness to model their domains while giving the system a single invariant that the CLI can enforce, test, audit, and explain.

Side A is also correct that a single enforcement code path is preferable to N structure-specific enforcement branches. Side B's concession that the enforcement cost difference is "marginal" understates the issue. The cost is not measured only in lines of code -- it is measured in the number of places a mutability bug can hide, the number of rules a user must learn, and the number of guarantees an auditor must verify. These scale with structure count under Side B's model and remain constant under Side A's.

Side A's treatment of metadata as separate objects with their own lifecycle is architecturally cleaner than Side B's approach. Rather than creating a content/metadata split within the freeze rule (which doubles the policy surface for every structure), Side A factors the problem away entirely: annotations are their own objects, with their own statuses, stored in their own namespace. This mirrors git notes, which is exactly the right analogy for a git-backed system.

### Where Side B wins

Side B's strongest argument is about sub-object freezing within designs, and Side A does not adequately answer it. Side A claims that sub-object freezing works under the uniform model because "each decision is a sub-object with its own status." But this is exactly Side B's model wearing Side A's clothing. If each decision within a design has its own status, its own terminal states, and its own freeze behavior, then the design structure has defined per-sub-object mutability semantics. Side A calls this "the uniform mechanism applied to sub-objects." Side B calls this "per-structure rules." They are describing the same thing, and Side B is more honest about what it is.

The real question is whether the uniform mechanism (terminal status means frozen) can express everything it needs to when applied recursively to sub-objects. Side B argues it cannot, using the example of a design whose decisions freeze on ratification while the design itself remains open. Side A says it can, by giving each decision its own status lifecycle. This works, but it means the "uniform" model requires structures to decompose themselves into independently-statused sub-objects whenever they have internal mutability variation. Side B is right that this decomposition pressure is a real cost, and Side A's acknowledgment of the "over-decomposition" risk validates this concern.

Side B also correctly identifies that the journal's freeze pattern (implicit on new-entry creation) fits the open/closed binary only if you squint. Side A acknowledges this -- "creating a new entry implicitly transitions the previous entry to a terminal state" -- but the framing is slightly forced. The journal's natural mental model is "the current entry is editable; past entries are not." Mapping this onto "entry 5 transitions to terminal status when entry 6 is created" adds a conceptual layer that does not match how the user thinks about it. This is a minor point but it reveals that the uniform model occasionally requires translating natural domain concepts into lifecycle machinery.

### Where Side B overreaches

Side B's claim that "mutability semantics are domain logic, not system-level policy" is overstated. Mutability semantics are *both*. The conditions that trigger a freeze are domain-specific (entry creation, investigation completion, decision ratification). The meaning of "frozen" (no further modifications to this object) is system-level. Side A is right to separate these and make the system-level part uniform.

Side B's argument that the uniform model will inevitably grow exceptions until it becomes "per-structure rules in disguise" is plausible but not demonstrated. Side A's annotation-as-separate-object approach for metadata is principled, not a workaround. The sub-object status approach is recursive application of the same rule, not an exception. The uniform model may accumulate pressure, but it has not been shown to collapse.

## Unresolved tensions

1. **Decomposition granularity.** The uniform model requires that anything with independent mutability be modeled as a separate object with its own status. This is architecturally clean but may force unnatural decomposition. The design-with-decisions case works well. But what about a structure where the mutable/immutable boundary cuts across what is naturally a single document? No concrete example has been produced yet, so this tension is theoretical -- but it is the most likely source of future pain.

2. **Implicit vs. explicit lifecycle transitions.** The journal's freeze-on-next-entry-creation is implicit. The uniform model makes it explicit (status transition on the previous entry). Both sides acknowledge this gap. The question is whether the CLI should surface the status transition to the user ("Entry 5 is now closed") or keep it hidden (just create entry 6 and silently freeze entry 5). This is a UX question the mutability model does not answer.

3. **Reopening semantics.** Side A forbids reopening. Side B permits it with restrictions. The primer identifies this as a practical need. If the system forbids reopening, the cost of invalidating a past finding is creating a new investigation, linking it to the old one, and re-establishing context. This friction is either a feature (Side A) or a tax (Side B). The right answer likely depends on how expensive investigation creation actually is in practice, which is not yet known.

4. **Metadata identity and storage.** Side A's "annotations as separate objects" approach raises implementation questions. Where do annotations live? How are they associated with the annotated object? How does the CLI present them? Git notes are one model, but they have limitations (only one note per ref per namespace, merge conflicts on note refs). The annotation layer needs concrete design work regardless of which mutability model is chosen.

## Whether experimental resolution is needed

**Partially yes.** The core architectural question (uniform mechanism vs. per-structure mechanisms) can be resolved by design decision -- the arguments favor Side A's mechanism. But two practical questions would benefit from prototyping:

1. **Design structure decomposition.** Implement a design structure with independently-statused decisions under the uniform model. Evaluate whether the decomposition feels natural or forced. Specifically: create a design with three decisions, ratify one, modify another, and verify that the freeze behavior matches user expectations. This is a half-day exercise with the git plumbing already available.

2. **Annotation layer mechanics.** Prototype the "annotations as separate objects" approach for metadata on frozen entries. Test whether git notes, a separate tree per annotated object, or inline annotation objects in the containment hierarchy is the right storage mechanism. This determines whether Side A's clean factoring of metadata actually works at the implementation level, or whether it introduces enough friction that a simpler "metadata is always mutable" exception would be preferable.

Neither experiment is blocking. The architectural decision can proceed now; the experiments validate implementation details.

## Recommended design decisions

1. **Adopt the uniform mechanism: terminal status means immutable.** Every object in the system has a status. The CLI enforces one rule: objects in terminal status cannot be modified. This is the system-level invariant. It is implemented once in the CLI's write path as a status check, and it applies to all structure types without exception.

2. **Each structure defines its own lifecycle.** States, transitions, and which states are terminal are specified per-structure. The journal defines entry states and marks past entries as terminal on new-entry creation. The investigation defines its status lifecycle and marks "complete" and "abandoned" as terminal. The design defines decision states and marks "ratified" as terminal. The uniformity is in the mechanism, not in the lifecycles.

3. **Sub-objects with independent mutability get their own status.** If a structure contains parts that freeze independently (design decisions), those parts are modeled as sub-objects with their own status lifecycle. The same terminal-means-frozen rule applies recursively. This is not an exception to the uniform model; it is recursive application of it. Structures that do not need sub-object freezing (journal entries, simple investigation entries) do not pay this cost.

4. **Annotations are separate objects, not metadata fields on frozen objects.** Tags, cross-references, and post-hoc annotations on frozen objects are stored as separate objects in the containment hierarchy, associated with but not part of the frozen object. They have their own lifecycle (typically always-open or open until explicitly closed). The frozen object's content-addressable identity is not affected by annotation changes. This eliminates the metadata mutability exception entirely.

5. **Reopening is forbidden in the initial design.** Closed structures stay closed. Revision means creating a new structure that references the old one. This preserves the traceability guarantee and avoids the complexity of defining per-structure reopening semantics. If practical experience reveals that this friction is genuinely excessive (not merely inconvenient), a system-wide reopen mechanism can be added later -- as a single, uniform transition with mandatory justification, not as per-structure reopening rules.

6. **Implicit lifecycle transitions are permitted but must be backed by explicit status changes.** The journal's freeze-on-next-entry pattern is natural and should be preserved as the user-facing behavior. But internally, entry 5's status transitions to terminal when entry 6 is created. The CLI may or may not surface this to the user, but the status field reflects reality. This means every freeze event is discoverable by inspecting status, even when it was triggered implicitly.

7. **History retention is a separate configuration concern.** The mutability model defines when things stop changing. Commit granularity (whether intermediate states of mutable objects are preserved) is configured independently, potentially per-structure. This decision is deferred and is not coupled to the mutability model.
