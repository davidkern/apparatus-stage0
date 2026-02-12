---
name: Superimposed Graphs
slug: superimposed-graphs
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs superimposed, p. 171"

intent: Combine multiple data series on a single graph by overlaying them to reveal relationships and intersections
direction: both

components:
  - element: base-graph
    encodes: The primary graph providing the plot area and primary scale
  - element: overlaid-data-series
    encodes: Additional data series plotted on the same axes
  - element: shared-axes
    encodes: Common reference frame for all data series
  - element: legend
    encodes: Identification of each data series
    required: true

parameters:
  data_series_count: "2 or more"
  graph_types: "line | column | area | mixed"
  scale_type: "single | dual (supplementary)"

related: []  # TBD: juxtaposed-graphs, combination-graph

warnings:
  - "Too many overlaid series creates visual clutter and reduces readability"
  - "Data series may obscure each other, particularly with area graphs"
  - "Requires careful color/pattern differentiation between series"

extensions:
  harris_entry: "Graph"
  alternate_names: ["combination graph", "overlay graph"]
  typical_use: "comparing trends across multiple data series, identifying intersections"
---

## Description

Superimposing is one of the most widely used methods for combining multiple graphs. Two or more data series are plotted on top of one another within the same plot area, sharing common axes. The resulting graph is sometimes referred to as a combination graph.

This technique creates a synergistic effect where the value of the combined visualization is greater than the sum of individual graphs. It excels at revealing relationships, crossover points, and comparative trends that would be difficult to spot in separate graphs.

## Examples

Harris demonstrates superimposed graphs with multiple data series over time (p. 171):

> "One of the most widely used methods for combining multiple graphs is to superimpose two or more graphs on top of one another. The resulting graph is sometimes referred to as a combination graph."

The example shows three data series (A, B, C) plotted as lines on a single graph from 1990-1997, making it easy to identify that "all four data series had approximately the same value sometime between 1994 and 1995."

## Usage

Most effective when:
- Comparing trends across multiple related data series
- Identifying intersection or crossover points between series
- Data series share compatible scales and units
- Limited number of series (typically 2-4)

Less effective when:
- Many data series would create clutter
- Data series have vastly different scales (consider dual axes)
- Precise value reading is more important than trend comparison
- Area graphs would cause complete occlusion of underlying data

Combines well with:
- **Supplementary scale/grid** for data with different units
- **Legend** for identifying multiple series
- **Symbols** to differentiate line series

## Notes

Harris contrasts superimposed graphs with juxtaposed graphs on page 171, showing the same four data series displayed both ways. The superimposed version makes intersection points obvious but can appear cluttered, while juxtaposed versions are cleaner but make precise comparisons harder.
