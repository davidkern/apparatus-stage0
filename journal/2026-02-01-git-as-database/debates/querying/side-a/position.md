# Side A: Minimal querying -- enumerate and filter

## Core argument

The Apparatus should maintain a single flat index -- the derived index accepted in the identity synthesis -- containing the five required contract fields plus citation targets for every object. All queries are sequential scans over this index with CLI-side filtering. No secondary indexes. No reverse-link tables. No temporal sort structures. The index is a lookup table, not a database engine.

The reason: every index the system maintains is a correctness liability. A secondary index that falls out of sync with the source objects produces wrong answers silently. The reverse-citation index that misses a link means assumption invalidation fails to propagate -- the exact failure mode the Apparatus exists to prevent. The simplest index that serves the query needs is the one least likely to produce wrong answers and the one easiest to verify and rebuild.

The base index maps assigned-id to structural-path, current-SHA, and the required metadata fields (id, type, status, schema-version, created-at). Even at the upper bound of realistic usage -- a few thousand objects -- the entire index fits in memory. A sequential scan takes single-digit milliseconds. There is no performance problem to solve.

## Position on each tension point

### 1. Date range queries: scan with created-at filter

The base index contains created-at for every object. "All journal entries from last week" is: load index, filter where type = journal-entry AND created-at >= seven-days-ago. This touches every entry in the index but no git objects. Filtering happens in memory over a small data structure.

A temporal index would sort entries by created-at so date range queries touch only matching entries. But "avoiding" a scan over a few hundred extra in-memory records saves microseconds. The temporal index's maintenance cost -- updating it on every object creation, verifying it during rebuilds -- is paid on every write to save microseconds on occasional reads. Date range queries are not the hot path. The hot path is "show me object X by its identifier" -- a direct lookup both sides serve identically.

### 2. Metadata filtering: scan with predicate

"All investigations with status 'researching'" is: load index, filter where type = investigation AND status = researching. The filtering is a predicate applied to in-memory records.

The granularity synthesis increased the object count by making findings and assumptions independent sub-objects. But "more" means hundreds or low thousands, not millions. Adding a type-status secondary index to accelerate a filter over a few thousand records is premature optimization that adds maintenance burden without solving a real problem. If the Apparatus ever reaches a scale where this is slow, adding a secondary index later is straightforward. The base index design does not preclude it.

### 3. Reverse citation lookup: enriched base index

This is the strongest argument for secondary indexes, and it deserves serious engagement. When an assumption is invalidated, the system must find every design decision that cites it.

There are two ways to handle this within the minimal approach:

**Option 1: Read citation metadata from git.** For each design-decision in the index, read the object via `git cat-file` and parse its citation fields. At fifty decisions and 3-5ms per subprocess call, that is 150-250ms. Noticeable but not unacceptable for assumption invalidation, which happens rarely.

**Option 2: Store citation targets in the base index.** Extend each index entry to include the list of assigned-ids it cites. Then "which objects cite assumption A-4?" is a scan filtering on citation-targets containing A-4. No git object reads. The cost is a wider index entry -- each record carries an array of cited identifiers.

Option 2 is the right answer. It expands the base index without introducing a separate structure. The scan is sequential but operates entirely in memory. Each design decision might cite five to twenty objects. For fifty decisions averaging ten citations each, that is 500 UUIDs, roughly 18KB. Negligible.

### 4. Cross-structural search: chained scans

"What was the evidence trail for this design decision?" is multi-hop: read the decision's citations from the index, look up each cited finding's parent via structural-path, look up linked journal entries. Each hop is a filter over the in-memory index. The total cost is proportional to hops times index size -- a few milliseconds per hop for realistic data.

Pre-computing relationship graphs means maintaining graph consistency on every object creation, edit, and status transition. Every write becomes a graph maintenance operation. The complexity cost is high; the benefit is saving milliseconds on queries that are already fast.

### 5. Performance at scale: the numbers do not justify indexes

A six-month single-researcher project might produce: 200 journal entries, 20 investigations with 200 entries and 60 findings, 50 design decisions, 100 assumptions. Total: roughly 610 objects. Triple it for generous estimates: 1800 objects.

The base index at 1800 entries, with each entry containing the contract fields plus citation targets, fits in a few hundred kilobytes. A full scan takes under 1ms. Even at ten thousand objects -- multiple researchers working for years -- the scan takes single-digit milliseconds.

Secondary indexes make sense when the data is too large to scan. A database with millions of rows needs indexes. A data structure with a few thousand entries does not.

## The maintenance argument

Every index is a correctness risk. The base index is verified by walking the git ref namespace: for each ref under `refs/apparatus/`, read the object, parse its metadata, and compare against the index entry. Conceptually simple, single source of truth.

A secondary reverse-citation index adds a second verification target. A temporal index adds a third. Each additional index is another thing that can be wrong, must be rebuilt, and must be updated atomically when objects change. The `update-ref --stdin` transaction mechanism does not extend to derived indexes stored outside the ref namespace. If the CLI crashes between updating refs and updating indexes, the indexes are stale. The minimal approach has one index to repair. The indexed approach has four or five.

## Summary

The minimal approach stores citation targets in the base index and answers all query patterns via sequential scans over a small in-memory data structure. No secondary structures. It handles the critical reverse-citation use case without reading git objects. It scales to the realistic upper bound of Apparatus usage. It minimizes the correctness risk surface by maintaining a single derived structure. And it preserves the option to add secondary indexes later if actual usage reveals a need.
