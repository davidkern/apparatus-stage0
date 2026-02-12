---
name: Drop Lines
slug: drop-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Drop lines used with line graphs, p. 218"

intent: Connect data points to axis labels or values using faint reference lines to improve readability
direction: construction

components:
  - element: drop-line
    encodes: Visual connection between data point and axis
    required: true
  - element: data-point
    encodes: The value being referenced
    required: true
  - element: axis-reference
    encodes: Label or value on the axis
    required: true

parameters:
  orientation: "vertical | horizontal | both"
  dimensionality: "two-dimensional | three-dimensional"

related: []  # TBD: see also line-graph-grid-lines

warnings:
  - "Drop lines should be faint to avoid competing with data lines"
  - "Excessive drop lines can create clutter, especially with many data points"

extensions:
  harris_entry: "Line Graph"
  alternate_names: []
  typical_use: "relating specific data points to axis values, particularly in 3D graphs"
---

## Description

Drop lines are faint lines that connect data points to axis labels or values, helping viewers more easily relate a data point to its corresponding position on the axes. They can be used with both two-dimensional and three-dimensional line graphs.

## Examples

**Two-dimensional drop lines** (p. 218):
- **Vertical drop lines**: Lines extending down from each data point to the X-axis, helping identify the X-axis position of each point
- **Horizontal drop lines**: Lines extending left from each data point to the Y-axis, helping estimate Y-axis values

**Three-dimensional drop lines** (p. 218):
> "Three-dimensional line graph (ribbon) with vertical drop lines"

The illustration shows a ribbon-style 3D line graph where vertical drop lines help ground the floating data line to the base plane, making spatial relationships clearer.

## Usage

Use drop lines when:
- Specific data point positions need to be precisely identified
- The graph lacks grid lines but value estimation is still important
- Three-dimensional presentation makes spatial relationships unclear
- Individual data points are more important than overall trend

Vertical drop lines are most widely used, as they help identify X-axis positions. Horizontal drop lines can be added when Y-axis value estimation is critical. A combination of both can be used for maximum precision, though this increases visual complexity.

## Notes

Drop lines serve a similar purpose to grid lines but are attached to specific data points rather than forming a continuous grid across the entire graph. They are particularly valuable in 3D graphs where the spatial separation between the data line and the axes can make relationships difficult to perceive.
