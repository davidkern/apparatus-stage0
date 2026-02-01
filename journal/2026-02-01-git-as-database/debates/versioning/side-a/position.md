# Side A: Single version concern

## Core argument

The per-object `schema-version` field, combined with the independently versioned metadata contract, is sufficient to handle all evolution of the Apparatus data model and storage format. A separate storage-format-version is unnecessary complexity. The system should not maintain a version counter for something that changes once every several years (if ever), when the CLI can reliably detect storage layout by inspecting the ref namespace.

The reason is structural: the git ref namespace is self-describing. A CLI that runs `git for-each-ref refs/apparatus/` gets back a list of ref names. Those names encode the storage conventions. The CLI does not need a version number to interpret them; it reads the names and applies pattern matching. This is not fragile duck typing -- it is the same strategy git itself uses. Git does not store a "ref layout version" in the repository; it reads what exists and interprets it.

## Position on each tension point

### 1. The CLI boot sequence: inspection is reliable

When the CLI opens `.apparatus/`, it runs `git for-each-ref refs/apparatus/` and examines the results. The ref names tell the CLI everything it needs to know about the storage layout:

```
refs/apparatus/journal/main
refs/apparatus/investigation/inv-001/main
refs/apparatus/design/des-001/main
refs/apparatus/index/primary
```

If a future layout reorganizes refs, the new pattern is equally discoverable:

```
refs/apparatus/objects/journal/main
refs/apparatus/objects/investigation/inv-001/main
refs/apparatus/meta/index/primary
```

The CLI matches against known patterns. If it finds `refs/apparatus/journal/main`, it knows the original layout. If it finds `refs/apparatus/objects/journal/main`, it knows the reorganized layout. If it finds neither, the apparatus is empty or in an unknown state.

This is not duck typing in the pejorative sense. It is structural pattern matching against a finite, well-defined set of possible layouts. The number of storage layout changes over the lifetime of the Apparatus will be countable on one hand. Each one introduces a new pattern the CLI recognizes. The cost of maintaining a pattern matcher for three or four layouts is trivial compared to the cost of maintaining a format version registry, migration framework, and version-bump protocol.

### 2. Forward and backward readability: the contract handles it

The metadata contract provides the forward-readability guarantee for individual objects. The concern that an older CLI "cannot find objects because the storage layout has changed" assumes layout changes happen frequently. They do not. The ref namespace is an architectural choice, not something that evolves with each release.

Even if the layout does change, `git for-each-ref refs/apparatus/` still enumerates all apparatus refs. The older CLI may not recognize the new pattern, but it can report "found N refs under refs/apparatus/ but could not interpret the layout." A storage-format-version would only improve this by saying "the format is version 3, which you do not understand" -- no more actionable than "I found refs I do not recognize."

A newer CLI encountering older data inspects the refs, recognizes the old pattern, and proceeds. It has knowledge of all past layouts compiled in. It does not need a marker to determine which version it is looking at.

### 3. Cold-start bootstrapping: write the data, not a version marker

When the CLI initializes a new apparatus (`git init --bare .apparatus`), it creates the initial refs and writes the first objects. The presence of these refs in a recognizable pattern is the bootstrap signal. A future CLI opening this apparatus will find `refs/apparatus/journal/main` (or whatever the initial ref is) and know it is looking at a valid apparatus.

An empty apparatus -- no refs under `refs/apparatus/` at all -- is unambiguously empty. There is no need for a format version marker to distinguish "empty apparatus" from "apparatus in unknown format." If there are no apparatus refs, there is no apparatus data. The CLI can offer to initialize.

Writing a format version blob to a well-known ref during initialization adds a step to the bootstrap sequence and creates an invariant the system must maintain. What happens if someone deletes the meta ref but not the data refs? Now the CLI finds data but no version marker. It must fall back to inspection anyway -- which means the version marker was not actually necessary for the fallback case, only for the happy path. A mechanism that is optional on the failure path provides weak guarantees.

### 4. Migration paths: per-object migration is sufficient

Content schema migration is per-object and driven by `schema-version`. Storage layout migration is a one-time global operation: detect the old layout by inspecting refs, move refs to new positions, rewrite trees. After migration, the refs are in the new pattern, and future CLIs recognize it directly.

A storage-format-version would make this marginally smoother: read version, migrate, bump version. But the inspection approach works equally well: inspect, migrate, done. The version number saves one step but adds ongoing maintenance cost.

That cost matters. Every operation modifying the storage layout must update the version marker atomically. If the marker and layout get out of sync -- a bug, an interrupted migration -- the version marker becomes misleading. The ref namespace, by contrast, is always truthful. It is the storage layout, not a description of the storage layout.

### 5. Operational asymmetry: real but not version-worthy

Yes, adding an optional field to a journal entry is operationally different from reorganizing the ref namespace. The first is local; the second is global. But this asymmetry does not imply they need separate version counters. It implies they have different migration strategies:

- Schema changes: handled by per-object `schema-version`, with lazy or eager per-object migration.
- Contract changes: handled by the contract version, with a cross-cutting update to all object types at their next schema-version bump.
- Layout changes: handled by ref-namespace detection with a one-time global migration.

Three different migration strategies, but only two of them (schema changes and contract changes) benefit from version counters because they happen frequently enough to warrant tracking. Layout changes are rare, detectable by inspection, and do not benefit from a version counter because the counter would be redundant with the actual ref structure.

## The complexity cost of dual versioning

Adding a storage-format-version introduces: a new well-known ref that must be maintained, a version registry in the CLI's code, atomic version bumps during migration, a mandatory read-before-operate step on every CLI invocation, and a new failure mode when the marker is missing or inconsistent with actual state. The handling for that failure mode is ref-namespace inspection -- exactly the single-versioning approach. The fallback for dual versioning is single versioning.

This is accidental complexity. The system gains a new invariant, a new failure mode, and a new coordination point -- all to avoid an inspection the CLI must perform anyway.

## Summary

The Apparatus already has two version axes: per-object `schema-version` for content evolution and an independently versioned metadata contract for cross-cutting field changes. These handle the common cases -- schema additions, contract expansions -- where versioning provides real value. Storage layout changes are rare, detectable by inspection, and do not benefit from a version counter because the ref namespace itself is the source of truth. Adding a storage-format-version creates complexity and failure modes that the system does not need. The CLI should read what exists and interpret it, not read a description of what exists and then verify it matches.
