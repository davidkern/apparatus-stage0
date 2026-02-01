# Identity debate: synthesis

## Key findings — consensus points

Both sides agree on the following, which should be treated as settled:

1. **Content-addressing is a substrate fact, not a choice.** The `.apparatus/` bare repo provides content-addressed identity for every object. This is one of the four accepted substrate primitives. Neither side proposes removing or bypassing it. The debate is about whether an additional identity layer is needed above it.

2. **Logical object continuity is a real system requirement.** Side A acknowledges that "tracking logical identity across edits" is harder under pure content-addressing and that the system layer must provide the "same logical object over time" abstraction. Side B builds its entire case on this need. Both sides agree the need exists; they disagree on where to satisfy it.

3. **The commit graph is the authoritative history.** Both sides accept that git's commit graph records version succession. Side A treats it as the primary mechanism for version tracking. Side B treats it as a supporting mechanism beneath assigned identity. Neither disputes its role.

4. **A derived index is necessary.** Both sides agree the system layer needs a queryable index that is separate from the raw storage. They disagree on what the index keys should be, but not on the index's existence or its derived/rebuildable nature.

5. **Citations need both precision and durability.** Both sides agree that a cross-structural citation must identify both "which logical thing" and "which version of it." They disagree on whether these are one value (SHA) or two (UUID + version), but both acknowledge the dual requirement.

6. **Users think in terms of persistent entities.** Side A explicitly concedes that "users think in terms of 'finding 3' or 'the latency assumption,' not in terms of SHA prefixes" and that a naming layer is required regardless. Side B builds on this. The user-facing model is not in dispute.

## The resolution

**Side B (assigned identity) presents the stronger overall position, but Side A identifies a critical constraint that prevents assigned identity from standing alone. The correct answer is a layered hybrid where content-addressing remains the substrate identity and assigned identifiers are a system-layer mechanism.**

Here is why, tension point by tension point:

### Where Side B wins

**Identity through content edits (tension 2).** This is Side B's strongest ground. The Apparatus manages objects that are routinely edited -- metadata updates, status transitions, tag additions. Under pure content-addressing, every edit produces a new identity, and every consumer of that object must resolve through the commit graph to understand continuity. Side A's response -- that the commit graph records the relationship -- is technically true but operationally burdensome. The common case in the Apparatus is "show me the current state of this thing," not "show me the cryptographic proof of what this thing contained at a historical moment." Side B correctly identifies that content-addressing optimizes for the uncommon case at the expense of the common one.

**Cross-structure references and citation staleness (tensions 3 and 4).** Side B's argument about citation staleness detection is decisive. Under assigned identity, "which of my citations are stale?" is a batch index scan: compare cited versions against current versions for each UUID. Under pure content-addressing, the same question requires reconstructing version lineage from the commit graph for every cited SHA. Side A claims this is O(1) via "comparing the cited SHA against the current SHA at the finding's position in the latest commit," but this claim smuggles in an assumption: that the system already knows the structural path of the cited object, which is itself a form of persistent identity (path-based). Side A's O(1) claim is actually O(1) only if a path-based lookup layer exists -- which is halfway to assigned identity already.

**Query index stability (tension 5).** Side B correctly identifies that content-addressed index keys are unstable and that stabilizing them requires either dangling-key management or a succession chain that recapitulates assigned identity. Side A's response that index updates are proportional to change size is true but does not address the deeper problem: external references (from other structures, from user bookmarks, from CLI history) that hold SHAs become dangling after any edit. Assigned identity solves this structurally.

### Where Side A wins

**Integrity and substrate alignment.** Side A's argument here is not just stronger -- it is unanswerable. Content-addressing provides cryptographic integrity verification as an inherent property of the substrate. A SHA is a proof of content. A UUID is a label on faith. Side B acknowledges this ("the substrate's content-addressing primitive is not replaced; it is complemented") but underestimates its importance. In a system whose entire purpose is maintaining evidentiary chains for design decisions, the ability to cryptographically verify that cited content has not been modified is not a nice-to-have. It is foundational.

**Instantiation fidelity (tension 1).** Side A is correct that content-addressed identity provides zero-cost, mathematically guaranteed stability across instantiations. Side B's response -- that UUIDs survive bundling because they are stored as content -- is also correct, but it concedes Side A's point: UUIDs survive bundling because they are content-addressed. The substrate does the work. Side B's identity model is parasitic on Side A's in this specific case.

**Citation precision.** Side A's argument that content-addressed citations are self-verifying -- that the SHA is both the identity and the integrity proof of what was relied upon -- is genuinely important. Under assigned identity, a citation records (UUID, version), but verifying that the cited version actually contained what the decision-maker relied upon requires a separate integrity check. Under content-addressing, the verification is the identity. This matters for the Apparatus's core use case of traceable design rationale.

### The hybrid resolution

The correct design uses both, at different layers:

- **Content-addressing is the substrate identity.** Every object's SHA remains the ground truth for integrity, deduplication, and historical precision. Citations record SHAs as their version-precision component. The commit graph remains the authoritative history.

- **Assigned identifiers are a system-layer mechanism.** Each logical object (journal entry, investigation finding, design decision, assumption) receives a stable identifier at creation time. This identifier is stored as part of the object's content (making it content-addressed at the substrate level). It does not change when content is edited. It provides the join key for index queries, staleness detection, cross-instantiation comparison, and user-facing reference.

