# Extract Recipes: Chunk 03 — Axis

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/03-A2-axis.pdf`

**Pages**: 21-35

## Entries in This Chunk

This chunk covers axis terminology and configuration:

- **Axis** — Main entry covering graph axes
  - Axis types (quantitative, category, sequence)
  - Axis components (tick marks, labels, scale breaks)
  - Multiple axes (dual Y-axis, secondary axes)
  - Axis positioning and orientation

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Annotated diagrams show axis configurations
2. **Describe visual components** — Tick marks, labels, grid lines, scale indicators
3. **Reference figures** — Include page numbers for specific configurations
4. **Note conventions** — Labeling positions, tick spacing, scale break symbols

## Extraction Approach

The Axis entry is about **components**, not chart types. Extract recipes for:

1. **Configuration techniques** — How to set up different axis types
2. **Component options** — Tick marks, labels, grid line styles
3. **Special techniques** — Scale breaks, log scales, dual axes

Each distinct configuration technique should be a separate recipe.

**Expected recipes** might include:
- `quantitative-axis` — Numeric scale configuration
- `category-axis` — Named category configuration
- `sequence-axis` — Time/ordered sequence configuration
- `dual-axis` — Two Y-axes on same chart
- `scale-break` — Interrupted axis for outliers
- `logarithmic-axis` — Log scale configuration

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Tick marks, p. XX"
```

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct axis technique or configuration
3. Capture axis components in the `components` field
4. Include page references in examples
5. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/03-A2-axis/`
