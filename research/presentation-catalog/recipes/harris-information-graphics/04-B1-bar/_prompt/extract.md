# Extract Recipes: Chunk 04 — Bar Graph

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/04-B1-bar.pdf`

**Pages**: 36-50

## Entries in This Chunk

- **Bar chart/graph** — Major entry with 10+ variations

**Note**: This is a HIGH-DENSITY chunk. The Bar Graph entry spans many pages with
numerous distinct variations. Each variation should become a separate recipe.

**Entry continues**: The Bar Graph entry may continue into chunk 05.

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Every bar graph variation is illustrated
2. **Describe visual components** — Bars, axes, labels, spacing, grouping
3. **Reference figures** — Include page numbers for each variation
4. **Note design conventions** — Bar width ratios, gap spacing, label placement

## Extraction Approach

This is a **major chart type entry**. Harris documents many distinct bar graph variations.
Extract **separate recipes** for each named variation.

**Expected variations** (verify against PDF):
- Simple bar graph
- Grouped bar graph (clustered, multiple, side-by-side)
- Stacked bar graph (segmented, divided, extended)
- 100% stacked bar graph
- Range bar graph (floating, spanning, high-low)
- Paired bar graph (bilateral, two-way, sliding)
- Pictorial bar graph (pictograph bars)
- Bar and symbol graph
- Deviation bar graph
- Histogram (as bar graph variant)
- Pareto chart

Each recipe should specify:
- Visual construction (components, layout)
- When to use this variation
- How it differs from related variations

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Grouped bar graph, p. XX"
```

## Extensions

Capture Harris-specific patterns:

```yaml
extensions:
  harris_entry: "Bar Graph"
  alternate_names: ["horizontal bar", "rotated column"]
  typical_use: "comparing values across categories"
```

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct bar graph variation
3. Capture visual components (bars, axes, labels, spacing) in `components` field
4. Include page references in examples
5. Note relationships between variations using `related` field
6. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/04-B1-bar/`
