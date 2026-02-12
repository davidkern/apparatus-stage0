---
name: Stacked Column Graph
slug: stacked-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Column Graph, p. 358"

intent: Show how totals are divided into components and how both components and totals change over time
direction: both

components:
  - element: column-segments
    encodes: Individual component values, stacked vertically
    required: true
  - element: column-total
    encodes: Sum of all components (top of column)
    required: true
  - element: sequence-axis
    encodes: Time periods or ordered categories (typically horizontal)
    required: true
  - element: quantitative-axis
    encodes: Cumulative values (typically vertical)
    required: true
  - element: segment-differentiation
    encodes: Color, pattern, or shade distinguishing components
    required: true

parameters:
  segment_count: "2 or more component segments"
  fill_type: "color | pattern | shade"
  segment_order: "consistent across all columns, typically largest at bottom"

related: []  # TBD: stacked-bar-graph, stacked-area-graph, grouped-column-graph

warnings:
  - "Only the bottom segment and the total can be read precisely from the axis"
  - "Interior segments are difficult to compare across time periods"
  - "Changes in lower segments affect the apparent position of all segments above them"

extensions:
  harris_entry: "Stacked Column Graph"
  alternate_names:
    - "divided column graph"
    - "composite column graph"
    - "extended column graph"
    - "segmented column graph"
    - "subdivided column graph"
  typical_use: "showing how totals and their component breakdown change over time"
  scale_types:
    horizontal: "sequence (time)"
    vertical: "quantitative"
---

## Description

A stacked column graph arranges multiple data series as segments stacked vertically within columns. Each column typically represents a time period, and the segments represent the components that sum to the total for that period. The top of each column indicates the cumulative total of all components.

Harris notes that such graphs are "generally used to show how a larger entity is divided into its various components, the relative effect that each component has on the whole, and how the sizes of the components and the total change over time."

## Examples

From the illustrations on p. 358, Harris shows two variations of stacked column graphs:

1. A two-dimensional stacked column graph showing years 1991-1995 with values up to $20 million, demonstrating multiple colored segments stacking to show total sales.

2. A three-dimensional perspective version of the same data, which adds visual interest but may reduce precision in reading values.

Both examples show the same principle: segments stack from the baseline upward, with the column top representing the total.

## Usage

Stacked column graphs are most effective when:
- Tracking how totals and their components change over time
- The sum is as important as the breakdown
- A moderate number of time periods (5-12) and segments (2-5) keeps the display manageable
- General patterns matter more than precise intermediate values

Less effective when:
- Precise comparison of non-bottom segments across time is critical
- Many segments create visual complexity
- Components include negative values (consider split or deviation graphs)
- Time series is very long (consider stacked area graph instead)

For time-series data, the stacked column graph offers discrete period comparisons, while the stacked area graph emphasizes continuous flow.

## Notes

Harris identifies this as equivalent to the "Subdivided Column Graph" (p. 373). The vertical orientation makes it particularly suitable for time-series data where the horizontal axis naturally represents time progression. Compare with Stacked Bar Graph for categorical (non-sequential) comparisons where horizontal orientation may be preferred.
