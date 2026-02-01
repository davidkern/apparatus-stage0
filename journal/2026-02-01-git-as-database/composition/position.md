# Containment model: Composition

## Resolved: Composition is the correct containment model

Composition structurally ensures future flexibility by making the structure — not the system — the unit of evolution.

The Apparatus manages structured knowledge artifacts that will change in representation over time. The containment question is ultimately a question about where evolutionary complexity lives. Under association, relational semantics pervade the system: the storage layer maintains references, the schema must accommodate every object type uniformly, and changes to one structure's representation ripple outward through shared dependencies. Under composition, each structure is self-contained. It owns its data, its interpretation of that data, and its internal organization. The system above specifies operations ("search," "trace," "provision"); the storage substrate below provides a small core of organizational primitives. The structures in between are free to evolve independently.

This produces four concrete properties:

1. **Semantic completeness.** A structure is the unit of meaning. A decision outside its design, or an entry outside its investigation, is not a meaningful object. Composition reflects this ontology directly.

2. **Versioning coherence.** The version of the parent is the version of everything inside it. There is no need for reference-with-version, no schema for the reference itself, no policy for stale references. One snapshot, one coherent state.

3. **Boundary minimization.** The boundary of a structure is its interface with the rest of the system. What crosses that boundary is an explicit, designed choice. The CLI needs to understand top-level structure boundaries and the operations they support, not resolve a dependency graph to answer "what is inside this investigation."

4. **Reduced coordination.** In a system where isolated instantiations are a first-class concept, composition means each environment's data is self-contained. There are no shared mutable objects across contexts — only independent copies within their containing structures. No locks, no conflict resolution, no referential integrity maintenance across boundaries.

These four properties are facets of a single architectural claim: complexity belongs at the structure layer, where evolution happens, and must be kept out of the storage substrate below and the system operations above.

## The three-layer argument

The architecture has three layers, and composition correctly distributes responsibility across them. The relationship between the layers is symbiotic: the storage substrate provides the organizational primitives that make composition natural, and composition as the containment model keeps the substrate's responsibilities bounded so the substrate itself can evolve.

### Storage substrate (the floor)

The substrate is not a raw blob store. A pure "serialize everything to bytes" approach pushes too much responsibility upward — every structure must reimplement containment, identity, and snapshotting, duplicating work that belongs below them. But nor is the substrate a database with relational semantics. The substrate provides physical organization without logical interpretation. It has four responsibilities:

1. **Hierarchical containment.** Containers that hold other containers and artifacts. This is what makes composition expressible at the storage level. Without it, every structure reimplements directory-like nesting semantics independently.

2. **Content-addressable identity.** The ability to determine whether two artifacts are identical without understanding what they are. This provides deduplication, integrity verification, and change detection as substrate-level properties rather than structure-level concerns.

3. **Atomic snapshots.** The ability to capture the state of a container and everything inside it as a single addressable point. This is what makes versioning coherent — not because the substrate understands versions, but because it can say "here is everything at this moment" as an atomic fact.

4. **Enumeration with metadata.** The ability to list what a container holds and report basic physical properties (type, size, identity) without loading full content. This is what makes the system layer's dispatch possible — it can discover structures and route operations without deserializing everything.

Notice what is absent from this list: references between containers, schema validation, query semantics, type systems. Those are structure-layer concerns. The substrate draws its boundary at physical organization — hierarchy, identity, snapshots, enumeration — and leaves logical interpretation to the layer above.

This boundary is what keeps the substrate stable. The substrate will still provide hierarchy, identity, snapshots, and enumeration when the structures above it are unrecognizable. And when the substrate itself needs to evolve — when a new capability is added to this interface, or an existing one changes — composition accommodates the transition. Old structures stored under the previous substrate interface do not need to be migrated. They can be held in compatibility containers: thin wrappers that present the old representation through the new interface. The substrate evolves beneath the structures without disturbing them, just as the structures evolve above the substrate without disturbing it.

Under association, the substrate must maintain relational semantics — reference resolution, integrity constraints, dependency tracking. These semantics are coupled to the logical schema of the structures above. When structures evolve, the relational substrate must evolve in lockstep, and every historical object must be migrated or the integrity constraints break. The substrate and the structures cannot evolve independently because association couples them.

### Structure layer (the middle)

Journal, investigation, design — each implementing domain-specific operations against the substrate. This is where schema sovereignty lives. Each structure owns not just its data but its interpretation of that data. A journal entry from 2026 is markdown. A journal entry from 2040 may be a quantum simulation. They do not need to share a schema. They need to share an operation interface — "search," "summarize," "extract references" — but the implementation behind that interface is specific to the structure and its era.

