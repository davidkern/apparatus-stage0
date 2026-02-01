# Side B: Dual versioning

## Core argument

The Apparatus needs two separate version axes: a per-object `schema-version` (already resolved, tracks content shape per type) and a per-apparatus `storage-format-version` (tracks the structural conventions the CLI uses to organize and locate objects in the git repo). The storage-format-version should live at a fixed, well-known location -- a blob on `refs/apparatus/meta` -- readable before the CLI attempts to interpret anything else.

The reason is operational: the CLI's boot sequence has two distinct phases, and they need different version information. Phase one is structural orientation -- the CLI must understand how the apparatus is organized before it can find any objects. Phase two is object interpretation -- the CLI reads individual objects and must understand their content shape. The per-object `schema-version` serves phase two. Nothing currently serves phase one. That gap is the problem.

## Position on each tension point

### 1. The CLI boot sequence: the bootstrap handshake

When the CLI opens `.apparatus/`, it must interpret ref names. Are journal entries under `refs/apparatus/journal/main`? Or `refs/apparatus/structures/journal/main`? The CLI has compiled-in expectations. If those expectations do not match the actual refs, the CLI is lost.

Side A proposes pattern matching against known layouts. This approach has a fundamental flaw: it cannot distinguish "unknown layout" from "empty apparatus" from "corrupted apparatus." If the CLI finds refs matching no known pattern, is the apparatus broken, or from a newer version?

A storage-format-version at a fixed ref eliminates this ambiguity:

1. `git rev-parse refs/apparatus/meta` -- does the meta ref exist?
2. If yes: read the format version. Recognized? Proceed. Higher than recognized? Report "newer format, please upgrade."
3. If no meta ref: fall back to pattern detection or treat as empty.

This is a deterministic decision tree. The cost is one sub-millisecond `git rev-parse` per invocation. The benefit is that every subsequent operation assumes a known layout without further detection.

### 2. Forward and backward readability: the two-layer problem

The metadata contract says "if you can find the object, you can read its basic metadata." It says nothing about how to find the object. If the storage layout has changed, the contract is unreachable.

Concretely: journal entries live on `refs/apparatus/journal/main`. A future version reorganizes to `refs/apparatus/objects/journal/<year>/<month>`. An older CLI looking for the original ref finds nothing. It cannot reach the objects, so the contract's guarantee is vacuous.

With a format version, the older CLI reads `refs/apparatus/meta`, sees format 2, and reports: "This apparatus uses format 2. Your CLI supports format 1. Please upgrade." Without it, the older CLI reports "no journal entries found" -- silently wrong.

### 3. Cold-start bootstrapping: the initialization contract

When `git init --bare .apparatus` is run, the CLI writes a format version blob to `refs/apparatus/meta` as its first operation. This is the apparatus's birth certificate: it declares the structural conventions the initializing CLI used. Future CLIs read this before interpreting anything else.

The meta ref also answers the "is this an apparatus?" question. Any tool that needs to detect whether a bare git repo is an apparatus checks for `refs/apparatus/meta`. This is more reliable than scanning for specific data ref patterns, because the meta ref is a stable sentinel that persists across layout changes.

### 4. Migration paths: explicit version transitions

With a storage-format-version, migration is: read format version, run migration, update meta ref -- all in a single `update-ref --stdin` atomic transaction. If the transaction fails at the `prepare` step, nothing changes. The apparatus remains at the old format. The format version is the transaction's commit flag.

Without a format version, migration lacks a completion marker. If interrupted, some refs have moved and others have not. The next CLI invocation finds a mixed state -- some old-pattern refs, some new-pattern refs. Is this a partial migration or corruption? Without a version marker, the CLI cannot distinguish these cases. With one, the answer is clear: if the marker says "format 1" but some refs follow format 2 patterns, a migration was interrupted.

### 5. Operational asymmetry: different concerns deserve different tracking

The per-object `schema-version` tracks per-type content evolution. It answers: "what fields does this journal entry have?" The contract version tracks cross-cutting contract evolution. It answers: "what fields does every object have?"

Neither of these answers the question: "where are the objects stored in git?" That is a third concern -- structural, not semantic. It describes the mapping from logical concepts (journal entries, investigations, findings) to physical git primitives (refs, trees, blobs, commits).

These three concerns evolve on different timescales:

- **Content schemas** change frequently. A new optional field every few weeks during active development.
- **The metadata contract** changes rarely. Perhaps once or twice over the system's lifetime.
- **The storage layout** changes very rarely. Perhaps during a major version transition.

Side A argues that because layout changes are rare, they do not need tracking. This reasoning is backwards. Rare changes are exactly the ones that need explicit tracking, because the code that handles them is exercised infrequently and therefore most likely to contain bugs. An explicit format version creates a reliable trigger for migration code. Pattern matching against ref names is a heuristic that must be correct across all possible states -- including partial migrations, empty apparatuses, and unknown future formats. The format version reduces this to a single integer comparison.

## What the meta ref contains

The meta ref holds a small document: `format-version` (integer, tracks storage layout), `contract-version` (integer, mirrors the metadata contract for boot-time access), and `created-by` (string, records the initializing CLI version). It lives as a blob in a committed tree on `refs/apparatus/meta`. A few hundred bytes. One ref. The cost is negligible. The informational value -- an unambiguous answer to "what am I looking at?" at every startup -- is significant.

## Addressing the complexity objection

Side A argues a storage-format-version adds complexity. True in the narrow sense. But the alternative is not "no complexity" -- it is complexity distributed across pattern-matching heuristics in the CLI boot sequence. The format version concentrates complexity in one place: a single ref, read once, producing a single integer. The pattern-matching alternative distributes it across every place the CLI interprets ref names.

If `refs/apparatus/meta` is missing, the CLI falls back to pattern-based detection -- exactly what Side A proposes as the primary strategy. Side A's approach is Side B's fallback. The format version is the fast path for the common case.

## Summary

The Apparatus has three distinct versioning concerns: content schemas (per-object, tracked by `schema-version`), the metadata contract (cross-cutting, tracked by contract version), and storage layout (per-apparatus, currently untracked). The first two are resolved. The third is the gap. A per-apparatus storage-format-version at `refs/apparatus/meta` fills this gap with minimal cost: one ref, one blob, one read per CLI invocation. It gives the CLI a deterministic boot sequence, enables clean forward-compatibility error messages, provides a transaction marker for layout migrations, and distinguishes empty from unknown from corrupted apparatus states. The alternative -- pattern matching against ref names -- is the correct fallback strategy, but it should not be the primary strategy when an explicit declaration is cheap and reliable.
