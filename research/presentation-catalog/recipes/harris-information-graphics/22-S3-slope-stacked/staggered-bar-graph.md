---
name: Staggered Bar Graph
slug: staggered-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Staggered Bar Graph, p. 359"

intent: Add visual emphasis to individual segments of a part-to-whole display by vertically displacing segments while maintaining the cumulative total concept
direction: construction

components:
  - element: displaced-segments
    encodes: Individual component values, vertically offset from adjacent segments
    required: true
  - element: cumulative-total
    encodes: Sum of all segments (implicit in combined segment lengths)
    required: true
  - element: segment-labels
    encodes: Component names and/or values
    required: true
  - element: quantitative-axis
    encodes: Component values
    required: true

parameters:
  displacement_direction: "up | down | alternating"
  segment_count: "2 or more segments"
  label_position: "inside | outside | adjacent"

related: []  # TBD: stacked-bar-graph, staggered-column-graph

warnings:
  - "Less compact than standard stacked bar graph"
  - "Works best with a single composite bar, not multiple category comparisons"
  - "Segment lengths still add to total, but visual separation may reduce this perception"

extensions:
  harris_entry: "Staggered Bar Graph"
  alternate_names:
    - "stepped bar graph"
    - "step-by-step bar graph"
    - "progressive bar graph"
  typical_use: "emphasizing individual segments within a single part-to-whole breakdown"
---

## Description

A staggered bar graph is a variation of the stacked bar graph that uses only one bar, with each segment vertically displaced from its neighbors. Rather than segments sitting directly adjacent in a continuous horizontal bar, each segment is offset up or down, creating a stair-step visual effect.

Harris explains: "The purpose of staggered bar graphs is to add visual emphasis to the individual segments while still maintaining the concept that the segments all add up to the whole."

## Examples

From the illustration on p. 359, Harris shows a staggered bar graph displaying expense categories:
- Personnel: $60 thousand
- Engineering: $70 thousand
- R&D: $130 thousand
- Selling: $60 thousand
- Admin.: $105 thousand

Each segment is offset vertically from the previous one, creating distinct visual separation. The segments step downward from Personnel through Admin., with labeled values showing both category names and dollar amounts. The horizontal axis shows "Thousands of expense dollars" from 0 to 400.

## Usage

Staggered bar graphs are most effective when:
- Displaying a single entity's breakdown into components
- Individual segments deserve visual emphasis
- Labels and values can be clearly associated with each segment
- The presentation allows vertical space for displacement

Less effective when:
- Comparing multiple entities (use standard stacked bars)
- Compact display is required
- Many segments would create excessive vertical spread
- The cumulative total needs visual emphasis (top line is less clear)

The format works well in presentations where walking through components sequentially is the goal.

## Notes

This is the horizontal equivalent of the Staggered Column Graph. Both techniques sacrifice compactness for visual emphasis on individual components. Harris also covers this under "Stepped Bar Graph" and "Step-by-Step Bar Graph" (p. 371), noting the same purpose of adding visual emphasis to segments.
