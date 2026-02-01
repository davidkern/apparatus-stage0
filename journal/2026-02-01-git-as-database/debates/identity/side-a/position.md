# Position: Content-addressed identity

## Core argument

Identity should be derived from content because, in a system built on git's object store, content-addressing is not merely an implementation convenience -- it is the only identity model that preserves the substrate's integrity guarantees without adding a layer of indirection that the substrate cannot verify.

The Apparatus storage contract rests on four substrate primitives, one of which is explicitly "content-addressable identity." This is not an accident of implementation. Content-addressing provides three properties simultaneously: identity, integrity, and deduplication. A SHA derived from content is a proof that the content is what it claims to be. Two objects with the same SHA are guaranteed identical. An object that has been tampered with will fail its own identity check. These properties are axiomatic in git -- every blob, tree, and commit inherits them without any system-level code needing to enforce them.

Assigned identity discards all three properties. A UUID says nothing about what an object contains, provides no integrity guarantee, and cannot detect duplication. It is a label affixed from outside, maintained by convention, and trusted on faith. In a system where hermetic instantiation, cross-structural citation, and long-term traceability are load-bearing requirements, building identity on faith rather than on mathematical proof is an unforced error.

The deeper argument is about what identity means in a system that manages evolving knowledge. Content-addressed identity makes a philosophical commitment: an object is defined by what it contains. When content changes, a new object exists. The old object is not gone -- it retains its identity, accessible by its SHA, immutable and verifiable for as long as the repository exists. Versioning is not layered on top of identity; it is a consequence of identity. The commit graph records which objects replaced which other objects, and every historical state is recoverable by its content address. This is not a limitation of content-addressing. It is the mechanism by which the system achieves traceability.

Assigned identity makes a different commitment: an object is defined by an act of naming. The name persists across mutations. This feels intuitive -- we name things in the world and expect the name to track the thing through changes. But the Apparatus is not modeling things in the world. It is modeling knowledge artifacts whose evidentiary value depends on knowing exactly what they contained at a specific moment. A design decision that rests on "finding Y" is meaningless if "finding Y" is a mutable label that may now point to different content than what the decision-maker relied upon. Content-addressing makes this impossible. The citation points to a SHA, and that SHA is the content. The evidentiary chain is unbreakable.

## Tension points

### 1. Stability across instantiations

Content-addressed identity provides automatic, zero-cost stability across instantiations. When a `git bundle` creates an isolated environment, every object SHA in the bundle is identical to the source. This is not a feature that content-addressing enables -- it is a mathematical inevitability. The same content produces the same hash. There is nothing to preserve, nothing to verify, nothing that could go wrong. Identity stability is a free consequence of the substrate's physics.

Under assigned identity, UUIDs must be stored within the content (in metadata blobs, frontmatter, or a separate registry). The bundling process must ensure these storage locations are included and correctly interpreted in the new environment. This works -- it is not fragile -- but it is a mechanism that must be built, tested, and maintained, solving a problem that content-addressing does not have.

The harder question is what happens after divergence. The isolated environment edits an investigation finding. Under content-addressing, the edited finding has a new SHA. The original SHA still exists in the commit history. The relationship between them is recorded in the commit graph: the new commit's parent is the old commit, and the tree diff shows which blob was replaced. This is exactly the same mechanism git uses to track file changes across commits, and it works because git was designed around content-addressed identity from the ground up.

The objection is that this relationship is implicit -- you must walk the commit graph to discover it, rather than looking up a stable ID. This is true. But "implicit in the commit graph" is not the same as "absent." The commit graph is the system's authoritative record of what changed, when, and in what context. The relationship between the original finding and its edited descendant is encoded in the most reliable data structure the system has. A derived index can make this relationship queryable without walking the graph on every access; the commit graph ensures the index can always be rebuilt from ground truth.

### 2. Identity through content edits

A journal entry's metadata is updated -- a tag is added. The content changes, so the SHA changes. Under content-addressing, the old SHA and the new SHA identify different states of the entry. The commit that introduced the new SHA records that it replaced the old one. The entry's history is the sequence of SHAs it has occupied across commits.

This is the correct model for a system that values traceability. The entry before tagging and the entry after tagging are not the same object in the same state -- they are two states of an evolving artifact, each independently addressable, each verifiable, each citable. If another structure cited the entry before the tag was added, that citation remains valid and precise: it points to exactly the content that existed when the citation was made.

The objection is that "adding a tag" feels like it should not change an object's identity -- it is a minor metadata edit, not a substantive content change. This intuition is understandable but misplaced. The question is not whether the change feels significant to a human, but whether the system should be able to distinguish the before-state from the after-state. Content-addressing says yes, always. Assigned identity says no, they are the same object. But "the same object" means citations to it cannot distinguish which version they relied upon, which means the evidentiary chain is lossy.

