# Position: Assigned identity

## Core argument

The Apparatus manages objects that persist through change. A journal entry is tagged, corrected, annotated. An investigation moves from researching to experimenting to complete. A design decision's rationale is refined as evidence accumulates. In every case, the system must answer a question that content-addressing cannot: "Is this the same object I was looking at before?"

Content-addressed identity answers a different question — "Is this the same content I was looking at before?" — and it answers that question perfectly. But content identity and object identity are not the same thing. An investigation finding that is corrected for a typo is still the finding that a design decision relied upon. A journal entry whose tags are updated is still the entry the researcher wrote on Tuesday. The system's users think in terms of objects with continuity. The storage layer should make that continuity explicit rather than forcing every consumer to reconstruct it from commit-graph archaeology.

Assigned identity makes the object, not its content, the unit of reference. A UUID or equivalent identifier is created once, stored as part of the object's representation, and never changes. When content changes, the identifier persists. When the object moves between structural positions, the identifier persists. When the object is bundled into an isolated instantiation and later diverges, both lineages share the same origin identifier, and the divergence is a fact about the object's history rather than an identity rupture. Every layer of the system — storage, structure, system, CLI — can use the assigned identifier to mean "this logical entity" without needing to resolve version history to determine what they are pointing at.

This is not a rejection of content-addressing. Content-addressed identity is one of the four accepted substrate primitives, and it remains the mechanism for integrity verification, deduplication, and change detection at the storage layer. Assigned identity is a layer above, implemented using the substrate's own capabilities: a UUID stored in a blob, tracked by git's content-addressing, versioned by git's commit graph. The two identity systems are complementary. Content-addressing tells you whether bits have changed. Assigned identity tells you which logical object those bits belong to.

## Tension points

### 1. Stability across instantiations

When an apparatus is bundled into an isolated environment via `git bundle`, assigned identifiers survive automatically because they are content — they are stored in blobs, which are content-addressed, which means `git bundle` preserves them exactly as it preserves everything else. There is no special mechanism required. The UUID is data inside the object, and data inside objects is what git is built to transport faithfully.

The interesting case is post-divergence. The isolated environment edits an investigation finding. Under content-addressing alone, the edited finding has a new SHA. The relationship between the original finding and the edited finding exists only in the commit graph — you must walk parent commits to discover that one tree contained a blob at a certain path that was replaced by a different blob in a child commit. This is possible but indirect, and it requires access to the commit history, which is a repository-level concern rather than an object-level one.

Under assigned identity, the edited finding retains its UUID. The relationship is immediate: same UUID, different content, different commit. Any system that knows the UUID can locate the object in either instantiation and compare versions without reconstructing the commit graph. If the two instantiations later need to be compared or reconciled, the UUID provides the join key. Object-level diff becomes: "find all UUIDs present in both instantiations, compare their content." Under content-addressing alone, the equivalent operation is: "walk both commit graphs, reconstruct the path-to-blob mapping at each point, match by path, compare content" — which is more fragile (paths can change) and more expensive (full graph traversal).

The risk is divergent edits: both instantiations modify the same UUID differently. Assigned identity does not resolve this conflict — it surfaces it. The system knows that two instantiations have divergent versions of the same logical object, and it can present that fact to the user. Under content-addressing, the system knows only that two instantiations have different blobs at the same path, which conflates structural reorganization with content divergence.

### 2. Identity through content edits

This is assigned identity's most natural territory. A journal entry's metadata is updated — a tag is added, a status field changes. The content changes, so every content-address from the blob up through the tree to the commit changes. Under pure content-addressing, the pre-edit and post-edit objects are different objects. The system must consult the commit graph to establish that one replaced the other, and any reference to the old SHA now points to a historical version rather than the current object.

Under assigned identity, the UUID does not change. The entry before and after the tag addition is the same entry. References to the entry by UUID continue to resolve to the current version. The commit graph still records the full history — every prior version is recoverable by walking parent commits — but the default behavior of a UUID reference is to resolve to the latest state, which is almost always what the user wants.

This matters most for the common operations that users perform constantly: "show me entry X," "what is the status of investigation Y," "list all findings in design Z." These are queries about current state. Content-addressing forces these queries through version resolution: look up the latest commit, find the blob at the expected path, verify it is the current version. Assigned identity makes current-state queries direct: look up the UUID in the index, retrieve the content. The version history is available when needed but is not on the critical path for routine access.

The deeper point is about what the system considers "normal." Content-addressing treats change as the creation of a new object and stability as a derived property. Assigned identity treats stability as the default and change as something that happens to a persistent entity. For a system where objects are routinely edited — metadata updates, status transitions, content corrections — the second framing matches the domain. Researchers think of "my finding" as a thing that evolves, not as a sequence of immutable snapshots that happen to be related by commit parentage.

