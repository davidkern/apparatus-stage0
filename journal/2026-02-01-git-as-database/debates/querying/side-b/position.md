# Side B: Indexed querying -- derived indexes for common query patterns

## Core argument

The Apparatus should maintain a small set of derived secondary indexes alongside the base index: a reverse-citation index, a temporal index, and a type-status index. These indexes are derived from git objects, rebuildable from scratch, and stored as git blobs under `refs/apparatus/indexes/`. They trade modest storage and maintenance complexity for query correctness and a clean separation between the query layer and the storage layer.

The Apparatus is a traceability system. Its defining operation is not "show me object X" but "show me everything connected to object X." Assumption invalidation, citation staleness detection, evidence trail reconstruction -- these are the core value proposition, not occasional convenience queries. A system that makes its primary use case depend on sequential scans over a flat table has optimized for the wrong thing.

The minimal approach correctly observes that scans over a few thousand entries are fast. But it conflates "fast enough" with "well-designed." A sequential scan that must parse citation arrays in every index entry to find reverse references is architecturally wrong: it embeds query logic in scan predicates rather than in data structure. Secondary indexes centralize query semantics and present clean lookup interfaces to the CLI.

## Position on each tension point

### 1. Date range queries: temporal index

The temporal index is a sorted list of (created-at, assigned-id) pairs. "All journal entries from last week" is: binary search for the start date, scan forward to the end, filter by type. O(log n + k) where k is the number of matches, versus O(n) for a full scan.

The performance difference is marginal at small scale. The design difference is not. A temporal index makes date range queries a first-class operation. More importantly, it enables efficient incremental queries. "What is new since I last checked?" is a single seek to the last-checked timestamp, then a forward scan. The cost is proportional to the answer size, not the total index size. Under the minimal approach, every incremental query scans the full index regardless of how few new objects exist.

### 2. Metadata filtering: type-status index

The type-status index groups objects by (type, status). "All findings with status 'active'" is a direct lookup: type-status-index["finding"]["active"] returns a list of assigned-ids. No scanning, no predicate evaluation.

The granularity synthesis made findings and assumptions independent sub-objects. A project with twenty investigations might have two hundred findings and one hundred assumptions alongside three hundred journal and investigation entries and fifty design decisions. The type-status index lets the CLI query one type without touching the others. The maintenance cost is low: object creation adds one entry to a bucket; status change moves one entry between buckets.

### 3. Reverse citation lookup: reverse-citation index

This is the decisive tension point. The minimal approach proposes storing forward citation targets in the base index and scanning every entry to find reverse references. This is wrong for three reasons.

**First, it conflates forward and reverse queries in the same structure.** The base index is keyed by assigned-id. Each entry lists what this object cites (forward references). To answer "who cites X?" the scan must check every entry's citation list for X. This is a table scan to answer a key lookup -- the textbook case for a secondary index.

**Second, the scan has a hidden correctness risk.** The citation list in each index entry is derived from the object's content. If an index entry's citation list is stale (object edited, index not fully updated), the reverse scan silently misses the reference. A dedicated reverse-citation index can be independently cross-verified against the forward data. When forward and reverse are tangled in the same record, inconsistencies between them are harder to detect.

**Third, the reverse-citation query is latency-sensitive and multi-hop.** When a researcher invalidates an assumption, the system must immediately report affected decisions. This is synchronous, not a batch job. And it may be transitive: decisions may cite findings that themselves depend on the invalidated assumption. Each hop in the transitive traversal is another query. With a reverse-citation index, each hop is a key lookup returning a small list. With the minimal approach, each hop is a full index scan with a containment predicate. Two hops over a thousand entries is two millisecond-level scans. Two hops in a reverse-citation index is two microsecond-level lookups. The architectural difference compounds as traversal depth increases.

The reverse-citation index maps each assigned-id to the list of objects that cite it. It is stored as a git blob under `refs/apparatus/indexes/reverse-citations` and is rebuildable by scanning all objects and extracting their citation metadata.

### 4. Cross-structural search: relationship traversal via indexes

"What was the evidence trail for this design decision?" is a graph traversal. Start at decision D-12, read its citations (base index lookup), look up each cited finding in the reverse-citation index to find its parent investigation entry, then look up journal links.

Under the indexed approach, each hop is a direct lookup. The traversal touches exactly the objects in the evidence trail. Under the minimal approach, each hop is a full scan with a different predicate. The code for the indexed version is a composition of lookups. The code for the minimal version is a chain of scan-and-filter loops, each of which must correctly implement its containment predicate.

### 5. Performance at scale: the growth trajectory matters

The minimal approach argues that a few thousand objects can be scanned quickly. Three weaknesses in this argument:

**Object count is higher than estimated.** Fine-grained objects at the traceability joints (per the granularity synthesis) plus citation metadata in every entry means the working set is dense. A realistic project produces 600-1000 objects; a longer or multi-researcher project produces several thousand.

**Query frequency scales with object count.** More objects means more citations means more staleness checks. If every "show decision" command triggers staleness checks for all cited objects, query load grows with citation density, not just object count.

**Growth trajectory is unpredictable.** A two-year project or a three-person team multiplies the object count. The indexed approach scales gracefully. The minimal approach requires architectural changes when scans become slow.

## The maintenance counterargument

The minimal approach argues that secondary indexes are correctness risks. True but manageable:

**Derived and rebuildable.** Every secondary index is derived from git objects. `apparatus rebuild-indexes` walks all refs, reads all objects, regenerates all indexes. This is the recovery path for any inconsistency.

**Atomic update.** The CLI updates all indexes in the same operation. Object creation writes the base index entry and all secondary entries as one logical operation. A generation counter detects mid-update crashes and triggers rebuild.

The correctness risk of secondary indexes is bounded by the rebuild mechanism. The correctness risk of not having a reverse-citation index -- missing a design decision that rests on an invalidated assumption -- directly undermines the system's purpose.

## Summary

The indexed approach maintains three secondary indexes: reverse-citation, temporal, and type-status. These are derived, rebuildable, and stored as git blobs. They serve the Apparatus's core query patterns as direct lookups rather than sequential scans. The maintenance cost is modest and mitigated by atomic updates and rebuild recovery. The architectural benefit is a clean query layer that scales with growth and supports the multi-hop traversals that are the Apparatus's reason for existing.
