---
name: Isoline Graph
slug: isoline-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Isoline, p. 200-201"

intent: Display lines connecting points of equal value to show combinations, relationships, or geographic features
direction: both

components:
  - element: isolines
    encodes: All points sharing a common value along one axis (typically Z)
    required: true
  - element: quantitative-axes
    encodes: The two or three variables being related
    required: true
  - element: value-labels
    encodes: The constant value each isoline represents
    required: true
  - element: plot-area
    encodes: The space where variable combinations exist
    required: true

parameters:
  dimensions: "2D | 3D"
  axis_type: "X-equal | Y-equal | Z-equal"
  application: "contour map | combination graph | engineering analysis"

related: []  # TBD: see also contour-graph, surface-graph

warnings:
  - "Two-dimensional graphs are generally easier to read than three-dimensional versions"
  - "Isoline spacing affects interpretability - too close or too far apart reduces clarity"
  - "Label isolines clearly to avoid misreading which points share which values"

extensions:
  harris_entry: "Isoline"
  alternate_names: ["isoquantity line", "isoquant line", "contour line"]
  typical_use: "showing combinations that yield equal results, geographic elevation, process optimization"
---

## Description

Isolines are lines of equal value. Every point on an isoline shares some common value, which normally implies equal values along either the X, Y, or Z axis. The most familiar example is the contour map, where isolines connect points of equal elevation. In engineering and analytical contexts, isolines show all combinations of two variables that produce the same result on a third variable.

Isoline graphs can be displayed in two or three dimensions. In 2D, multiple isolines appear in the same X-Y plane, each labeled with its Z-value. In 3D, each isoline can be shown at its actual position on the Z-axis, illustrating how the 2D projection relates to the full three-dimensional surface.

## Examples

Harris demonstrates isoline graphs with a tensile strength analysis:

> "All points on line A have the same tensile strength of 75 lbs. All points on line B have the same tensile strength of 50 lbs. If a tensile strength of 25 lbs. is desired, one can use this type of graph to determine which combination of hardener and cure temperature are required." (p. 200)

The example shows that with a cure temperature of 50 degrees, 25 percent hardener is required. If temperature increases to 250 degrees, only 5 percent hardener is needed to achieve the same 25 pounds of tensile strength.

Harris also shows a contour map example where isolines marked 360, 380, 400, 420, 440, 460 indicate points of equal elevation in feet above sea level.

## Usage

Isoline graphs are appropriate when:
- Showing all combinations of two variables that produce a constant third value
- Displaying geographic elevation or depth data
- Enabling viewers to interpolate between labeled isolines for intermediate values
- Analyzing trade-offs between variables in engineering or economic contexts

The two-dimensional format is generally preferred for precision reading. Three-dimensional formats help viewers understand the overall shape but sacrifice exact value determination.

## Notes

Isolines can be drawn with equal values along any axis (X, Y, or Z). The Z-axis variation (contour graph) is most common. When equal values along both X and Y axes are used, the result is sometimes called a fishnet graph.