The journal as a container defines what operations are meaningful; each entry carries or is versioned alongside the tooling that knows how to perform those operations on its specific format. The substrate's four primitives are sufficient for this: the journal uses hierarchical containment to hold entries, content-addressable identity to detect changes, atomic snapshots to version itself, and enumeration to discover its contents. It does not need the substrate to understand what a journal entry is. The journal provides that interpretation.

This is what makes structures forward-compatible. As long as a structure can map its internal organization to containers and artifacts, the substrate supports it. The substrate does not constrain what a structure can contain — it only provides the physical scaffolding. A structure that today contains markdown files and tomorrow contains quantum simulations requires no substrate change, because the substrate never knew about markdown in the first place.

### System layer (the ceiling)

The CLI orchestrating across structures: dispatching operations, collating results, enforcing isolation boundaries. The system layer does not interpret data directly. It knows which structures exist, what operations they support, and how to combine results. When a researcher searches the journal, the system dispatches "search for X" to each entry; entries from different eras use different tooling to answer; the system collates.

### The symbiosis

Composition and the substrate's design are mutually reinforcing. Composition keeps the substrate minimal because structures do not demand relational services from below — they are self-contained units that use only the four physical primitives. The substrate's minimality makes composition viable because the four primitives are general enough that any structure can map onto them without impedance. Neither derives from the other. They are the correct factoring of the same problem: where does organizational intelligence live?

Association pushes intelligence downward — the substrate must understand relationships, the schema must be universal, and the substrate and structures evolve as a coupled unit. Composition pushes intelligence to the structure layer, which is exactly where domain knowledge lives and where evolution is both expected and necessary. The substrate provides the scaffolding. The structures provide the meaning.

## Tensions

### Journal/investigation overlap

The journal and investigation do not compete for ownership of the same objects because they record different representations of the same underlying work. A journal entry is free-form prose that may reference an investigation — one that has already occurred, one in another project, one that has not yet taken place. Mere reference does not force association; the prose body of a journal entry is a higher-level abstraction than the data model. Tools may interpret these references however appropriate, and that interpretation is version-dependent.

The more interesting case arises when an investigation is performed "in the journal" — when the formal investigation system is inadequate for a process proposed ad hoc during journaling. Under composition, the contained process inherits the qualities of its container. The journal's defining quality is informality. By containing an investigation-like process inside a journal entry, the researcher may make arbitrary modifications to the artifacts produced. This permits open-ended exploration with low formality, which is the journal's purpose.

Under association, this scenario forces a choice: either the informal investigation is a "real" investigation object (imposing structure the researcher is trying to avoid) or it is unstructured journal content (losing the ability to reference it as investigation-like). Composition dissolves this tension — the container determines the rules, and the journal's rules are permissive.

### Design-to-investigation links

The tension point as framed assumes the investigation is not part of the design. This assumption is incorrect. Investigations are initiated in support of a design and are tightly coupled with it. Both the input framing that initiated the investigation and the output framing that feeds findings back into decisions are version-specific to the design that spawned them.

The same principle of quality inheritance applies. Where the journal container permitted informality, the design container formalizes rigor. It forces the investigation to function in a particular way — to produce findings in a form the design's decisions can consume, to meet the evidence standards the design requires. A future design process may support fundamentally different approaches to investigation, incompatible with approaches used in previously completed designs. Composition permits this because each design owns its internal organization. The system requires only that designs implement the coarse-grained operation interface.

Association would require that investigations conform to a single schema shared across all designs. This either constrains future design processes to be compatible with past schemas, or requires migration of historical investigations when the schema changes — precisely the evolutionary rigidity that composition avoids.

### Assumption impact analysis

This tension point appears to favor association because cross-cutting queries ("which decisions rest on assumption X?") seem natural in a relational model. But the appearance is misleading.

Under composition, assumptions live within decisions, which live within designs. To find all decisions affected by a changed assumption, the system dispatches the query "find decisions resting on assumption X" to each design structure and collates the results. This is the system layer performing its role: orchestrating operations across structures. Each design walks its own contained tree, returning matches. The query is parallelizable, requires no shared index, and each result comes with its full context — the design, the decision, the specific meaning of the assumption in that context.

This last point matters. Under association, an assumption is a shared object referenced by multiple decisions. But the meaning of an assumption is contextual — "we assume latency under 100ms" means something different in a real-time control design than in a batch processing design. When the assumption changes, the question is not merely "which decisions reference it" but "which decisions are actually affected given their context." Under composition, each design holds its own instance of the assumption, with its own contextual meaning, and the impact assessment happens within that context. Under association, a shared assumption object strips the context, forcing the researcher to reconstruct it during impact analysis.

