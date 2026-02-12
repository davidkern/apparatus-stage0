---
name: Frame and Border
slug: frame
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Frame, pp. 159-160"

intent: Enclose and delineate chart elements using borders of varying completeness based on design needs
direction: construction

components:
  - element: title-frame
    encodes: Boundary around chart title
    required: false
  - element: chart-frame
    encodes: Outer boundary of entire chart
    required: false
  - element: graph-frame
    encodes: Boundary of plot area (also called grid border, box, scale line)
    required: false
  - element: legend-frame
    encodes: Boundary around legend
    required: false
  - element: note-frame
    encodes: Boundary around notes section
    required: false
  - element: data-graphic-frame
    encodes: Boundary around individual data elements
    required: false

parameters:
  completeness: "full (4 sides) | partial (2-3 sides) | none"
  position_relative_to_data: "behind | coincident | shifted"

related: []

warnings:
  - "When data graphics are coincident with or extend beyond the frame, the frame is typically behind the data graphic"
  - "Frame choice depends on: number of scales, grid line presence, chart clutter, chart size, desired appearance"

extensions:
  harris_entry: "Frame"
  alternate_names: ["Border"]
  component_entry: true
  frame_types:
    - "Title frame/border"
    - "Chart frame/border"
    - "Map frame/border (sometimes called neat line)"
    - "Table frame/border"
    - "Graph frame/border (grid border, box, rectangle, plot area border, scale line, label axis, axis, scale axis)"
    - "Data graphic frame/border"
    - "Legend frame/border"
    - "Note frame/border"
---

## Description

The terms frame and border are often used interchangeably in charts and graphs. Frames serve to visually delineate different elements of a chart, provide structure, and can enhance or diminish readability depending on their application.

Sometimes a complete frame (two sides, a top and a bottom) is used with a graph, map, or table. Other times a partial frame or no frame is used.

## Factors Affecting Frame Choice

Factors affecting the decision as to the type of frame to use include:
- How many scales are used and where they are located
- Whether or not grid lines are used
- How cluttered the chart is
- The size of the chart
- The desired appearance of the chart

## Frame Position Relative to Data

Although there are many ways to position frames with respect to data graphics, in most cases the frame has little or no effect on the chart as a whole. In a few cases frames can add to the effectiveness of the chart.

Harris illustrates four positioning approaches (p. 159):
1. **Frame behind data**: When data graphics are coincident with or extend beyond the frame, the frame is typically behind the data graphic
2. **Frame and scales shifted**: Shifted slightly to improve visibility of data
3. **Frame larger than active area**: To avoid confusion when data approaches boundaries

> "The key considerations in applying a frame are ease of viewing, accuracy of encoding and decoding, and attractiveness." (p. 159)

## Examples

Harris shows graphs, maps, and tables with frames ranging from full frame to no frame (p. 160):
- Column graphs with complete frame vs. partial frame vs. no frame
- Line maps with complete frame vs. partial frame vs. no frame
- Data tables with complete frame vs. partial frame vs. no frame

The examples demonstrate that reducing frame elements can reduce visual clutter while still maintaining chart readability.

## Usage

Full frames are appropriate when:
- Multiple scales appear on different sides
- Visual containment of the chart is desired
- Formal presentation requires defined boundaries

Partial or no frames work well when:
- Reducing visual clutter is a priority
- Grid lines already provide sufficient structure
- A more modern, open appearance is desired
- The chart is large and borders would add unnecessary weight
