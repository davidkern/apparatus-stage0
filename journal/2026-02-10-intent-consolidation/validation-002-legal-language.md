# Validation 002: Legal Language Discovery

**Date**: 2026-02-10
**Discovery source**: Legal/contractual language (deontic logic, contract drafting, legislative interpretation)
**Discovered intents**: ~25
**Proposed categories**: 7

## What This Discovery Targeted

Legal language was selected to test whether formal human-to-human systems surface
general-purpose intents that informal communication leaves unnamed. The hypothesis
was that legal precision reveals roots, not leaves.

## Auditory Forms Coverage Delta

Changes from Validation 001:

| Form | Before | After | Notes |
|------|--------|-------|-------|
| Statement/Assertion | ❌ | ❌ | Basic, still not named |
| Question | ❌ | ❌ | Basic |
| Command/Imperative | ❌ | ~ | Obligation formalizes binding commands |
| Warning (4 levels) | ~ | ~ | No change |
| Definition | ❌ | ✓ | Legal Definition is stipulative |
| Example/Illustration | ~ | ~ | No change |
| Step | ❌ | ❌ | Basic |
| Acknowledgement | ~ | ~ | No change |
| Confirmation Request | ~ | ~ | No change |
| Apology | ✓ | ✓ | No change |
| Suggestion | ~ | ✓ | Permission clarifies suggestion-vs-authorization |
| Transition Marker | ~ | ~ | No change |
| Formula | ~ | ~ | No change |
| Exhortation | ✓ | ✓ | No change |
| Consolation | ~ | ~ | No change |
| Greeting | ❌ | ❌ | Basic |
| Farewell/Ending | ~ | ~ | No change |
| Progress | ~ | ~ | No change |
| List Item | ❌ | ~ | Enumeration addresses list semantics |
| Status Report | ~ | ~ | No change |
| Ambient Update | ~ | ~ | No change |

**Before**: 2 direct hits, 13 related, 9 missing
**After**: 4 direct hits, 14 related, 6 missing

## Presently Intents Coverage Delta

| Category | Intent | Before | After | Notes |
|----------|--------|--------|-------|-------|
| Temporal | Sequence | ❌ | ❌ | |
| | Timeline | ❌ | ❌ | |
| | Duration | ❌ | ✓ | Legal Duration is precise |
| | Overlap | ❌ | ❌ | |
| | Trend | ❌ | ❌ | |
| | Recurrence | ❌ | ❌ | |
| Distributional | Histogram | ❌ | ❌ | |
| | Density | ❌ | ❌ | |
| | Quartiles | ❌ | ❌ | |
| | Ranking | ❌ | ❌ | |
| | Proportion | ❌ | ❌ | |
| Comparative | Diff | ❌ | ❌ | |
| | Before/After | ~ | ~ | |
| | Alternative | ~ | ~ | |
| | Deviation | ❌ | ~ | Exception is deviation from rule |
| Relational | Dependency | ❌ | ~ | Condition-Precedent is dependency |
| | Causation | ~ | ~ | |
| | Hierarchy | ~ | ~ | Override establishes hierarchy |
| | Network | ❌ | ❌ | |
| | Grouping | ~ | ~ | |
| | Path | ❌ | ❌ | |
| Evidential | Claim+Evidence | ✓ | ✓ | |
| | Confidence | ✓ | ✓ | Warranty adds accountability to confidence |
| | Provenance | ✓ | ✓ | |
| | Reasoning chain | ❌ | ❌ | |
| | Uncertainty range | ✓ | ✓ | |
| State | Status | ✓ | ✓ | |
| | Progress | ✓ | ✓ | |
| | Health | ❌ | ❌ | |
| | Inventory | ❌ | ❌ | |
| | Configuration | ❌ | ❌ | |
| Aggregative | Count | ~ | ~ | |
| | Statistics | ~ | ~ | |
| | Grouping summary | ❌ | ❌ | |
| | Top-N | ❌ | ❌ | |
| Instructional | Action required | ~ | ✓ | Obligation formalizes "required" |
| | Suggestion | ✓ | ✓ | |
| | Warning | ✓ | ✓ | |
| | Error | ✓ | ✓ | |

**Before**: 9 direct hits, 11 related, 20 missing
**After**: 11 direct hits, 15 related, 14 missing

## Coverage by Category (Updated)

| Category | Before Hits | After Hits | Delta |
|----------|-------------|------------|-------|
| Temporal | 0 | 1 | +1 (Duration) |
| Distributional | 0 | 0 | — |
| Comparative | 0 | 0 | — (but +1 related) |
| Relational | 0 | 0 | — (but +1 related) |
| Evidential | 4 | 4 | — (strengthened) |
| State | 2 | 2 | — |
| Aggregative | 0 | 0 | — |
| Instructional | 3 | 4 | +1 (Action required) |

## New Contributions Not in Holdback

Legal language contributed intents that weren't in our holdback sets at all:

| Intent | Why It Wasn't in Holdback |
|--------|---------------------------|
| Obligation/Permission/Prohibition | Apparatus didn't formalize deontic modality |
| Entitlement | Rights-based framing not in apparatus |
| Condition-Precedent/Subsequent | Apparatus has temporal but not contingent temporal |
| Warranty/Representation/Covenant | Commitment types not distinguished |
| Best-Efforts/Reasonable-Efforts | Effort gradations not formalized |
| Override/Preservation/Survival | Meta-document intents not in apparatus |
| Exhaustive/Illustrative enumeration | List semantics not distinguished |

This is the value of sampling a formal domain: it reveals intents that a technically-
focused holdback wouldn't include but that general communication uses.

## Gap Analysis Update

**Filled gaps**:
- Instructional (Action required now covered via Obligation)
- Temporal (Duration now covered)
- Definition now explicit (was basic/assumed)

**Remaining gaps**:
- **Distributional** — still completely uncovered (Histogram, Density, Quartiles, Ranking, Proportion)
- **Aggregative** — still uncovered (Count, Statistics, Top-N)
- **Temporal** — still missing Sequence, Timeline, Trend, Overlap, Recurrence
- **Comparative** — still missing Diff, Before/After (direct)
- **Relational** — still missing Network, Path
- **System output** — still missing Health, Inventory, Configuration

**Pattern**: Legal language filled *normative* gaps (what's required, permitted, promised)
but not *data presentation* gaps (how to show distributions, comparisons, aggregates).

## Dimensional Insights

Legal language strongly suggests some things are dimensions, not categories:

| Candidate Dimension | Evidence |
|--------------------|----------|
| **Deontic modality** | Obligation/Permission/Prohibition can modify any action |
| **Effort level** | Best/Reasonable/Good-faith can modify any obligation |
| **List semantics** | Exhaustive/Illustrative can modify any enumeration |
| **Accountability** | Warranty vs. Representation vs. mere assertion |

If these are dimensions, our category count stays lower but our expressiveness increases.

## Recommendations

1. **Next discovery should target data presentation** — Distributional and Aggregative
   remain completely uncovered. Data visualization literature is the obvious source.

2. **Consider formalizing deontic modality in framework** — RFC 2119 shows technical
   writing already needs this. The framework could recommend SHALL/SHOULD/MAY precision
   for all instructional intents.

3. **The dimensional hypothesis needs testing** — If Deontic is a dimension rather than
   a category, the taxonomy structure changes significantly.
