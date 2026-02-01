# Position: Per-structure schemas

## Core argument

A common base schema is an abstraction. The question is whether it is a useful abstraction or a premature one. I argue it is premature, and that the cost it imposes -- a system-level contract that every structure must satisfy and every future structure must conform to -- is not justified by the benefits, which can be achieved through lighter mechanisms.

The Wave 1 resolutions do establish that certain fields must exist on every object: an assigned identifier (identity resolution), a status field (mutability resolution), and a schema version (forward-readability requirement). Side A reads these as evidence that a common base schema already exists implicitly. But "three fields must exist" and "there is a common base schema" are different claims. The first is a set of constraints. The second is an architectural commitment to a shared data type with a versioned contract, a defined serialization position, and a governance model for evolution. The constraints are real. The architectural commitment is optional, and it carries costs that the constraints alone do not.

The per-structure alternative: each structure defines its own metadata schema. The identity, mutability, and schema-versioning constraints are satisfied by each structure including the required fields in its own schema. The CLI enforces these constraints through validation at the structure level -- when the CLI creates or modifies a journal entry, it ensures the entry has an id, a status, and a schema-version, because the journal schema requires them. When the CLI creates or modifies an investigation, it does the same, because the investigation schema requires them. The constraints are satisfied not by a shared data type but by a shared validation rule: "every structure schema must include id, status, and schema-version fields."

This is a weaker form of coupling than a common base schema. The validation rule is a requirement on structure schemas, not a component of them. Structure schemas are free to name these fields differently (if there is a good domain reason), position them differently, and extend them differently. The system layer asks "does this object have an assigned identifier?" not "does this object's metadata.id field at byte offset 12 contain a UUID." The coupling is to the semantic requirement, not to a specific shape.

Why does this distinction matter? Because schema is a commitment, and premature commitments have compounding costs.

## Tension points

### 1. CLI implementation complexity

The CLI already dispatches operations by structure type. It knows what a journal entry is, how to create one, how to render one, and how to validate one. Adding "extract the id" and "extract the status" to each structure's handler is trivial. The per-structure model does not require the CLI to understand each structure's entire schema for basic operations -- it requires each structure's handler to expose the fields that system-level operations need. This is an interface contract, not a base schema.

The dispatch table objection -- that without a common base, the CLI must know each structure's schema to extract basic fields -- overstates the problem. The CLI does not parse raw bytes. It deserializes structured data (YAML, TOML, JSON, or whatever format the structure uses) and the deserialization layer can expose a standard interface for required fields. This is a programming pattern (interface or trait), not a data model pattern (base schema). The distinction matters because an interface contract constrains behavior while a base schema constrains shape. Shape constraints are harder to evolve.

The mutability enforcement code path is the strongest argument for a common base. The CLI must check status before every write. If the status field is always at the same location in the metadata, the check is trivial. But "always at the same location" is a serialization constraint, not a semantic constraint. The validation rule "every structure must have a status field accessible through the standard interface" achieves the same enforcement simplicity without imposing a serialization shape. The enforcement code calls `object.status()`, not `object.metadata.fields[2]`.

The forward-readability argument -- that the CLI can always extract base fields even from unknown schema versions -- is genuinely compelling. But it requires that the base schema's serialization is stable across all versions, which is itself a hard constraint to maintain. If the base schema ever needs a structural change (changing how status is encoded, for example), forward readability of the base breaks. Per-structure schemas contain this risk: a structural change to the journal's schema breaks forward readability for journals, not for all structures simultaneously.

### 2. Querying across structures

The derived index needs to store certain fields for every object: assigned-id, type, status, structural-path, current-SHA. Side A argues that a common base guarantees these fields exist. This is true, but the guarantee can come from a weaker source: the index builder's validation step.

The index builder processes objects as it encounters them. For each object, it must extract the fields it needs. If a structure's schema does not provide a required field, the index builder reports an error. This is runtime validation rather than schema-time guarantee. The trade-off is familiar from programming: static typing (common base) catches errors at definition time; dynamic validation (per-structure with validation) catches errors at processing time. Both catch the same errors. Static typing catches them earlier. Dynamic validation permits more flexibility.

