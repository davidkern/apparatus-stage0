# Generate Chunk Extractions for Harris Information Graphics

Instantiated prompt for generating chunk subdirectories and extraction prompts.

---

You are generating chunk-level structure for recipe extraction.

## Generator

Read for guidance: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/generate-multimodal-chunk-extractions.md`

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/harris-information-graphics/_context.md`

## Source Material

Directory: `/work/apparatus-research/reference/harris-information-graphics/chunks/`

## Chunk Structure

Create the following chunk directories, each with `_prompt/extract.md`:

| Chunk | Directory | PDF File | Content |
|-------|-----------|----------|---------|
| 01 | `01-frontmatter/` | 01-frontmatter.pdf | Title, organization overview |
| 02 | `02-A1-abscissa-area/` | 02-A1-abscissa-area.pdf | Abscissa, Adjustment, Area graph |
| 03 | `03-A2-axis/` | 03-A2-axis.pdf | Axis entries |
| 04 | `04-B1-bar/` | 04-B1-bar.pdf | Bar graph entries |
| 05 | `05-B2-box/` | 05-B2-box.pdf | Box graph, Bubble graph |
| 06 | `06-C1-cake-chart/` | 06-C1-cake-chart.pdf | Cake chart, Category |
| 07 | `07-C2-column/` | 07-C2-column.pdf | Column graph |
| 08 | `08-C3-comparative-cumulative/` | 08-C3-comparative-cumulative.pdf | Comparative, Cumulative |
| 09 | `09-C4D1-data/` | 09-C4D1-data.pdf | Curve, Data entries |
| 10 | `10-D2-difference-distribution/` | 10-D2-difference-distribution.pdf | Difference, Distribution |
| 11 | `11-EFG1-flow-font-graph/` | 11-EFG1-flow-font-graph.pdf | Flow chart, Font, Graph |
| 12 | `12-G2-graph/` | 12-G2-graph.pdf | Graph (core) |
| 13 | `13-G3H-histogram/` | 13-G3H-histogram.pdf | Graph (cont.), Histogram |
| 14 | `14-HIK-icon-index/` | 14-HIK-icon-index.pdf | Icon, Index |
| 15 | `15-L1M1-line-map/` | 15-L1M1-line-map.pdf | Line graph, Map |
| 16 | `16-M2-map/` | 16-M2-map.pdf | Map (core) |
| 17 | `17-M3N-map-normal/` | 17-M3N-map-normal.pdf | Map (cont.), Normal |
| 18 | `18-OP1-patch-pie-plot/` | 18-OP1-patch-pie-plot.pdf | Patch, Pie, Plot |
| 19 | `19-P2-polar-proportional/` | 19-P2-polar-proportional.pdf | Polar, Proportional |
| 20 | `20-QRS1-quantile-range-scatter/` | 20-QRS1-quantile-range-scatter.pdf | Quantile, Range, Scatter |
| 21 | `21-S2-scale-sequence/` | 21-S2-scale-sequence.pdf | Scale, Sequence |
| 22 | `22-S3-slope-stacked/` | 22-S3-slope-stacked.pdf | Slope, Stacked |
| 23 | `23-S4T1-symbol-table/` | 23-S4T1-symbol-table.pdf | Symbol, Table |
| 24 | `24-T2-text-time/` | 24-T2-text-time.pdf | Text, Time series |
| 25 | `25-T3V-topo-variable/` | 25-T3V-topo-variable.pdf | Topographic, Variable |
| 26 | `26-WZ-weather-zone/` | 26-WZ-weather-zone.pdf | Weather, Zone, Bibliography |

**Note**: Skip `01-frontmatter` for extraction — it contains only title/copyright info, no recipes.

## Output Structure

```
harris-information-graphics/
├── _context.md                           (exists)
├── _prompt/
│   ├── generate-chunks.md                (this file)
│   └── consolidate.md                    (exists)
├── 02-A1-abscissa-area/
│   └── _prompt/
│       └── extract.md
├── 03-A2-axis/
│   └── _prompt/
│       └── extract.md
├── ...
└── 26-WZ-weather-zone/
    └── _prompt/
        └── extract.md
```

## Extraction Prompt Template

Each `extract.md` should:

1. Reference the source `_context.md`
2. Specify which PDF file to examine
3. List the entries this chunk covers (from _source.yaml content notes)
4. Include visual extraction guidance from multimodal generator
5. Reference `recipes/SCHEMA.md` for output format
6. Reference `recipes/_context.md` for general extraction guidance

## Special Considerations

### Encyclopedic Structure

This is an encyclopedia, not a linear text. Each chunk contains multiple independent
entries arranged alphabetically. Extraction should:

- Treat each major entry as a potential recipe source
- Break large entries into multiple recipes for distinct variations
- Note when entries continue into the next chunk

### Entry Continuation

Some entries span chunk boundaries:

- **Bar Graph**: Continues from chunk 04 into chunk 05
- **Graph**: Spans chunks 11, 12, 13
- **Map**: Spans chunks 15, 16, 17

Extraction prompts should note:
- For starting chunks: "Entry continues in next chunk"
- For continuation chunks: "Continued from previous chunk"

### High-Density Chunks

These chunks contain major entries with many variations:

- **04-B1-bar**: Bar graph with 10+ variations
- **07-C2-column**: Column graph with similar variation density
- **12-G2-graph**: Core graph terminology and multiple graph uses
- **18-OP1-patch-pie-plot**: Three major chart types

Extraction prompts for these should emphasize creating separate recipes for each
distinct variation rather than one monolithic recipe.

### Component vs. Chart Type Entries

Some entries describe components (Axis, Grid, Scale) rather than chart types. These
should yield recipes about:
- How to configure the component
- When to use different variations
- How components interact with chart types

### Visual Density

Every chunk is graphics-heavy. Every entry has annotated diagrams. Extraction prompts
must emphasize:
- Examining all figures
- Capturing component labels from annotated diagrams
- Noting design conventions shown in illustrations

## Task

1. Create chunk directories 02-26 with `_prompt/` subdirectories (skip 01-frontmatter)
2. Create self-contained `extract.md` for each chunk
3. Ensure each extraction prompt can stand alone (includes all necessary references)
4. Note entry continuations where they occur

## Agency

You may:
- Adjust which entries are noted for each chunk based on PDF examination
- Add chunk-specific guidance for particularly complex entries
- Emphasize different extraction approaches (chart types vs. components)
