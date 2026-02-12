---
name: Trilinear Graph Grid Lines
slug: trilinear-graph-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Trilinear graphs, p. 183"

intent: Configure the three sets of grid lines for trilinear (ternary) graphs where three variables sum to 100%
direction: construction

components:
  - element: axis-1-grid-lines
    encodes: Lines perpendicular to first axis (altitude from vertex 1)
  - element: axis-2-grid-lines
    encodes: Lines perpendicular to second axis (altitude from vertex 2)
  - element: axis-3-grid-lines
    encodes: Lines perpendicular to third axis (altitude from vertex 3)
  - element: scale-labels
    encodes: Percentage values along each edge

parameters:
  grid_density: "major-only | major-and-minor"
  axes_shown: "yes | no (grid-only)"

related: []  # TBD: trilinear-graph, ternary-diagram

warnings:
  - "All three components must sum to 100% for any point"
  - "Reading values requires understanding the three-axis system"
  - "Minor grid lines are only useful for detailed analysis"

extensions:
  harris_entry: "Grid and Grid Line"
  typical_use: "composition analysis in chemistry, geology, color mixing"
---

## Description

There are three sets of grid lines on trilinear graphs, one for each axis. The axes are the altitudes of the triangle (lines from each vertex to the midpoint of the opposite side). Grid lines are drawn perpendicular to these axes, creating a pattern that allows reading three interdependent values from any point.

## Examples

Harris explains the trilinear grid structure (p. 183):

**Axis definition:**
> "Lines from the vertexes to the bases opposite (called altitudes) form the axes for trilinear graphs."

**Grid line orientation:**
> "Grid lines are drawn perpendicular to the axis to which they apply. Axes are lines that run from a vertex to the base opposite it and are perpendicular to that base."

**Simplified display:**
> "Many times the axes are not drawn, and only the three sets of grid lines and scales are shown."

The main illustration shows major grid lines at 20% intervals (0%, 20%, 40%, 60%, 80%, 100%) for each of three variables.

**Minor grid lines:**
> "When a small portion of a trilinear grid (gray area on left) is expanded (example on right), minor grid lines can sometimes be included for greater accuracy in decoding."

The expanded view shows finer subdivisions within a small region of the triangle.

## Usage

**Grid line structure:**
- Three sets of parallel lines, one for each variable
- Each set perpendicular to its corresponding axis
- Lines from all three sets intersect at every point

**Reading values:**
- Any point in the triangle represents a combination of three values
- The three values always sum to 100%
- Follow grid lines to the appropriate scale edge to read each value

**Major grid lines:**
- Typically at 10% or 20% intervals
- Provide basic reference for composition reading
- Usually sufficient for overview analysis

**Minor grid lines:**
- Useful for detailed compositional analysis
- Typically shown only in expanded/magnified views
- Add precision but increase visual complexity

**Design options:**
- Show axes explicitly (pedagogical/explanatory contexts)
- Show only grid lines and scales (compact, experienced users)
- Use partial grids for zoomed regions

## Notes

Trilinear graphs are specialized tools for representing three-component systems where the components must sum to 100%. They are standard in chemistry (phase diagrams), geology (mineral compositions), and color theory. The grid system is essential for reading compositions from the triangular format.
