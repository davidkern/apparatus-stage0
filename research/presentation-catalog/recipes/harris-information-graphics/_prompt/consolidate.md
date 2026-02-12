# Consolidate Harris Information Graphics Recipes

Instantiated prompt for consolidating extracted recipes from all chunks.

---

You are consolidating recipes extracted from multiple chunks into a coherent collection.

## Generator

Read for guidance: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/consolidate-source.md`

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Input

Recipe files from chunk directories:
- `harris-information-graphics/02-A1-abscissa-area/*.md`
- `harris-information-graphics/03-A2-axis/*.md`
- `harris-information-graphics/04-B1-bar/*.md`
- `harris-information-graphics/05-B2-box/*.md`
- `harris-information-graphics/06-C1-cake-chart/*.md`
- `harris-information-graphics/07-C2-column/*.md`
- `harris-information-graphics/08-C3-comparative-cumulative/*.md`
- `harris-information-graphics/09-C4D1-data/*.md`
- `harris-information-graphics/10-D2-difference-distribution/*.md`
- `harris-information-graphics/11-EFG1-flow-font-graph/*.md`
- `harris-information-graphics/12-G2-graph/*.md`
- `harris-information-graphics/13-G3H-histogram/*.md`
- `harris-information-graphics/14-HIK-icon-index/*.md`
- `harris-information-graphics/15-L1M1-line-map/*.md`
- `harris-information-graphics/16-M2-map/*.md`
- `harris-information-graphics/17-M3N-map-normal/*.md`
- `harris-information-graphics/18-OP1-patch-pie-plot/*.md`
- `harris-information-graphics/19-P2-polar-proportional/*.md`
- `harris-information-graphics/20-QRS1-quantile-range-scatter/*.md`
- `harris-information-graphics/21-S2-scale-sequence/*.md`
- `harris-information-graphics/22-S3-slope-stacked/*.md`
- `harris-information-graphics/23-S4T1-symbol-table/*.md`
- `harris-information-graphics/24-T2-text-time/*.md`
- `harris-information-graphics/25-T3V-topo-variable/*.md`
- `harris-information-graphics/26-WZ-weather-zone/*.md`

Exclude `_prompt/` directories.

## Consolidation Tasks

### 1. Cross-Chunk Entry Merging

Some entries span multiple chunks:

| Entry | Chunks | Action |
|-------|--------|--------|
| Bar Graph | 04, 05 | Ensure variations connected, no duplication |
| Graph | 11, 12, 13 | Major entry; verify comprehensive coverage |
| Map | 15, 16, 17 | Major entry; verify comprehensive coverage |

When merging cross-chunk entries:
- Keep recipes in their primary chunk location
- Add relationships connecting recipes from same parent entry
- Ensure no duplicate recipes for the same variation

### 2. Cross-Reference Resolution

Fill in `related` fields that were left as TBD during extraction:

```yaml
related:
  - slug: grouped-bar-graph
    relationship: variant-of  # Variation of bar graph
  - slug: column-graph
    relationship: contrasts   # Vertical vs. horizontal orientation
```

Common relationships for Harris:
- **variant-of**: Chart type variations (stacked, grouped, 100%)
- **contrasts**: Horizontal vs. vertical, linear vs. log
- **contains / contained-by**: Chart types and their components
- **combines-with**: Charts often used together (e.g., price + volume)

### 3. Deduplication

Harris discusses the same concept in multiple entries. Check for:
- "Bar graph" vs. "Horizontal bar graph" (same thing)
- "Column graph" vs. "Vertical bar graph" (same thing)
- Components described in both their own entry and in chart type entries

When duplicates found:
- Keep the most complete version
- Merge unique content from duplicates
- Add cross-references rather than redundant content

### 4. Alias Consistency

Harris uses many alternate names. Ensure:
- Primary name in recipe `name` field matches Harris's primary term
- Aliases captured in `extensions.alternate_names`
- No recipes named by alias instead of primary term

### 5. Relationship Hierarchy

Establish proper hierarchies:

**Chart type families:**
```
bar-graph
├── simple-bar-graph
├── grouped-bar-graph
├── stacked-bar-graph
│   └── 100-percent-stacked-bar-graph
├── range-bar-graph
├── paired-bar-graph
└── ... (other variations)
```

**Component hierarchies:**
```
axis
├── horizontal-axis
├── vertical-axis
├── dual-axis
└── logarithmic-axis
```

Use `relationship: variant-of` for variations, `relationship: contains` for parts.

### 6. Consistency Check

Ensure consistent treatment of:
- `direction`: Most should be `both` (construction and recognition)
- `extensions.scale_types`: Consistently applied to chart type recipes
- `extensions.harris_entry`: Parent entry name present where applicable

### 7. Gap Analysis

Check for missing recipes that should have been extracted:

**Core chart types** (must have recipes):
- Bar graph (and major variations)
- Column graph (and major variations)
- Line graph (and variations)
- Area graph
- Pie chart (and variations)
- Scatter plot
- Histogram
- Box plot

**Core components** (should have recipes):
- Axis (types and configuration)
- Scale (types and usage)
- Grid lines
- Legend
- Labels

**Specialized types** (should have recipes if in source):
- Gantt chart
- PERT chart
- Flow chart
- Control chart
- Bubble chart
- Radar/spider chart
- Treemap
- etc.

Report any gaps for follow-up extraction.

## Output

1. Updated recipe files with filled `related` fields
2. Consolidated recipes (merged duplicates)
3. Gap report listing any missing recipes
4. Summary of cross-references established
5. Alias mapping document (optional but helpful)

## Validation

Run validation after consolidation:

```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py harris-information-graphics/
```

Fix any errors before completing.

## Final Structure

After consolidation, the directory should contain:
- Recipe files organized by chunk (extraction location)
- Complete `related` fields connecting the collection
- No duplicate recipes
- Consistent terminology and extensions
