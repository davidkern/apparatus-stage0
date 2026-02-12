# Extract Recipes: Chunk 06 — Cake Chart, Calculation Chart, Category

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/06-C1-cake-chart.pdf`

**Pages**: 65-80

## Entries in This Chunk

- **Cake chart** — 3D pie chart variant
- **Calculation chart** — Charts for computation/nomograms
- **Category** — Category axis and grouping concepts
- Other C-entries that appear before Column

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Each entry has diagrams
2. **Describe visual components** — Slices, layers, scales, grid patterns
3. **Reference figures** — Include page numbers
4. **Note 3D conventions** — For cake charts, capture perspective handling

## Extraction Approach

**Cake Chart** is a 3D variant of pie chart. Extract:
- Construction technique (layering, perspective)
- Warnings about 3D distortion
- When/why it might be used despite limitations

**Calculation Chart** (nomograms) if present:
- How to construct alignment charts
- How to read/use them for computation
- Variations (parallel scale, Z-chart, etc.)

**Category** is a component/concept entry:
- How categories function in charts
- Category axis configuration
- Grouping and ordering considerations

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cake Chart, p. XX"
```

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct technique
3. Capture visual components in the `components` field
4. Include warnings about limitations (especially for 3D charts)
5. Include page references in examples
6. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/06-C1-cake-chart/`