- **Citations are pairs.** A citation records (assigned-id, content-SHA): "I relied on logical object X as it existed at content state Y." The assigned ID provides durability (find the current version of what I cited). The SHA provides precision (verify exactly what I relied upon). This is Side B's (UUID, version) model, with the SHA serving as the version marker.

This is not a compromise. It is the architecture both sides are converging toward. Side A concedes the need for a "stable-reference experience" and proposes refs and paths as the mechanism. Side B concedes that content-addressing provides integrity and proposes layering UUIDs on top of it. The hybrid makes both concessions explicit and structural.

## Unresolved tensions

1. **What generates and enforces assigned identifiers?** Side B acknowledges that UUID generation and uniqueness enforcement is "real complexity that content-addressing avoids." The system layer (or CLI) must guarantee that every object has exactly one assigned identifier, that identifiers are never duplicated, and that identifiers are never lost during edits. The enforcement mechanism has not been designed. This is an implementation risk, not a design flaw, but it needs resolution before the system is built.

2. **What is the assigned identifier's format?** UUID v4? UUID v7 (time-sortable)? A shorter content-derived identifier (e.g., a hash of creation timestamp + structural path)? The format affects storage overhead, human readability, sortability, and collision risk. Neither side engaged with this question.

3. **Path-based identity vs. assigned identity.** Side A implicitly relies on structural paths (e.g., `journal/entries/2026-02-01`) as a form of persistent identity. Side B relies on UUIDs. There is a question of whether paths already provide sufficient persistent identity for the Apparatus's use cases without introducing UUIDs. The answer depends on how frequently objects move between structural positions -- a question neither side addressed with evidence.

4. **History reconstruction cost under assigned identity.** Side B acknowledges that "historical queries require reconstruction" under assigned identity: finding all prior versions of a UUID requires walking the commit history. This is the mirror of Side A's current-state problem. The relative frequency of historical vs. current-state queries in the Apparatus has not been established. If historical queries dominate (plausible in a traceability system), the cost balance shifts.

5. **Garbage collection and object lifetime.** Neither side addressed what happens when objects are deleted or archived. Under content-addressing, unreferenced SHAs can be garbage-collected by git. Under assigned identity, a deleted UUID must be removed from the index and its references must be handled (dangling? tombstoned?). The lifecycle model for assigned identifiers is undesigned.

## Whether experimental resolution is needed

**Yes, but narrowly scoped.**

The hybrid architecture is sufficiently well-motivated by both sides' arguments that it does not need experimental validation at the architectural level. What does need experimental validation:

1. **Assigned identifier storage mechanism.** Where exactly in the git object model does the UUID live? Options include: a field in a metadata blob alongside the content, a git note attached to the creation commit, a registry blob in a well-known tree path. Each option has different implications for bundling, querying, and edit workflows. A small experiment that implements two or three storage mechanisms and tests them against the instantiation and edit workflows would resolve this concretely.

2. **Citation staleness detection performance.** Side B claims the batch-staleness query is O(n) in citation count under assigned identity and O(n * d) under content-addressing (where d is commit depth). This claim is plausible but unverified. An experiment that builds a small corpus with realistic citation density and measures actual query performance would establish whether the difference is practically significant or purely theoretical.

3. **Path stability as a proxy for assigned identity.** If objects rarely move between structural positions, the structural path may serve as a sufficient persistent identifier, making UUIDs unnecessary overhead. An experiment that models the expected edit and reorganization patterns of the three structures (journal, investigation, design) could determine whether path-based identity is adequate.

## Recommended design decisions

1. **Adopt a two-layer identity model.** Content-addressing at the substrate. Assigned identifiers at the system layer. Do not attempt to use content-addressing alone for user-facing identity, and do not attempt to replace content-addressing with assigned identifiers at the storage layer.

2. **Every logical object gets an assigned identifier at creation time.** The CLI is responsible for generating and embedding the identifier. The identifier is stored as part of the object's content representation (not in a separate registry), so that it is versioned, bundled, and content-addressed along with everything else.

3. **Citations record both the assigned identifier and the content SHA.** The assigned identifier answers "what did I cite?" The SHA answers "what exactly did it contain when I cited it?" Staleness detection compares the cited SHA against the current SHA for that assigned identifier. This gives both durability and precision without sacrificing either.

4. **The derived index is keyed by assigned identifier.** This gives stable index keys, direct current-state lookup, and straightforward staleness queries. The index maps assigned-id to (structural-path, current-SHA, metadata). The index is derived and rebuildable from the git object store.

5. **Do not use UUIDs as user-facing names.** Users should refer to objects by human-readable names (entry dates, investigation titles, decision numbers). The assigned identifier is a system-internal mechanism for tracking logical identity. The CLI translates between human-readable names and assigned identifiers. Users should never need to type or read a UUID.

6. **Defer the identifier format decision.** UUID v7 is a reasonable default (time-sortable, low collision risk, widely supported), but the format is an implementation detail that can be decided during CLI implementation. The architectural decision is "assigned identifiers exist and are embedded in object content." The format is a detail beneath that.

7. **Integrity verification uses content-addressing, not assigned identity.** When the system verifies a citation, it checks the SHA, not the UUID. When the system verifies a bundle, it relies on git's content-addressed integrity. The assigned identifier is never used as a proxy for content integrity. This preserves Side A's strongest argument without compromise.