### 3. Cross-structure references

A design decision cites an investigation finding as supporting evidence. This reference must serve two purposes: it must identify which finding (durability), and it should record which version of the finding was relied upon (precision).

Under assigned identity, the reference naturally separates these concerns. The UUID identifies the finding. A version marker — which can be a commit SHA, a timestamp, or a sequence number — identifies the specific state that was relied upon. The reference is a pair: (UUID, version). This pair is explicit about what it means: "I relied on finding F as it existed at version V."

Under content-addressing, the SHA serves double duty as both identifier and version. This appears elegant — a single value encodes both — but it sacrifices durability. The reference points to a specific version of the finding. If the finding is corrected, the reference still points to the old version. To discover that the finding has been updated, the system must know that the old SHA has a successor, which requires walking the commit graph to find a newer commit where the same path contains a different blob. This is the reconstruction problem: the information exists in the commit graph, but it is implicit rather than explicit.

Assigned identity makes "has the cited source been updated?" a direct question: look up the UUID, compare the current version to the version recorded in the citation. If they differ, the citation is stale. This is O(1) in the index, versus O(depth) in the commit graph under content-addressing. For a system that needs to answer "which of my citations are stale?" across an entire design, the difference between an index scan and repeated graph traversals is significant.

The cost is that assigned identity requires the reference to be a pair rather than a single value. This is marginally more complex to store and to validate. But the pair makes the semantics explicit, and explicit semantics are cheaper to maintain than implicit ones that must be reconstructed.

### 4. Identity in the citation mechanism

The citation pattern — "I relied on finding Y from investigation X at version Z" — maps directly onto assigned identity's natural representation. Y is a UUID. X is a UUID. Z is a version marker (commit SHA or equivalent). The citation is a structured record with clear semantics: the identity of the source, the identity of the containing structure, and the version that was consulted.

Under content-addressing, Y's SHA is both its identity and its version. The citation is a single SHA. But this single value cannot answer the question "has the source been updated since I cited it?" without consulting the commit history to determine whether a newer version of the same logical object exists. And to determine what "the same logical object" means, the system must establish that the old SHA and some newer SHA occupy the same structural position in successive commits — which is precisely the reconstruction of assigned identity from commit-graph position.

This is the crux: content-addressing does not eliminate the need for persistent identity. It defers the reconstruction of persistent identity to query time. Every time the system asks "is this the same object?", it must re-derive the answer from the commit graph. Assigned identity pays this cost once, at creation time, and amortizes it across every subsequent query.

For the citation mechanism specifically, the staleness check is a first-class operation. The system should be able to answer "which of my citations are out of date?" efficiently and routinely. Under assigned identity, this is a batch comparison of (UUID, cited-version) pairs against current versions. Under content-addressing, it requires reconstructing the version lineage of every cited object from the commit graph. The batch comparison scales linearly with citation count. The graph reconstruction scales with citation count multiplied by commit history depth.

### 5. Identity in the query index

The system layer maintains a derived index for cross-structural queries. The index maps identities to locations and metadata. The identity model determines the index's key space.

Under assigned identity, the index key is the UUID. This key is stable across content edits, metadata updates, and structural moves. When an object changes, the index entry is updated in place: same key, new value (new location, new metadata, new version). The index maintains a one-to-one mapping between logical objects and index entries. Index construction is straightforward: enumerate all objects, extract their UUIDs and metadata, build the map.

Under content-addressing, the index key is the SHA. When content changes, the old SHA becomes historical and a new SHA takes its place. The index must either (a) remove the old entry and add a new one, or (b) maintain a chain of SHA-to-SHA succession so that queries against old SHAs can be redirected to current state. Option (a) means external references to the old SHA become dangling index lookups. Option (b) is a reimplementation of assigned identity — a stable logical key (the succession chain) that maps changing content-addresses to a persistent entity.

The index under assigned identity is a conventional key-value store. The index under content-addressing is either a key-value store with key instability (requiring all consumers to track key changes) or a key-value store with an indirection layer (the succession chain) that recapitulates assigned identity with more moving parts.

For cross-structural queries — "which decisions depend on assumption X?", "show me everything from Tuesday" — the query predicates are about logical objects, not about specific content versions. The researcher asking "which decisions depend on this assumption" means the assumption as a logical entity, not the assumption as it existed at a particular SHA. Assigned identity aligns the index key space with the query semantics. Content-addressing introduces a mismatch that must be resolved at query time.

## Evaluation

**Domain alignment.** The system's domain is structured knowledge artifacts that evolve over time. Researchers think of entries, findings, decisions, and assumptions as persistent entities that change — not as sequences of immutable snapshots. Assigned identity reflects this mental model. When the data model matches the domain model, every layer of the system — from storage to CLI to user interface — can use the same vocabulary. When they diverge, every layer must translate, and translation is where bugs live.

