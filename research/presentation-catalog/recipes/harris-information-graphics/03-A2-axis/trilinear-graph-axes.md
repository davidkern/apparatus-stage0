---
name: Trilinear Graph Axes
slug: trilinear-graph-axes
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Trilinear graph axes, p. 25"

intent: Configure the three-axis system for ternary diagrams displaying compositional data
direction: both

components:
  - element: primary-axes
    encodes: Three altitude lines from vertices to opposite bases (measurement references)
    required: true
  - element: label-axes
    encodes: Three triangle sides used for scale display
    required: true
  - element: scale-labels
    encodes: Percentage or proportion values along each label axis
    required: true
  - element: grid-lines
    encodes: Parallel lines to aid value reading
    required: false

parameters:
  axis_designation: X-Y-Z | positional (left, right, bottom)
  scale_range: 0-100% | 0-1.0

related: []  # TBD: see also triangular-coordinates

warnings:
  - "There are no guidelines as to which letter (X, Y, Z) should be assigned to which axis"
  - "Values on the three axes must sum to 100% or 1.0"

extensions:
  harris_entry: "Axis, Graph"
  alternate_names: ["ternary diagram axes", "triangular coordinate axes"]
  typical_use: "displaying three-component mixtures where proportions sum to unity"
---

## Description

Trilinear graphs use a unique three-axis system based on an equilateral triangle. The three primary axes are the altitude lines running from each vertex to the center of the opposite base. These primary axes form right angles with the bases and serve as the fundamental measurement references. The three lines forming the triangle's perimeter serve as label axes where scale values are displayed.

The scale values on the label axes are projections of values measured on the primary axes. Any point within the triangle represents a composition where the three components sum to 100%.

## Examples

> "The three primary axes of a trilinear graph are the three lines that run from the vertexes to the bases opposite them (altitudes). The primary axes form right angles with the bases." (p. 25)

Harris illustrates the dual axis system:
- **Primary axes**: Three lines from vertices perpendicular to opposite sides (X-axis, Y-axis, Z-axis labeled at each altitude)
- **Label axes**: The three triangle sides (Left scale axis, Right scale axis, Bottom or horizontal scale axis)

The label axes are typically referred to by:
- Position: right, left, bottom (horizontal)
- Title: whatever variable each represents
- Letter designation: X, Y, and Z (with no standard assignment convention)

## Usage

Trilinear graph axes are appropriate for:
- Geological compositions (soil, rock, mineral mixtures)
- Chemical formulations (three-component alloys)
- Population genetics (three allele frequencies)
- Any data where three proportions must sum to unity

Reading values:
- Locate the point within the triangle
- Draw lines parallel to each side of the triangle
- Read where these lines intersect the opposite scale axes
- Values should sum to 100%

## Notes

Unlike rectangular graphs where X and Y have standard positions, trilinear graphs have no universal convention for axis letter assignment. Documentation should clearly specify which variable maps to which axis. The perpendicular primary axes differ from the angled label axes, which can initially confuse readers accustomed to rectangular coordinate systems.
