# Phase 2: Structure Design for Harris Information Graphics

## Overview

This document designs the target structure for the synthesized Harris collection. The structure must support **intent-driven visualization selection**: given what a user wants to communicate and their data characteristics, the system should navigate to appropriate chart types and construction guidance.

The design prioritizes:
1. **Traversability** - Clear paths from intent to chart types to construction
2. **Technique reuse** - Cross-cutting patterns extracted once, referenced many times
3. **Fragment unification** - Multiple source files merged into single authoritative recipes
4. **Relationship explicitness** - Connections between concepts are navigable, not buried in prose

---

## 2.1 Organization Scheme

### Directory Structure

```
_synthesized/
  structure.md              # This document
  analysis.md               # Phase 1 analysis

  intents/                  # Communication goals (what user wants to show)
    compare-values.md
    show-change-over-time.md
    show-part-to-whole.md
    show-distribution.md
    show-correlation.md
    show-flow-process.md
    show-hierarchy.md
    show-geographic-patterns.md
    show-range-uncertainty.md
    track-time-activities.md

  techniques/               # Reusable construction patterns
    stacking.md
    grouping.md
    100-percent-normalization.md
    circular-arrangement.md
    matrix-arrangement.md
    proportional-sizing.md
    connecting-linking.md
    three-dimensional.md
    superimposition.md
    juxtaposition.md
    reference-lines.md
    logarithmic-scaling.md

  chart-types/              # Unified chart type recipes
    bar/                    # Bar graph family
      simple-bar-graph.md
      grouped-bar-graph.md
      stacked-bar-graph.md
      100-percent-stacked-bar-graph.md
      range-bar-graph.md
      paired-bar-graph.md
      deviation-bar-graph.md
      progressive-bar-graph.md
      circular-bar-graph.md
      pictorial-bar-graph.md
      area-bar-graph.md
      bar-and-symbol-graph.md

    column/                 # Column graph family
      simple-column-graph.md
      grouped-column-graph.md
      stacked-column-graph.md
      100-percent-stacked-column-graph.md
      range-column-graph.md
      deviation-column-graph.md
      floating-column-graph.md
      histogram.md
      step-column-graph.md

    line/                   # Line graph family
      simple-line-graph.md
      multiple-line-graph.md
      stacked-line-graph.md
      step-line-graph.md
      slope-graph.md
      sparkline.md

    area/                   # Area graph family
      simple-area-graph.md
      stacked-area-graph.md
      100-percent-stacked-area-graph.md
      band-graph.md

    pie/                    # Pie/circular partitions
      pie-chart.md
      donut-chart.md
      exploded-pie-chart.md
      proportional-pie-chart.md

    scatter/                # Scatter/point displays
      scatter-plot.md
      scatter-graph-matrix.md
      bubble-graph.md

    statistical/            # Statistical displays
      box-plot.md
      histogram.md          # (symlink to column/histogram.md)
      frequency-polygon.md
      ogive.md
      stem-and-leaf.md
      normal-probability-graph.md

    flow/                   # Flow and network
      flow-chart.md
      sankey-diagram.md
      network-diagram.md
      decision-tree.md

    hierarchy/              # Hierarchical displays
      organizational-chart.md
      tree-diagram.md
      mosaic-graph.md
      treemap.md
      dendrogram.md

    time/                   # Time-specific displays
      gantt-chart.md
      milestone-chart.md
      pert-chart.md

    geographic/             # Map-based displays
      choropleth-map.md
      proportional-symbol-map.md
      dot-density-map.md
      flow-map.md
      isoline-map.md
      cartogram.md

    comparison/             # Specialized comparison
      radar-graph.md
      parallel-coordinates.md
      back-to-back-graph.md

    range/                  # Range and uncertainty
      high-low-graph.md
      candlestick-chart.md
      error-bar-graph.md

  components/               # Shared building blocks
    axes/
      quantitative-axis.md
      category-axis.md
      sequence-axis.md
      dual-axis.md
      circular-axis.md
    scales/
      linear-scale.md
      logarithmic-scale.md
      probability-scale.md
    grid/
      grid-lines.md
      tick-marks.md
    labels/
      axis-labels.md
      data-labels.md
      legend.md
      title.md
    reference/
      zero-line.md
      reference-line.md
      reference-band.md
    data-graphics/
      bars.md
      lines.md
      points-symbols.md
      areas.md
      segments.md

  data-types/               # Data characteristic definitions
    axis-types.md           # categorical, sequential, quantitative
    series-structure.md     # single, multiple, hierarchical
    value-characteristics.md # positive-only, signed, percentages, ranges
    relationship-types.md   # independent, ordered, continuous, hierarchical, network

  mappings/                 # Machine-readable relationships
    intent-to-charts.yaml   # Intent -> [chart types] with conditions
    chart-to-techniques.yaml # Chart type -> [techniques used]
    data-to-charts.yaml     # Data characteristics -> [compatible charts]
    chart-to-components.yaml # Chart type -> [required/optional components]

  provenance/               # Source tracking
    source-to-synthesis.yaml # Maps source files to synthesized destinations
```

