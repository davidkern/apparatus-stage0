# Phase 1 Analysis: Harris Information Graphics Collection

## Overview

This analysis examines 379 recipes extracted from Robert L. Harris's "Information Graphics: A Comprehensive Illustrated Reference" (1996). The recipes span 25 chunk directories (02-26), covering chart types, components, techniques, and conceptual guidance.

The collection is encyclopedic in structure. Harris organized entries alphabetically by chart name, but the underlying knowledge is organized around purposes, data types, and construction techniques. This analysis identifies those latent structures to support intent-driven visualization selection.

---

## 1.1 Communication Intents

The extracted recipes reveal distinct communication goals that visualizations serve. Each intent maps to multiple chart types that can accomplish it under different circumstances.

### Compare Values Across Categories
Show how different entities compare on a quantitative measure at a point in time.

**Chart types serving this intent:**
- Simple bar graph (horizontal comparison)
- Simple column graph (vertical comparison)
- Grouped bar graph (multiple series comparison)
- Grouped column graph (multiple series comparison)
- Paired bar graph (two opposing series)
- Back-to-back graphs (comparative juxtaposition)
- Radar graph (multivariate profile comparison)
- Dot plot / point graph (precise value comparison)

**Data requirements:** Categorical variable (entities) + quantitative variable (measure). Single point in time or aggregated period.

### Show Change Over Time
Display how values evolve across a time sequence.

**Chart types serving this intent:**
- Line graph (continuous trends)
- Column graph (discrete periods)
- Step line graph (discrete changes)
- Area graph (emphasizing magnitude)
- Stacked area graph (component trends)
- Time series graph (any of above with time axis)
- Sparklines (compact trend display)

**Data requirements:** Time/sequence scale + quantitative values. May have single or multiple data series.

### Reveal Part-to-Whole Relationships
Show how a total is divided into component parts.

**Chart types serving this intent:**
- Pie chart (proportions of whole)
- Donut chart (pie with center removed)
- 100% stacked bar graph (proportional composition)
- 100% stacked column graph (proportional composition over time)
- Stacked bar graph (components with totals visible)
- Stacked column graph (components over time)
- Mosaic graph (hierarchical decomposition)
- Treemap (nested proportional areas)
- Single stacked bar (one-time breakdown)

**Data requirements:** Categories that sum to a meaningful whole. Values must be positive.

### Display Distribution of Values
Show how frequently different values occur in a dataset.

**Chart types serving this intent:**
- Histogram (frequency of continuous values)
- Frequency polygon (smooth distribution curve)
- Box plot/graph (summary statistics)
- One-axis data distribution graph (individual points)
- Cumulative frequency graph / Ogive (running totals)
- Stem-and-leaf chart (digit-based distribution)
- Dot array (unit-based distribution)
- Normal probability graph (normality testing)

**Data requirements:** Continuous quantitative data, preferably with enough observations to show meaningful patterns.

### Expose Correlation Between Variables
Reveal relationships between two or more quantitative variables.

**Chart types serving this intent:**
- Scatter plot/graph (bivariate relationship)
- Scatter graph matrix (all pairwise correlations)
- Bubble graph (scatter with third variable as size)
- Correlation matrix (numeric summary)
- Residual plot (deviation from fit)
- Q-Q plot (comparing distributions)

**Data requirements:** Two or more quantitative variables measured on the same observations.

### Show Flow or Process
Depict sequential steps, decisions, and movement through a system.

**Chart types serving this intent:**
- Flow chart (process steps and decisions)
- Flow diagram (system logic)
- Flow map (movement through geography)
- Sankey diagram (proportional flow)
- Network diagram (connections)
- PERT chart (project dependencies)
- Decision tree (branching choices)
- Organizational chart (authority flow)

**Data requirements:** Steps/nodes + connections/transitions. May include sequence, branching, loops.

### Depict Hierarchy or Structure
Show organizational or taxonomic relationships.

