---
name: Three-Axis Line Graph
slug: three-axis-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Three-axis line graph, p. 214"

intent: Add a third axis to display data curves distributed along depth, enabling views of 3D data surfaces, trajectories, and patterns
direction: both

components:
  - element: vertical-axis
    encodes: Quantitative values (always quantitative)
    required: true
  - element: horizontal-axis
    encodes: Category, sequence, or quantitative scale
    required: true
  - element: depth-axis
    encodes: Third dimension (category, sequence, or quantitative scale)
    required: true
  - element: data-curves
    encodes: Lines distributed along the depth axis
    required: true

parameters:
  line_style: "conventional | ribbon (with width and depth)"
  ribbon_type: "segmented | curved"
  curve_type: "grouped | scatter | vertical drop | contour | wireframe | surface"

related: []  # TBD: see also surface-graph, contour-graph

warnings:
  - "Three-axis variations typically yield no additional information over two-axis for simple grouped data"
  - "Best used when the third dimension reveals patterns not visible in 2D"
  - "Occlusion can hide data - back curves may be obscured by front curves"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["three-dimensional line graph", "ribbon graph"]
  typical_use: "presentation graphics, showing 3D surfaces and trajectories"
---

## Description

When a third axis is added to a two-axis line graph, data curves can be distributed along this new dimension. For simple grouped line data, the curves are uniformly distributed along the third axis, though this typically adds presentation impact rather than new information.

However, three-axis graphs enable several visualization types that are not possible in two dimensions:
- **Scatter line graph**: Lines connect data points in 3D space
- **Trajectory**: Smooth curves through 3D space
- **Vertical line graph**: Lines from data points to the base plane
- **Contour graph**: Lines connecting points of equal Z-value
- **Wireframe graph**: Network of lines depicting a surface
- **Lined surface graph**: Wireframe with opaque areas between lines

The data curve can be rendered as a conventional thin line or as a ribbon with width and depth for visual impact.

## Examples

Harris describes the basic three-axis grouped line graph:

> "When a third axis is added to a two-axis grouped line graph, the data curves are uniformly distributed along the third axis. Three-axis variations of two-axis line graphs typically yield no additional information over the two-axis variation." (p. 214)

He shows ribbon variations:
> "The data graphic may be a conventional line or, as is sometimes done for presentation purposes, the line may be given width and depth and called a ribbon or ribbon graph. The ribbon may simulate a segmented or a smooth curve." (p. 214)

Harris illustrates additional three-axis graph types:
- Lines connecting scatter data points
- Smooth trajectory curves
- Vertical drop lines to base plane
- Contour lines at equal Z-values
- Wireframe surfaces
- Lined surface graphs (wireframe with opaque fills)

## Usage

Three-axis line graphs are appropriate when:
- The third dimension contains meaningful data (not just for visual effect)
- Showing how a surface or pattern exists in 3D space
- Revealing correlations or structures that would be hidden in 2D projections
- Presentation contexts where visual impact matters

The three-axis format is less appropriate when:
- The third axis adds no information (merely spreading grouped lines in space)
- Precise value reading is required (3D distortion makes this difficult)
- Back data would be occluded by front data

## Notes

There is always a quantitative scale on the vertical axis in three-axis line graphs. The other two axes can use quantitative, sequential, or category scales depending on the data and graph type. Some variations (like true scatter line graphs) require quantitative scales on all three axes.