### File Format Conventions

**Markdown files (.md):**
- Human-readable prose with embedded YAML frontmatter
- Used for intents, techniques, chart types, components
- Support rich description, examples, warnings, usage guidance

**YAML files (.yaml):**
- Machine-parseable relationship data
- Used for mappings that enable traversal
- Support queries like "given intent X and data type Y, what charts fit?"

**Symlinks:**
- Avoid duplication where a recipe legitimately belongs in multiple places
- Example: `histogram.md` is both a column variant and a statistical display

---

## 2.2 Recipe Transformations

### 1:1 Mappings (Direct Transfer)

These source recipes map directly to synthesized chart-type recipes with minimal restructuring:

| Source File | Destination |
|-------------|-------------|
| simple-bar-graph.md (04-B1-bar) | chart-types/bar/simple-bar-graph.md |
| grouped-bar-graph.md (04-B1-bar) | chart-types/bar/grouped-bar-graph.md |
| simple-column-graph.md (07-C2-column) | chart-types/column/simple-column-graph.md |
| pie-chart.md (18-OP1) | chart-types/pie/pie-chart.md |
| scatter-plot.md (20-QRS1) | chart-types/scatter/scatter-plot.md |
| box-plot.md (05-B2-box) | chart-types/statistical/box-plot.md |
| flow-chart.md (11-EFG1) | chart-types/flow/flow-chart.md |

For these, transformation means:
- Update frontmatter to reference intents, techniques, components
- Add links to related recipes in synthesized structure
- Preserve all construction and selection guidance
- Note provenance (source location)

### Merging (Fragments -> Unified Recipe)

These concepts appear in multiple source files and must be merged:

| Concept | Source Files | Primary Source | Merge Strategy |
|---------|--------------|----------------|----------------|
| **Mosaic Graph** | 04-B1-bar/mosaic-graph.md, 07-C2-column/mosaic-graph.md, 12-G2-graph/mosaic-graph.md, 16-M2-map/mosaic-graph.md | 16-M2-map (p. 242) | Primary has full construction; others add context |
| **Scatter Graph Matrix** | 12-G2-graph/scatter-graph-matrix.md, 16-M2-map/scatter-graph-matrix.md, 22-S3-slope-stacked/scatter-graph-matrix.md | 16-M2-map (p. 239) | Primary has full treatment; combine unique content |
| **Stacked Bar Graph** | 04-B1-bar/stacked-bar-graph.md, 22-S3-slope-stacked/stacked-bar-graph.md | 04-B1-bar | Primary from main entry; stacked chunk adds technique perspective |
| **Stacked Column Graph** | 07-C2-column/stacked-column-graph.md, 22-S3-slope-stacked/stacked-column-graph.md | 07-C2-column | Same as above |
| **Stacked Area Graph** | 02-A1-abscissa-area/stacked-area-graph.md, 22-S3-slope-stacked/stacked-area-graph.md | 02-A1-abscissa-area | Same as above |
| **Flow Chart** | 10-D2-difference/flow-chart.md, 11-EFG1-flow/flow-chart.md | 11-EFG1-flow (pp. 155-156) | Primary is main entry; other is fragment |
| **Radar Graph** | 19-P2-polar/radar-graph.md, 20-QRS1-quantile/radar-graph.md | 19-P2-polar | Combine both treatments |
| **Histogram** | 13-G3H-histogram/histogram.md + other mentions | 13-G3H-histogram (pp. 187-194) | Primary has extensive treatment |

**Merge Process:**
1. Identify primary source (main entry, most complete)
2. Extract unique content from secondary sources
3. Combine into single recipe, noting all source locations
4. Resolve any contradictions (prefer primary source)
5. Preserve all warnings and usage guidance

### Extraction (Cross-Cutting -> Independent Recipe)

These techniques are described within multiple chart-type entries and should become independent technique recipes:

