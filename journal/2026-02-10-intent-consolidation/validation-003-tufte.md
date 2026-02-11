# Validation 003: Tufte Extraction

**Date**: 2026-02-10
**Discovery source**: Tufte "Visual Display of Quantitative Information" (full book, 191 pages)
**Extraction method**: Multimodal chunked (12 chunks × 2 modalities = 24 agent tasks)
**Raw entries**: 312
**After consolidation**: 31 catalog-ready intents

## What This Discovery Targeted

Tufte was selected to fill **data presentation gaps** identified after legal language discovery:
- Distributional (completely uncovered)
- Aggregative (uncovered)
- Temporal (weak)
- Comparative (weak)

## Presently Intents Coverage Delta

Changes from Validation 002:

| Category | Intent | Before | After | Notes |
|----------|--------|--------|-------|-------|
| Temporal | Sequence | ❌ | ✓ | Tell a Story Over Time |
| | Timeline | ❌ | ✓ | Narrate Across Space and Time |
| | Duration | ✓ | ✓ | (from legal) |
| | Overlap | ❌ | ~ | Partial via Small Multiples |
| | Trend | ❌ | ✓ | Tell a Story Over Time |
| | Recurrence | ❌ | ✓ | Enable Cyclical Continuity |
| Distributional | Histogram | ❌ | ✓ | Display Distribution Summary |
| | Density | ❌ | ✓ | Show Marginal Distributions |
| | Quartiles | ❌ | ✓ | Display Distribution Summary, Range-Frame |
| | Ranking | ❌ | ✓ | Rank Change Display |
| | Proportion | ❌ | ✓ | Show the Data, Enable Multi-Level Reading |
| Comparative | Diff | ❌ | ✓ | Show Deviation from Expected |
| | Before/After | ~ | ✓ | Show Before-After State Change |
| | Alternative | ~ | ~ | (no change) |
| | Deviation | ~ | ✓ | Show Deviation from Expected |
| Relational | Dependency | ~ | ~ | (no change from legal) |
| | Causation | ~ | ✓ | Support Causal Investigation |
| | Hierarchy | ~ | ~ | (no change) |
| | Network | ❌ | ❌ | Not in Tufte scope |
| | Grouping | ~ | ~ | (no change) |
| | Path | ❌ | ~ | Show Movement and Direction (partial) |
| Evidential | Claim+Evidence | ✓ | ✓ | |
| | Confidence | ✓ | ✓ | |
| | Provenance | ✓ | ✓ | |
| | Reasoning chain | ❌ | ~ | Support Causal Investigation (partial) |
| | Uncertainty range | ✓ | ✓ | |
| State | Status | ✓ | ✓ | |
| | Progress | ✓ | ✓ | |
| | Health | ❌ | ❌ | System output, not in Tufte |
| | Inventory | ❌ | ❌ | System output, not in Tufte |
| | Configuration | ❌ | ❌ | System output, not in Tufte |
| Aggregative | Count | ~ | ~ | |
| | Statistics | ~ | ✓ | Display Distribution Summary |
| | Grouping summary | ❌ | ~ | Synthesize Multiple Sources (partial) |
| | Top-N | ❌ | ~ | Rank Change Display (partial) |
| Instructional | Action required | ✓ | ✓ | |
| | Suggestion | ✓ | ✓ | |
| | Warning | ✓ | ✓ | |
| | Error | ✓ | ✓ | |

## Coverage by Category (Updated)

| Category | Before (post-legal) | After (post-Tufte) | Delta |
|----------|---------------------|-------------------|-------|
| Temporal | 1 direct | 5 direct | +4 |
| Distributional | 0 direct | 5 direct | +5 |
| Comparative | 0 direct | 3 direct | +3 |
| Relational | 0 direct | 1 direct | +1 |
| Evidential | 4 direct | 4 direct | — |
| State | 2 direct | 2 direct | — |
| Aggregative | 0 direct | 1 direct | +1 |
| Instructional | 4 direct | 4 direct | — |

**Total direct hits**: 11 → 25 (+14)

## Gap Analysis Update

**Filled gaps (Tufte)**:
- **Distributional**: All 5 intents now covered (Histogram, Density, Quartiles, Ranking, Proportion)
- **Temporal**: 5/6 now covered (Sequence, Timeline, Trend, Recurrence; Overlap partial)
- **Comparative**: 3/4 now covered (Diff, Before/After, Deviation; Alternative unchanged)

**Remaining gaps**:
- **Network/Path**: Tufte is about statistical graphics, not network diagrams. These remain uncovered. Would need network visualization source (e.g., graph drawing literature).
- **System output (Health, Inventory, Configuration)**: Tufte is about data visualization for human analysis, not dashboard/monitoring contexts. These remain uncovered. Would need ops/monitoring literature.
- **Overlap (temporal)**: Partial coverage through Small Multiples but no direct "show overlapping time periods" intent.

## Pattern Confirmation

The hypothesis was: "Tufte should fill data presentation gaps (Distributional, Aggregative, Comparative) that legal language couldn't."

**Confirmed**. Distributional went from 0% to 100% coverage. Comparative and Temporal also substantially improved.

Remaining gaps (Network, Path, System output) are outside Tufte's scope — they require different source literature.

## New Contributions Not in Holdback

Tufte contributed intents not anticipated in holdback sets:

| Intent | Why Novel |
|--------|-----------|
| **Small Multiples** | Specific visualization technique with clear intent |
| **Range-Frame** | Technique for showing actual data extent |
| **Show Marginal Distributions** | Specific distributional technique |
| **Enable Cyclical Continuity** | Addresses periodic/seasonal data display |
| **Annotate with Contextual Events** | Historical annotation integration |
| **Reveal Interaction Effects** | Multivariate visualization concern |
| **Synthesize Multiple Sources** | Meta-analysis visualization |
| **Decompose Signal from Noise** | Analytical separation technique |

These are *technique-level intents* — more specific than the category-level intents in the holdback. This suggests the catalog may have multiple granularity levels.

## Recommendations

1. **Write Tufte intents to catalog** — The 31 consolidated intents are ready for `/work/apparatus/catalog/intents/`.

2. **Network visualization source needed** — To fill Network/Path gaps, consider graph drawing literature (e.g., Bertin's "Semiology of Graphics" network sections, or modern network visualization research).

3. **System output source needed** — Dashboard and monitoring literature would fill Health/Inventory/Configuration gaps. Consider observability documentation (Datadog, Grafana design guides) or operational dashboard research.

4. **Consider granularity hierarchy** — Tufte produced technique-level intents (Range-Frame, Small Multiples) alongside purpose-level intents (Enable Comparison, Show Distribution). The catalog may need explicit parent-child relationships.
