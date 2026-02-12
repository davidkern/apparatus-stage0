---
name: Circular Graph Grid Lines
slug: circular-graph-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Circular graphs, p. 183"

intent: Configure radial and circular grid lines for polar, radar, and other circular graph formats
direction: construction

components:
  - element: radial-grid-lines
    encodes: Lines radiating from center, marking angular positions around circumference
  - element: circular-grid-lines
    encodes: Concentric circles marking distances along radius from center

parameters:
  angular_divisions: "degrees | categories | equal-segments"
  radial_scale: "linear | logarithmic"
  grid_extent: "full | partial"

related: []  # TBD: polar-graph, radar-chart, pie-chart

warnings:
  - "Pie charts have only radial lines (no circular grid lines needed)"
  - "Too many angular divisions creates visual noise"
  - "Logarithmic radial scales require careful labeling"

extensions:
  harris_entry: "Grid and Grid Line"
  typical_use: "polar graphs, radar charts, circular statistical displays"
---

## Description

Most circular graphs have two sets of grid lines. Radial grid lines extend outward from the center, marking off positions around the circumference. Circular grid lines are concentric circles that mark distances along the radius. Together, these form a polar coordinate system for the graph.

## Examples

Harris describes the two grid line types (p. 183):

**Radial grid lines:**
> "Radial grid lines are generally equally spaced around the circle. They may be used for marking off equal numbers of degrees or for denoting categories or sequential units."

The illustration shows radial lines at 30-degree intervals (0, 30, 60, 90... 330 degrees).

**Circular grid lines:**
> "Circular grid lines are concentric circles that mark off units of measure along the scale that radiates from the center of the circle."

The example shows concentric circles at values 0, 5, 10, 15, 20 along the radius.

**Single-axis circular graphs:**
> "If a circular graph has only one axis, as in the case of circle graphs, there are no circular grid lines and only the radial grid lines are used."

Pie charts, for example, only divide the circle into sectors with no need for radial measurement.

**Partial grids:**
> "In some cases only partial grids are used with circular graphs to enlarge the area of interest, improve accuracy in decoding, make scales more visible, and focus the viewer's attention on areas where the data is plotted."

Harris shows examples of partial circular grids where only a wedge-shaped section is displayed.

**Logarithmic scales:**
> "Linear or logarithmic scales can be used with either a full or partial grid."

## Usage

**Radial grid lines (angular):**
- **Degrees**: For technical/scientific polar plots (typically 30 or 45 degree intervals)
- **Categories**: For radar charts (one line per variable)
- **Time**: For clock-face style time displays

**Circular grid lines (radial):**
- Mark measurement units from center outward
- Linear spacing for standard scales
- Logarithmic spacing for data spanning orders of magnitude

**Partial grids:**
- Focus on the angular range where data exists
- Useful for directional data concentrated in one area
- Can enlarge area of interest for detail

**By graph type:**
- **Polar graphs**: Both radial and circular lines needed
- **Radar/spider charts**: Radial lines for variables, circular lines for values
- **Pie/circle graphs**: Only radial lines (sector boundaries)

## Notes

Harris notes that major, minor, and intermediate grid lines can be used with circular graphs just as with rectangular graphs. The choice of how many divisions to show depends on the precision needed and the visual clarity required.