| Technique | Embedded In | Extract To |
|-----------|-------------|------------|
| **Stacking** | bar-graph, column-graph, area-graph, line-graph, histogram, pie-chart | techniques/stacking.md |
| **Grouping** | bar-graph, column-graph, box-plot | techniques/grouping.md |
| **100% Normalization** | stacked-bar, stacked-column, stacked-area, pie-chart | techniques/100-percent-normalization.md |
| **Circular Arrangement** | bar-graph, column-graph, line-graph, area-graph | techniques/circular-arrangement.md |
| **Matrix Arrangement** | scatter-plot, line-graph (small multiples) | techniques/matrix-arrangement.md |
| **3D Projection** | bar, column, pie, area, scatter | techniques/three-dimensional.md |
| **Connecting/Linking** | stacked-graphs, scatter-plots, flow-charts | techniques/connecting-linking.md |
| **Reference Lines** | most graph types | techniques/reference-lines.md |
| **Logarithmic Scaling** | most graph types with quantitative axes | techniques/logarithmic-scaling.md |

**Extraction Process:**
1. Read all mentions of technique across chart-type entries
2. Synthesize into abstract description (what it is, what it accomplishes)
3. Note which chart types use it
4. Document variations and warnings
5. Chart-type recipes then *reference* the technique rather than embedding it

### Restructuring (Separation of Concerns)

Some recipes need restructuring to separate:
- **Selection guidance** (when to use) -> linked from intent files
- **Construction guidance** (how to build) -> remains in chart-type recipe
- **Component configuration** -> extracted to component recipes

Example restructuring for `simple-bar-graph.md`:

**Before (source recipe):**
```yaml
components:
  - element: horizontal-bars
    encodes: Quantitative values...
  - element: quantitative-scale
    ...
```

**After (synthesized recipe):**
```yaml
intents:
  - compare-values          # Link to intent file

techniques:
  - none                    # Simple form, no technique modifiers

components:
  required:
    - bars                  # Reference to components/data-graphics/bars.md
    - quantitative-axis     # Reference to components/axes/quantitative-axis.md
    - category-axis         # Reference to components/axes/category-axis.md
  optional:
    - grid-lines
    - data-labels
    - reference-line
```

---

## 2.3 Relationship Representation

### Intent -> Chart Type Mappings

File: `mappings/intent-to-charts.yaml`

```yaml
# Intent-to-chart mappings with selection conditions
# Used to answer: "I want to show X, what charts can I use?"

compare-values:
  description: "Compare values across categories at a point in time"
  charts:
    - chart: bar/simple-bar-graph
      when: "Few categories, long labels, horizontal reading preferred"
      strength: primary
    - chart: column/simple-column-graph
      when: "Few categories, short labels, vertical emphasis"
      strength: primary
    - chart: bar/grouped-bar-graph
      when: "Multiple series to compare side-by-side"
      strength: primary
    - chart: comparison/radar-graph
      when: "Multiple variables per entity, profile comparison"
      strength: secondary
    - chart: scatter/scatter-plot
      when: "Comparison on two quantitative dimensions"
      strength: secondary

show-change-over-time:
  description: "Display how values evolve across a time sequence"
  charts:
    - chart: line/simple-line-graph
      when: "Continuous trend, many time points"
      strength: primary
    - chart: column/simple-column-graph
      when: "Discrete periods, emphasize individual values"
      strength: primary
    - chart: area/simple-area-graph
      when: "Emphasize cumulative magnitude"
      strength: secondary
    - chart: line/step-line-graph
      when: "Values change at discrete moments"
      strength: secondary

show-part-to-whole:
  description: "Show how a total divides into component parts"
  charts:
    - chart: pie/pie-chart
      when: "Single breakdown, few categories (2-6), percentages"
      strength: primary
    - chart: bar/stacked-bar-graph
      when: "Multiple entities to compare, totals matter"
      strength: primary
    - chart: bar/100-percent-stacked-bar-graph
      when: "Proportions matter, totals differ"
      strength: primary
    - chart: hierarchy/mosaic-graph
      when: "Multiple levels of hierarchical breakdown"
      strength: secondary
    - chart: hierarchy/treemap
      when: "Deep hierarchy, many small categories"
      strength: secondary

# ... additional intents ...
```

### Technique -> Chart Type Mappings

File: `mappings/chart-to-techniques.yaml`

