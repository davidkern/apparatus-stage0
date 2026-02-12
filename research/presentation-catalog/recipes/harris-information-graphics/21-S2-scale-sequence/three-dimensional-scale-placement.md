---
name: Three-Dimensional Scale Placement
slug: three-dimensional-scale-placement
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Number and location of scales, Three-dimensional, p. 342"

intent: Position scales on three-dimensional graphs to maximize readability while minimizing interference with data graphics
direction: construction

components:
  - element: x-axis-scale
    encodes: Values along the horizontal depth axis
    required: true
  - element: y-axis-scale
    encodes: Values along the horizontal width axis
    required: true
  - element: z-axis-scale
    encodes: Values along the vertical axis
    required: true
  - element: scale-labels
    encodes: Numeric values at each scale position
    required: true

parameters:
  scale_position: "front | back | both sides"
  duplicate_scales: "whether to repeat scales on opposite sides"
  reference_axis_location: "within graph | outside frame"

related: []  # TBD: three-dimensional-graph, linear-scale

warnings:
  - "Scales at back of graph interfere with data graphics"
  - "Duplicate scales are more common in 3D than 2D graphs"
  - "Multiple scales with different values on same axis are rare in 3D"

extensions:
  harris_entry: "Scale"
  typical_use: "three-dimensional surface and column graphs"
---

## Description

Placement of scales on three-dimensional graphs becomes more difficult because of the additional axis, the fact that the scales are more apt to interfere with the data graphics, and the inclined angle at which the graph is drawn.

Although technically the zero base line axes are at the back of the graph, placing the scales there would cause significant interference with the data graphics. Consequently, scales are generally placed in the front, outside the graph frame.

## Examples

> "Placement of scales on three-dimensional graphs becomes more difficult because of the additional axis, the fact that the scales are more apt to interfere with the data graphics, and the inclined angle at which the graph is drawn." (p. 342)

The PDF illustrates several configurations:

**Basic graph with scales on zero base line axes**: Labels inside the graph space interfere with data graphics. Not recommended.

**Most widely used layout**: Scales and labels in the front and outside of the graph frame. Provides clear reading without obstruction.

**Duplicate scales**: More common in 3D than 2D graphs. Scales appear on both left and right vertical edges, or on front and back horizontal edges.

**Reference axis within graph**: Even when a zero base line or reference axis is drawn on the walls of the 3D graph, the scales generally remain on the outside of the frame.

## Usage

Guidelines for 3D scale placement:
- Place scales in front, outside the graph frame
- Duplicate scales are acceptable and often helpful due to the viewing angle
- Avoid placing scales at the back where they interfere with data
- Keep scale labels outside the data area

Special considerations:
- The use of duplicate scales is much more common on 3D graphs than 2D
- Multiple scales with different values on a given axis are much rarer on 3D graphs than 2D
- Grid lines may be projected onto the floor and walls (skirts) for reference

## Notes

> "The use of duplicate scales, as illustrated on the left, is much more common on three-dimensional graphs than on two-dimensional graphs. The use of multiple scales with different values on a given axis is much rarer on three-dimensional graphs than on two." (p. 342)

The viewing angle of 3D graphs creates unique challenges for scale placement that do not exist in 2D. The goal is to ensure all scales are readable without requiring the viewer to mentally rotate the graph.
