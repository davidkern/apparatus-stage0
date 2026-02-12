---
name: Grid Line Location (Front vs. Behind)
slug: grid-lines-location
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Location of grid lines, p. 182"

intent: Position grid lines behind, in front of, or both relative to data graphics to optimize value reading and visual clarity
direction: construction

components:
  - element: background-grid
    encodes: Grid lines behind data graphics (most common)
  - element: foreground-grid
    encodes: Grid lines in front of or on data graphics
  - element: combined-grid
    encodes: Grid lines both behind and on data graphics

parameters:
  location: "behind | front | both"
  graph_type: "2D | 3D"
  data_graphic_type: "line | bar | area"

related: []  # TBD: grid-lines-types, area-graph

warnings:
  - "Foreground grid lines can obscure data if too prominent"
  - "Background-only lines may be hidden under large data graphics"
  - "Combined approach adds visual complexity"

extensions:
  harris_entry: "Grid and Grid Line"
---

## Description

Grid lines can be positioned behind data graphics (most common), in front of or on data graphics, or in both locations. The choice affects how easily viewers can estimate values from the data graphics and the overall visual appearance of the graph.

## Examples

Harris describes three location strategies (p. 182):

**Behind data graphics (most common):**
> "Typically grid lines are located behind the data graphics in both two- and three-dimensional graphs."

This is the standard approach where grid lines provide a reference backdrop without interfering with the data.

**In front of or on data graphics:**
> "Occasionally the grid lines are located in front of or on the data graphics... This is done for two main reasons: to aid the viewer in estimating data point values, particularly with data graphics that have large surface areas such as area graphs; and to improve the appearance of the graph."

When data graphics are large or filled (like area graphs), overlaying grid lines helps viewers read values that would otherwise require tracing to the edge.

**Both behind and on:**
> "In still other cases, the grid lines are shown both on and behind the data graphics. This technique is used more frequently with three-dimensional graphs, since they are more difficult to read."

The illustration shows grid lines extending from the back wall of a 3D graph onto the surface of the data.

> "When multiple types and locations of grid lines are used, it is a matter of judgment as to which grid lines should go where."

## Usage

**Behind (default):**
- Clean appearance with clear data graphics
- Works well for line, point, bar, and column graphs
- Grid lines may be hidden under area fills

**In front / On data:**
- Essential for reading values in large filled areas
- Useful for area graphs, surface plots
- Grid lines must be subtle to avoid obscuring data

**Both locations:**
- Most common in 3D graphs
- Provides reference both at back and on data surface
- Adds visual complexity; use judiciously

**Design considerations:**
- Grid lines in front should be lighter/thinner than those behind
- Consider using only major lines in front, all lines behind
- 3D graphs often need both for any value reading at all

## Notes

Harris emphasizes that 3D graphs particularly benefit from grid lines in multiple locations because the depth makes value estimation difficult. The trade-off is increased visual complexity, so this technique should be applied thoughtfully.
