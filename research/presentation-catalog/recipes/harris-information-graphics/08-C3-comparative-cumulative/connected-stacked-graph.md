---
name: Connected Stacked Graph
slug: connected-stacked-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Connected Stacked Graph, p. 102"

intent: Make relationships between data series easier to see on stacked bar and column graphs by connecting segment boundaries across adjacent bars or columns
direction: construction

components:
  - element: stacked-bars-or-columns
    encodes: Multiple data series stacked to show part-to-whole relationships
    required: true
  - element: connecting-lines
    encodes: Visual links showing how each segment boundary changes from one bar/column to the next
    required: true
  - element: filled-areas
    encodes: Optional shading between connecting lines to emphasize the flow of each data series
    required: false
  - element: segment-labels
    encodes: Identity of each data series in the stack
    required: false

parameters:
  orientation: vertical-columns | horizontal-bars
  stack_type: simple | 100-percent
  fill_between_links: true | false

related: []

warnings:
  - "Best suited for time series or ordered categories where trends across segments are meaningful"
  - "Can become visually complex with many data series"

extensions:
  harris_entry: "Connected Stacked Graph"
  alternate_names:
    - linked stacked graph
  typical_use: "Showing how segment proportions change over time or across categories"
  base_graph_types:
    - stacked column graph
    - stacked bar graph
    - 100% stacked column graph
    - 100% stacked bar graph
---

## Description

A connected stacked graph enhances standard stacked bar or column graphs by drawing lines that connect the boundaries between data series from one bar or column to the next. This technique makes it easier to see how each segment changes relative to the others across the sequence.

The connecting lines visually link corresponding segment boundaries, creating a flow that helps viewers track how each data series evolves. The area between the connecting links may or may not be filled with color or shading to further emphasize the relationship.

## Examples

Harris illustrates three variations on page 102:

> Simple stacked column graph with connecting lines between segment boundaries, showing years 1991-1995 with five data series (A through E).

> Stacked column graph with area between links filled, creating a ribbon-like appearance that emphasizes the flow of each data series.

> 100% stacked bar graph with connecting lines, showing proportional relationships where each bar totals to 100%.

## Usage

Connected stacked graphs are most effective when:
- The sequence on the horizontal axis is meaningful (time series, ordered categories)
- You want to emphasize trends within individual segments across the sequence
- The number of data series is manageable (typically 5-7 or fewer)

The technique can be applied to both:
- Simple stacked graphs (showing absolute values)
- 100% stacked graphs (showing proportional relationships)

When filling the areas between connecting lines:
- Use distinct colors or patterns for each data series
- Consider whether the additional visual weight aids or hinders comprehension
- The filled version creates a visual similar to a stacked area chart but maintains the discrete bar/column structure

## Notes

This technique bridges the gap between discrete stacked bar/column graphs and continuous stacked area charts, providing some of the flow visualization benefits of area charts while maintaining the discrete time period representation of bar charts.
