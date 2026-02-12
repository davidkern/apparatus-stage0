---
name: Cartesian Coordinates
slug: cartesian-coordinates
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cartesian Coordinates, p. 67"

intent: Locate data points on rectangular graphs using pairs (2D) or triplets (3D) of numeric values
direction: both

components:
  - element: x-coordinate
    encodes: Distance from zero on the horizontal axis
    required: true
  - element: y-coordinate
    encodes: Distance from zero on the vertical axis
    required: true
  - element: z-coordinate
    encodes: Distance from zero on the third axis (3D only)
    required: false
  - element: origin
    encodes: The point where all axes intersect (0,0 or 0,0,0)
    required: true

parameters:
  dimensions: two | three
  value_range: positive_only | positive_and_negative

related: []

warnings:
  - "Coordinate order matters - first value is always horizontal (X), second is vertical (Y)"

extensions:
  harris_entry: "Cartesian Coordinates"
  alternate_names: ["rectangular coordinates"]
  typical_use: "plotting data points on rectangular graphs"
---

## Description

Cartesian coordinates are the values by which data points are located on rectangular graphs. On two-dimensional graphs, two coordinates or numbers define the location of each data point. The two values are written one behind the other with a comma between (e.g., 2,4; 5,1; 4,-3).

The first number indicates how far the point is located from zero on the horizontal or X-axis. The second number indicates how far the point is located from zero on the vertical or Y-axis. Both positive and negative values can be used.

With three-dimensional graphs the same procedure is used, except that there are three coordinates to designate the location along all three axes.

## Examples

Harris provides coordinate examples (p. 67):

> "This data point has coordinates 2,4" - located 2 units right of the origin on the X-axis and 4 units up on the Y-axis

> "This data point has coordinates 5,1" - located 5 units right and 1 unit up

> "This data point has coordinates 4,-3" - located 4 units right and 3 units down (below the X-axis)

The diagram shows dashed lines from each point to the axes for illustrative purposes; in actual graphs such lines would typically not be used.

## Usage

Cartesian coordinates are fundamental to all rectangular graphs including:
- Scatter plots
- Line graphs
- Any graph where data points must be precisely positioned

The coordinate system allows both positive and negative values, enabling graphs to show data that crosses zero in either direction.

## Notes

The term "rectangular coordinates" is an alternate name reflecting that this system works with rectangular (right-angle) graph grids.
