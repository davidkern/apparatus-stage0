---
name: Isometric Projection
slug: isometric-projection
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Isometric Projection (View), p. 201"

intent: Give a three-dimensional appearance to graphs by rotating and tilting so viewer sees top and two sides simultaneously
direction: both

components:
  - element: rotated-axes
    encodes: X, Y, and Z axes positioned at 120-degree angles to each other
    required: true
  - element: tilted-view
    encodes: Orientation showing top and two sides of the data graphic
    required: true
  - element: data-graphic
    encodes: The chart elements (columns, surfaces, etc.) rendered in 3D
    required: true

parameters:
  angle_between_axes: "120 degrees (defines isometric specifically)"
  graph_type: "column graph | bar graph | surface graph | other"

related: []  # TBD: see also three-dimensional-graph

warnings:
  - "Actual values are difficult to read using axonometric or isometric views"
  - "All surfaces are somewhat distorted in isometric projection"
  - "No major plane (X-Z, Y-Z, or X-Y) is parallel to the plane of the paper"
  - "Best used for overview and showing relative values, trends, correlations, and patterns rather than precise values"

extensions:
  harris_entry: "Isometric Projection (View)"
  alternate_names: ["isometric view", "axonometric projection"]
  typical_use: "presentation graphics, showing overview of data, revealing patterns and unusual data points"
  parent_category: "axonometric"
---

## Description

Isometric projection is a technique for giving graphs a three-dimensional appearance. The graph is rotated and tilted forward so the viewer can see the top and two sides at the same time. This type of view belongs to the general category of axonometric projections, with the specific characteristic that the angles between each pair of axes (X-Y, Y-Z, X-Z) are all 120 degrees.

In an isometric view, no major plane is parallel to the plane of the paper, which means all surfaces are somewhat distorted. This distortion is the trade-off for gaining the ability to show three-dimensional structure.

## Examples

Harris illustrates the technique with a three-dimensional column graph:

> "Since actual values are difficult to read using axonometric or isometric views, the major function of such graphs is generally to give an overview of the data and show relative values, trends, correlations, patterns, unusual data points, etc. Exact values are typically determined some other way." (p. 201)

The example shows a column graph rotated so that the Z-axis points upward, while the X and Y axes recede at 120-degree angles from each other.

## Usage

Isometric projection is appropriate when:
- The goal is to provide an overview rather than enable precise value reading
- Showing the general shape and pattern of three-dimensional data
- Creating presentation graphics where visual impact matters more than precision
- Revealing correlations or unusual data points that might be hidden in 2D views

Isometric projection is inappropriate when:
- Precise value determination is required
- The audience needs to extract specific numbers from the chart
- Distortion would mislead about actual relationships in the data

When exact values are needed, they should be determined from a table, data labels, or a supplementary two-dimensional graph.

## Notes

The same isometric principles apply to graphs, maps, and other visual representations. While this technique is often used for presentation purposes, the distortion inherent in any axonometric view means it should be used thoughtfully, with awareness that it prioritizes overview over precision.