**Chart types serving this intent:**
- Organizational chart (reporting structure)
- Tree diagram (hierarchical categories)
- Mosaic graph (nested proportions)
- Decomposition graph (breakdown levels)
- Dendrogram (clustering hierarchy)
- Venn diagram (set relationships)

**Data requirements:** Parent-child relationships or containment structure.

### Display Geographic Patterns
Show how values or phenomena vary across physical space.

**Chart types serving this intent:**
- Choropleth map (shaded regions)
- Dot density map (points showing quantity)
- Proportional symbol map (sized symbols)
- Flow map (movement patterns)
- Isoline/contour map (continuous surfaces)
- Statistical map (any thematic overlay)
- Cartogram (distorted by value)

**Data requirements:** Geographic locations + associated values or categories.

### Show Range, Uncertainty, or Variability
Display spread, bounds, or confidence around values.

**Chart types serving this intent:**
- Range bar graph (upper/lower bounds)
- High-low graph (min/max)
- Box plot (statistical summary)
- Error bars (confidence intervals)
- Band graph (filled range)
- Envelope graph (boundary curves)
- Candlestick chart (open/high/low/close)

**Data requirements:** Central value + upper/lower bounds OR raw data for computing statistics.

### Track Time and Activities
Plan, schedule, and monitor tasks over time.

**Chart types serving this intent:**
- Gantt chart / Time and activity bar chart
- Milestone chart
- PERT chart
- Critical path diagram
- Schedule loading chart

**Data requirements:** Activities + start/end times. Optional: dependencies, resources, progress.

---

## 1.2 Reusable Techniques

These construction patterns appear across multiple chart types. They are independent of specific chart forms and can be applied as modifiers or enhancements.

### Stacking (Cumulative Display)
Place data series on top of each other so that values accumulate.

**Applies to:** Bar graph, column graph, area graph, line graph, histogram, pie chart

**What it accomplishes:**
- Shows component contributions to totals
- Enables part-to-whole comparisons
- Reveals cumulative patterns

**Variations:**
- Simple stacking (absolute values)
- 100% stacking (normalized to percentages)
- Connected stacking (lines linking segment boundaries)

**Warnings:** Only bottom segment can be read precisely; interior segments are hard to compare.

### Grouping (Side-by-Side Comparison)
Arrange multiple data series adjacent to each other at each category.

**Applies to:** Bar graph, column graph, box plot

**What it accomplishes:**
- Enables direct comparison of values across series
- Shows relationships between series at each category
- Supports correlation detection

**Warnings:** More than 3-4 series becomes confusing.

### 100% Normalization
Convert absolute values to percentages of whole.

**Applies to:** Stacked bar, stacked column, stacked area, pie chart

**What it accomplishes:**
- Enables fair comparison when totals differ
- Focuses attention on proportional composition
- Removes magnitude variation

**Warnings:** Loses absolute value information.

### Circular Arrangement
Wrap linear forms around a center point.

**Applies to:** Bar graph, column graph, line graph, area graph

**What it accomplishes:**
- Shows cyclical patterns (time of day, seasons)
- Enables comparison along angular dimension
- Creates visual emphasis on center/periphery

**Chart type mappings:**
- Circular bar graph
- Circular column graph
- Circular line graph
- Circular area graph
- Radar/spider graph
- Polar graph

### Matrix Arrangement (Small Multiples)
Organize multiple instances in rows and columns.

**Applies to:** Any chart type, scatter plots especially

**What it accomplishes:**
- Enables systematic comparison across many variables
- Reveals patterns across conditions
- Supports exploration of multivariate data

**Variations:**
- Graph matrix (same chart type repeated)
- Scatter graph matrix (all variable pairs)
- Trellis/lattice display (conditioned on variables)
- Icon comparison display

### Proportional Sizing
Encode value in the size of visual elements.

**Applies to:** Symbols, bubbles, pies, bars (width), segments

**What it accomplishes:**
- Adds quantitative dimension to position-based charts
- Creates visual hierarchy by magnitude
- Enables comparison without scales

