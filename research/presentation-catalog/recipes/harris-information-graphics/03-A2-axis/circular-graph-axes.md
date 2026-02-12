---
name: Circular Graph Axes
slug: circular-graph-axes
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Circular graph axes, p. 25"

intent: Configure radial and circular axes for polar, pie, and radar chart types
direction: both

components:
  - element: radial-axis
    encodes: Quantitative scale radiating from center
    required: true
  - element: circular-axis
    encodes: Angular scale around circumference (degrees, categories, or time)
    required: true
  - element: polar-axis
    encodes: The radial axis at zero degrees on the circular scale
    required: false
  - element: z-axis
    encodes: Vertical axis for three-dimensional circular graphs
    required: false

parameters:
  graph_type: one-axis-circle | two-axis-polar | three-axis-cylindrical | three-axis-spherical
  circular_scale: degrees | categories | time
  radial_scale: quantitative values

related: []  # TBD: see also quantitative-axis, polar-graph

warnings:
  - "Radial axis at zero degrees on circular scale serves as zero base line axis"

extensions:
  harris_entry: "Axis, Graph"
  graph_variations:
    - name: "One-axis circle graph"
      description: "Simple pie or ring chart with only circular axis"
    - name: "Two-axis polar graph"
      description: "Radar chart with radial and circular axes"
    - name: "Three-axis cylindrical polar graph"
      description: "Adds vertical Z-axis for height values"
    - name: "Three-axis spherical polar graph"
      description: "Adds second circular axis for spherical coordinates"
---

## Description

Circular graphs use a fundamentally different axis system than rectangular graphs. Lines with quantitative scales radiating from the center are called radial axes. The radial axis at the zero point on the circular scale is the zero base line axis (sometimes called the polar axis when degrees are measured on the circular scale). The line around the circumference is the circular axis or polar axis.

Harris describes four variations of circular graph axis configurations, ranging from simple one-axis circle graphs to complex three-dimensional spherical polar graphs.

## Examples

> "Lines with quantitative scales radiating from the centers of circular graphs are generally referred to as radial axes." (p. 25)

**One-axis circle graph:**
A simple pie chart with only a circular axis showing percentages (100%, 90%, 80%... around the circumference) dividing the circle into wedges.

**Two-axis polar graph:**
Shows both radial axis (0, 5, 10, 15, 20 from center outward) and circular axis (0 to 360 degrees around circumference). Data points are plotted by angle and distance from center.

**Three-axis cylindrical polar graph:**
Adds a vertical Z-axis to the two-axis polar configuration, allowing values to be measured upward from the polar plane.

**Three-axis spherical polar graph:**
Has a Z-axis for reference but incorporates a second circular axis for measuring the third variable in degrees, creating spherical coordinates.

## Usage

Circular graph axes are appropriate for:
- Displaying cyclical or periodic data (time of day, seasons, directions)
- Showing part-to-whole relationships (pie charts)
- Comparing multiple variables from a common center (radar charts)
- Navigational or directional data (compass headings, wind roses)

Axis configuration depends on dimensionality:
- One-axis: simple proportion display
- Two-axis: position by angle and magnitude
- Three-axis cylindrical: adds height dimension
- Three-axis spherical: full 3D angular positioning

## Notes

The circular axis is sometimes called the polar axis, which can create confusion with the radial polar axis. Context usually clarifies which is meant. In polar coordinates, the radial axis measures distance from origin while the circular axis measures angle from reference direction.
