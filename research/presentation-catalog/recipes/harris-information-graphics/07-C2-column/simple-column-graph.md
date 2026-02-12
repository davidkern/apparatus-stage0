---
name: Simple Column Graph
slug: simple-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Simple column graph, pp. 80-81"

intent: Display a single data series using vertical rectangles to compare values across categories or show changes over time
direction: both

components:
  - element: vertical-columns
    encodes: Individual data element values via column height
    required: true
  - element: quantitative-scale
    encodes: Numeric values on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true
  - element: baseline
    encodes: Zero reference from which columns extend
    required: true
  - element: column-spacing
    encodes: Visual separation between discrete data points
    required: false

parameters:
  column_width: "any uniform width"
  spacing: "uniform gaps between columns"
  orientation: "vertical only"
  values: "positive | negative | both"

related:
  - slug: simple-bar-graph
    relationship: variant-of

warnings:
  - "When columns are so narrow they approximate lines, the graph becomes a vertical line graph"
  - "When columns become so wide there is no space between them, the graph becomes a joined/histogram type"
  - "Scale should start at zero to avoid misrepresenting column lengths"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["bar graph", "vertical bar graph", "rotated bar graph"]
  typical_use: "comparing values across categories, showing time series, displaying discrete data"
  scale_types:
    vertical: "quantitative (linear)"
    horizontal: "category or sequence"
---

## Description

A simple column graph displays a single data series using vertical rectangles. Each column represents a data element, with the top of the column designating the value. The length of the column may or may not be proportional to the value it represents. Because column tops are pronounced, this type of graph excels at showing specific values. The stand-alone nature of columns makes them well suited for representing discrete data.

Column graphs are the vertical counterpart to bar graphs. While functionally equivalent, vertical orientation is often preferred for time series data (time flowing left to right) and when comparing many categories.

## Examples

> "When a column graph displays a single data series similar to the example at the left, it is referred to as a simple column graph. The columns can be of any width; however, with a few exceptions, columns are uniform in width throughout a given graph." (p. 80)

Harris illustrates simple column graphs with years 1991-1995 on the horizontal axis, showing how a single data series appears with uniform column widths and spacing.

> "Both positive and negative values can be plotted on the vertical quantitative scale." (p. 80)

When both positive and negative values are plotted, the result is sometimes called an "over-under" or "deviation" graph.

## Usage

Simple column graphs are appropriate when:
- Displaying a single data series
- Comparing values across distinct categories
- Showing changes over a time sequence
- Emphasizing individual discrete values

Design considerations:
- Columns should be uniform in width throughout the graph
- Spaces between columns should be uniform
- The vertical scale should be quantitative and typically linear
- The horizontal axis uses category or sequence (time series) scales
- Linear scales starting at zero are almost always used

## Notes

Harris identifies two special cases based on column width:

**Vertical line graph**: When columns are so narrow they approximate vertical lines, the graph is called a spike, needle, vertical line, or point graph with drop lines. With this variation, quantitative data can be plotted on the horizontal axis.

**Joined column graph**: When columns become so wide there is no space between them, the graph is called a joined, connected, or stepped column graph, or histogram. A quantitative scale is sometimes used on the horizontal axis, with column widths indicating the spread of values.