**Perceptual issues:** Viewers underestimate larger areas; consider apparent-magnitude correction.

### Connecting/Linking
Draw lines between related elements.

**Applies to:** Stacked graphs, scatter plots, flow charts, network diagrams

**What it accomplishes:**
- Shows relationships and dependencies
- Emphasizes trends in segment boundaries
- Creates visual flow

**Variations:**
- Connecting lines between stacked segments
- Drop lines to axes
- Dependency arrows in Gantt charts

### Three-Dimensional Projection
Add depth perspective to two-dimensional forms.

**Applies to:** Bar, column, pie, area, scatter, surface graphs

**What it accomplishes:**
- Aesthetic appeal
- Can show third variable (true 3D)
- Creates visual impact

**Warnings:** Usually reduces accuracy of decoding. Oblique views can obscure data. Rarely recommended for analytical purposes.

### Superimposition
Overlay multiple graph types on shared axes.

**Applies to:** Any combination of line, bar, column, area graphs

**What it accomplishes:**
- Shows relationships between different measures
- Enables comparison of scales and patterns
- Combines data types on one display

**Requirements:** Common axis (usually X-axis) to align data.

### Juxtaposition
Place related graphs adjacent for comparison.

**Applies to:** Any chart type

**What it accomplishes:**
- Enables comparison without overlay complexity
- Shows complementary information
- Supports before/after or experimental comparison

**Variations:**
- Comparative (same data, different views)
- Complementary (related data, same view)
- Back-to-back (mirror image arrangement)

### Reference Lines and Bands
Add horizontal or vertical lines marking significant values.

**Applies to:** Most graph types

**What it accomplishes:**
- Shows targets, thresholds, averages
- Provides context for interpretation
- Enables "above/below" judgments

**Types:** Single reference lines, bands (ranges), zero-base emphasis

### Logarithmic Scaling
Use logarithmic rather than linear axis.

**Applies to:** Any graph with quantitative axis

**What it accomplishes:**
- Handles wide data ranges
- Reveals percentage/ratio changes
- Makes growth rates visible

**Warnings:** Cannot include zero or negative values.

---

## 1.3 Data Requirements

Chart selection depends on data characteristics. This section identifies the dimensions that constrain visualization choices.

### Axis Types

**Categorical axis:**
- Discrete named items (products, regions, people)
- No inherent order or order not meaningful
- Spacing between items has no quantitative meaning

**Suitable charts:** Bar graph, grouped bar, pie chart, dot plot

**Sequential/Ordinal axis:**
- Ordered items (time periods, rankings, stages)
- Order matters but spacing may or may not
- Can be discrete periods or continuous

**Suitable charts:** Column graph, line graph, area graph, step graph

**Quantitative axis:**
- Continuous numeric values
- Both position and distance are meaningful
- Can be linear or logarithmic

**Suitable charts:** Scatter plot, histogram, line graph (as continuous)

### Data Series Structure

**Single series:**
- One set of values
- Simple comparison or trend

**Charts:** Simple bar, simple column, simple line, simple area, pie chart

**Multiple independent series:**
- Several sets of values to compare
- No additive relationship

**Charts:** Grouped bar, grouped column, multiple line, scatter matrix

**Multiple additive series (parts of whole):**
- Series sum to meaningful total
- Part-to-whole relationships

**Charts:** Stacked bar, stacked column, stacked area, pie chart

**Hierarchical series:**
- Nested levels of aggregation
- Parent-child relationships

**Charts:** Mosaic graph, treemap, sunburst, organizational chart

### Value Characteristics

**Positive only:**
- All values above zero
- Suitable for most chart types

**Positive and negative:**
- Values above and below zero
- Requires deviation/diverging format
- Stacked charts become problematic

**Charts:** Deviation bar, deviation column, signed bar, waterfall

**Percentages (sum to 100%):**
- Part-to-whole relationships
- All values between 0-100%

**Charts:** Pie chart, 100% stacked bar, 100% stacked column

