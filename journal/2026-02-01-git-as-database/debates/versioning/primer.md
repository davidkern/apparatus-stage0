# Versioning debate: primer

## The question

How does the Apparatus data model and storage format evolve over time? What version information does the system need, and where does it live?

This is the sixth design question in the resolution sequence. It operates downstream of mutability (resolved: terminal status means immutable), identity (resolved: two-layer model with assigned identifiers and content-addressing), metadata model (resolved: five-field required contract including `schema-version`), and granularity (resolved: fine-grained objects at traceability joints, ~9 object types). The versioning question takes those decisions as given and asks: when the system changes, how does the data tell the CLI what it is looking at?

## What is at stake

The Apparatus stores structured knowledge artifacts in a `.apparatus/` bare git repo. An apparatus CLI mediates all access using git plumbing commands (`hash-object`, `mktree`, `commit-tree`, `update-ref`). Data lives in custom ref namespaces (`refs/apparatus/...`), organized as content-addressed blobs in git trees with history maintained as commit chains. Atomic multi-ref updates use `update-ref --stdin` with `start`/`prepare`/`commit` transactions.

This system will evolve. Schemas will gain fields. Storage conventions will change. The required contract may expand. The derived index may be restructured. The question is what the CLI needs to know -- and where that knowledge is stored -- to correctly read data written by any past or future version of itself.

The stakes are concrete: when a CLI opens `.apparatus/`, it must orient itself before it can do anything. It runs `git for-each-ref refs/apparatus/` to discover what exists. But which ref conventions is it looking at? If an older CLI wrote the data under one ref namespace layout and a newer CLI expects a different layout, the enumeration may return nothing, or return refs the CLI cannot interpret. The boot sequence -- the first few operations the CLI performs when it opens an apparatus -- is where versioning either works or fails.

## The four things that can change

1. **Content schema.** A journal entry gains a new optional field. A finding's schema adds a confidence score. Each object type has its own schema, and the per-object `schema-version` field (one of the five required contract fields) tracks this. A CLI encountering an object with a higher schema-version than it understands can still read the required contract fields and present a minimum viable view.

2. **Storage layout.** The ref namespace convention changes. Perhaps `refs/apparatus/journal/main` becomes `refs/apparatus/v2/journal/main`, or entries move from a flat tree layout to date-bucketed subdirectories within commits. Perhaps the relationship between refs and object types changes. These are structural conventions about where objects live in the git repo, independent of what those objects contain.

3. **Required contract.** The five-field metadata contract (`id`, `type`, `status`, `schema-version`, `created-at`) adds a sixth field. The contract is versioned independently from structure schemas (metadata synthesis, decision 6). This is a cross-cutting change that affects all object types.

4. **Index format.** The derived index changes its serialization, adds new index types, or restructures its ref namespace. The index is a derived artifact (rebuildable from primary data), but the CLI depends on it for query performance.

## The two positions

**Side A: Single version concern.** The per-object `schema-version` is sufficient. Storage layout conventions are stable and change extremely rarely. When they do change, the CLI can detect the layout by inspecting the ref namespace -- duck typing the apparatus. A global storage-format-version would add complexity with minimal benefit. The system already has versioning at the object level and the contract level; adding a third version axis creates coordination overhead without solving a real problem.

**Side B: Dual versioning.** Separate the per-object `schema-version` (tracks content shape per type) from a per-apparatus `storage-format-version` (tracks layout conventions). Store the storage-format-version in a well-known location -- a blob at a canonical ref like `refs/apparatus/meta`, readable before the CLI attempts to interpret any other ref. This gives the CLI an explicit bootstrap handshake: read the format version first, then know how to find and interpret everything else.

## Tension points

### 1. The CLI boot sequence

When the CLI opens `.apparatus/`, what does it do first? It must discover refs, interpret their structure, and locate objects. If the ref namespace convention has changed between CLI versions, the CLI needs to know which convention to expect before it enumerates refs. The per-object `schema-version` cannot help here because the CLI has not yet found any objects -- it is still trying to figure out where they are.

Side A says the CLI can detect the layout by inspection: try the known patterns, see which refs exist. Side B says this is fragile duck typing and that an explicit version declaration at a fixed location is more reliable.

### 2. Forward and backward readability

An older CLI encountering newer data must degrade gracefully. The metadata contract guarantees a minimum viable view for individual objects (the five required fields are always present). But what if the older CLI cannot find the objects because the storage layout has changed? The per-object contract is useless if the CLI never reaches the objects.

Conversely, a newer CLI encountering older data must know how to read the old layout. If the old layout lacks a storage-format-version marker, the newer CLI must infer the format version -- which is the same duck-typing problem from tension point 1, but in the other direction.

### 3. Cold-start bootstrapping

When `git init --bare .apparatus` is run for the first time, what initial state is written? The answer to this question determines what a future CLI finds when it opens the apparatus. If the initial state includes a format version marker, the bootstrap is explicit. If not, the CLI must distinguish "empty apparatus with no format marker" from "apparatus in an unknown format."

### 4. Migration paths

When the storage layout changes (a major structural change, not an additive field), what is the migration story? With dual versioning, the CLI can detect the old format version, run a migration to the new format, and update the format version marker atomically. With single versioning, the CLI must detect the layout by inspection, migrate, and then... what? There is no marker to update, so the next CLI invocation must detect the layout again.

### 5. Operational asymmetry

Adding an optional field to a journal entry schema is local, non-breaking, and affects only journal entries. The existing `schema-version` handles this cleanly. Changing the ref namespace convention is global, potentially breaking, and affects every object type simultaneously. These are operationally different kinds of change. Should they share a version counter, or is the difference significant enough to warrant separate tracking?

## Dependencies from prior debates

The versioning debate must respect these resolved decisions: mutability (terminal status means immutable), identity (two-layer model with assigned identifiers and content-addressing), metadata contract (five required fields including `schema-version`, contract versioned independently), granularity (~9 object types with per-type schemas), and storage substrate (`.apparatus/` as separate bare git repo with custom ref namespaces, plumbing commands, and atomic multi-ref transactions).

The key downstream question: the metadata synthesis designed `schema-version` as a per-object, per-type version counter. It did not address whether a separate version is needed for the structural conventions that determine how objects are organized in git. The versioning debate determines whether that gap needs filling.
