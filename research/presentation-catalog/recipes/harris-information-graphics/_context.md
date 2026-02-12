# Source Context: Harris's Information Graphics

## Work Information

- **Title**: Information Graphics: A Comprehensive Illustrated Reference
- **Author**: Robert L. Harris
- **Edition**: First edition (1996/1999 Oxford paperback)
- **Pages**: 449

### Structure

This work is an **alphabetically-organized encyclopedia**, not a chapter-based text. Entries
range from brief definitions to extensive multi-page treatments (e.g., "Bar Graph" spans
14+ pages, "Graph" and "Map" span multiple chunks).

Each entry follows a consistent pattern:
- Entry heading (bold)
- Subheadings for variations (e.g., "Grouped bar graph", "Stacked bar graph")
- Extensive illustrations demonstrating each variation
- Cross-references to related entries

The format is fundamentally visual: Harris demonstrates every chart type and variation
with annotated diagrams. Understanding requires seeing the graphics, not just reading
about them.

## Chunk Inventory

The source is split into 26 alphabetically-ordered chunks. Entries may span chunk
boundaries.

| Chunk ID | Pages | Content |
|----------|-------|---------|
| 01-frontmatter | 1-6 | Title, copyright, organization overview |
| 02-A1-abscissa-area | 7-20 | Abscissa, Adjustment, Area chart/graph entries |
| 03-A2-axis | 21-35 | Axis entries (graph axes, terminology) |
| 04-B1-bar | 36-50 | Bar chart/graph entries |
| 05-B2-box | 51-64 | Box graph/plot, Bubble graph entries |
| 06-C1-cake-chart | 65-80 | Cake chart, Calculation chart, Category entries |
| 07-C2-column | 81-100 | Column graph entries |
| 08-C3-comparative-cumulative | 101-120 | Comparative, Composite, Cumulative graph entries |
| 09-C4D1-data | 121-140 | Curve, Data series/set entries |
| 10-D2-difference-distribution | 141-155 | Difference, Distribution graph entries |
| 11-EFG1-flow-font-graph | 156-170 | Flow chart, Font, early Graph entries |
| 12-G2-graph | 171-185 | Graph entries (core section) |
| 13-G3H-histogram | 186-200 | Graph (cont.), Histogram entries |
| 14-HIK-icon-index | 201-215 | Icon, Index, Intercept entries |
| 15-L1M1-line-map | 216-235 | Line graph, early Map entries |
| 16-M2-map | 236-255 | Map entries (core section) |
| 17-M3N-map-normal | 256-275 | Map (cont.), Normal distribution entries |
| 18-OP1-patch-pie-plot | 276-295 | Patch graph, Pie chart, Plot entries |
| 19-P2-polar-proportional | 296-315 | Polar graph, Proportional chart entries |
| 20-QRS1-quantile-range-scatter | 316-335 | Quantile, Range, Scatter plot entries |
| 21-S2-scale-sequence | 336-355 | Scale, Sequence graph entries |
| 22-S3-slope-stacked | 356-375 | Slope, Stacked graph entries |
| 23-S4T1-symbol-table | 376-395 | Symbol, Table entries |
| 24-T2-text-time | 396-415 | Text, Time series entries |
| 25-T3V-topo-variable | 416-435 | Topographic map, Variable entries |
| 26-WZ-weather-zone | 436-449 | Weather map, Zone entries, Bibliography |

**Source path**: `/work/apparatus-research/reference/harris-information-graphics/chunks/`

**Note on boundaries**: This is an encyclopedia, not a linear text. Entries may start in
one chunk and continue in the next. Major entries like "Bar Graph", "Graph", and "Map"
span multiple chunks.

## Reference System

Harris uses entry names and page numbers. No chapter/section structure exists.

