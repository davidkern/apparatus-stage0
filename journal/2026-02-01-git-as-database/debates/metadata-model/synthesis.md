# Metadata model debate: synthesis

## Key findings -- consensus points

Both sides agree on more than they disagree about. These points are settled:

1. **Certain fields must exist on every object.** The Wave 1 resolutions mandate an assigned identifier (identity), a status field (mutability), and a schema-version (forward readability). Both sides accept these as system-level requirements. Side A names them as a base schema. Side B satisfies them through validation rules. The semantic requirements are identical; only the enforcement mechanism differs.

2. **Structure-specific metadata is unconstrained.** Neither side proposes that the system layer dictate domain-specific fields. The journal's tags, the investigation's evaluation criteria, and the design's assumption chains are structure-level concerns. The debate is entirely about the system-level fields, not about whether structures can define their own metadata.

3. **The derived index needs predictable fields.** Both sides accept that the index builder must be able to extract assigned-id, type, status, and structural-path from any object. Side A provides this through schema shape. Side B provides this through interface contracts. Both acknowledge the index requires reliable access to these fields.

4. **Schema evolution is a real cost.** Both sides agree that shared artifacts (whether a base schema or a validation-rule set) create coordination costs when they change. Both argue their model minimizes this cost. The disagreement is about where the coordination cost is lower, not about whether it exists.

5. **Forward readability is a first-class requirement.** Both sides agree the CLI must be able to read data written under older schema versions. They disagree on whether a common base schema aids this (Side A: yes, the base is a stable foothold) or hinders it (Side B: base changes break all structures simultaneously).

## The resolution

**Side A (common base schema) is correct, but Side B identifies the right implementation mechanism. The answer is a required interface contract -- a small, explicit set of fields that every object must carry -- enforced through validation, not through schema inheritance.**

Here is why.

### Where Side A wins

Side A's central argument is unanswerable: the Wave 1 resolutions already mandate that every object carry specific fields. Declining to name this as a shared contract does not eliminate the contract; it makes the contract implicit. Implicit contracts are harder to communicate, harder to test, and harder to evolve deliberately. Side A is right that naming the common fields is a design hygiene decision, not an architectural expansion.

Side A is also correct about the system layer. The mutability enforcement code, the index builder, the enumeration code, and the forward-readability fallback all operate across structure types. These are the system's most correctness-critical paths. They need a guaranteed set of fields. Whether that guarantee comes from schema shape or from validation, the guarantee must exist and must be explicit. Side A's argument that an explicit base schema concentrates correctness obligations in one place -- reviewable, testable, and stable -- is architecturally sound.

The forward-readability argument is Side A's strongest specific point. When the CLI encounters an object whose schema-version is higher than what it fully understands, a guaranteed set of base fields provides a degraded-but-functional view: the CLI can display the id, type, status, and creation time even if it cannot interpret the structure-specific fields. Under pure per-structure schemas, the CLI has no foothold for unknown versions of unknown types. Side B dismisses this by arguing that unknown types imply an outdated CLI, but this ignores the cross-instantiation observation case: a researcher reading another project's apparatus data may encounter structure types or versions that their CLI does not fully support. The base fields provide a minimum viable view.

### Where Side B wins

Side B is correct that "common base schema" and "required fields on every object" are different claims. A schema is a data-type commitment: a specific shape, a specific serialization, a specific position in the byte stream. A set of required fields is a semantic commitment: these fields must exist and must be accessible. The second is weaker coupling, and weaker coupling is generally preferable.

Side B's schema-evolution argument is the strongest objection to Side A's purest form. If the base schema is a concrete data type with a versioned serialization, then changing the base is a cross-cutting migration. If the base is an interface contract (required fields with specified semantics, accessed through a standard extraction function), then changing the contract is still cross-cutting at the semantic level but does not require serialization-level migration. Each structure can satisfy the contract in its own serialization.

Side B's citation example is a sharp concrete illustration. Side A proposes that citations carry a status field, which invites using status for staleness tracking. But staleness is a derived property (cited-SHA differs from current-SHA), not an intrinsic state. Storing staleness as a status field creates a synchronization obligation: the system must update citation statuses whenever cited objects change. This is a maintenance burden caused by the base schema requiring a field that the domain does not need in that form. Side B is right that the base should not impose fields that structures must carry but cannot use meaningfully.

