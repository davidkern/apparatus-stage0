---
name: Stepped Line Graph
slug: stepped-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Terminology/Curve variations, p. 219; Connecting dissimilar information, p. 216"

intent: Connect data points using horizontal and vertical line segments to emphasize discrete values rather than continuous transitions
direction: both

components:
  - element: horizontal-segments
    encodes: The value held at each data point
    required: true
  - element: vertical-segments
    encodes: Transitions between values
    required: true
  - element: data-points
    encodes: Actual measured or recorded values
    required: false

parameters:
  emphasis: "horizontal segments bold | uniform weight"
  vertical_inclusion: "with verticals (stepped) | without verticals (jumped)"

related: []  # TBD: see also segmented-line-graph

warnings:
  - "Stepped lines are particularly useful for discrete data where smooth transitions would be misleading"
  - "The horizontal portion can be darkened to emphasize values instead of transitions"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["staircase graph", "step chart"]
  typical_use: "discrete categorical comparisons, emphasizing that values are distinct rather than transitioning smoothly"
---

## Description

Stepped lines connect data points with a series of horizontal and vertical line segments, creating a staircase-like appearance. Unlike segmented lines that draw diagonal connections between points, stepped lines first move horizontally to show the value, then vertically to transition to the next value.

A variation called "jumped lines" omits the vertical portions entirely, leaving only the horizontal segments.

## Examples

**Discrete data comparison** (p. 216):
Harris illustrates the same population data for Paris, Rome, London, and Moscow plotted on:
- A segmented line graph (diagonal connections)
- A stepped line graph (horizontal then vertical connections)
- A stepped line graph with bold horizontal lines
- A column graph (for comparison)

> "When the points are connected, stepped line graphs are sometimes used to emphasize the fact that the graph is showing values for comparison purposes and not to establish a trend. The horizontal portion of the line can be darkened to emphasize the values instead of the transitions."

**Curve variations terminology** (p. 219):
> "Stepped lines result from connecting data points with a series of horizontal and vertical lines."
> "Jumped lines are stepped lines without the vertical portions."

## Usage

Use stepped line graphs when:
- Data points represent distinctly different things (like different cities' populations)
- You want to emphasize that values are discrete, not continuously transitioning
- The graph shows values for comparison rather than establishing a trend
- You want to avoid implying interpolation between data points

The bold horizontal variation is useful when:
- You want to further emphasize the discrete values
- The transitions between points are less important than the values themselves

## Notes

Harris discusses the debate about whether discrete data (like populations of different cities) should be connected with lines at all. Some feel that since the data points "do not represent data elements that transition smoothly from one to another, they should not be represented by a line graph, but instead, by a point, column, or bar graph." Others feel connecting is acceptable as a visual aid. The stepped line graph is a compromise that connects while still emphasizing discreteness.