**Ranges (upper/lower bounds):**
- Values have extent, not just position
- May include central tendency

**Charts:** Range bar, box plot, error bars, band graph, high-low

### Relationship Types

**Independent categories:**
- No inherent connection between items
- Order arbitrary

**Examples:** Product categories, geographic regions, survey responses

**Ordered sequence:**
- Items have meaningful order
- Adjacent items are more related

**Examples:** Time periods, age groups, process stages

**Continuous range:**
- Values from continuous distribution
- Any value in range is possible

**Examples:** Measurements, prices, temperatures

**Hierarchical containment:**
- Items nested within other items
- Part-of relationships

**Examples:** Organizational structure, geographic hierarchy, taxonomy

**Network connections:**
- Items linked to other items
- Many-to-many relationships

**Examples:** Social networks, dependencies, flow paths

---

## 1.4 Shared Components

Chart types share common building blocks. Understanding these components enables modular construction guidance.

### Axes

**Quantitative axis:**
- Scale line with tick marks
- Numeric labels
- Optional title
- Linear or logarithmic spacing
- Must start at zero for area-based comparisons

**Category axis:**
- Scale line with positions for each category
- Text labels for categories
- Optional title
- Equal spacing typical

**Sequence axis:**
- Scale line with ordered positions
- Labels for time periods or ordered items
- Tick mark density varies with data density

**Dual axis:**
- Two quantitative scales on opposite sides
- Different units or ranges
- Requires care to avoid misleading comparisons

### Scales

**Linear scale:**
- Equal increments = equal distances
- Starts at zero for accurate comparison
- Most common choice

**Logarithmic scale:**
- Equal ratios = equal distances
- Cannot include zero
- Shows percentage changes

**Probability scale:**
- Specialized for cumulative distributions
- Normal probability for normality testing

**Circular/Angular scale:**
- 0-360 degrees (or radians)
- For polar and circular graphs

### Grid Lines

**Major grid lines:**
- Aligned with major tick marks
- Aid value estimation
- Should be visually subordinate to data

**Minor grid lines:**
- Subdivide major intervals
- Add precision
- Risk creating clutter

**Horizontal vs. vertical:**
- Horizontal aids Y-value reading
- Vertical aids X-position tracking
- Both create full grid

### Labels

**Axis labels:**
- Identify what axis represents
- Include units if applicable

**Data labels:**
- Show actual values on or near data elements
- Reduce need for scale reading
- Risk clutter with many data points

**Legend:**
- Key for decoding multiple series
- Maps colors/patterns/symbols to meanings
- Should be close to data

**Title:**
- Describes what graph shows
- Should be informative, not just descriptive

### Reference Elements

**Zero line:**
- Baseline for positive/negative data
- Often emphasized

**Reference lines:**
- Mark significant values (targets, averages, thresholds)
- Can be horizontal or vertical

**Reference bands:**
- Mark significant ranges
- Often shaded differently

### Tick Marks

**Major ticks:**
- Mark scale divisions
- Align with grid lines and labels

**Minor ticks:**
- Subdivide major intervals
- Add precision without labels

**Placement:**
- Inside frame, outside frame, or crossing frame
- Affects available plot area

### Data Graphics

**Points/Symbols:**
- Mark individual data values
- Shape can encode category
- Size can encode quantity

**Lines:**
- Connect points to show continuity
- Style (solid, dashed) can encode series

**Bars/Columns:**
- Rectangles encoding values by length
- Bars horizontal, columns vertical
- Width typically uniform

**Areas:**
- Filled regions under curves or between bounds
- Emphasize magnitude

**Segments:**
- Divisions within stacked elements
- Differentiated by fill

---

## 1.5 Fragment Inventory

The following concepts appear in multiple source files. The table identifies primary entries (main treatment) versus secondary entries (mentions within other topics).

### Duplicated Recipe Files

