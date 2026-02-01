# Position: Common base schema

## Core argument

The Wave 1 debates have already decided this question. They just have not named the decision.

The mutability resolution requires every object to carry a status field. The identity resolution requires every object to carry an assigned identifier. The schema-versioning requirement demands every piece of data be associated with its schema version. The index must extract metadata from any object. These are system-level invariants, not optional suggestions.

The question is not whether a common metadata shape exists -- it already does, implicitly. The question is whether the system names it explicitly or leaves it implicit and hopes every structure implementer independently satisfies the same constraints. A common base schema is the act of naming what is already required.

The base is small and precisely motivated:

- **id**: required by the identity resolution. The join key for the derived index.
- **type**: required for CLI dispatch. The system must know what it is looking at without parsing full content.
- **status**: required by the mutability resolution. The CLI checks this before every write.
- **schema-version**: required for forward readability. CLI N+1 reads data written at version N.
- **created-at**: required for ordering and provenance. Every object in a traceability system must record when it came into existence.

Five fields, each mandated by a resolved decision or behavioral requirement. Structures extend the base freely with domain-specific fields. The base establishes a floor, not a ceiling.

## Tension points

### 1. CLI implementation complexity

A common base simplifies every layer where the CLI operates across structure types. Enumeration extracts id, type, status, and created-at from every object using a single code path. Mutability enforcement -- the most correctness-critical path -- reads the status field from a guaranteed location. Forward readability provides a degraded-but-functional view of objects the CLI does not fully understand.

Without a common base, the CLI faces a bootstrap problem: to determine the type, it must parse the object, which requires knowing the schema, which is what the type was supposed to tell it. The CLI must infer type from structural position or attempt multiple parsings -- neither is clean. Per-structure dispatching works for structure-specific operations, but the system layer (cross-structural queries, index maintenance, enforcement) operates on all types simultaneously. One code path versus N.

### 2. Querying across structures

The derived index maps assigned-id to (structural-path, current-SHA, metadata). With a common base, the index builder extracts base fields generically. Cross-structural queries that filter by status, sort by created-at, or group by type work uniformly. Impact analysis can filter out abandoned investigations and superseded decisions without structure-specific logic.

Without a common base, the index must be configured per-structure for field extraction. Adding a new structure type means updating the index configuration. With a base, the index extracts base fields generically and needs structure-specific configuration only for structure-specific fields.

### 3. Schema evolution

The base creates a two-tier evolution model: base fields evolve at the system level (rare, high review); structure extensions evolve at the structure level (frequent, local). This matches the impact model -- base fields have system-wide consequences, so their evolution should be governed system-wide.

The schema-version field in the base enables forward readability at two levels. The CLI reads it to choose deserialization logic. For unknown schema versions, the base fields provide a guaranteed foothold -- the CLI can display id, type, status, and creation time even without understanding structure-specific fields. This matters for the cross-instantiation observation case: a researcher reading another project's apparatus data.

### 4. Metadata on citations

Under the common base, citations carry id, type ("citation"), status, schema-version, and created-at, plus citation-specific fields (source-id, source-sha, citing-structure-id). The type field lets the index distinguish citations from other objects. The created-at records provenance. The schema-version enables format evolution. Citations become first-class participants in the system without special-case code.

### 5. Instantiation metadata

Instantiation records carry the base (id, type, status, schema-version, created-at) plus domain-specific fields (source-instantiation-id, purpose, creator). Making instantiations first-class objects means they appear in the index, can be queried by status, and can be cited. The CLI needs no special-case code because it already handles objects with the base schema.

## Evaluation

**Architectural coherence.** The base schema is the contract between the structure layer and the system layer. In a three-layer architecture, layer boundaries should have explicit contracts. Without the base, the system layer is coupled to every structure's schema individually.

**Correctness concentration.** The enforcement check, index builder, and forward-readability fallback are structure-agnostic under the base: one implementation, tested once, correct for all current and future types.

**Extensibility.** A new structure type inherits system-layer integration for free by carrying the five fields. No system-layer code changes needed.

## Consequences

**Easier:** system-layer operations are structure-agnostic; new types are cheaper to add; schema evolution is partitioned by impact level.

**Harder:** all structures must carry the base fields, even if some are semantically thin (a citation's status may be trivial). Base changes are expensive and must be rare.

**Risks:** base creep (temptation to add "useful" fields that are not system-mandated) and false uniformity (treating the base as semantic rather than infrastructural).