### YAML Examples

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, p. 37"
```

```yaml
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Grid lines, p. 180"
```

For variations within entries, use the format: `Entry, Variation, p. XX`

## Terminology Guidance

### Entry Types

Harris categorizes entries implicitly:

| Type | Examples | Pattern |
|------|----------|---------|
| Chart/graph types | Bar graph, Pie chart, Scatter plot | Primary entry with variations |
| Components | Axis, Grid line, Legend, Scale | Structural elements |
| Data concepts | Data series, Data point, Variable | Underlying information structures |
| Techniques | Curve fitting, Normalization | Methods applied to graphics |
| Visual elements | Symbol, Color, Font | Presentation choices |

### Naming Conventions

Harris uses multiple names for the same concept. Common aliases:

| Primary Term | Also Called |
|--------------|-------------|
| Bar graph | Horizontal bar, rotated column graph |
| Column graph | Vertical bar graph |
| Pie chart | Circle graph, sector chart |
| Scatter plot | Scatter graph, XY graph |
| Box graph | Box plot, box-and-whisker |
| Histogram | Frequency distribution |
| Stacked bar | Segmented, extended, divided, composite bar |

Preserve Harris's primary terminology in recipe names, but note aliases in descriptions.

### Key Vocabulary

| Term | Definition |
|------|------------|
| Data element | Single value in a data series |
| Data series | Set of related data elements |
| Data graphic | Visual representation of data (bars, lines, symbols) |
| Quantitative scale | Numeric scale showing measured values |
| Category scale | Scale with named items (products, regions, etc.) |
| Sequence scale | Ordered scale (time series, ordinal) |
| Grid lines | Reference lines aiding value estimation |
| Tick marks | Small marks indicating scale divisions |

## Extraction Guidance

### What to Extract

1. **Chart/graph types**: Each distinct visualization type and its variations
2. **Design patterns**: How to construct each type (components, layout)
3. **Variation techniques**: Grouped, stacked, 3D, paired, etc.
4. **Reading techniques**: How to interpret/decode each type
5. **Selection guidance**: When to use each chart type
6. **Component guidance**: How to configure axes, grids, legends, scales
7. **Combination techniques**: Superimposing, juxtaposing multiple graphs

### What NOT to Extract

- Simple definitions without procedural content
- Pure terminology entries with no technique
- Bibliography entries

### Direction Guidance

Most Harris entries support **both** construction and recognition:

- **Construction**: How to build this chart type, what components to include
- **Recognition**: How to read this chart type, what the elements mean

Default to `both` for most chart type entries. Use `construction` for design-focused
techniques. Use `recognition` for interpretation-focused entries.

### Handling Multi-Page Entries

Large entries like "Bar Graph" contain many distinct techniques:

1. **Create separate recipes** for major variations (grouped, stacked, range, etc.)
2. **Create component recipes** for reusable elements (bar and symbol, area bars)
3. **Use relationships** to connect variations to the base entry

Example: "Bar Graph" should yield:
- `simple-bar-graph`
- `grouped-bar-graph`
- `stacked-bar-graph`
- `100-percent-stacked-bar-graph`
- `range-bar-graph`
- `paired-bar-graph`
- etc.

### Visual Extraction

**Critical**: This source requires multimodal extraction. Every technique is demonstrated
with detailed annotated diagrams. Extractors must:

1. **Examine all figures** — They show exactly what the text describes
2. **Note visual components** — Annotated callouts identify structural elements
3. **Capture design features** — Spacing, alignment, labeling conventions
4. **Reference illustrations** — Page numbers where diagrams appear

### Structural Patterns

Recipes from this source will often have:

- **Components**: Visual elements (bars, axes, grid lines, labels)
- **Parameters**: Scale type, data series count, orientation, spacing
- **Related**: Connections between chart type variants
- **Warnings**: Common misuses or readability issues Harris notes

### Extensions to Consider

```yaml
extensions:
  harris_entry: "Bar Graph"                    # Parent entry if recipe is a variation
  alternate_names: ["horizontal bar", "rotated column"]  # Aliases Harris mentions
  typical_use: "comparing values across categories"      # When this type is appropriate
  scale_types:                                 # Axis requirements
    horizontal: "quantitative"
    vertical: "category"
```

### Cross-Reference Notes

Harris includes many cross-references (see X, see also Y). These map to:
- `relationship: variant-of` — for closely related chart types
- `relationship: contains / contained-by` — for component relationships
- `relationship: combines-with` — for charts often used together
- `relationship: contrasts` — for chart types serving different purposes

## Extraction Strategy

Given the encyclopedic structure:

1. **Entry-based extraction**: Each major entry is a candidate for recipes
2. **Variation decomposition**: Break multi-page entries into distinct techniques
3. **Cross-chunk awareness**: Some entries span chunks; note continuations
4. **Visual-first approach**: Start with diagrams, then find supporting text

### Expected Recipe Density

| Chunk Range | Expected Density | Key Entries |
|-------------|------------------|-------------|
| 02-05 (A-B) | High | Area, Axis, Bar, Box, Bubble |
| 06-08 (C) | High | Column, Comparative, Composite, Cumulative |
| 09-13 (C-H) | Moderate-High | Curve, Data, Distribution, Graph, Histogram |
| 14-17 (H-M) | Moderate | Icon, Index, Line, Map |
| 18-22 (O-S) | High | Pie, Polar, Proportional, Range, Scatter, Scale, Stacked |
| 23-26 (S-Z) | Moderate | Symbol, Table, Time series |

## Multimodal Requirements

This source **requires multimodal extraction**. Text-only extraction would miss:
- Annotated diagram callouts identifying components
- Visual variations that text only names
- Design conventions shown but not described
- Before/after or comparison illustrations
- The actual chart types being catalogued

Use PDF files for extraction. Every chunk is a PDF with essential visual content.
