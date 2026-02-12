---
name: Partial Grid Lines (Drop Lines)
slug: partial-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Length of grid lines (partial grid lines, drop grid lines, and drop lines), p. 181"

intent: Use grid lines that extend only partway across the graph to reduce visual clutter while maintaining value reading support
direction: construction

components:
  - element: partial-grid-line
    encodes: Grid line that does not extend completely across the graph
  - element: connection-to-data
    encodes: Line connecting data point to axis or scale
  - element: reference-line-segment
    encodes: Short line indicating scale position

parameters:
  extension: "from-data-to-axis | from-axis-partway | custom-length"
  orientation: "horizontal | vertical | both"
  graph_dimension: "2D | 3D"

related: []  # TBD: grid-lines-types, grid-lines-number

warnings:
  - "Partial lines may not support interpolation between data points"
  - "Mixed full and partial lines can create visual inconsistency"
  - "Must still maintain sufficient reference for value reading"

extensions:
  harris_entry: "Grid and Grid Line"
  alternate_names: ["drop grids", "drop lines"]
---

## Description

When a grid line does not extend completely across the graph, it is sometimes referred to as a partial grid line, a drop grid, or a drop line. This technique reduces visual clutter by including only the grid line segments that directly support value reading for the actual data points.

## Examples

Harris describes the technique and its applications (p. 181):

> "When a grid line does not extend completely across the graph it is sometimes referred to as a partial grid line, a drop grid, or a drop line."

Applicability:
> "Partial grid lines can be used with any type of graph, including three-dimensional. They can be used with single or multiple data series, on the horizontal or vertical axis, and as major, minor, or intermediate type grid lines."

Benefit:
> "The use of partial grid lines can sometimes enhance the readability of the graph by reducing the number of unnecessary lines."

The illustrations show four examples:
1. Bar graph with partial vertical grid lines extending from axis to bars
2. Point graph with partial grid lines from data points to both axes
3. Line graph with partial grid lines connecting curves to scale values
4. 3D graph with partial lines helping locate points in space

## Usage

**When to use partial grid lines:**
- Data points are sparse and full grid would be mostly empty
- Visual clutter from full grid obscures data
- Emphasis should be on specific data values, not the entire space
- 3D graphs where full grids add confusion

**Types of partial grid lines:**
- **Drop lines**: Extend from data point to axis (most common)
- **Axis stubs**: Short lines extending from axis into plot area
- **Connecting segments**: Lines between data points and reference values

**Design considerations:**
- Maintain enough reference for viewers to estimate values
- Use consistently (all points or none)
- Consider color/weight to distinguish from data graphics
- In 3D, partial lines can help locate points in space

**Trade-offs:**
- Reduces clutter but limits interpolation between points
- Works well for discrete data, less well for continuous data
- May require more prominent axis labels to compensate

## Notes

Partial grid lines represent a design trade-off between completeness and clarity. They work best when the goal is to communicate specific data values rather than to support reading arbitrary points on a continuous scale.
