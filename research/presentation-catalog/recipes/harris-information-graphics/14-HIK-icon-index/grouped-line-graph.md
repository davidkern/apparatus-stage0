---
name: Grouped Line Graph
slug: grouped-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Grouped line graph, p. 208"

intent: Display multiple data series on the same graph with all curves referenced from a common zero base line axis
direction: both

components:
  - element: multiple-data-series
    encodes: Two or more sets of related values to compare
    required: true
  - element: common-zero-axis
    encodes: Shared baseline from which all curves are measured
    required: true
  - element: differentiated-lines
    encodes: Visual distinction between data series (color, pattern, symbol)
    required: true
  - element: vertical-axis
    encodes: Quantitative scale for measured values
    required: true
  - element: horizontal-axis
    encodes: Category, sequence, or quantitative scale
    required: true
  - element: legend-or-labels
    encodes: Identification of each data series
    required: true

parameters:
  number_of_series: "2-5 recommended, more becomes confusing"
  horizontal_scale: "category | sequence | quantitative"
  data_structure: "common horizontal values | unique X-Y pairs"

related: []  # TBD: see also stacked-line-graph, simple-line-graph

warnings:
  - "When there are more than four or five data series, the graph becomes confusing"
  - "Stepped lines can be confusing if the lines intersect"
  - "Clear differentiation between lines is essential for readability"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["dual line", "multiple line", "overlapped line", "compound line graph"]
  typical_use: "comparing trends across multiple data series"
  when_all_scales_quantitative: "called grouped XY line graph (2D) or grouped XYZ line graph (3D)"
---

## Description

A grouped line graph displays multiple data series on the same graph, with all values measured from a common zero base line axis (typically the horizontal axis). This is the standard format for comparing multiple data series over time or across categories.

There are two variations based on data structure:
1. **All data series use common horizontal values**: Each series shares the same categories or X-values, but has unique Y-values
2. **All data points have unique X-Y pairs**: Each data series has its own set of horizontal and vertical values (sometimes called a paired line graph)

## Examples

Harris shows grouped line graphs with various scale types:

> "This is the format generally used when multiple data series are shown on the same line graph. Grouped line graphs generally have a quantitative scale on the vertical axis and either a category, quantitative, or sequence scale on the horizontal axis." (p. 208)

> "In grouped line graphs, all curves are plotted from the same zero base line axis." (p. 208)

Examples demonstrate:
- Three curves (A, B, C) each starting and ending at different values but sharing the same horizontal positions
- Category scale version with Wood, Metal, Plastic, Cloth categories
- Sequence and quantitative scale versions with multiple crossing curves

## Usage

Grouped line graphs are appropriate when:
- Comparing trends or patterns across multiple related data series
- The individual values of each series matter (not just their sum)
- Series use comparable scales and units
- You want to show where series diverge, converge, or cross

Construction guidelines:
- Limit to 4-5 data series for clarity
- Use distinct line styles, colors, or patterns for each series
- Segmented and smooth curve lines are most common
- Include clear legend or direct curve labels
- Positive and negative values can be plotted on quantitative axes

## Notes

The grouped line graph contrasts with the stacked line graph, where data series are placed on top of one another and the top curve represents the sum. In a grouped line graph, each curve is independent and measured from zero, making individual series values easy to read but cumulative totals not directly visible.
