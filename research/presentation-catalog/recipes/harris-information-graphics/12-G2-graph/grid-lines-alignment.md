---
name: Grid Line Alignment
slug: grid-lines-alignment
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Alignment of grid lines, p. 180"

intent: Position grid lines correctly relative to labels, tick marks, and data points based on scale type and graph type
direction: construction

components:
  - element: grid-lines
    encodes: Reference lines extending across plot area
  - element: scale-labels
    encodes: Text labels on the scale
  - element: tick-marks
    encodes: Small marks indicating scale positions
  - element: data-points
    encodes: Actual data values being plotted

parameters:
  scale_type: "category | sequence | quantitative"
  graph_type: "column | bar | area | point | line"

related: []  # TBD: grid-lines-types, category-scale, quantitative-scale

warnings:
  - "Misaligned grid lines mislead viewers about data values"
  - "Grid lines are seldom aligned with columns or bars"
  - "Category scales require different treatment than quantitative scales"

extensions:
  harris_entry: "Grid and Grid Line"
---

## Description

Grid lines must be positioned correctly relative to scale labels, tick marks, and data points. The correct alignment depends on both the type of scale (category, sequence, or quantitative) and the type of graph (column, bar, area, point, or line).

## Examples

Harris provides detailed alignment guidance with illustrated examples (p. 180):

**Category and Sequence Scales:**

For column and bar graphs:
> "Grid lines are seldom aligned with columns or bars."

Instead, grid lines fall between the columns/bars or at category boundaries.

For area graphs with category scales:
Grid lines are "located between labels and data points" when data points represent discrete categories.

For point and line graphs with category scales:
Grid lines are "aligned with labels and data points" - the grid lines pass through where the data is plotted.

**Quantitative Scales:**

For all graph types with quantitative scales:
Grid lines are "aligned with scale labels" - the numeric values on the axis.

When data points have unique X-Y coordinates (scatter graphs):
Grid lines are "aligned with data points" only incidentally; the primary alignment is with scale values.

## Usage

**Category/Sequence scales with discrete values (columns, bars):**
- Position grid lines between data items
- Grid lines mark category boundaries, not item centers
- Helps viewers distinguish between categories

**Category/Sequence scales with continuous values (points, lines, areas):**
- Grid lines may pass through data point locations
- Alignment with labels helps trace values

**Quantitative scales:**
- Grid lines align with scale values
- Alignment is with the numeric labels, regardless of where data falls
- Data points fall where they fall; grid lines mark reference values

**Design principle:**
Grid lines should support value reading without creating ambiguity about what value a data point represents.

## Notes

The key distinction is that category scales treat data items as discrete entities (with grid lines marking boundaries), while quantitative scales treat the axis as a continuous measurement (with grid lines marking specific values). This difference affects how viewers read values from the graph.