**Referential stability.** References between objects should survive routine operations. Adding a tag to a journal entry should not invalidate every reference to that entry. Updating an investigation's status should not break the evidence chain in a design decision. Assigned identity provides this stability by construction. Content-addressing provides it only through commit-graph reconstruction, which is fragile (depends on unbroken history) and expensive (proportional to history depth).

**Query directness.** The system's most important queries — current state lookup, staleness detection, cross-structural traversal — are about logical objects. Assigned identity makes logical objects first-class in the index. Content-addressing makes content-versions first-class and requires an additional resolution step to reach logical objects. Every additional resolution step is a place where performance degrades and bugs can hide.

**Composability with the substrate.** Assigned identity does not fight the git substrate — it layers on top of it. UUIDs are stored as content, which means they are content-addressed, which means they participate fully in git's integrity, deduplication, and transport mechanisms. The substrate's content-addressing primitive is not replaced; it is complemented. This is the correct use of a layered architecture: each layer adds capability without undermining the layer below.

## Consequences

### What becomes easier

**Routine operations are direct.** Current-state lookup, metadata queries, cross-structural references — all resolve through stable identifiers without commit-graph traversal. The common case is fast and simple.

**Citation staleness is a first-class query.** Comparing cited versions against current versions is a batch index operation, not a per-citation graph reconstruction.

**Instantiation comparison and reconciliation.** When two instantiations diverge, the UUID provides an immediate join key for identifying corresponding objects, comparing versions, and surfacing conflicts.

**Index maintenance is conventional.** The index is a stable-key map updated in place. No key-instability management, no succession chains, no dangling-key cleanup.

**The CLI can speak the user's language.** Users refer to "finding F" or "entry E" — persistent names for persistent things. Assigned identity lets the CLI resolve these references without version-history reconstruction.

### What becomes harder

**Identity is a system-layer responsibility.** The substrate does not provide assigned identity natively. The structure layer or system layer must generate, store, and maintain UUIDs. This is additional mechanism that must be implemented correctly: generation must be unique, storage must be consistent, and the CLI must enforce that every object has an assigned identity. This is real complexity that content-addressing avoids by making identity a substrate-level automatic property.

**History queries require additional structure.** Under content-addressing, the commit graph is the version history — every SHA is a version, and the graph records succession. Under assigned identity, the commit graph still records history, but connecting a UUID to its version sequence requires either walking the commit history to find all commits where that UUID's content changed, or maintaining a separate version log. This is the mirror image of the staleness problem: assigned identity makes current-state queries cheap and historical queries require reconstruction, while content-addressing makes historical queries native and current-state queries require reconstruction.

**UUID collisions and corruption.** Assigned identifiers are generated, not derived. A bug in the generation logic, a corrupted storage write, or a failure to assign an ID at creation time can produce duplicate identifiers or orphaned objects. Content-addressing is immune to this class of error because identity is computed from content, not assigned. Assigned identity introduces a trust dependency on the generation and storage mechanism that content-addressing does not have.

### What risks emerge

**Identity without content-verification.** If the system relies on UUIDs for reference resolution, a corrupt object that retains its UUID but has garbled content will be treated as the correct object. Content-addressing detects this corruption automatically (the SHA does not match). Assigned identity must implement a separate integrity check — which the substrate provides via content-addressing, but only if the system layer uses it. The risk is that an implementation might rely on UUID lookup alone and skip integrity verification.

**Semantic drift.** A UUID says "this is the same object" even when content has changed dramatically. If a finding is edited so heavily that it no longer supports the design decision that cited it, the citation remains valid by identity even though it is invalid by meaning. The system can detect that the version has changed, but it cannot detect that the semantic relationship has been severed. This is a fundamental limitation: assigned identity tracks entity continuity, not semantic continuity. Content-addressing does not solve this problem either — a changed SHA tells you the content is different, not whether the semantic relationship holds — but it at least forces the citing structure to explicitly re-acknowledge the new version rather than silently accepting it.

**Coupling to generation infrastructure.** Every tool that creates apparatus objects must generate and assign identifiers correctly. The CLI is the sole supported interface today, but if that assumption weakens — if objects are created by scripts, migrations, or manual git operations — the identity invariant (every object has a unique, persistent ID) must be enforced by every creator. Content-addressing enforces its invariant automatically because git computes it. Assigned identity enforces its invariant only through discipline and tooling.

The core bet of assigned identity is that the Apparatus is a system about persistent entities that evolve, not about immutable content snapshots that succeed one another. The system's users, queries, references, and indexes all operate on logical objects. Making logical objects first-class in the identity model — rather than reconstructing them from content history at every point of use — aligns the storage layer with every layer above it and pays upfront complexity for ongoing simplicity.