The cost of composition is that the system must dispatch to multiple structures rather than querying a single index. This is a performance trade-off, not a capability trade-off, and it is proportional to the number of top-level structures — not to the total number of objects in the system.

### Selective provisioning

Selective provisioning is composition's most natural operation. Each structure is self-contained — it carries everything it needs. Creating an isolated environment with specific structures means copying those structures into the new environment. No dependency resolution. No broken references. No orphaned objects. The substrate operation is "copy these containers."

Under association, selective provisioning requires dependency analysis. Copying an investigation means identifying all objects it references, then identifying all objects those objects reference, transitively. It means deciding what to do when a referenced object is shared with a structure that was not selected — copy it (creating a partial duplicate) or omit it (breaking references). It means the provisioning tool must understand the full relational schema to compute the transitive closure. Every new relationship type in the schema is a new edge case in the provisioning logic.

Composition makes this problem structurally impossible. There are no external references to break because there are no external references.

### Future structure types

Adding a new structure type under composition requires defining:

1. The structure's internal organization (what it contains, how sub-objects relate to each other).
2. The operations the structure supports (how the system layer can interact with it).
3. How the structure uses the storage substrate (how it maps to containers and artifacts).

It does not require modifying the storage substrate, altering existing structures, updating a shared schema, or changing the provisioning logic. The new structure is self-contained. It can evolve at its own pace. If it is later abandoned, it leaves no residue in the system — no dangling references, no orphaned schema definitions, no compatibility shims in other structures.

Under association, a new structure type must integrate with the shared relational model. Its objects must be representable in the common schema. Its references must be resolvable by the existing dependency machinery. The provisioning logic must learn about its reference patterns. Every new structure type increases the system's total coupling.

## Qualities indicating this is the resolution

**Evolutionary independence.** Structures evolve independently. The 2026 version of the investigation structure and the 2040 version do not need to coexist in a shared schema. Old instances are intelligible through old tooling. New instances use new tooling. The system layer dispatches to whatever tooling the structure requires. This is forward compatibility achieved through containment rather than through schema universality.

**Substrate stability and evolvability.** The storage substrate remains stable because its responsibilities are bounded to four physical primitives that carry no structural opinions. It will still provide hierarchy, identity, snapshots, and enumeration when the structures above it are unrecognizable. And when the substrate itself must evolve — when a primitive is refined, or a new capability added — composition absorbs the change through compatibility containers. Old structures stored under the previous substrate interface are wrapped, not migrated. The substrate can evolve beneath the structures just as structures evolve above it. Under association, the substrate's relational semantics are coupled to the structural schema, so substrate evolution forces structure migration — or the integrity guarantees that association depends on break down.

**Operational clarity.** Every operation has clear, local semantics. Deleting a design deletes everything inside it. Versioning a journal entry versions everything it contains. Copying an investigation copies a complete, self-sufficient unit. There is no garbage collection, no orphan detection, no referential integrity maintenance. The simplicity of these operations is not a limitation — it is a structural guarantee that the system remains comprehensible as it grows.

**Substrate independence.** The four substrate primitives (hierarchical containment, content-addressable identity, atomic snapshots, enumeration with metadata) describe a contract, not an implementation. Git happens to provide all four natively — trees and blobs for hierarchy, SHA-based addressing for identity, commits for snapshots, tree listings for enumeration — which makes it a natural first implementation. But the argument for composition rests on the contract, not on git. Any storage backend providing these four primitives would work. Composition does not marry the system to a particular technology; it specifies the minimal interface any substrate must satisfy.

**Isolation by construction.** Instantiation — creating a hermetically isolated environment — is a substrate-level copy. Because structures are self-contained, copying them produces a valid, independent environment with no dangling references and no hidden dependencies on the source. The isolation guarantee is structural, not policy-enforced.

## Closing

Choosing composition means the following becomes easier: provisioning isolated environments, adding new structure types, evolving existing structures independently, versioning coherently, and reasoning locally about any given structure without understanding the whole system.

The following becomes harder: cross-structure queries require dispatching to multiple structures and collating results rather than querying a single index. Shared concepts (like an assumption that appears in multiple designs) exist as independent instances rather than as a single shared object, requiring the researcher to maintain consistency across copies through discipline rather than through referential identity.

The risk of composition is redundancy — the same information may exist in multiple structures, and keeping it consistent is a human responsibility rather than a system guarantee. But this is the correct trade-off for a system that must remain evolvable over long time horizons. Referential identity is a constraint: it couples structures together and demands schema compatibility. Redundancy with independent evolution preserves the freedom to change. In a system whose defining purpose is to compound research capability over time, the ability to change without coordinating across the entire data model is not merely convenient — it is load-bearing.