```yaml
# Which techniques apply to which chart types
# Used to understand chart construction and find related forms

bar/stacked-bar-graph:
  techniques:
    - stacking
  produces:
    - bar/100-percent-stacked-bar-graph  # when combined with normalization

bar/grouped-bar-graph:
  techniques:
    - grouping

bar/circular-bar-graph:
  techniques:
    - circular-arrangement

column/stacked-column-graph:
  techniques:
    - stacking
  produces:
    - column/100-percent-stacked-column-graph

area/stacked-area-graph:
  techniques:
    - stacking
    - connecting-linking  # boundaries often connected

# Technique applicability matrix
techniques:
  stacking:
    applies-to:
      - bar/*-stacked-*
      - column/*-stacked-*
      - area/*-stacked-*
      - line/stacked-line-graph
      - pie/stacked-pie-chart
    produces: "Part-to-whole with visible totals"

  grouping:
    applies-to:
      - bar/grouped-*
      - column/grouped-*
      - statistical/box-plot  # when grouped
    produces: "Direct side-by-side comparison"

  circular-arrangement:
    applies-to:
      - bar/circular-bar-graph
      - column/circular-column-graph
      - line/circular-line-graph
      - comparison/radar-graph
    produces: "Cyclical pattern emphasis, angular comparison"
```

### Data Requirements -> Chart Type Constraints

File: `mappings/data-to-charts.yaml`

```yaml
# Data characteristics and compatible chart types
# Used to answer: "Given my data structure, what charts can I use?"

axis-requirements:
  categorical-x:
    compatible:
      - bar/*
      - column/*
      - pie/*
    notes: "Discrete named categories, order not meaningful"

  sequential-x:
    compatible:
      - column/*
      - line/*
      - area/*
    notes: "Ordered sequence, typically time"

  quantitative-both:
    compatible:
      - scatter/*
    notes: "Both axes measure quantities"

series-requirements:
  single-series:
    compatible:
      - bar/simple-bar-graph
      - column/simple-column-graph
      - line/simple-line-graph
      - pie/pie-chart

  multiple-independent:
    compatible:
      - bar/grouped-bar-graph
      - column/grouped-column-graph
      - line/multiple-line-graph
      - scatter/scatter-plot  # with color/symbol encoding

  multiple-additive:
    compatible:
      - bar/stacked-bar-graph
      - column/stacked-column-graph
      - area/stacked-area-graph
      - pie/pie-chart  # if one breakdown
    requires: "Series sum to meaningful whole"

  hierarchical:
    compatible:
      - hierarchy/mosaic-graph
      - hierarchy/treemap
      - hierarchy/organizational-chart
    requires: "Parent-child relationships"

value-requirements:
  positive-only:
    compatible: "*"  # All charts work with positive values

  positive-and-negative:
    compatible:
      - bar/deviation-bar-graph
      - column/deviation-column-graph
      - line/*
      - scatter/*
    incompatible:
      - pie/*
      - bar/stacked-*
      - column/stacked-*
      - area/stacked-*
    notes: "Stacking requires same-sign values; pies need positive"

  ranges:
    compatible:
      - bar/range-bar-graph
      - column/range-column-graph
      - range/high-low-graph
      - statistical/box-plot
      - range/error-bar-graph
```

### Chart Type -> Component Composition

File: `mappings/chart-to-components.yaml`

```yaml
# What components make up each chart type
# Used for modular construction guidance

bar/simple-bar-graph:
  required:
    - data-graphics/bars
    - axes/category-axis
    - axes/quantitative-axis
  optional:
    - grid/grid-lines
    - labels/data-labels
    - labels/legend
    - reference/reference-line
  configuration:
    bars:
      orientation: horizontal
      width: uniform
      spacing: uniform-gaps
    axes:
      quantitative: horizontal
      category: vertical

column/simple-column-graph:
  required:
    - data-graphics/bars  # Same component, different orientation
    - axes/category-axis
    - axes/quantitative-axis
  optional:
    - grid/grid-lines
    - labels/data-labels
    - labels/legend
    - reference/reference-line
  configuration:
    bars:
      orientation: vertical
      width: uniform
      spacing: uniform-gaps
    axes:
      quantitative: vertical
      category: horizontal

scatter/scatter-plot:
  required:
    - data-graphics/points-symbols
    - axes/quantitative-axis  # X
    - axes/quantitative-axis  # Y
  optional:
    - grid/grid-lines
    - labels/data-labels
    - reference/reference-line
    - lines  # Trend line, regression
  configuration:
    axes:
      both: quantitative

pie/pie-chart:
  required:
    - data-graphics/segments
    - labels/legend  # or direct labels
  optional:
    - labels/data-labels
  configuration:
    layout: circular
    segments:
      encoding: angle/area
      sum: 360-degrees (100%)
```

---

## 2.4 Key Decisions

### Decision 1: Family-Based Chart Type Organization

