---
name: Linked Stacked Graph
slug: linked-stacked-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Linked Stacked Graph, p. 220"

intent: Make relationships between segments easier to see by connecting boundaries between data series with lines
direction: both

components:
  - element: stacked-segments
    encodes: Component values in each category
    required: true
  - element: connecting-links
    encodes: Visual tracking lines between segment boundaries
    required: true
  - element: filled-areas
    encodes: Optional fill between links
    required: false

parameters:
  stack_type: "simple stacked | 100% stacked"
  chart_type: "bar | column"
  link_fill: "filled | unfilled"

related: []  # TBD: see also stacked-bar-graph, stacked-column-graph

warnings:
  - "Links add visual complexity"
  - "With many segments, links may create confusing crossings"

extensions:
  harris_entry: "Linked Stacked Graph"
  alternate_names: ["connected stacked graph"]
  typical_use: "emphasizing segment relationships across categories, tracking component changes"
---

## Description

In stacked bar and column graphs, it can be difficult to see how individual segments relate across different bars or columns. Linked (or connected) stacked graphs address this by drawing lines connecting the boundaries between data series from one bar/column to the next.

The links make it easier to track how each component changes across categories or time periods. The area between the links may or may not be filled.

## Examples

**Three variations** (p. 220):

1. **Stacked column graph** (basic): Standard stacked columns without links

2. **Area between links filled**: Stacked columns with connecting lines between segment boundaries, and the areas between links filled with color/shading

3. **100% stacked bar graph**: Horizontal 100% stacked bars with links connecting segment boundaries (labeled A through E)

> "In an attempt to make relationships easier to see on stacked bar and column graphs, lines are sometimes drawn connecting the boundaries between the data series."

## Usage

Use linked stacked graphs when:
- Tracking how specific components change across categories
- The relative size of segments is as important as the total
- Visual continuity between bars/columns aids understanding
- You want to create a hybrid between stacked bar/column and area charts

Consider whether filled areas (creating a banded appearance) or unfilled links (cleaner look) better serves the communication goal.

## Notes

Harris cross-references both the Bar Graph and Column Graph entries. The linked stacked graph is essentially a technique that can be applied to any stacked bar or column chart, creating a visual hybrid that combines properties of stacked charts and area charts.
