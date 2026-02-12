---
name: Staggered Column Graph
slug: staggered-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Staggered Column Graph, p. 359"

intent: Add visual emphasis to individual segments of a part-to-whole display by horizontally displacing segments while maintaining the cumulative total concept
direction: construction

components:
  - element: displaced-segments
    encodes: Individual component values, horizontally offset from adjacent segments
    required: true
  - element: cumulative-total
    encodes: Sum of all segments (implicit in combined segment heights)
    required: true
  - element: segment-labels
    encodes: Component names, values, and/or percentages
    required: true
  - element: quantitative-axis
    encodes: Component values
    required: true

parameters:
  displacement_direction: "right (typical) | left | alternating"
  segment_count: "2 or more segments"
  label_position: "inside segment | outside | adjacent"

related: []  # TBD: stacked-column-graph, staggered-bar-graph

warnings:
  - "Less compact than standard stacked column graph"
  - "Works best with a single composite column, not multiple time period comparisons"
  - "Horizontal spread may require more space than standard stacked format"

extensions:
  harris_entry: "Staggered Column Graph"
  alternate_names:
    - "stepped column graph"
    - "step-by-step column graph"
    - "progressive column graph"
  typical_use: "emphasizing individual segments within a single part-to-whole breakdown"
---

## Description

A staggered column graph is a variation of the stacked column graph that uses only one column, with each segment horizontally displaced from its neighbors. Rather than segments stacking directly on top of each other in a single vertical column, each segment is offset to the right (typically), creating a stair-step visual effect ascending from bottom-left to top-right.

Harris explains: "The purpose of staggered column graphs is to add visual emphasis to the individual segments while still maintaining the concept that the segments all add up to the whole."

## Examples

From the illustration on p. 359, Harris shows a staggered column graph displaying expense categories:
- Personnel: 9% ($60 thousand)
- Engineering: 16%
- R&D: 40%
- Selling: 10%
- Administrative: 25%

Each segment is offset to the right of the segment below it, creating a stair-step appearance rising from left to right. Both percentages and dollar values are labeled, with the vertical axis showing "Thousands of expense dollars" from 0 to 400.

The visual effect creates distinct separation between segments while maintaining the additive relationship.

## Usage

Staggered column graphs are most effective when:
- Displaying a single entity's breakdown into components
- Walking through components in a presentation or explanation
- Individual segments deserve visual emphasis and labeling
- Both absolute values and percentages need to be shown

Less effective when:
- Comparing breakdown across multiple time periods or categories
- Horizontal space is limited
- Many segments would create excessive horizontal spread
- Quick reading of the total is more important than segment emphasis

The stepped arrangement naturally guides the eye upward through the components, making it suitable for sequential explanation.

## Notes

This is the vertical equivalent of the Staggered Bar Graph. Harris also covers this under "Stepped Column Graph" and "Step-by-Step Column Graph" (p. 371). The rightward displacement is the most common convention, creating a natural reading progression from bottom-left to top-right.
