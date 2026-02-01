# Position: Uniform freeze-on-close

## Core argument

The single most valuable property a mutability model can have is that a human can hold the entire rule in their head. Uniform freeze-on-close provides this: open things are mutable, closed things are not. One rule. No lookup table mapping structure types to freeze behaviors. No conditional logic that depends on whether you are looking at a journal entry, an investigation artifact, or a design decision. The status field is the mutability switch, and it works the same way everywhere.

This matters because mutability is not a feature -- it is a constraint, and constraints derive their power from being predictable. When a researcher closes an investigation, they need to know what that means without consulting documentation specific to investigations. When the CLI enforces a write rejection, the error message is the same regardless of structure type: "this object is closed." When a new structure type is added to the system, its mutability semantics are already defined -- it inherits the universal rule. The designer of the new structure specifies its status lifecycle (what states exist, which are terminal) and gets freeze behavior for free.

The deeper argument is about where complexity should live. Per-structure mutability rules place mutability logic in the structure layer -- each structure type becomes responsible for defining, implementing, and communicating its own freeze semantics. Uniform freeze-on-close places mutability logic at the boundary between the structure layer and the system layer, as a single policy that the CLI enforces uniformly. This keeps the structure layer focused on what structures are good at (domain-specific organization of knowledge) and keeps policy enforcement where enforcement belongs (the CLI, which is the sole access interface).

The journal's existing pattern -- content freezes when a new entry is created -- is not a special case. It is freeze-on-close expressed through the journal's particular lifecycle. Creating a new entry implicitly transitions the previous entry to a terminal state. The mechanism is lifecycle-specific; the principle is universal. Generalizing this principle does not flatten meaningful differences between structures. It provides a shared grammar within which each structure defines its own vocabulary of states and transitions.

## Tension points

### 1. Metadata vs. content mutability

The question is whether a researcher should be able to tag a past journal entry or annotate a completed investigation after the fact. The answer is yes -- and uniform freeze-on-close accommodates this without exception to the rule.

The key insight is that metadata annotation is not mutation of the frozen object. It is creation of a new object -- an annotation -- that refers to the frozen object. Git's own architecture demonstrates this pattern: git notes attach metadata to commits without modifying the commit objects. The commit is immutable. The note is a separate object in a separate namespace. The system presents them together, but they are ontologically distinct.

Under uniform freeze-on-close, a frozen journal entry's content blob is immutable. Tags, cross-references, and annotations discovered after the fact are stored as separate objects associated with the entry but not part of it. The entry's identity (its content-addressable hash) is preserved. The annotation layer is mutable because annotations are open objects -- they have their own lifecycle. A tag can be added, corrected, or removed without touching the frozen entry.

This is not a workaround for an inflexible model. It is the correct factoring. Content and metadata have different identities, different lifecycles, and different integrity requirements. Content is the reasoning record -- it must be immutable to serve its auditability purpose. Metadata is an evolving interpretive layer -- it must be mutable to remain useful as understanding develops. Uniform freeze-on-close handles both by recognizing them as different objects with different statuses, not by carving out a metadata exception to a content freeze rule.

Per-structure rules could arrive at the same factoring, but they would arrive at it independently for each structure type, producing N implementations of the same principle. The uniform model names the principle once and applies it everywhere.

### 2. Completion semantics

When an investigation reaches "complete," what freezes? Under uniform freeze-on-close, the answer follows from the structure's containment hierarchy and the status of each node in that hierarchy.

The investigation as a whole transitions to a terminal status. This freezes the investigation's top-level properties: its question, its recommendation, its status. Individual entries within the investigation may already be frozen (if the investigation's lifecycle transitions entries to terminal states as they are superseded) or may freeze simultaneously (if entry terminal status is coupled to investigation terminal status). The specific policy is defined by the investigation's lifecycle specification -- but the mechanism is the same everywhere: terminal status means immutable.

