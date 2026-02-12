# Extract Recipes: Chunk 02 — Abscissa, Adjustment, Area

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/02-A1-abscissa-area.pdf`

**Pages**: 7-20

## Entries in This Chunk

- **Abscissa** — Horizontal axis terminology
- **Adjustment** — Data adjustment techniques
- **Area chart/graph** — Area-based visualizations with variations

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Every entry has annotated diagrams demonstrating the technique
2. **Describe visual components** — Use the `components` field to capture visual elements (axes, fills, labels, grid lines)
3. **Reference figures** — Include page numbers where diagrams appear
4. **Note design conventions** — Capture spacing, labeling, and annotation patterns shown

## Extraction Approach

For **component entries** (Abscissa, Adjustment):
- Extract as recipes about how to configure/use the component
- Focus on parameters and when to apply

For **chart type entries** (Area graph):
- Extract **separate recipes** for each distinct variation
- Look for: simple area, stacked area, 100% stacked area, silhouette/difference area, etc.
- Each variation with a distinct name gets its own recipe

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Entry Name, p. XX"
```

For variations: `"Area Graph, Stacked area graph, p. XX"`

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct technique
3. Capture visual components in the `components` field
4. Include page references in examples
5. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/02-A1-abscissa-area/`