**Choice:** Organize chart types by visual family (bar, column, line, etc.) rather than by intent or data type.

**Rationale:**
- Harris organizes by chart name; preserving this makes source-to-synthesis mapping clear
- Variants within a family share construction fundamentals (grouped-bar is built on simple-bar)
- Enables progressive disclosure: learn simple form, then variations
- Mappings handle the intent-to-chart traversal; chart-type files focus on construction

**Trade-off:** Users must traverse through mappings to find charts; cannot browse by intent directly. Mitigated by intent files that list compatible charts.

### Decision 2: Techniques as First-Class Recipes

**Choice:** Extract cross-cutting techniques into independent recipe files that chart types reference.

**Rationale:**
- Avoids duplicating stacking description in 6+ chart-type recipes
- Enables systematic exploration: "What other charts use stacking?"
- Aligns with how Harris actually describes these patterns (appearing across many entries)
- Supports composition: stacking + normalization = 100% stacked

**Trade-off:** Chart-type recipes are not self-contained; require following references. Mitigated by keeping core construction guidance in chart-type files and only abstracting the reusable technique.

### Decision 3: YAML for Traversal, Markdown for Description

**Choice:** Use YAML files for machine-parseable mappings; Markdown files for human-readable guidance.

**Rationale:**
- Mappings are essentially lookup tables; YAML makes queries explicit
- Prose guidance (when to use, warnings, examples) suits Markdown
- Separation enables different consumption patterns (human browse vs. programmatic query)
- YAML is already used in recipe frontmatter; extending to mapping files is consistent

**Trade-off:** Information split across file types. Mitigated by clear naming conventions and cross-references.

### Decision 4: Symlinks for Dual Membership

**Choice:** Use symlinks when a recipe legitimately belongs in multiple locations.

**Rationale:**
- Histogram is both a column-graph variant and a statistical display
- Radar graph is both a comparison tool and a circular arrangement
- Symlinks avoid duplication while preserving browsability

**Trade-off:** Symlinks can break or confuse some tools. Mitigated by documenting symlink relationships in the mappings.

### Decision 5: Provenance Tracking in Separate File

**Choice:** Maintain `provenance/source-to-synthesis.yaml` mapping source files to synthesized destinations.

**Rationale:**
- Enables validation that all 379 source recipes contributed
- Supports debugging: "Where did this guidance come from?"
- Keeps individual recipes cleaner (brief source reference vs. full inventory)

**Trade-off:** Provenance not immediately visible in each recipe. Mitigated by including brief source citation in each recipe's frontmatter.

### Decision 6: Intent Files List Charts, Not Vice Versa

**Choice:** Intent files enumerate compatible chart types; chart-type files link to relevant intents.

**Rationale:**
- Primary use case is intent-driven selection: "I want to show X" -> find charts
- Intent files become the entry points for selection workflow
- Chart-type files become the destination for construction workflow

**Trade-off:** Bidirectional consistency must be maintained. Mitigated by generating chart->intent links from the authoritative intent->chart mappings.

### Decision 7: Flatten Secondary Mentions

**Choice:** Secondary mentions (e.g., mosaic graph mentioned within bar graph entry) are absorbed into the primary recipe, not preserved as separate files.

**Rationale:**
- Preserves Harris's knowledge without duplication
- Primary entry has construction details; secondary mentions add context/examples
- Provenance file tracks where all content came from

**Trade-off:** Some context from secondary mentions might be lost. Mitigated by explicitly reviewing secondary sources during merge and incorporating unique content.

---

## Summary

The synthesized structure supports three navigation patterns:

1. **Intent-driven selection:**
   `intents/*.md` -> `mappings/intent-to-charts.yaml` -> `chart-types/**/*.md`

   User starts with "I want to show change over time" and navigates to line graph, column graph, or area graph options with guidance on when each is appropriate.

2. **Data-driven constraint:**
   `data-types/*.md` -> `mappings/data-to-charts.yaml` -> filtered chart options

   User specifies "I have hierarchical categorical data with negative values" and sees which charts are compatible (not stacked, not pie).

3. **Construction reference:**
   `chart-types/**/*.md` -> `techniques/*.md` + `components/**/*.md`

   User building a stacked bar graph follows references to the stacking technique and bar/axis component specifications.

Total estimated synthesized files:
- ~10 intent files
- ~12 technique files
- ~60 chart-type files (after merging)
- ~20 component files
- ~4 data-type files
- ~4 mapping files
- 1 provenance tracking file

This structure transforms Harris's alphabetical encyclopedia into a navigable knowledge system optimized for intent-driven visualization selection.
