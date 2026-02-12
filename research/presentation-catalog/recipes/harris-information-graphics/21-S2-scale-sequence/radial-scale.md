---
name: Radial Scale
slug: radial-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Number and location of scales, Circular, p. 342"

intent: Configure a scale extending from the center to the circumference of a circular graph to encode quantitative values
direction: both

components:
  - element: radial-axis
    encodes: Line from center to circumference along which values are measured
    required: true
  - element: scale-labels
    encodes: Numeric values at intervals along the radius
    required: true
  - element: tick-marks
    encodes: Division markers along the radial axis
    required: false
  - element: concentric-grid-circles
    encodes: Reference circles at labeled values (optional)
    required: false

parameters:
  scale_type: "linear | logarithmic"
  minimum_value: "value at center (typically zero or minimum)"
  maximum_value: "value at circumference"
  label_positions: "single radius | multiple radii | concentric circles"

related: []  # TBD: angular-scale, polar-graph

warnings:
  - "In almost all cases, the lowest value is at the center and largest at the circumference"
  - "Multiple display methods exist for radial scales; choose based on graph complexity"

extensions:
  harris_entry: "Scale"
  typical_use: "polar graphs, radar charts, circular displays"
---

## Description

Radial scales are used on circular graphs to encode quantitative values along the radius, from the center of the circle outward to the circumference. In almost all cases, the lowest value on the scale is at the center and the largest at the circumference. Radial scales might be linear or logarithmic.

There are three major ways in which radial scales are displayed:
1. Labels along a single radius
2. Labels along multiple radii (at different angles)
3. Concentric circles with labels, showing values at each ring

## Examples

> "There are three major ways in which radial scales are displayed. In almost all cases the lowest value on the scale is at the center and the largest at the circumference. The radial scales might be linear or logarithmic." (p. 342)

The PDF illustrates:
- A circular graph with angular scale (0-330 degrees) around the circumference
- Radial scale options showing values 0-6 extending from center to edge
- One example shows labels along a single radius
- Another shows concentric circles with values labeled at each ring
- A third shows labels repeated on opposite sides of the graph

## Usage

Radial scales are appropriate when:
- Creating polar graphs or radar charts
- Displaying data that radiates from a central point
- Combining with angular scales for polar coordinate displays
- Showing magnitude varying by direction or category

Radial scale considerations:
- Linear scales are most common for general use
- Logarithmic scales may be used when data spans multiple orders of magnitude
- Grid circles at labeled values help viewers estimate intermediate positions
- Labels may be placed along one radius (cleaner) or multiple radii (easier to read from any angle)

## Notes

The combination of a radial scale (measuring distance from center) with an angular scale (measuring angle around the circle) creates a polar coordinate system. This is the basis for polar graphs, radar charts, and other circular displays where both direction and magnitude are encoded.
