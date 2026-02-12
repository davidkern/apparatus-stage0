---
name: Vertical Line Graph
slug: vertical-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Vertical Line Graph, p. 437"

intent: Designate individual data points using separate vertical lines extending from the baseline to the data value
direction: both

components:
  - element: vertical-lines
    encodes: Individual data points (line extends from baseline to value)
    required: true
  - element: horizontal-axis
    encodes: Sequence or time scale
    required: true
  - element: vertical-axis
    encodes: Quantitative values
    required: true

parameters:
  dimensionality: two-dimensional | three-dimensional
  interval: uniform | variable

related: []  # TBD: line-graph, sequence-graph, spike-graph

warnings:
  - "Best suited for many data points at uniform intervals"

extensions:
  harris_entry: "Vertical Line Graph"
  alternate_names: ["needle graph", "spike graph"]
  typical_use: "plotting many data points at uniform intervals, sequence-type graphs"
---

## Description

On a vertical line graph, a separate vertical line is used to designate each individual data point. The top of the vertical line designates the actual data point value. This differs from a bar graph in that the lines are typically thin (like needles) rather than wide bars.

Such graphs are frequently used when many data points are to be plotted at uniform intervals, as in many sequence-type graphs.

## Examples

> "Sometimes referred to as a needle or spike graph. On this type of graph a separate vertical line is used to designate each individual data point. The top of the vertical line designates the actual data point. Such graphs are frequently used when many data points are to be plotted at uniform intervals, as in many sequence type graphs. Vertical line graphs might be two- or three-dimensional." (p. 437)

Harris illustrates a vertical line graph with values ranging from 0-10, showing multiple thin vertical lines of varying heights representing data points.

## Usage

Vertical line graphs are appropriate for:
- Displaying large numbers of data points
- Time series with uniform intervals
- Spectral data or frequency distributions
- Any situation where bar widths would create clutter

### Comparison with Bar Graphs

**Bar graphs**: Use wide bars, better for categorical comparisons, fewer data points

**Vertical line graphs**: Use thin lines (needles/spikes), better for many sequential data points, emphasize individual values rather than filled areas

### Dimensionality

Vertical line graphs can be rendered in:
- Two dimensions (standard x-y display)
- Three dimensions (adding depth for multiple data series)

## Notes

The needle or spike appearance makes this graph type particularly effective when data points are numerous and closely spaced. The thin lines prevent overlap that would occur with wide bars while still clearly showing the value at each point.
