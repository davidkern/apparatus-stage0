# Position: Per-structure schemas

## Core argument

A common base schema is an abstraction. The question is whether it is useful or premature. I argue premature: the cost it imposes -- a system-level contract every structure must satisfy and every future structure must conform to -- is not justified by benefits achievable through lighter mechanisms.

The Wave 1 resolutions establish that certain fields must exist on every object: assigned identifier, status, schema-version. Side A reads these as evidence for a common base schema. But "three fields must exist" and "there is a common base schema" are different claims. The first is a set of constraints. The second is an architectural commitment to a shared data type with a versioned contract and a governance model. The constraints are real. The architectural commitment is optional, and it carries costs.

The per-structure alternative: each structure defines its own metadata schema. The identity, mutability, and schema-versioning constraints are satisfied because each structure's schema includes the required fields. The CLI enforces constraints through validation: when it creates a journal entry, it ensures the entry has id, status, and schema-version because the journal schema requires them. The constraints are satisfied not by a shared data type but by a shared validation rule: "every structure schema must include these fields."

This is weaker coupling. The validation rule is a requirement on structure schemas, not a component of them. Structures can name these fields differently if the domain warrants it, position them differently, and extend them differently. The coupling is to the semantic requirement, not to a specific shape. And schema is a commitment -- premature commitments have compounding costs.

## Tension points

### 1. CLI implementation complexity

The CLI already dispatches by structure type. Adding "extract the id" and "extract the status" to each structure's handler is trivial. The per-structure model requires each handler to expose the fields that system-level operations need -- an interface contract, not a base schema.

The bootstrap problem (needing the type to parse, needing to parse to get the type) is real but overstated. The CLI does not parse raw bytes; it deserializes structured data, and the deserialization layer can expose a standard accessor for required fields. This is a programming pattern (interface), not a data model pattern (base schema). The distinction matters because an interface constrains behavior while a base schema constrains shape. Shape constraints are harder to evolve.

The forward-readability argument is genuinely compelling. But it requires the base schema's serialization to be stable across all versions. If the base ever needs a structural change, forward readability of the base breaks -- for all structures simultaneously. Per-structure schemas contain this risk: a breaking change to the journal's schema breaks journal readability, not everything.

### 2. Querying across structures

The index needs certain fields per object: assigned-id, type, status, structural-path, current-SHA. The guarantee can come from a weaker source than a base schema: the index builder's validation step. If a structure's schema does not provide a required field, the builder reports an error. This is runtime validation rather than schema-time guarantee -- a familiar trade-off. For the Apparatus, where structures are defined by system designers (not end users), a validation error is a development-time bug caught at first test run.

Cross-structural queries filtering by status or sorting by created-at require these fields on all objects. Per-structure satisfies this through validation. Common-base satisfies it through schema. Both work. The difference is where the guarantee lives.

### 3. Schema evolution

This is per-structure schemas' strongest ground.

A common base creates a coupling surface: every structure depends on the base. Adding a field to the base touches everything. Removing one is nearly impossible (forward readability). Changing semantics is dangerous (all structures must agree). The base becomes the least evolvable part of the system.

Per-structure schemas evolve independently. The journal can change its metadata format without coordinating with investigations or designs. If the journal needs richer status sub-states, it modifies its own schema. The validation rule still holds (status field exists), but the journal's internal representation is its own concern.

Side A's two-tier evolution model sounds clean but introduces coordination overhead. When the base adds a field, every structure must incorporate it. Per-structure schemas' evolution cost is proportional to the change's scope: a change to one structure costs one structure. Changes that genuinely affect all structures cost the same under both models. The difference is that per-structure schemas do not pay coordination costs for base-only changes.

### 4. Metadata on citations

Citations need specific fields: source-id, source-sha, citing-structure-id, created-at. These are citation-domain-specific. Under per-structure schemas, the citation schema includes system-mandated fields (id, schema-version) plus its domain fields -- nothing more.

Here a concrete problem with the common base surfaces. Side A proposes citations carry a status field, enabling lifecycle transitions like "stale." But staleness is a derived property (cited-SHA differs from current-SHA), not a stored state. Making it a status creates a synchronization obligation: update citation statuses whenever cited objects change. This is maintenance burden caused by the base requiring a field the domain does not need. Per-structure schemas let citations define exactly the fields they need. If a lifecycle later emerges, the citation schema adds a status field then.

### 5. Instantiation metadata

Instantiation records describe operational history -- when environments were created, from what source, for what purpose. Whether they are "objects in the same sense as journal entries" is a modeling question the common base answers prematurely.

Putting instantiations and journal entries in the same index with the same base implies they are the same kind of thing. Whether this is desirable depends on use cases. Per-structure schemas let this decision be made based on actual need rather than schema-level fiat.

## Evaluation

**Minimal coupling.** Each structure depends on semantic constraints (must have id, status, schema-version), not on a shared data type. Semantic constraints are cheaper to satisfy and more robust to evolution.

**Evolutionary resilience.** Each structure evolves independently. No shared artifact requires cross-structure coordination.

**Domain fidelity.** Each structure's metadata reflects its domain. No fields exist because the base requires them.

## Consequences

**Easier:** structure-specific evolution without coordination; domain-appropriate modeling; experimentation with new structure types without base-schema conformance.

**Harder:** system-layer code must handle heterogeneous schemas through interface dispatch; forward readability of unknown types has no guaranteed foothold; consistency across structures relies on convention.

**Risks:** drift in field representation across structures; duplication of semantically identical field definitions; validation gaps if test coverage is incomplete.

The core bet: the system-level constraints are better satisfied through validated interfaces than shared data types, and evolutionary flexibility will prove more valuable than integration simplicity.
