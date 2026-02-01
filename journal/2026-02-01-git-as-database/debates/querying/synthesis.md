# Querying debate: synthesis

## Key findings -- consensus points

Both sides agree on more than the framing suggests:

1. **The base index exists and is not in dispute.** Both sides accept the derived index from the identity synthesis: a table keyed by assigned-id, mapping to structural-path, current-SHA, and metadata. The debate is about what else exists alongside it.

2. **All indexes are derived and rebuildable.** Neither side proposes indexes containing information not derivable from git objects. Both treat index corruption as recoverable: walk the refs, read the objects, regenerate. The index design is a performance and query-ergonomics question, not a data model question. The git objects are always the source of truth.

3. **Citation metadata belongs in the index.** Side A proposes storing forward citation targets in the base index. Side B proposes a separate reverse-citation index. Both agree citation data must be accessible without per-object `git cat-file` calls. The disagreement is structural: forward-reference arrays versus a dedicated reverse-reference table.

4. **The reverse-citation query is the critical operation.** Both sides identify assumption invalidation -- "which decisions cite this assumption?" -- as the highest-stakes query pattern. Side A addresses it with a scan. Side B addresses it with a dedicated index. Neither dismisses its importance.

5. **Realistic object counts are hundreds to low thousands.** Both converge on similar estimates: a six-month single-researcher project produces roughly 600-1000 objects. Neither argues for a design that must handle millions.

## The resolution

**Side A's core insight is correct: a single enriched index is simpler and sufficient at the expected scale. But Side B correctly identifies that the reverse-citation lookup is architecturally distinct from a forward scan and deserves dedicated structure. The right design is a single index file with two sections: a forward table (keyed by assigned-id) and a reverse-citation table (keyed by cited assigned-id). No temporal index. No type-status index.**

### Where Side A wins

**The performance argument is decisive for simple queries.** Date range queries, status filtering, and type-based enumeration do not justify secondary indexes. Scanning a few thousand in-memory records with predicate filters takes single-digit milliseconds. A temporal index saving a few hundred microseconds on date range queries is not worth its maintenance cost. A type-status index avoiding scans of non-matching types solves a problem that does not exist at the expected scale.

Side B's incremental query argument ("what is new since I last checked?") is technically valid but practically marginal. Scanning a few thousand entries and filtering on a single timestamp comparison is negligible work.

**The single-structure maintenance argument is compelling.** Every additional index is a correctness liability. Side B's mitigations -- atomic updates, generation counters, rebuild commands -- are sound in principle but add implementation complexity. For a CLI tool mediating access to a personal knowledge store, simplicity of derived state is a genuine virtue.

**"Add indexes later" is valid strategy.** The minimal design preserves the option to add secondary indexes when justified by measured performance. The query layer can be refactored from scans to lookups without changing the git object model or CLI interface.

### Where Side B wins

**The reverse-citation lookup is architecturally distinct.** Side A proposes storing forward citation targets in each base index entry and scanning all entries to find reverse references. This is the wrong data structure for a reverse query -- not on performance grounds (the scan is fast) but on design grounds.

When the CLI needs to answer "who cites X?", that intent should be expressed as a key lookup, not as a scan with a containment predicate. The lookup communicates intent clearly. The scan embeds query semantics in filtering logic that every caller must replicate correctly.

More concretely: reverse-citation lookup is used for transitive invalidation. When assumption A-4 is invalidated, the system finds decisions citing A-4, then findings depending on A-4, then decisions citing those findings. Each hop is a reverse query. With a reverse-citation table, each hop is a key lookup. With the scan approach, each hop is a full index scan with a different predicate. The code for the indexed version is a composition of lookups. The code for the scan version is a chain of filter loops. The former is cleaner to write, test, and maintain.

**Citation staleness checks are frequent.** Every time the CLI displays a design decision, it should indicate whether cited findings have changed. The forward direction (look up each cited id, compare SHAs) is served by the base index. But the reverse direction -- "has anything that cites this finding been notified?" -- requires reverse-citation structure. Both directions are needed for a complete staleness picture.

**Cross-verification is an advantage, not a cost.** Having forward citations in the base index and reverse citations in a dedicated table enables cross-checking: for every reverse entry, confirm the corresponding forward entry contains the matching citation. This detects inconsistencies that a single-structure approach cannot catch internally.

