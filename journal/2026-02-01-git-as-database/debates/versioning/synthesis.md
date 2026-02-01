# Versioning debate: synthesis

## Key findings -- consensus points

Both sides agree on more than the framing suggests:

1. **Per-object `schema-version` is correct and sufficient for content evolution.** Neither side disputes that per-type schema versioning handles field additions, field deprecations, and structural changes within a single object type. The metadata synthesis resolved this correctly. The debate is entirely about what happens outside the individual object.

2. **The metadata contract version is a separate, necessary concern.** Both sides accept that the five-field contract has its own version, tracked independently from per-type schemas. When the contract adds a sixth field, the contract version bumps. This is resolved and not in dispute.

3. **Storage layout changes are rare but real.** Side A characterizes them as "once every several years" and Side B as "perhaps during a major version transition." Both agree these are infrequent. The disagreement is whether infrequent changes need explicit tracking or can be handled by inspection.

4. **The CLI must be able to handle unknown or older layouts.** Both sides accept that pattern-based ref inspection is necessary in some circumstances. Side A proposes it as the primary strategy; Side B proposes it as the fallback. Neither side believes the CLI can avoid understanding historical layouts entirely.

5. **The boot sequence is the critical path.** Both sides agree that the CLI's first operations when opening `.apparatus/` determine whether versioning works. The debate centers on whether the boot sequence should begin with an explicit version read or with structural inspection.

## The resolution

**Side B's bootstrap-handshake argument is correct in principle, but the mechanism should be lighter than proposed. The system should maintain a meta ref with format metadata, but the CLI should also be capable of operating without it. The format version is a fast-path optimization and a forward-compatibility signal, not a hard gate.**

### Where Side B wins

**The boot-sequence ambiguity argument is decisive.** Side A's claim that ref-namespace inspection is equivalent to an explicit version declaration does not survive contact with the concrete failure modes. Consider three states the CLI might encounter:

- An apparatus initialized by a newer CLI with a different ref layout.
- An apparatus mid-migration (some refs moved, others not).
- An empty apparatus with no data yet.

Under Side A's approach, these three states can be indistinguishable. An apparatus with only new-layout refs looks like an unknown format. A partially migrated apparatus looks like a corrupted one. An empty apparatus with no refs looks like either of the above. The CLI must use heuristics to disambiguate, and heuristics fail at the boundaries.

A meta ref resolves all three cases deterministically. A newer-format apparatus has a meta ref with a version the old CLI does not recognize -- clean error message. A partially migrated apparatus has a meta ref whose version does not match the ref layout -- detectable inconsistency. An empty apparatus has a meta ref (written during initialization) but no data refs -- unambiguously empty.

**The migration-transaction argument is strong.** A format version serves as a transaction marker during layout migrations. Without it, a partial migration (interrupted at the `prepare` step of `update-ref --stdin`) leaves the apparatus in a state indistinguishable from corruption. With a format version, the CLI can detect the inconsistency and offer recovery.

**The forward-compatibility error message argument matters.** The difference between "no journal entries found" (silently wrong) and "this apparatus uses format 2; your CLI supports format 1; please upgrade" (actionable) is significant. In a system designed for long-lived data, silently wrong is unacceptable.

### Where Side A wins

**The complexity of dual versioning is real.** A format version is a new invariant: written during initialization, updated during migration, consistent with the actual ref layout at all times. If it gets out of sync, the CLI has a lying version marker -- a harder problem than no marker at all.

**Ref-namespace inspection is necessary regardless.** Side B concedes that pattern-based detection is the correct fallback for legacy or corrupted data. The format version does not eliminate inspection code; it provides a fast path that skips it in the common case. The system's correctness depends on the fallback, not the fast path.

**The mechanism should be proportional to the frequency of change.** Side A is wrong that rarity eliminates the need for tracking, but right that a full version registry with migration framework is over-engineering. The mechanism should be minimal.

### Where Side B overreaches

**The proposed meta ref content is too heavy.** Including the contract version in the meta ref is redundant (it already exists in every object) and creates a synchronization obligation. The `created-by` field is debugging information, not boot-critical. The meta ref should contain only what the boot sequence absolutely requires.

**The commit chain for format history is over-engineered.** Format changes are so rare that the audit trail would contain one to three entries. A single blob is sufficient. The old blob persists in the object database even after the ref is updated, providing implicit history.

## The resolution in detail

The system should maintain a meta ref at a fixed location with minimal format metadata. The CLI's boot sequence should read this ref first and use it as a fast path for structural orientation, falling back to ref-namespace inspection when the meta ref is absent.

### The meta ref specification

**Location**: `refs/apparatus/meta` -- a direct ref pointing to a blob (not a commit). This is the simplest possible structure: one ref, one object.

**Content**: A small document containing exactly one field:

```
format: 1
```

This is the storage format version. It is an integer that increments when the storage layout conventions change. It does not include the contract version (that is per-object), the creating CLI version (that is debugging information, not boot-critical), or any other metadata. The meta ref answers one question: "what structural conventions does this apparatus use?" It answers that question with one number.

**Encoding**: Plain text, single line. Not YAML, not JSON. The simplest possible format, parseable with a single line read. The meta ref is the one thing in the system that cannot depend on a schema or serialization framework, because it is the thing the CLI reads before it knows what schemas or serialization to expect.