The practical concern -- that frequent metadata edits create a proliferation of SHAs -- is real but manageable. The commit graph already compresses this into a linear history. The system layer can provide a "current state" view by resolving the ref that points to the latest commit, giving the user the experience of a stable, evolving entry while the substrate maintains the full history. The ref is the stability mechanism; the SHA is the precision mechanism. Both are needed; content-addressing provides both natively.

### 3. Cross-structure references

A design decision cites an investigation finding as evidence. Under content-addressing, the citation is a SHA: it points to exactly the content that was relied upon. This is not merely precise -- it is honest. The decision-maker examined specific content and judged it sufficient. The citation records that judgment. If the finding is later corrected, the citation still points to what was actually relied upon, and the system can detect the discrepancy: the finding's current SHA differs from the cited SHA. This detection is automatic. The system does not need special logic to compare versions; it compares two content addresses.

Under assigned identity, the citation points to a UUID. To achieve the same precision, the citation must also record a version identifier. This is the "citation is a pair" problem from the primer. It works, but it means precision is opt-in rather than structural. A careless citation that omits the version points to "whatever the finding currently says," which may not be what the decision-maker relied upon. Content-addressing makes imprecise citations structurally impossible: every reference is to a specific SHA, which is a specific version by definition.

The objection that content-addressed citations become "stale" when the finding is updated misunderstands what staleness means in an evidentiary system. A citation is not stale because its target has been updated -- it is stale only if the update is relevant to the citing decision. The system can surface this: "the finding you cited has a newer version; review whether the decision still holds." This is more useful than a UUID citation that silently points to updated content without alerting the decision-maker that their evidence base has shifted under them.

### 4. Identity in the citation mechanism

The citation records "I relied on finding Y from investigation X at version Z." Under content-addressing, Y's SHA is both identity and version. The citation is a single value. This is elegant, but the elegance is not the point -- the point is that the citation is self-verifying. Given the SHA, the system can retrieve the content and verify it matches. There is no possibility of the identity pointing to one version while the version field points to another. There is no version field to get out of sync.

Under assigned identity, the citation is a UUID-version pair. This works but introduces a new failure mode: the pair can become inconsistent. The UUID could point to a version that has been garbage-collected or a version that does not belong to that UUID. The system must validate the pair's consistency, which is work that content-addressing eliminates.

For the "has the cited source been updated?" question: under content-addressing, the system compares the cited SHA against the current SHA at the finding's position in the latest commit. If they differ, the source has been updated. This is a single SHA comparison -- O(1). Under assigned identity, the system looks up the UUID, retrieves its current version, and compares against the cited version. This is also straightforward, but it requires a version-tracking mechanism that content-addressing provides for free through the commit graph.

The deeper advantage is that content-addressed citations compose. A citation to a finding includes, transitively, the exact state of every sub-object within that finding -- because the tree SHA is derived from the SHAs of its contents. If any part of the finding changed, the SHA would be different. The citation verifies the entire subtree, not just the top-level object. Under assigned identity, verifying that no part of a cited structure has changed requires checking each component's version separately.

### 5. Identity in the query index

The system layer maintains a derived index mapping identities to locations. Under content-addressing, the index maps SHAs to structural positions. When content changes, the SHA changes, and the index must be updated. This is the apparent weakness of content-addressing for indexing: every mutation invalidates index entries.

But this framing misunderstands how the index works in practice. The index is derived from the commit graph. Each commit represents a complete, consistent snapshot. When a new commit is created, the index is updated by diffing the new commit's tree against the previous commit's tree -- exactly the operation `git diff-tree` performs natively. The objects that changed are identified, their old index entries are retired, and new entries are created. This is an incremental update proportional to the size of the change, not the size of the index.

Under assigned identity, the index maps UUIDs to current locations. The key is stable but the value changes. This means the index never needs new keys for existing objects -- but it also means the index cannot represent historical states without additional machinery. "Where was this UUID at commit N?" requires either a versioned index or a walk of the commit graph -- the same walk that content-addressing requires. Content-addressing pays the update cost on write and gets O(1) lookup for any historical state by SHA. Assigned identity pays no update cost for keys but requires additional work for historical queries.

For a system where traceability and historical precision are primary values, paying the write-time cost to get exact historical lookup is the correct trade-off. The index under content-addressing is a cache of the commit graph's derived information. It can always be rebuilt from the commits. It can represent any point in time by indexing a specific commit. It is never the source of truth -- the content-addressed objects are. This separation between the authoritative store (immutable, content-addressed objects) and the derived index (mutable, rebuilt on demand) is architecturally clean and operationally resilient.

## Evaluation against key qualities

**Integrity.** Content-addressed identity provides cryptographic integrity verification as an inherent property. Every object can be verified against its own identity. No object can be silently modified. No citation can point to content other than what it claims. In a system that manages evidence chains and design rationale, integrity is not a nice-to-have -- it is the foundation of trust. Assigned identity provides no integrity guarantee; it must be layered on separately.

