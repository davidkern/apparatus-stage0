---
name: Grid Line Quantity Selection
slug: grid-lines-number
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Number of grid lines, p. 182"

intent: Determine the optimal number of grid lines to balance decoding accuracy against visual clutter
direction: construction

components:
  - element: scale-labels
    encodes: Number of major labels determines major grid line count
  - element: major-grid-lines
    encodes: Primary reference lines (typically 3-7)
  - element: minor-grid-lines
    encodes: Additional precision lines between major lines
  - element: data-complexity
    encodes: Graph type and data density affecting grid needs

parameters:
  accuracy_requirement: "low | medium | high"
  graph_type: "2D | 3D"
  visual_density: "sparse | medium | dense"

related: []  # TBD: grid-lines-types, grid-lines-location

warnings:
  - "Too few grid lines reduces reading accuracy"
  - "Too many grid lines creates clutter and reduces readability"
  - "3D graphs benefit less from added grid lines than 2D graphs"

extensions:
  harris_entry: "Grid and Grid Line"
---

## Description

The two factors having the greatest influence on the number of grid lines used on graphs are the number of labels and the degree of accuracy expected in the decoding process. Finding the right balance is essential: too few lines reduces accuracy, and too many causes clutter and makes the graph harder to read.

## Examples

Harris illustrates the trade-off with six versions of the same data (p. 182):

> "The two factors having the greatest influence on the number of grid lines used on graphs are the number of labels and the degree of accuracy expected in the decoding process."

The six examples show the same column graph with:
- No horizontal grid lines
- One horizontal grid line
- Two horizontal grid lines
- Five horizontal grid lines
- 14 horizontal grid lines
- 29 horizontal grid lines

> "Generally an effort is made to strike a balance between degree of accuracy and number of grid lines. Too few lines reduces the accuracy, and too many causes clutter and makes the graph harder to read."

**For 3D graphs:**
> "Fewer grid lines tend to be used with three-dimensional graphs than with two-dimensional graphs, because added grid lines generally do little to improve the readability of three-dimensional graphs."

## Usage

**Increasing grid lines:**
- More scale labels = more major grid lines
- Higher accuracy needs = more minor grid lines between labels
- Both approaches increase total grid line count

**Recommended ranges:**
- Major horizontal grid lines: typically 3-7
- Minor subdivisions: typically 1-4 between each major line
- Total grid lines: rarely exceed 15-20 in either direction

**By graph type:**
- **2D graphs**: Can support more grid lines productively
- **3D graphs**: Fewer lines needed; added lines often unhelpful
- **Area graphs**: May need fewer lines as fill provides reference
- **Point/scatter graphs**: May need more lines for precise location

**Decision factors:**
- Required precision of value reading
- Visual complexity of data graphics
- Audience familiarity with graph reading
- Physical size of the graph (larger can support more lines)

## Notes

Harris's visual comparison makes clear that the "right" number depends on purpose. A graph for precise analysis may warrant more lines; a graph for quick comparison may need fewer. The principle is that every grid line should earn its place by supporting value reading without adding clutter.
