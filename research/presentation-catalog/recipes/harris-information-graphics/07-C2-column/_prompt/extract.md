# Extract Recipes: Chunk 07 — Column Graph

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/07-C2-column.pdf`

**Pages**: 81-100

## Entries in This Chunk

- **Column graph** — Major entry with many variations (parallel to Bar Graph)

**Note**: This is a HIGH-DENSITY chunk. Column Graph mirrors Bar Graph in structure
but with vertical orientation. Each variation should become a separate recipe.

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Every column graph variation is illustrated
2. **Describe visual components** — Columns, axes, labels, spacing, grouping
3. **Reference figures** — Include page numbers for each variation
4. **Note design conventions** — Column width, gap spacing, baseline handling

## Extraction Approach

Column Graph is the vertical counterpart to Bar Graph. Harris documents parallel variations.
Extract **separate recipes** for each named variation.

**Expected variations** (verify against PDF):
- Simple column graph
- Grouped column graph (clustered)
- Stacked column graph (segmented)
- 100% stacked column graph
- Range column graph (floating)
- Deviation column graph (above/below baseline)
- Histogram (frequency column)
- Pictorial column graph
- Step column graph
- Connected column graph

Each recipe should note:
- Relationship to corresponding bar graph variation
- When vertical orientation is preferred
- Construction and reading techniques

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Grouped column graph, p. XX"
```

## Extensions

```yaml
extensions:
  harris_entry: "Column Graph"
  alternate_names: ["vertical bar graph"]
  typical_use: "comparing values across categories, showing time series"
```

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct column graph variation
3. Capture visual components in `components` field
4. Note relationships to bar graph variants where applicable
5. Include page references in examples
6. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/07-C2-column/`
