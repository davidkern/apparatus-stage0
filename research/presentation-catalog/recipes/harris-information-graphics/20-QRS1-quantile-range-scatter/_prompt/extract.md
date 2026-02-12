# Extract Recipes: Chunk 20 — Quantile, Range, Scatter

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/20-QRS1-quantile-range-scatter.pdf`

**Pages**: 316-335

## Entries in This Chunk

- **Quantile** — Quantile plots and statistical displays
- **Range** — Range charts (high-low, band)
- **Scatter plot** — Major entry for bivariate point displays

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Statistical plots, range displays, scatter variations
2. **Describe visual components** — Points, ranges, bands, axes
3. **Reference figures** — Include page numbers
4. **Note statistical conventions** — Quantile markers, range indicators

## Extraction Approach

**Quantile**:
- Q-Q plot (quantile-quantile)
- Quantile displays
- Statistical comparison techniques

**Range**:
- High-low chart (OHLC, candlestick if covered)
- Range band displays
- Floating bar/range bar variants
- Error range indicators

**Scatter Plot** — Major chart type:
- Simple scatter plot (XY graph)
- Scatter with trend line
- Connected scatter
- Scatter matrix (SPLOM)
- Jittered scatter
- Extract **separate recipes** for each variation

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scatter Plot, p. XX"
```

## Extensions

```yaml
extensions:
  harris_entry: "Scatter Plot"
  alternate_names: ["scatter graph", "XY graph", "point chart"]
  typical_use: "showing relationship between two quantitative variables"
```

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct technique
3. For Scatter Plot, extract each named variation separately
4. Capture visual components in `components` field
5. Include page references in examples
6. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/20-QRS1-quantile-range-scatter/`
