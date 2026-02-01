# Metadata model debate: synthesis

## Key findings -- consensus points

1. **Certain fields must exist on every object.** The Wave 1 resolutions mandate an assigned identifier (identity), a status field (mutability), and a schema-version (forward readability). Both sides accept these as system-level requirements. The disagreement is enforcement mechanism, not field existence.

2. **Structure-specific metadata is unconstrained.** Neither side proposes the system dictate domain-specific fields. The debate is entirely about system-level fields.

3. **The derived index needs predictable fields.** Both sides accept that the index must reliably extract assigned-id, type, status, and structural-path from any object. Side A provides this through schema shape; Side B through interface contracts.

4. **Schema evolution is a real cost.** Both sides agree shared artifacts create coordination costs. They disagree on where that cost is lower.

5. **Forward readability is first-class.** Both agree the CLI must read data written under older schema versions.

## The resolution

**Side A (common base schema) is correct about the fields. Side B is correct about the mechanism. The answer is a required metadata contract -- a small, explicit set of fields every object must carry -- enforced through validation, not schema inheritance.**

### Where Side A wins

Side A's central argument is unanswerable: the Wave 1 resolutions already mandate that every object carry specific fields. Declining to name this as a shared contract makes the contract implicit. Implicit contracts are harder to communicate, test, and evolve deliberately. Naming the common fields is design hygiene.

Side A is correct about the system layer. Mutability enforcement, the index builder, enumeration, and the forward-readability fallback all operate across structure types. These are the most correctness-critical paths. They need a guaranteed set of fields, and that guarantee must be explicit.

The forward-readability argument is Side A's strongest specific point. When the CLI encounters an object whose schema-version is higher than what it understands, guaranteed base fields provide a minimum viable view. This matters for cross-instantiation observation: a researcher reading another project's apparatus data may encounter types or versions their CLI does not fully support.

### Where Side B wins

Side B correctly distinguishes "common base schema" from "required fields." A schema is a data-type commitment (specific shape, serialization, byte-level position). Required fields are a semantic commitment (these fields must exist and be accessible). The second is weaker coupling, and weaker coupling is preferable.

Side B's evolution argument is strong. If the base is a concrete data type, changing it is a cross-cutting migration. If the base is an interface contract, changing it is cross-cutting semantically but does not require serialization-level migration. Each structure satisfies the contract in its own serialization.

Side B's citation example is sharp. Side A proposes citations carry a status field, inviting staleness-as-status. But staleness is derived (cited-SHA differs from current-SHA), not intrinsic state. Storing it as status creates a synchronization obligation the domain does not warrant. The base should not impose fields that structures must carry but cannot use meaningfully.

### Where Side B overreaches

Side B's argument that per-structure schemas are "more resilient to evolution" is partially correct but understates drift risk. If each structure independently defines how it represents status, the enforcement code must handle variation. In a system where "terminal status means immutable" is the most important invariant, the status field's representation should not be left to convention.

## Unresolved tensions

1. **Serialization commitment.** The resolution says "required interface contract" rather than "base data type." The exact mechanism (required YAML keys, required section, typed accessor) is an implementation decision needed before the CLI is built.

2. **Status universality.** Some object types (annotations, citations) may not have meaningful lifecycles. They still carry a status field. This is a small tax acknowledged as the cost of uniform enforcement.

3. **Type discriminator authority.** The type field in content and the object's structural position can both indicate type. Rule needed: content field is authoritative; structural position is an optimization.

## Recommended design decisions

1. **Define a required metadata contract.** Every object carries five fields: `id` (assigned identifier), `type` (structure type discriminator), `status` (lifecycle state), `schema-version` (integer), and `created-at` (timestamp). These are mandated by resolved Wave 1 decisions.

2. **The contract is semantic, not serialization-specific.** It specifies fields, types, and semantics. It does not specify serialization position or encoding. Each structure may serialize metadata in whatever format suits its domain, provided required fields are present and accessible through a standard extraction interface.

3. **Each structure defines its own complete schema.** No schema inheritance. The journal schema includes the five required fields plus domain-specific fields. Each schema is self-contained. Required fields are present because the structure's schema includes them, not because it inherits from a base type.

4. **The CLI validates the contract at creation and modification time.** Validation confirms all five required fields are present, correctly typed, and semantically consistent (status is valid for that structure's lifecycle). Failures are hard errors.

5. **The derived index extracts required fields generically.** The base index (id, type, status, schema-version, created-at, structural-path, current-SHA) is structure-agnostic. Structure-specific fields are extracted by structure-specific extensions.

6. **The contract is versioned independently.** The contract has its own version number. If a sixth field is needed, the contract version increments, and each structure incorporates the new field at its next schema-version bump. This separates system-level evolution from structure-level evolution.

7. **Status is required even on thin-lifecycle objects.** Citations, annotations, and instantiation records carry a status field. Minimal lifecycle: `active` then `closed`. The enforcement code has no exceptions.

8. **Type field in content is authoritative.** When type in content disagrees with structural position, content wins. The CLI warns on disagreement but trusts content.
