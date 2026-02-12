---
name: Juxtaposed Charts
slug: juxtaposed-charts
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Juxtaposed Charts/Graphs, p. 202"

intent: Position two or more charts adjacent to one another to enable comparison while maintaining separate visual spaces
direction: construction

components:
  - element: individual-charts
    encodes: The separate graphs being compared
    required: true
  - element: spatial-arrangement
    encodes: How charts are positioned relative to each other
    required: true

parameters:
  arrangement: "side-by-side | above-below | combination"
  chart_types: "same type | different types"
  abutting: "yes | no"

related: []  # TBD: see also superimposed-charts

warnings:
  - "Juxtaposed charts require more space than superimposed charts"
  - "Alignment of scales and time periods is important for valid comparison"

extensions:
  harris_entry: "Juxtaposed Charts/Graphs"
  contrast_with: "superimposed (overlaid on top of one another)"
  typical_use: "comparing related data sets while keeping them visually distinct"
---

## Description

Juxtaposed charts are two or more charts or graphs positioned adjacent to one another. The charts might be arranged side-by-side, above and below one another, or in a combination of both arrangements. They may or may not abut (touch edges), and they may or may not be of the same chart type.

Juxtaposition is the opposite of superimposition, where charts are overlaid on top of one another. The choice between juxtaposition and superimposition depends on whether the goal is to preserve visual separation (juxtaposition) or to enable direct overlay comparison (superimposition).

## Examples

Harris shows three line graphs positioned side-by-side:

> "Two or more charts or graphs that are positioned adjacent to one another, as shown below. The charts might be side-by-side, above and below one another, or a combination of the two. They may or may not abut or be of the same type." (p. 202)

The example displays three line graphs with the same time scale ('90-'97), enabling viewers to compare trends across the three while keeping each graph's data visually isolated.

## Usage

Juxtaposition is appropriate when:
- Comparing multiple data sets that should remain visually distinct
- The charts use different scales that would be confusing if superimposed
- You want viewers to see each dataset clearly before mentally comparing
- Multiple chart types are being compared (e.g., bar graph next to line graph)

The arrangement should:
- Align scales where direct comparison is intended
- Use consistent time periods or categories across charts
- Position related charts so the eye naturally moves between them

## Notes

The opposite technique (superimposed charts) places multiple charts directly on top of one another, sharing the same axes. Each approach has trade-offs: juxtaposition preserves clarity of individual datasets at the cost of requiring more visual effort to compare; superimposition enables direct comparison but risks visual clutter when datasets overlap.
