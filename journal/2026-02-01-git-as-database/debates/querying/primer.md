# Querying debate: primer

## The question

What retrieval operations must the Apparatus storage layer support beyond enumerating objects by structural path? What does the derived index contain, how is it maintained, and what query patterns does it serve?

This is the sixth design question in the resolution sequence. It operates downstream of all five prior decisions: the storage substrate (`.apparatus/` bare git repo with custom ref namespaces and plumbing commands), mutability boundaries (terminal status means immutable, uniform mechanism), identity (two-layer model with content-addressing at the substrate and assigned identifiers at the system layer), the metadata contract (five required fields: id, type, status, schema-version, created-at), and granularity (per-topic journal entries, typed investigation entries, findings and assumptions as independent sub-objects, design decisions as independent sub-objects). The querying question takes all of these as given and asks: when the CLI needs to find objects that match a condition, how does it do so?

## What is at stake

The Apparatus stores structured knowledge artifacts as git blobs organized in trees, accessed through ref namespaces under `refs/apparatus/...`. Every object is a blob that must be read via `git cat-file -p <sha>` or an equivalent library call. Every tree listing requires `git ls-tree <sha>`. These are not free operations. Each is a subprocess invocation (or, at best, a libgit2 function call) that opens the object database, decompresses the object, and returns its content. For a single object the cost is negligible -- a few milliseconds. For a hundred objects it is noticeable. For a thousand it is a design constraint.

The identity synthesis established a derived index keyed by assigned identifier, mapping assigned-id to (structural-path, current-SHA, metadata). This index exists and is accepted. But the synthesis left its scope deliberately vague. What metadata does it contain? Is it just the five required contract fields, or does it include type-specific fields like topic, investigation references, and citation targets? Does it maintain reverse lookups -- given a finding's assigned-id, which design decisions cite it? Does it maintain temporal ordering -- given a date range, which objects were created in that window?

The answer determines the system's query vocabulary: what questions can the CLI answer without scanning the entire object store, and what questions require a full walk. It also determines the maintenance burden: every additional index entry must be updated when objects change, and every index must be rebuildable from the git objects when the derived state is lost or corrupted.

## The two positions

**Side A: Minimal querying.** The derived index maps assigned-id to structural-path and current-SHA, plus the five required contract fields. All complex queries -- date ranges, status filtering, reverse citation lookup, cross-structural search -- are sequential scans over this small index. The index is a flat lookup table, not a relational database. The CLI reads the entire index into memory, applies filters, and returns results. No secondary indexes. No reverse-link tables. The index is cheap to maintain because it tracks only what the identity synthesis required. At the expected scale of the Apparatus (hundreds to low thousands of objects), a full scan of the index is fast enough that secondary indexes would be premature optimization.

**Side B: Indexed querying.** Beyond the base index, the system maintains derived secondary indexes for common query patterns: a reverse-citation index (given object X, which objects cite X), a temporal index (objects sorted by created-at), a type-status index (objects grouped by type and status). These indexes are derived from the git objects and rebuildable from scratch, just like the base index. They trade additional storage and maintenance complexity for query performance and, more importantly, for query correctness -- some queries (particularly reverse citation lookup for assumption invalidation) are not just slow without an index but error-prone, because they require parsing every object's citation metadata to find references to a given target.

## Tension points

1. **Date range queries.** The system must answer "all journal entries from last week" or "all entries created between date X and Y." Under minimal querying, this is a scan of the base index filtering on created-at. Under indexed querying, this is a range lookup in a temporal index. The question is whether the scan is fast enough and whether the temporal index justifies its maintenance cost.

2. **Metadata filtering.** The system must answer "all investigations with status 'researching'" or "all findings tagged with topic X." Under minimal querying, this is a scan with filter predicates. Under indexed querying, this is a lookup in a type-status index. The granularity synthesis established that findings are independent sub-objects, so the object count for filtering is larger than it would be under coarse granularity.

3. **Reverse citation lookup.** When an assumption is invalidated, the system must find all design decisions that cite it. This is the critical traceability use case. Under minimal querying, this requires scanning every design decision's citation metadata. Under indexed querying, this is a direct lookup in a reverse-citation index. The correctness requirement here is absolute: missing a citing decision means a design decision rests on an invalidated assumption without the researcher knowing.

4. **Cross-structural search.** The system must answer "what was the evidence trail for this design decision?" -- spanning journal entries, investigation findings, and design rationale. This is a multi-hop traversal: decision cites findings, findings belong to investigation entries, investigation entries are linked to journal entries. Under minimal querying, this is a sequence of index scans. Under indexed querying, this could be served by pre-computed relationship graphs or by chaining index lookups.

5. **Performance at scale.** The Apparatus is a per-project tool. A single project might accumulate hundreds of journal entries, dozens of investigations with hundreds of findings, and dozens of design decisions over months of work. Realistic upper bounds might be a few thousand objects. The question is whether these counts make sequential scans problematic and whether they justify the complexity of maintaining secondary indexes.

## Dependencies from prior decisions

The querying debate must respect these resolved decisions:

- **Storage substrate**: all objects are git blobs in trees, accessed via plumbing commands. Reading an object requires `git cat-file`. Listing a tree requires `git ls-tree`. Atomic multi-ref updates via `update-ref --stdin`.
- **Identity**: two-layer model. The derived index keyed by assigned identifier exists and maps assigned-id to (structural-path, current-SHA, metadata). The index is derived and rebuildable.
- **Metadata contract**: every object has id, type, status, schema-version, created-at. These are the minimum queryable fields.
- **Granularity**: findings and assumptions are independent sub-objects. Investigation entries are typed. Journal entries are per-topic. Cross-structural relationships are typed links in metadata. This means the object count is higher than it would be under coarse granularity, and the citation graph is denser.
- **Mutability**: terminal status means immutable. Status transitions are the primary mutation operation. Status is a required field on every object.

The key downstream question: the identity synthesis said the index maps assigned-id to (structural-path, current-SHA, metadata) but did not specify what "metadata" includes or whether secondary indexes exist. Querying is where that specification happens.