### Where Side B overreaches

Side B's argument that per-structure schemas are "more resilient to evolution" is partially correct but overstated. Per-structure schemas avoid base-level migration costs, but they introduce drift risk. If each structure independently defines how it represents status, the mutability enforcement code must handle the variation. Side B acknowledges this ("convention and code-review discipline") but these are softer guarantees than a contract. In a system where "terminal status means immutable" is the single most important invariant, the status field's representation should not be left to convention.

Side B's claim that runtime validation catches the same errors as schema-time guarantees is technically true but pragmatically weaker. Validation catches errors at processing time. A schema contract catches errors at definition time. For a system with a small number of structures defined by system designers, the gap is small. But the gap exists, and it favors the common contract.

## Unresolved tensions

1. **Serialization commitment.** The resolution says "required interface contract" rather than "base data type." But the interface must be concrete enough for the CLI to implement. The exact mechanism -- a required YAML/TOML section, a required set of keys at the top level, or a structure-specific accessor that conforms to a type signature -- is unresolved. This is an implementation decision, not an architecture decision, but it must be made before the CLI is built.

2. **Status field universality.** The mutability resolution requires a status field on every object. Side B raises a legitimate question: do all object types have a meaningful status? Annotations, citations, and instantiation records may not have natural lifecycles. The resolution says they must carry a status field anyway (because the enforcement code checks it), which means some objects will carry a status that is semantically thin -- "active" always, or "active" then "closed" with no interesting transitions. This is a small tax, but it should be acknowledged.

3. **Type discriminator source.** The base contract includes a type field. But the object's type can also be inferred from its structural position (ref namespace). Having both raises the question of which is authoritative. If they disagree, which one wins? This needs a rule: the type field in the content is authoritative; the structural position is a performance optimization for the index.

## Recommended design decisions

1. **Define a required metadata contract.** Every object in the system must carry five fields: `id` (assigned identifier), `type` (structure type discriminator), `status` (lifecycle state), `schema-version` (integer), and `created-at` (timestamp). These fields are mandated by resolved Wave 1 decisions. This is the system-layer contract for the structure-to-system boundary.

2. **The contract is semantic, not serialization-specific.** The contract specifies the fields, their types, and their semantics. It does not specify their serialization position or encoding. Each structure may serialize its metadata in whatever format and layout suits its domain, provided the required fields are present and accessible through the standard extraction interface. This is Side B's interface-contract mechanism applied to Side A's field set.

3. **Each structure defines its own complete schema.** There is no schema inheritance. The journal schema includes the five required fields plus its domain-specific fields (entry-date, tags, artifact-refs). The investigation schema includes the five required fields plus its domain-specific fields (question, evaluation-criteria, recommendation). Each schema is self-contained. The required fields are present because the structure's schema includes them, not because the structure inherits from a base type.

4. **The CLI validates the required contract at creation and modification time.** When the CLI creates or modifies any object, it validates that the five required fields are present, correctly typed, and semantically consistent (e.g., status is a valid state for that structure's lifecycle). Validation failures are hard errors. This is the enforcement mechanism for the contract.

5. **The derived index extracts the required fields generically.** The index builder reads the five required fields from every object using the standard extraction interface. Structure-specific fields are extracted by structure-specific index extensions. The base index (id, type, status, schema-version, created-at, structural-path, current-SHA) is structure-agnostic.

6. **The required contract is versioned independently.** The contract has its own version number, distinct from any structure's schema-version. If the contract adds a sixth field in the future, the contract version increments, and each structure's schema must incorporate the new field at its next schema-version bump. This separates system-level evolution from structure-level evolution while making the coordination cost explicit.

7. **Status is required even on objects with thin lifecycles.** Citations, annotations, and instantiation records carry a status field. For objects without complex lifecycles, the lifecycle is minimal: `active` (mutable) and `closed` (immutable). This satisfies the mutability enforcement invariant uniformly. The cost is a field that carries little domain meaning for these objects. The benefit is that the enforcement code path has no exceptions.

8. **Type field in content is authoritative.** When the type field in the object's content disagrees with the object's structural position, the content field is authoritative. The structural position is a derived organizational fact. The type field is part of the object's identity. The CLI should warn on disagreement but trust the content.
