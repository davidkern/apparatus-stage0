---
name: Three-Dimensional Axes
slug: three-dimensional-axes
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Number of scale axes, p. 25; Axonometric Projection, p. 26"

intent: Configure the three-axis system for displaying data with X, Y, and Z dimensions
direction: both

components:
  - element: x-axis
    encodes: First horizontal dimension
    required: true
  - element: y-axis
    encodes: Second horizontal dimension
    required: true
  - element: z-axis
    encodes: Vertical dimension (height/depth)
    required: true
  - element: back-planes
    encodes: Vertical planes for grid line display
    required: false
  - element: floor-plane
    encodes: Horizontal XY plane, often with grid lines
    required: false

parameters:
  rotation_angle: degrees of horizontal rotation
  tilt_angle: degrees of vertical tilt
  projection_type: axonometric | isometric | oblique
  axis_visibility: all | selective

related: []  # TBD: see also axonometric-projection, back-plane

warnings:
  - "When degrees of rotation and/or tilt approach zero or multiples of 90 degrees, some advantages of 3D view are lost"
  - "Varying tilt or rotation without varying both results in charts difficult to interpret"
  - "High peaks close together may require greater tilt so front data graphics do not obscure back ones"

extensions:
  harris_entry: "Axis, Graph"
  back_planes_definition: "Vertical planes formed by Z-axis with X and Y axes where grid lines are displayed"
  isometric_definition: "Axonometric view where angles between each pair of axes is 120 degrees"
  configuration_flexibility: "No limitations on number or location of scale axes that can be used"
---

## Description

Three-dimensional graphs extend the two-axis rectangular system by adding a third dimension, typically represented by the Z-axis running vertically. The X and Y axes form the horizontal base plane, while the Z-axis provides height or depth. Unlike two-dimensional graphs with fixed orientation, three-dimensional graphs require choices about rotation and tilt that significantly affect readability.

Harris emphasizes that there are no limitations on the number or location of scale axes, label axes, scale lines, or frame lines that can be used with a given graph. The configuration depends on data type, graph purpose, software capabilities, and the observations being highlighted.

## Examples

> "When a graph or map with data on three axes is shown in three-dimensional form, an axonometric projection or view is generally used. In this type of view, the graph, map, or other object is tilted and rotated so the viewer sees the top or bottom and two sides." (p. 26)

**Axis and plane structure:**
> "Back planes are the vertical planes on three-dimensional graphs formed by the Z-axis (vertical axis) and the X and Y axes. Grid lines for one or more of the axes are many times displayed on the back planes." (p. 27)

In three-dimensional graphs, zero base line axes become planes: "the X and Y base line axes form the plane from which quantitative values are measured along the Z-axis." (p. 22)

**Rotation and tilt effects:**
Harris shows the same data with varying rotation (90 degrees, 60 degrees, 30 degrees, 0 degrees) and tilt (0 degrees, 30 degrees, 60 degrees) combinations, demonstrating how different combinations affect readability.

> "The direction of rotation can have an effect on the readability of the data. If the high points on a graph or map are concentrated on one side or if it is important for the viewer to see particular data, the chart may need to be rotated in a direction that will best display the most important characteristics." (p. 26)

**Isometric projection:**
> "An isometric projection is a variation of axonometric projection in which the angles between each pair of axes is 120 degrees." (p. 26)

## Usage

Three-dimensional axes are appropriate when:
- Data has three independent variables requiring simultaneous display
- Surface visualization is needed (terrain, response surfaces)
- Spatial relationships between data points matter

Configuration considerations:
- Rotation direction should reveal important data features
- Greater tilt helps when peaks are close together or values are large on Z-axis
- Slight tilt suffices when Z-values are relatively small
- Avoid rotation or tilt near 0 or 90 degrees (loses 3D advantages)
- Vary both rotation and tilt together for interpretable results

## Notes

On three-dimensional graphs, caution should be exercised when referring to X and Y axes as right or left, since they reverse their relative positions from top to bottom of the display. The upper X label axis may be to the right of the upper Y label axis, while at the bottom their positions are reversed.

Depth is frequently added to data graphics on 3D views to improve appearance, even for category-type data that does not inherently require three dimensions.