This handles the case of a design with decisions at different stages naturally. Each decision is a sub-object with its own status. A decision that has been ratified is in a terminal state and is frozen, even while the containing design remains open. A decision under discussion is in an active state and is mutable. When the design itself reaches a terminal state, all remaining non-terminal sub-objects are forced to terminal status (either "ratified" or "superseded" or "withdrawn" -- whatever the design's lifecycle dictates). The freeze cascades through the containment hierarchy via status transitions, not through a special freeze mechanism.

The uniform model does not prevent structures from having complex internal freeze semantics. It provides the mechanism (status-driven immutability) and lets each structure define the lifecycle (which statuses are terminal, when sub-objects transition, whether parent completion forces child completion). The uniformity is in the mechanism, not in the lifecycle. This is a critical distinction: per-structure mutability rules conflate the mechanism with the lifecycle, making it appear that different freeze behaviors require different freeze systems. They do not. They require different lifecycle definitions evaluated by the same system.

### 3. Reopening closed structures

A completed investigation's finding is invalidated by new evidence. Under uniform freeze-on-close, the completed investigation is immutable. It cannot be reopened. A new investigation must be created.

This is not a limitation -- it is a feature, and it is the correct behavior for a design-with-traceability system.

The original investigation and its finding are part of the historical record. Decisions were made based on that finding. If the original investigation is reopened and its finding is modified, the historical basis for those decisions becomes invisible. The reasoning chain is broken. Under freeze-on-close, the original finding persists as a frozen artifact. The new investigation references the original, explains why its finding is invalidated, and produces a new finding. The full chain is preserved: original finding, invalidation evidence, revised finding, and the relationship between them.

The practical concern is friction: creating a new investigation is more work than editing an existing one. This is true, and it is the correct trade-off. The friction is proportional to the importance of the action. Invalidating a previous finding is a significant epistemic event -- it should require deliberate work, not a casual edit. The system's traceability guarantee depends on this friction. Reducing it by allowing reopening would trade a structural guarantee for convenience, and the convenience is needed rarely while the guarantee is needed always.

If the system later determines that reopening is genuinely necessary (not merely convenient), the uniform model can accommodate it through a single, system-wide mechanism: a "reopen" transition that moves a structure from a terminal state back to an active state, with a mandatory annotation explaining why. This transition creates a new commit in the structure's history, preserving the fact that the structure was once closed and has been reopened. The freeze guarantee is not violated -- it is explicitly and traceably revoked. But this mechanism, if added, would be uniform across all structure types. There is no reason reopening semantics should differ between investigations and designs.

### 4. History retention of mutable state

Should the system retain the history of changes to mutable objects? Under uniform freeze-on-close, this question is cleanly separable from the mutability model -- and that separability is itself an advantage.

The mutability model says: open things are mutable, closed things are not. It does not say whether intermediate states of open things are preserved. That is a history retention policy, and it should be decided independently based on the system's auditability requirements.

Git makes the answer natural. Every commit to the apparatus repo captures a snapshot. If the CLI commits on every modification to an open object, intermediate states are preserved in the commit history. If the CLI commits only on status transitions (entry creation, investigation completion), only the final state at freeze time is preserved. The mutability model is compatible with either policy because it defines when things stop changing, not how changes are recorded while they are happening.

This separation is valuable because history retention has costs (storage, commit noise, garbage collection) that should be tuned independently of the mutability rule. A system might retain full history for journal entries (where the evolution of thought is itself valuable) but only final-state-at-freeze for investigation metadata (where intermediate states are noise). These are configuration decisions, not mutability decisions. Uniform freeze-on-close keeps them in the right category.

Per-structure mutability rules tend to entangle history retention with freeze semantics because they define mutability at the structure level, where history policy also lives. When the journal's freeze rule is "content freezes on new-entry creation," it is natural to also specify "and intermediate states of the current entry are/are not preserved" as part of the same rule. This coupling is unnecessary and makes both policies harder to change independently.

### 5. Enforcement mechanism

The CLI is the sole access interface. Direct git access can bypass any CLI-imposed constraint. Given these facts, the enforcement burden of uniform freeze-on-close is minimal.

The CLI checks one thing before allowing a write: is the target object's status terminal? If yes, reject. If no, allow. This check is the same regardless of structure type, which means it is implemented once in the CLI's core write path, not once per structure type in structure-specific handlers.

Git's content-addressable storage already provides object-level immutability. Once a blob is written, it cannot be changed -- only new blobs can be created. The CLI's job is not to enforce immutability at the storage level (git already does that) but to enforce it at the logical level: preventing the creation of new blobs that would replace a frozen object's content. This is a policy check, not a storage mechanism, and a simpler policy is easier to implement correctly.

Per-structure rules require the CLI to consult a structure-specific policy for every write. The CLI must know that journal entries freeze on new-entry creation but investigation entries freeze on investigation completion but design decisions freeze on ratification. Each rule is a branch in the enforcement logic. Each branch is a place where a bug can hide. Each new structure type adds a new branch. The enforcement surface grows linearly with the number of structure types.

Uniform freeze-on-close has a constant enforcement surface. The number of structure types is irrelevant to the enforcement logic. The check is: read the status, compare to the set of terminal statuses for this structure type's lifecycle, allow or reject. The lifecycle definition is data (a list of terminal statuses), not code. Adding a new structure type means adding a new lifecycle definition, not new enforcement logic.

## Evaluation

The qualities I consider most important for this decision:

**Predictability.** A researcher using the system should be able to predict what will happen without consulting structure-specific documentation. "I closed this, so it is frozen" is predictable. "This journal entry froze when I created the next one, but this investigation entry is still mutable until I complete the investigation, and this design decision froze when it was ratified" requires a mental lookup table. Predictability compounds: it reduces errors, reduces documentation burden, reduces the cognitive cost of working across structure types, and reduces the training cost for new users.

**Enforcement simplicity.** The CLI is the sole interface and the sole enforcement point. A rule that can be enforced by a single, structure-agnostic check in the write path is less likely to have bugs, less likely to have inconsistencies between structure types, and less work to maintain as the system evolves. Enforcement simplicity is not merely an implementation convenience -- it is a correctness property. The simpler the enforcement logic, the higher the confidence that the guarantee actually holds.

**Composability with the git substrate.** Git provides content-addressable immutability and commit-based history. Uniform freeze-on-close maps cleanly onto these primitives: a frozen object's content hash is its permanent identity, and the commit that recorded the status transition is the freeze point in history. Per-structure rules do not map less cleanly onto git, but they do not leverage git's uniformity -- they impose structure-specific logic on top of a structure-agnostic substrate, creating an impedance mismatch between the policy layer and the storage layer.

**Evolvability.** When a new structure type is added, uniform freeze-on-close requires only a lifecycle definition (states and transitions, with terminal states marked). Per-structure rules require a lifecycle definition plus a freeze policy plus enforcement logic for that policy. The marginal cost of a new structure type is lower under the uniform model, which matters for a system explicitly designed to be extended.

**Separation of concerns.** Mutability policy, history retention policy, and structure-specific lifecycle are three independent concerns. Uniform freeze-on-close keeps them separate: the mutability rule is system-wide, history retention is configurable, and lifecycle definitions are per-structure. Per-structure mutability rules merge the first and third concerns, making both harder to reason about and change independently.

## Consequences

### What becomes easier

Cross-structure reasoning about mutability. A researcher working with a journal entry, an investigation, and a design decision uses the same mental model for all three: check the status, know whether it is mutable. The CLI displays status prominently because it is the single most important piece of state for determining what you can do.

Adding new structure types. The new structure inherits the freeze-on-close mechanism automatically. Its designer specifies a lifecycle (states and transitions) and marks which states are terminal. No new enforcement code is needed.

Auditing and compliance. The rule is simple enough to state in a single sentence, verify with a single check, and explain to anyone who asks. "Closed things cannot be modified" is a guarantee that auditors, researchers, and future maintainers can all understand without specialized knowledge.

Testing the enforcement logic. One code path to test, with a parameterized lifecycle definition. Structure-specific tests verify that the lifecycle transitions are correct, not that the freeze mechanism works -- because the mechanism is shared.

### What becomes harder

Nuanced freeze behaviors that do not map to status transitions. If a legitimate use case requires freezing part of an object while leaving another part mutable -- and this cannot be modeled as two objects with different statuses -- uniform freeze-on-close cannot express it without decomposition into separately-statused sub-objects. This decomposition may feel forced if the domain concept is naturally a single object.

Implicit freeze behaviors. The journal's pattern (content freezes on new-entry creation) is natural and implicit -- the researcher does not think "I am freezing entry 5," they think "I am creating entry 6." Under uniform freeze-on-close, this implicit behavior must be expressed as an explicit status transition on entry 5 that happens to be triggered by entry 6's creation. The mechanism is the same, but the framing shifts from implicit domain behavior to explicit lifecycle machinery. This adds a small amount of visible mechanism where per-structure rules would keep it hidden.

### What risks emerge

Over-decomposition. To fit every mutability need into the status-driven model, designers may be tempted to decompose structures into many small sub-objects each with their own status, producing a proliferation of statuses and transitions that is harder to understand than a simpler structure with a bespoke freeze rule would have been.

Lifecycle rigidity. If a structure's lifecycle is specified at design time and terminal statuses drive freeze behavior, changing the lifecycle later (adding a new state, reclassifying a terminal state as non-terminal) has mutability implications. The lifecycle definition becomes a load-bearing contract, and evolving it requires careful consideration of what was frozen under the old definition.

False uniformity. The strongest risk is that "uniform" becomes a straitjacket -- that the system forces genuinely different domain behaviors into a single mold, producing freeze semantics that are technically consistent but domain-inappropriate. This risk is real, and it must be mitigated by allowing structures sufficient expressiveness in their lifecycle definitions. The uniformity is in the mechanism (status drives mutability), not in the lifecycles themselves. If this distinction erodes -- if pressure toward uniformity starts constraining lifecycle design -- the model is being misapplied.
