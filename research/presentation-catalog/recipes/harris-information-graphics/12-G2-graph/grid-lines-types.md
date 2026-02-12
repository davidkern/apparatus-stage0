---
name: Grid Line Types
slug: grid-lines-types
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Types of grid lines, pp. 180-181"

intent: Select and configure major, minor, and intermediate grid lines to support accurate value reading without visual clutter
direction: construction

components:
  - element: major-grid-lines
    encodes: Primary reference lines aligned with main scale labels, boldest appearance
  - element: minor-grid-lines
    encodes: Secondary reference lines for finer divisions, faintest appearance
  - element: intermediate-grid-lines
    encodes: Occasional middle-level lines between major and minor
    required: false

parameters:
  differentiation_method: "line-width | dashes | dots | color | shading"
  orientation: "horizontal | vertical | both"

related: []  # TBD: grid-lines-alignment, grid-lines-number, partial-grid-lines

warnings:
  - "Too many grid lines creates visual clutter"
  - "Grid lines must be clearly differentiated from data graphics"
  - "Minor grid lines should be subtle to avoid competing with major lines"

extensions:
  harris_entry: "Grid and Grid Line"
  alternate_names: ["rulings", "grid rules", "coordinate lines", "scale lines"]
---

## Description

The three major types of grid lines used with graphs are major, minor, and intermediate. These types are differentiated by their visual prominence and their alignment with scale elements.

Major grid lines align with the major labels on the scale and are the boldest in appearance. They provide the primary reference for value reading. Minor grid lines align with lesser tick marks and/or labels, providing finer-grained references. They are the least bold of the three types. Intermediate grid lines are only occasionally used for special cases requiring a middle level of prominence.

## Examples

Harris describes the three-level hierarchy (p. 180):

> "The three major types of grid lines used with graphs are major, minor, and intermediate. The major grid lines align with the major labels on the scale and are the boldest in appearance. Intermediate and minor grid lines align with the lesser tick marks and/or labels."

**Differentiation methods (p. 181):**

> "Major, intermediate, and minor grid lines are differentiated from one another by means of line width, dashes, dots, color, or shading. Major grid lines are always the boldest and minor grid lines the faintest, whichever method is used."

Three illustrated approaches:
1. "All lines solid black with minor grid lines thinner than the major grid lines"
2. "Minor grid lines the same size as major grid lines but a fainter shade"
3. "Major grid lines solid and minor grid lines dashed or dotted"

## Usage

**Major grid lines:**
- Always aligned with major scale labels
- Boldest appearance (thicker, solid, darker)
- Provide primary value references
- Essential for most graphs

**Minor grid lines:**
- Aligned with lesser tick marks or subdivisions
- Faintest appearance (thinner, lighter, dashed)
- Provide precision for detailed value reading
- Optional; add only when precision is needed

**Intermediate grid lines:**
- Occasionally used for middle-level references
- Visual weight between major and minor
- Useful when scale has three distinct levels of subdivision

**Differentiation approaches:**
- Line width variation: simple, works in black and white
- Shade/color variation: clear hierarchy, may not reproduce in B&W
- Dash/dot patterns: clear distinction, may create visual noise

## Notes

Harris notes that "If lesser tick marks or labels are not shown, the grid lines denote where they would be if they were shown." This means grid lines can provide precision even when explicit tick marks are omitted for visual simplicity.