| Concept | Files | Primary Source | Secondary Sources |
|---------|-------|----------------|-------------------|
| Mosaic Graph | 4 files | 16-M2-map (p. 242) | 04-B1-bar (p. 48), 07-C2-column (p. 90), 12-G2-graph (p. 172) |
| Scatter Graph Matrix | 3 files | 16-M2-map (p. 239) | 12-G2-graph (p. 179), 22-S3-slope-stacked (p. 359) |
| Stacked Bar Graph | 2 files | 04-B1-bar (pp. 39-40) | 22-S3-slope-stacked (p. 358) |
| Stacked Column Graph | 2 files | 07-C2-column (pp. 83-84) | 22-S3-slope-stacked (p. 358) |
| Stacked Area Graph | 2 files | 02-A1-abscissa-area | 22-S3-slope-stacked (p. 358) |
| Flow Chart | 2 files | 11-EFG1-flow (pp. 155-156) | 10-D2-difference (pp. 153-154) |
| Radar Graph | 2 files | 19-P2-polar | 20-QRS1-quantile |
| Error Bar | 2 files | 20-QRS1-quantile | 10-D2-difference |
| Histogram | 2 files | 13-G3H-histogram (pp. 187-194) | other mentions |
| Donut Chart | 2 files | 10-D2-difference | other mentions |
| High-Low Graph | 2 files | 20-QRS1-quantile | other mentions |
| Change Graph | 2 files | 06-C1-cake | 10-D2-difference |
| Category Scale | 2 files | 06-C1-cake | 21-S2-scale |
| Circular Bar/Column | 2 files each | 04-B1-bar / 06-C1-cake | other mentions |
| Area Bar/Column Graph | 2 files each | 02-A1-abscissa | 04-B1-bar |
| Frequency Polygon | 2 files | 13-G3H-histogram | other mentions |

### The Stacked Chunk (22-S3-slope-stacked)

Chunk 22 contains many brief treatments of stacking applied to various chart types. These are typically secondary references pointing back to fuller treatments in the main chart type entries:

- stacked-bar-graph.md - secondary (primary in 04-B1-bar)
- stacked-column-graph.md - secondary (primary in 07-C2-column)
- stacked-area-graph.md - secondary (primary in 02-A1-abscissa-area)
- stacked-line-graph.md - may be primary
- stacked-histogram.md - may be primary
- stacked-pie-chart.md - may be primary

### Cross-Reference Patterns

Harris's cross-references create a web of relationships:

1. **Variant relationships:** stacked-bar-graph variant-of simple-bar-graph
2. **Contains relationships:** mosaic-graph contains 100-percent-stacked-bar
3. **Contrasts relationships:** bar-graph contrasts column-graph
4. **Combines-with relationships:** noted but less formalized

### Synthesis Implications

For Phase 3 synthesis:

1. **Merge fragments** for concepts with multiple source files:
   - Mosaic graph: combine 4 sources, prioritize p. 242
   - Scatter graph matrix: combine 3 sources, prioritize p. 239
   - Stacked variants: combine main chart entry + stacked chunk

2. **Extract techniques** that appear across chart types:
   - Stacking is described within bar, column, area, line, histogram, pie
   - Should become independent technique recipe
   - Chart type recipes reference the technique

3. **Preserve provenance** by noting all contributing source locations in synthesized recipes.

---

## Summary Statistics

- **Total recipes extracted:** 379
- **Chunk directories:** 25 (02-26)
- **Recipes per chunk:** 7-24 (average ~15)
- **Identified duplicates:** 35+ files representing ~17 concepts
- **Communication intents identified:** 10 major categories
- **Reusable techniques identified:** 13 major patterns
- **Data requirement dimensions:** 5 (axis types, series structure, value characteristics, relationship types, special cases)
- **Shared component types:** 6 major categories

---

## Next Steps (Phase 2)

Based on this analysis, Phase 2 will design:

1. **Organization scheme** for the synthesized collection
2. **Recipe transformation rules** (1:1, merge, extract, restructure)
3. **Relationship representation** (YAML mappings, directory structure, symlinks)
4. **Intent-to-chart-type navigation** structure
