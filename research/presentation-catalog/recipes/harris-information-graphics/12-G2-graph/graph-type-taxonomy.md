---
name: Graph Type Taxonomy
slug: graph-type-taxonomy
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Terminology, p. 176"

intent: Classify and select appropriate graph types based on data characteristics, scale types, and number of data series
direction: both

components:
  - element: graph-family
    encodes: Basic visual form (point, line, area, column)
  - element: horizontal-scale-type
    encodes: Category, sequence, or quantitative scale
  - element: data-series-count
    encodes: Single or multiple data series
  - element: data-point-relationship
    encodes: How data points relate to axes (common X, unique pairs)

parameters:
  graph_family: "point | line | area | column"
  horizontal_scale: "category | sequence | quantitative"
  series_count: "single | multiple"

related: []  # TBD: scatter-graph, line-graph, area-graph, column-graph

extensions:
  harris_entry: "Graph"
  taxonomy_basis: "scale type and data series count"
---

## Description

Graph type selection depends on multiple factors: the basic configuration (point, line, area, column), the type of horizontal scale (category, sequence, quantitative), and whether single or multiple data series are plotted. Harris provides a comprehensive taxonomy table showing how these factors combine.

## Examples

Harris presents a systematic table (p. 176) organizing graphs by family and scale type:

**Point Graph Family:**
- Category scale, single series: Simple point graph
- Sequence scale, single series: Simple point graph  
- Quantitative scale, single series: Simple scatter graph
- Multiple series with common X coordinates: Grouped point graph
- Multiple series with unique X-Y pairs: Grouped scatter graph (paired)

**Line Graph Family:**
- Category scale, single series: Simple line graph
- Sequence scale, single series: Simple line graph
- Quantitative scale, single series: Simple scatter line graph
- Multiple series: Grouped line graph or grouped scatter line graph

**Area Graph Family:**
- Category scale, single series: Simple area graph
- Sequence scale, single series: Simple area graph
- Quantitative scale, single series: Simple area graph
- Multiple series: Grouped or overlapped area graph

**Column Graph Family:**
- Category scale, single series: Simple column graph
- Sequence scale, single series: Simple column graph (sometimes called vertical line graph)
- Quantitative scale, single series: Histogram (discrete data or intervals)
- Multiple series: Grouped column graph, vertical line graph, or histogram

Key distinction for multiple series:
> "All data series use common X-axis coordinates. Each data point has a unique Y-axis coordinate."

vs.

> "All data points have a unique pair of X and Y axis coordinates."

## Usage

Selection process:
1. Identify whether horizontal scale is category, sequence, or quantitative
2. Determine if plotting single or multiple data series
3. For multiple series, determine if they share X coordinates or have unique X-Y pairs
4. Select graph family based on what aspect to emphasize (discrete values, trends, cumulative, comparison)

Scale type guidance:
- **Category scale**: Named items (products, regions) - no inherent order
- **Sequence scale**: Ordered items (time periods, stages) - order matters
- **Quantitative scale**: Numeric values (measurements) - intervals meaningful

Graph family guidance:
- **Point**: Emphasize discrete data values
- **Line**: Emphasize trends and connections between points
- **Area**: Emphasize cumulative totals or volume
- **Column**: Emphasize discrete comparisons

## Notes

Harris notes that "most graphs are referred to by more than one name" and that his table shows "only representative names." The taxonomy helps match data type to appropriate visualization form, which is increasingly important as graphing software proliferates.
