---
name: Drop Line
slug: drop-line
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Drop Line, p. 143-144"

intent: Connect data points to reference points, lines, or planes to help viewers determine values or highlight differences
direction: both

components:
  - element: data-point
    encodes: The value being displayed
  - element: drop-line
    encodes: Thin line connecting point to reference
  - element: reference
    encodes: Axis, baseline, fitted curve, other data point, or plane
  - element: terminus-marks
    encodes: Symbols at line endpoints
    required: false

parameters:
  line_style: solid | dashed
  reference_type: zero-axis | non-zero-baseline | fitted-curve | other-data-series | wall | floor
  drop_count: one | two | three

related: []

warnings:
  - "Multiple drop lines per point add precision but increase visual complexity"
  - "Coding may be needed when multiple data series share a graph"

extensions:
  harris_entry: "Drop Line"
  alternate_names: ["drop grid", "tether"]
  typical_use: "showing deviations from reference, clarifying 3D data point positions, connecting paired observations"
---

## Description

Drop lines are thin lines drawn from data points to reference points, lines, or planes. They anchor floating data points to something meaningful, helping viewers decode values or perceive differences. The reference might be the zero axis, a fitted curve, another data series, or in 3D graphs, the walls or floor of the plotting space.

What the drop line highlights depends on where it connects: lines to an axis show absolute values; lines to a fitted curve show residuals; lines between data series show paired differences.

## Examples

Harris shows extensive variations (p. 143-144):

**Basic configurations:**
- Drawn to the zero base line axis
- Drawn to a non-zero reference line
- Drawn to a wall (3D)
- Drawn to the floor (3D)
- Drawn to a reference point
- Drawn to a fitted curve
- Drawn between data series

**Multiple drop lines:**
> "Typically, only one drop line is used with each data point. In certain situations, however, two or three might be used to enable the viewer to more accurately decode the information."

The illustrations show:
- Two drop lines per point (for 2D precision)
- Three drop lines per point (for 3D: to both side walls and floor)
- Trilinear graph with drop lines to circular base

**Applied to various graph types:**
> "Drop lines are frequently used with point graphs but can be used with almost any type of graph"

Examples include: three-dimensional ribbon graph, line graph, area graph, and surface graph.

## Usage

Drop lines serve multiple purposes:
- **Value reading**: Lines to axis help estimate coordinates
- **Deviation display**: Lines to fitted curve show residuals
- **Paired comparison**: Lines between series highlight differences
- **3D anchoring**: Lines to walls/floor locate points in space

Style variations encode information:
- Solid vs. dashed distinguishes data series
- Line coding differentiates when multiple series share a graph
- Grid lines may or may not accompany drop lines

## Notes

The choice of what reference to drop to fundamentally changes what the visualization communicates. Dropping to zero shows absolute magnitude; dropping to a fitted curve shows model fit; dropping between series shows correspondence. Select the reference based on the analytical question.

In 3D graphs, drop lines are often essential since perspective makes it difficult to judge point positions without visual anchors.
