---
name: Vertical Line Graph
slug: vertical-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Vertical line graph, p. 210"

intent: Display data points with vertical lines extending from each point down to the horizontal axis, emphasizing individual values and their timing
direction: both

components:
  - element: data-points
    encodes: Individual measured values
    required: true
  - element: vertical-lines
    encodes: Drop lines from data points to the axis or plane
    required: true
  - element: horizontal-axis
    encodes: Time or sequence scale
    required: true
  - element: quantitative-axis
    encodes: Values being measured
    required: true
  - element: plotting-symbols
    encodes: Markers at the top of vertical lines (optional)
    required: false

parameters:
  symbol_at_top: "yes | no"
  combine_with_conventional_line: "yes | no"
  highlight_intervals: "yes | no"
  dimensions: "2D | 3D"

related: []  # TBD: see also column-graph, point-graph

warnings:
  - "When lines are close together, the graph may resemble a filled area graph"
  - "Ensure individual lines remain distinguishable"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["needle graph", "spike graph"]
  typical_use: "plotting many successive data points, emphasizing exact timing of values"
---

## Description

Vertical line graphs display data by extending a vertical line from each data point down to the horizontal axis or plane. They can be thought of as column graphs where the columns have the widths of lines, or as point graphs with drop lines where the plotting symbols may be eliminated.

This format is particularly useful when plotting many successive data points or when it is important to identify the exact value or time associated with each data point. When the vertical lines are positioned close together, they can resemble an area graph with a pattern fill.

## Examples

Harris describes the technique and its applications:

> "Vertical line graphs are generally used when many successive data points are to be plotted or where it is desirable to enable the viewer to identify the exact value or time associated with each data point." (p. 210)

Harris illustrates several variations:
- **Basic vertical line graph**: Simple vertical lines from axis to data points
- **Combined with conventional line**: Vertical lines plus a connecting line for emphasis
- **Highlighted intervals**: Selected vertical lines darkened, dashed, or colored differently to designate weeks, months, or other intervals
- **Three-axis version**: Vertical lines in a 3D space

> "Sometimes a conventional line and the vertical lines are used together for emphasis. Selected vertical lines can be darkened, dashed, or made a different color to designate intervals such as weeks, months, etc." (p. 210)

## Usage

Vertical line graphs are appropriate when:
- Plotting dense time series data
- Emphasizing the exact timing of each data point
- Showing discrete events or measurements
- The individual data points matter as much as the overall trend

Construction options:
- Symbols may or may not be placed at the top of lines to mark exact data points
- A conventional line curve can be overlaid for trend visibility
- Interval markers (weekly, monthly) can be visually distinguished
- Works in both two- and three-dimensional formats

## Notes

The vertical line graph occupies a middle ground between point graphs (where only symbols mark data points) and column graphs (where rectangles extend from the axis). The line width provides less visual weight than columns, making it suitable for dense data while still showing the "reach" from baseline to value that columns provide.