**Substrate alignment.** The storage substrate is git. Git's entire object model is content-addressed. Working with content-addressed identity means working with the substrate's grain. Every git operation -- diffing, merging, bundling, garbage collection, pack files -- assumes content-addressed objects. Assigned identity works against this grain, requiring a mapping layer between the system's identity model and the substrate's identity model. This mapping layer is a permanent source of complexity and a permanent vector for inconsistency.

**Traceability.** The Apparatus exists to trace how knowledge evolves. Content-addressed identity makes every state of every object independently addressable and verifiable. The history of an object is the sequence of content addresses it has occupied. Citations point to exact states. The commit graph records exact transitions. There is no ambiguity about what existed when. Assigned identity provides continuity of naming but sacrifices precision of reference -- you can say "this is the same object" but not "this is exactly what it contained when I relied on it" without additional version tracking.

**Simplicity of the storage contract.** Content-addressed identity adds nothing to the substrate. It is the substrate. There is no UUID generation, no uniqueness enforcement, no registry to maintain, no mapping between assigned IDs and content addresses. The system's identity model is the substrate's identity model. One model, one set of invariants, one source of truth. Assigned identity introduces a second identity model that must coexist with and map onto the first, doubling the conceptual surface area.

**Instantiation fidelity.** When an environment is instantiated from a bundle, content-addressed identity is preserved by mathematical necessity. There is no mechanism by which identity could be lost, corrupted, or mismatched. Under assigned identity, the bundling and unbundling process must correctly transfer UUID storage, and the new environment must correctly interpret it. This works in practice but is a correctness obligation that content-addressing eliminates.

## Consequences

### What becomes easier

**Instantiation is zero-cost for identity.** Bundle, unbundle, and every object retains its identity. No verification needed, no mapping, no reconciliation.

**Citations are self-verifying and precise.** Every cross-structural reference points to exactly the content that was relied upon. Staleness detection is a single SHA comparison. The evidentiary chain is cryptographically sound.

**History is free.** Every previous state of every object is preserved with its own identity. The commit graph records all transitions. There is no need to build a versioning system -- the substrate provides one.

**The index is rebuildable.** Because the index is derived from content-addressed objects and the commit graph, it can be reconstructed from scratch at any time. Index corruption is annoying, not catastrophic.

**Deduplication is automatic.** Two structures that contain identical content share the same objects in the git store. No deduplication logic, no content comparison -- if the SHAs match, the content is identical.

### What becomes harder

**Tracking logical identity across edits.** When a finding is updated, it has a new SHA. The system must consult the commit graph to know that the new SHA replaced the old SHA at a given path. This requires either walking the graph or maintaining a derived mapping from paths to SHA histories. The system layer must provide the "same logical object over time" abstraction that assigned identity provides natively.

**User-facing references.** Users think in terms of "finding 3" or "the latency assumption," not in terms of SHA prefixes. The system must provide human-readable names (refs, paths, or aliases) that map to content addresses. This naming layer is necessary regardless of identity model, but under content-addressing it is the sole mechanism for stable human reference, whereas under assigned identity the UUID provides a stable (if not human-readable) anchor.

**Index maintenance on write.** Every content mutation changes SHAs and requires index updates. The cost is proportional to change size, not index size, and git's diff-tree makes it efficient -- but it is non-zero work that assigned identity avoids for key stability.

### What risks emerge

**Accidental conflation of identity and versioning.** Content-addressing makes identity and version the same thing. This is a strength for precision but a risk for mental models. Developers may struggle with the idea that "editing an object creates a new object." The system layer must present an interface where objects feel stable and editable, even though the substrate treats each state as a distinct entity. If this translation layer is poorly designed, users will find the system confusing or will work around it in ways that break traceability.

**Over-reliance on the commit graph.** The relationship between versions of an object lives in the commit graph. If the commit graph becomes complex (many branches, merges, rebases in instantiated environments), tracing the lineage of an object across commits may become computationally expensive or ambiguous. The system must enforce discipline on commit graph structure to keep lineage queries tractable.

**Path-dependency for logical identity.** In the absence of assigned IDs, an object's logical identity is often its path within the tree (e.g., `journal/entries/2026-02-01`). If an object is moved to a different path, the commit graph records the move, but the system must explicitly track renames to maintain logical continuity. Git's rename detection is heuristic, not exact. The system may need to record moves explicitly in commit metadata or in a separate tracking mechanism.

The core bet of content-addressed identity is that precision and integrity are more valuable than naming convenience, and that the system layer can provide the stable-reference experience users expect on top of a substrate that guarantees every state of every object is independently addressable and verifiable. The substrate provides the truth. The system layer provides the narrative. Neither should try to do the other's job.