### The CLI boot sequence

1. Set `GIT_DIR=.apparatus`.
2. `git rev-parse refs/apparatus/meta` -- does the meta ref exist?
3. **If yes**: `git cat-file blob <sha>` -- read the format version.
   - If the format version is recognized: use the corresponding layout module.
   - If the format version is higher than recognized: error with actionable message ("apparatus uses format N, CLI supports up to format M, upgrade required").
   - If the format version is lower than the CLI's current format: offer migration.
4. **If no**: fall back to ref-namespace inspection.
   - `git for-each-ref refs/apparatus/` -- enumerate all apparatus refs.
   - If no refs exist: apparatus is empty. Offer to initialize (which creates the meta ref).
   - If refs exist but no meta ref: this is a pre-meta-ref apparatus (format 0). The CLI can read it using legacy layout logic, and should offer to add the meta ref.

Step 4 is the backwards-compatibility path for pre-meta-ref apparatuses. Over time it becomes rare, but the code remains for resilience.

### What the format version tracks

The format version increments when structural conventions change: ref namespace patterns, tree layouts within commits, commit chain semantics, or index organization. It does not increment for per-type schema changes (tracked by `schema-version`) or metadata contract changes (tracked by contract version in objects). This maps cleanly to the operational asymmetry both sides acknowledged: structural changes are global and potentially breaking; content changes are local and non-breaking.

### Initialization and migration

During initialization, the CLI runs `git init --bare .apparatus`, writes a blob containing `format: 1`, and points `refs/apparatus/meta` at it. Direct blob refs are unusual but valid and well-supported by plumbing.

During migration, the CLI reads the current format version, runs migration logic (potentially chaining N to N+1 steps), creates a new format blob, and wraps all ref changes plus the meta ref update in a single `update-ref --stdin` atomic transaction. If the transaction fails, nothing changes.

## Unresolved tensions

1. **Meta ref as blob vs. commit.** Start with a blob; upgrade to a tree-based structure if additional fields become necessary. That upgrade is itself a format version bump.

2. **Format version 0.** Pre-meta-ref apparatuses have no explicit format marker. The CLI distinguishes "format 0" (refs exist under `refs/apparatus/` but no meta ref) from "empty" (no refs at all) from "corrupt" (only meta ref, no data). This heuristic is reliable but should be documented.

3. **Contract version location.** The CLI's compiled-in format version implies a minimum contract version (format 1 implies contract version 1). This coupling is implicit. A future debate may revisit whether the meta ref should carry the contract version explicitly.

4. **Instantiation and format versions.** Bundles must include `refs/apparatus/meta` alongside data refs. The instantiation experiment demonstrated selective ref bundling works; this is a mechanical addition.

5. **Multi-format coexistence.** The format version describes the entire apparatus; migration is all-or-nothing. Partial migration is deferred as unlikely.

## Experiment needs

1. **Meta ref boot-sequence benchmark.** Implement the two-step boot (`git rev-parse` + `git cat-file blob`). Measure latency on a typical apparatus. Compare against the `git for-each-ref` fallback to quantify the fast-path benefit.

2. **Atomic migration transaction.** Mock a format migration (move 10-20 refs, update meta ref) in a single `update-ref --stdin` transaction. Kill the process at various points and verify the apparatus remains consistent.

3. **Bundle round-trip with meta ref.** Create a bundle including `refs/apparatus/meta` plus data refs. Unbundle into a new bare repo. Verify the boot sequence works identically.

## Recommended design decisions

1. **Maintain a per-apparatus storage format version.** Store it as a blob at `refs/apparatus/meta`. Content is plain text: `format: <integer>`. This is read once during the CLI boot sequence to determine storage layout conventions.

2. **The meta ref is created during apparatus initialization.** `git init --bare .apparatus` followed by writing the meta ref blob is the canonical initialization sequence. An apparatus without a meta ref is treated as format 0 (legacy) if other apparatus refs exist, or as empty if no apparatus refs exist.

3. **The format version tracks structural conventions only.** It increments when ref namespace patterns, tree layouts, commit chain semantics, or index organization change. It does not increment for per-type schema changes or metadata contract changes.

4. **The CLI boot sequence reads the meta ref first.** If present and recognized, it determines the layout module. If present and unrecognized (higher version), it produces an actionable error. If absent, it falls back to ref-namespace inspection. The fallback path handles format 0 and corrupted states.

5. **Format migrations are atomic.** All ref changes (layout restructuring and meta ref update) are wrapped in a single `update-ref --stdin` transaction. Interrupted migrations leave the apparatus at the old format version.

6. **The meta ref points to a blob, not a commit.** This is the simplest possible structure. If additional metadata is needed in the future, upgrading to a tree-based structure is itself a format version bump.

7. **The per-object `schema-version` remains the primary versioning mechanism for content evolution.** The format version does not replace or supersede it. Objects carry their own schema version. The format version is orthogonal: it describes where objects are stored, not what they contain.

8. **Instantiation bundles include the meta ref.** When `git bundle` creates a hermetic copy, `refs/apparatus/meta` is included alongside all data refs. The instantiated apparatus is fully self-describing.
