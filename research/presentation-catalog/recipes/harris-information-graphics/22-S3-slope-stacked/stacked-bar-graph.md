---
name: Stacked Bar Graph
slug: stacked-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Bar Graph, p. 358"

intent: Show how a larger entity is divided into component parts, with segments stacked end-to-end in horizontal bars
direction: both

components:
  - element: bar-segments
    encodes: Individual component values, stacked horizontally
    required: true
  - element: bar-total
    encodes: Sum of all components (far right end of bar)
    required: true
  - element: category-axis
    encodes: Categories being compared (typically vertical)
    required: true
  - element: quantitative-axis
    encodes: Cumulative values (typically horizontal)
    required: true
  - element: segment-differentiation
    encodes: Color, pattern, or shade distinguishing components
    required: true

parameters:
  segment_count: "2 or more component segments"
  fill_type: "color | pattern | shade"
  segment_order: "consistent across all bars"

related: []  # TBD: stacked-column-graph, grouped-bar-graph, 100-percent-stacked-bar-graph

warnings:
  - "Only the first segment (leftmost) and the total can be read precisely from the axis"
  - "Interior segments are difficult to compare across categories because they don't share a common baseline"
  - "Segment order should remain consistent across all bars to enable comparison"

extensions:
  harris_entry: "Stacked Bar Graph"
  alternate_names:
    - "divided bar graph"
    - "composite bar graph"
    - "extended bar graph"
    - "segmented bar graph"
    - "subdivided bar graph"
  typical_use: "comparing how totals are divided among components across categories"
  scale_types:
    horizontal: "quantitative"
    vertical: "category"
---

## Description

A stacked bar graph arranges multiple data series as segments placed end-to-end within horizontal bars. Each bar represents a category, and the segments within each bar represent the component parts that make up the total for that category. The far right end of each bar indicates the sum of all components.

This format is particularly useful for showing how a larger entity (total sales, total budget, total population) breaks down into its constituent parts, while still allowing comparison of totals across categories.

## Examples

From the illustration on p. 358, Harris shows a stacked bar graph with five categories (A through E) where each bar contains multiple colored segments. The rightmost edge of each bar, marked with arrows and the label "Ends of bars designate totals," clearly indicates where to read the cumulative total.

The example demonstrates the key visual principle: segments stack from left to right, with the total readable at the bar's terminus.

## Usage

Stacked bar graphs are most effective when:
- Showing part-to-whole relationships across categories
- The total value is as important as the breakdown
- Comparing how different categories divide their totals
- A small number of segments (2-5) keeps the display readable

Less effective when:
- Precise comparison of individual components is needed (use grouped bars instead)
- Many segments would make the bar difficult to decode
- Components include negative values
- The focus is solely on individual component values rather than totals

For readability, maintain consistent segment ordering across all bars. The leftmost segment is easiest to compare across categories since it shares a common baseline (zero).

## Notes

Harris notes this is functionally equivalent to the "Subdivided Bar Graph" entry (p. 373). The horizontal orientation distinguishes this from the Stacked Column Graph, which uses vertical orientation. The choice between horizontal (bar) and vertical (column) stacking often depends on label length and reading direction preferences.
