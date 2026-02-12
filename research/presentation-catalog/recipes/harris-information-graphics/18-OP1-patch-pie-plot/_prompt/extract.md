# Extract Recipes: Chunk 18 — Patch, Pie, Plot

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

**PDF file**: `/work/apparatus-research/reference/harris-information-graphics/chunks/18-OP1-patch-pie-plot.pdf`

**Pages**: 276-295

## Entries in This Chunk

- **Patch graph** — Mosaic/marimekko charts
- **Pie chart** — Major entry with variations
- **Plot** — Scatter/point plotting concepts

**Note**: This is a HIGH-DENSITY chunk with three major chart types.

## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine all figures** — Each chart type has multiple illustrations
2. **Describe visual components** — Slices, tiles, points, axes
3. **Reference figures** — Include page numbers for each variation
4. **Note visual conventions** — Slice ordering, tile sizing, point encoding

## Extraction Approach

**Patch Graph** (mosaic/marimekko):
- Two-variable area encoding
- Construction technique
- Reading/interpretation guidance

**Pie Chart** — Major entry with variations:
- Simple pie chart
- Exploded pie chart
- Doughnut chart (if covered)
- 3D pie (cake chart was separate)
- Pie with multiple rings
- Extract **separate recipes** for each variation

**Plot**:
- Point plotting techniques
- May overlap with scatter plot content
- Focus on plotting conventions distinct from scatter graph entry

## Extensions for Pie Chart

```yaml
extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["circle graph", "sector chart"]
  typical_use: "showing parts of a whole"
```

## Output Format

Follow the schema in: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`

Follow general extraction guidance in: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Source Reference Format

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Exploded pie chart, p. XX"
```

## Task

1. Read the PDF to see both text and visual content
2. Create one recipe file per distinct technique/variation
3. For Pie Chart, extract each named variation separately
4. Capture visual components in `components` field
5. Include warnings about pie chart limitations if Harris notes them
6. Include page references in examples
7. Validate each recipe with the schema

Write recipe files to this directory (sibling to `_prompt/`):
`/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/18-OP1-patch-pie-plot/`