For the Apparatus, the structures are defined by the system designers, not by end users. A validation error in the index builder means a structure was incorrectly defined -- a development-time bug, caught at the first test run. The risk of a missing field reaching production is low, and the benefit of schema flexibility is concrete.

Cross-structural queries that filter by status or sort by created-at do require these fields to exist on all objects. The per-structure model satisfies this through the validation rule. The common-base model satisfies it through the schema definition. Both work. The difference is where the guarantee lives -- in the schema (common base) or in the validation (per-structure). Per-structure puts it closer to each structure's definition, where it is reviewed alongside the structure's domain semantics.

### 3. Schema evolution

This is per-structure schemas' strongest ground.

A common base schema creates a coupling surface: every structure depends on the base, and the base depends on every structure being compatible. Adding a field to the base is a change that touches everything. Removing a field from the base is nearly impossible (forward readability of old objects requires the field's absence to be handled). Changing a field's semantics is dangerous (all structures must agree on the new semantics). The base becomes the least evolvable part of the system.

Per-structure schemas evolve independently. The journal can change its metadata format without coordinating with the investigation or the design. If the journal needs a richer status model (sub-states within "open," for example), it modifies its own schema. The system-layer validation rule still holds -- the journal still has a status field, and the CLI still checks it -- but the journal's internal representation of status is its own concern.

The schema-version field enables forward readability at the structure level. CLI version N+1 reads a journal entry written at schema version 3 by consulting the journal's schema-version field and applying the appropriate deserialization logic. This works identically whether the schema-version field is part of a common base or part of the journal's own schema. The forward-readability mechanism does not depend on a common base; it depends on the schema-version field existing, which the validation rule guarantees.

The two-tier evolution model that Side A proposes -- base evolves independently from extensions -- sounds clean but introduces coordination overhead. When the base adds a field, every structure must incorporate it. When the base changes a field's format, every structure must update. This coordination cost is low if the base is truly stable. But the base's stability is itself an assumption, and if the assumption fails (a sixth field is needed, a field's encoding must change), the cost is paid across all structures simultaneously.

Per-structure schemas' evolution cost is proportional to the change's scope. A change to one structure costs one structure. A change that genuinely affects all structures (say, a new system-level requirement emerges) costs all structures -- but this cost is the same under both models. The difference is that per-structure schemas do not pay coordination costs for changes that affect only the base.

### 4. Metadata on citations

Citations need specific metadata: source-id, source-sha, citing-structure-id, and created-at. These fields are citation-domain-specific. The fact that citations also carry an assigned-id and a schema-version is a consequence of the system-level constraints (identity and versioning), not evidence that citations share a meaningful schema with journal entries.

Under per-structure schemas, the citation schema is defined by the citation domain: here are the fields a citation carries, here is what each means, and here are the constraints (every citation has an id, a schema-version, and a type). The system-level constraints are satisfied because the citation schema includes them. The citation does not carry a status field unless citations have a meaningful lifecycle -- and whether they do is a citation-domain question, not a base-schema question.

This is a concrete example of where the common base imposes unnecessary structure. Side A proposes that citations carry a status field, enabling lifecycle transitions like "stale" or "acknowledged." But staleness is a derived property (the cited SHA differs from the current SHA for that assigned-id), not a stored status. Making staleness a status field means the system must maintain it -- updating the citation's status whenever the cited object changes. This is a synchronization obligation that the common base created by requiring a status field on an object that may not need one.

Per-structure schemas let the citation define exactly the fields it needs. If citations later need a status field (because a genuine lifecycle emerges), the citation schema adds one. No base schema change, no coordination, no fields-that-exist-because-the-base-requires-them.

### 5. Instantiation metadata

Instantiation records are metadata about the system's operational history. They describe when environments were created, from what source, and for what purpose. Whether they are "objects in the same sense as journal entries" is a modeling question that the common base schema answers prematurely.

Under per-structure schemas, instantiation records define their own schema: source-instantiation-id, purpose, creator, created-at, status (active, frozen, archived). They satisfy the system-level constraints (id, schema-version) because the validation rule requires it. They do not carry fields that are meaningful only for knowledge artifacts (like a type discriminator that places them in the same taxonomy as journal entries and investigation findings) unless doing so is genuinely useful.

The composability argument -- that instantiations should appear in the index alongside knowledge artifacts -- is not self-evidently correct. An instantiation is an operational record. A journal entry is a knowledge artifact. Putting them in the same index with the same base schema implies they are the same kind of thing, queryable in the same ways. Whether this is desirable depends on the use cases. Per-structure schemas let this decision be made based on actual need rather than schema-level fiat.

## Evaluation

**Minimal coupling.** Per-structure schemas minimize the coupling between structures and the system layer. Each structure depends on a set of semantic constraints (must have an id, must have a status, must have a schema-version), not on a shared data type. Semantic constraints are cheaper to satisfy and more robust to evolution than structural conformance.

**Evolutionary resilience.** Each structure evolves independently. Changes are local. The system-level constraints evolve separately from any structure's schema. There is no shared artifact whose evolution requires cross-structure coordination.

**Domain fidelity.** Each structure's metadata reflects its domain. The journal's metadata is about chronological reasoning records. The investigation's metadata is about bounded inquiry. The design's metadata is about tracked decisions. These are different domains with different metadata needs. Per-structure schemas express this difference directly rather than layering domain-specific fields on top of a system-level base that may not align with any of them.

**Honest about the constraints.** The Wave 1 resolutions create real constraints. Per-structure schemas do not deny them. They satisfy them through validation rather than through schema inheritance. The difference is in mechanism, not in outcome.

## Consequences

### What becomes easier

Structure-specific evolution. A structure can change its metadata format, add fields, restructure its representation, or adopt a different serialization -- all without coordinating with other structures or modifying a shared base.

Domain-appropriate modeling. Each structure's metadata matches its domain. No fields exist because the base requires them; every field exists because the structure needs it (subject to system-level constraints satisfied through validation).

Experimentation. A new structure type can be prototyped with whatever metadata shape makes sense for exploration. The system-level constraints are enforced by validation, but the shape is free. The structure can be formalized later without migrating a base-schema dependency.

### What becomes harder

System-layer code that operates across structures must handle heterogeneous schemas. The enumeration code, the index builder, and the display code must use an interface contract (extraction functions per structure type) rather than a common data shape. This is more code, though not necessarily more complex code -- interface dispatch is well-understood.

Forward readability of unknown structure types. If the CLI encounters a structure type it does not recognize, it has no guaranteed foothold for extracting basic fields. Under a common base, it can always extract the base fields. Under per-structure schemas, it can extract nothing without the structure's handler. This is a real limitation, mitigated by the fact that structure types are defined by the system designers, not by end users -- encountering a genuinely unknown structure type means the CLI is outdated, and the correct response is to update it.

Consistency across structures. Without a common base, structures may diverge in how they name, encode, or position the required fields. The validation rule ensures the fields exist but not that they are consistent in representation. Mitigation: documentation conventions and code-review discipline, which are softer guarantees than a schema contract.

### What risks emerge

**Drift.** Structures may drift in their interpretation of the required fields. What counts as a "terminal status" may be encoded differently across structures, leading to subtle bugs in the mutability enforcement code. The common base prevents this by defining the encoding once. Per-structure schemas must rely on convention and validation to prevent it.

**Duplication.** Each structure independently defines fields that are semantically identical (id, status, schema-version). The definitions may diverge in representation even when they agree in semantics. This is duplication that a common base eliminates.

**Validation gaps.** Runtime validation catches errors later than schema-time guarantees. If a structure's tests do not exercise the validation path (missing the case where a field is absent), the error reaches the index builder rather than the test suite. This is a test-coverage problem, not an architectural problem, but it is a real risk.

The core bet of per-structure schemas is that the Apparatus's structures have genuinely different metadata domains, that the system-level constraints are better satisfied through validated interfaces than through shared data types, and that the evolutionary flexibility of per-structure schemas will prove more valuable than the integration simplicity of a common base -- especially as the system grows and the structures' metadata needs diverge further from whatever common shape was defined at the beginning.
