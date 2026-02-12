---
name: Point Graph
slug: point-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Point Graph and Scatter Graph, pp. 290-294"

intent: Display quantitative information using positioned symbols to represent data values across category, sequence, or quantitative scales
direction: both

components:
  - element: horizontal-axis
    encodes: Categories, sequence (time), or quantitative values
    required: true
  - element: vertical-axis
    encodes: Quantitative values (most often)
    required: true
  - element: data-points
    encodes: Individual values as positioned symbols
    required: true
  - element: plot-symbols
    encodes: Geometric shapes (dots, circles, squares, triangles)
    required: true

parameters:
  horizontal_scale_type: "category | sequence | quantitative"
  data_series_count: "simple (one) | grouped (multiple)"
  point_pairing: "common-x-values | unique-pairs"

related:
  - slug: scatter-graph
    relationship: variant-of

warnings:
  - "When points are connected by lines, the graph is generally referred to as a line graph"

extensions:
  harris_entry: "Point Graph and Scatter Graph"
  alternate_names: ["dot graph", "symbol graph"]
  typical_use: "displaying data values; comparing categories; showing distributions"
  naming_by_scale:
    category_scale: "point graph, dot graph, symbol graph"
    sequence_scale: "point graph, scattergram, scatterplot"
    quantitative_scale: "scatter graph, scattergram, XY graph"
---

## Description

Point graphs are a family of graphs that display quantitative information by means of points represented by symbols such as dots, circles, or squares (called plot or plotting symbols). When the points are connected by lines, the graph is generally referred to as a line graph.

The naming of point graphs depends on several factors:
- Type of scale on horizontal axis (category, sequence, or quantitative)
- Number of data series plotted
- Whether data series use common values on the horizontal axis

## Examples

Harris provides a naming taxonomy (p. 290):

**Category scale on horizontal axis:**
- One data series: "Simple point graph" (or dot graph, symbol graph)
- Multiple series with common categories: "Grouped point graph"

**Sequence scale on horizontal axis:**
- One data series: "Simple point graph" (or scatter graph)
- Multiple series with common values: "Grouped point graph" (or grouped scatter graph)
- Multiple series with unique pairs: "Grouped paired point graph" (or paired scatter graph)

**Quantitative scale on horizontal axis:**
- One data series: "Scatter graph" (or scattergram, scatterplot, XY graph)
- Multiple series with common values: "Grouped scatter graph"
- Multiple series with unique pairs: "Paired scatter graph"

Visual examples show points plotted for materials (Wood, Metal, Plastic, Cloth) on category scales and time/value scales with sequence and quantitative data.

## Usage

**Distribution analysis:**
Point graphs can show distribution of data elements within data sets, either alone or superimposed over other graphs (box or column graphs). This reveals:
- Clustering of data points
- Gaps in data
- Spread of values
- Maximum and minimum values
- Outliers

**One-axis point graphs:**
> "When the scale and data are displayed along the same axis, it is sometimes called a one-axis graph."

Used to analyze distribution within individual data sets or in margins of two-axis scatter graphs to show distribution along each axis.

**Monitoring applications:**
Simple point graphs with sequence scales are frequently used to monitor processes:
- Whether measurements stay within limits
- Whether trends are developing toward limits
- Whether performance is erratic
- Whether spread is changing

Reference or control lines are displayed on such monitoring graphs.

## Notes

The point graph family spans a wide range of applications from simple category comparisons to complex correlation analysis. The common thread is the use of positioned symbols rather than bars, lines, or areas as the primary data encoding.

Harris notes the relationship to line graphs: points become a line graph when connected. This makes point graphs the foundation for line graph construction, with the points representing the actual data and lines showing continuity or trend between points.