### The resolution in detail

The system maintains a single derived index file with two sections:

**Section 1: The forward index.** Keyed by assigned-id. Each entry contains: assigned-id, type, status, schema-version, created-at, structural-path, current-SHA, and a list of (cited-assigned-id, cited-SHA) citation pairs. This is Side A's enriched base index. It serves direct object lookup, date range queries (scan with created-at filter), status filtering (scan with type+status filter), and forward citation resolution.

**Section 2: The reverse-citation index.** Keyed by cited assigned-id. Each entry contains a list of citing assigned-ids. This is Side B's reverse-citation index, stored in the same file rather than as a separate structure. It serves reverse citation lookup, assumption invalidation, and evidence trail reconstruction via alternating forward and reverse lookups.

No temporal index. No type-status index. Date range and status queries are scans over the forward index. At the expected scale, predicate scans are fast enough that dedicated structures are not justified.

The two-section design captures Side B's strongest argument (reverse-citation as a first-class query structure) while accepting Side A's strongest argument (minimize independent derived structures). Both sections live in one file, are rebuilt by one command, and are updated by one CLI operation. Cross-verification is a single pass: for every reverse entry, confirm the citing object's forward entry contains the corresponding citation.

## Unresolved tensions

1. **Index storage location.** The index should live as a file in `.apparatus/` outside the git object store (to avoid producing new blobs on every update), or as a git blob under a dedicated ref (to participate in bundling). Since the index is derived and rebuildable, external storage with regeneration on instantiation is likely correct, but the bundling question needs resolution.

2. **Index update atomicity.** Both sections must be updated atomically. Since they share a file, write-then-rename handles this. But the interaction between the index file update and git ref updates via `update-ref --stdin` is a two-phase operation. The CLI must handle the case where refs are updated but the index is not, or vice versa.

3. **Citation metadata granularity.** Should citation pairs include the citation's semantic role ("relies-on" vs. "supersedes")? Typed citations would enable richer queries but add schema complexity.

4. **Historical query support.** The index tracks current state. "What did the citation graph look like when this decision was made?" requires either index snapshots or reconstruction from commit history. For the traceability use case this may be important, but the cost is unclear.

## Experiment needs

1. **Index read/write performance.** Implement the two-section index as a JSON file with 1000 objects, 200 having citations averaging 8 targets each. Measure: (a) full scan with date range predicate, (b) reverse-citation lookup, (c) three-hop evidence trail traversal, (d) full rebuild from git objects.

2. **Atomicity under crash.** Implement the update path: git ref update via `update-ref --stdin`, then index file write via atomic rename. Simulate a crash between steps. Verify the next operation detects inconsistency and triggers rebuild.

3. **Cross-verification pass.** After a series of object creation, edit, and status transitions, run the cross-check (every reverse entry confirmed by its forward entry). Verify inconsistencies are detected.

## Recommended design decisions

1. **Maintain a single derived index file with two sections: forward and reverse-citation.** The forward section is keyed by assigned-id and contains the five contract fields, structural-path, current-SHA, and citation pairs. The reverse-citation section is keyed by cited assigned-id and contains lists of citing assigned-ids. Both sections are updated, verified, and rebuilt together.

2. **Date range, type, and status queries are sequential scans over the forward index.** No temporal index. No type-status index. These are deferred unless measured performance justifies them.

3. **Reverse-citation lookup is a direct key lookup in the reverse section.** Assumption invalidation, reverse staleness detection, and evidence trail reconstruction use the reverse-citation section. This is the one query pattern that justifies dedicated structure.

4. **The index is derived and rebuildable from git objects.** `apparatus rebuild-index` walks all refs under `refs/apparatus/`, reads all objects, parses metadata and citations, and regenerates both sections. This is the recovery and initialization path.

5. **The index is stored outside the git object store as a file in `.apparatus/`.** It is not a git blob. It is regenerated on instantiation after bundle unbundling. This avoids polluting the object store with derived data.

6. **Index updates are atomic via write-then-rename.** A generation counter embedded in the index detects staleness relative to the git refs. If the counter is stale, the next CLI operation triggers a rebuild.

7. **Defer typed citations, historical index snapshots, and per-structure index partitioning.** These are downstream of the basic index structure and can be resolved during implementation.
