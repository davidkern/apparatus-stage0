---
name: Line Graph Matrix
slug: line-graph-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Line graph matrix, p. 214"

intent: Arrange multiple line graphs in rows and columns to enable simultaneous comparison of many data series across multiple measures
direction: both

components:
  - element: individual-line-graphs
    encodes: Each graph showing one measure for one entity
    required: true
  - element: row-organization
    encodes: Grouping by one dimension (e.g., measures)
    required: true
  - element: column-organization
    encodes: Grouping by another dimension (e.g., divisions)
    required: true
  - element: consistent-scales
    encodes: Aligned axes enabling cross-graph comparison
    required: true

parameters:
  rows: "number of measures or entities"
  columns: "number of divisions or categories"
  shared_scales: "yes | no"

related: []  # TBD: see also small-multiples, matrix-display

warnings:
  - "Each graph must be large enough to be readable"
  - "Too many graphs can overwhelm the viewer"
  - "Consistent scales across graphs are essential for valid comparison"

extensions:
  harris_entry: "Line Graph"
  typical_use: "multi-division performance dashboards, comparing trends across many dimensions"
---

## Description

A line graph matrix consists of line graphs arranged in rows and columns in an organized fashion. This arrangement simplifies the analysis of large quantities of data by enabling viewers to study multiple graphs at one time.

The matrix structure allows two-dimensional comparison: across rows (same measure, different entities) and down columns (same entity, different measures). Consistent scales and time periods across graphs enable valid visual comparison.

## Examples

Harris provides a detailed example:

> "For instance, the example at the right shows the trends of six different measures in four divisions on a single page." (p. 214)

The example matrix shows:
- **Columns**: Division A, Division B, Division C, Division D
- **Rows**: Sales ($0-$25,000), Return on assets (0%-25%), Deviation from budget (-2% to 12%), Research & Arch. Eng. expenditures ($2,000-$8,000)

Each cell contains a small line graph showing that division's performance on that measure over time ('90-'95). This allows viewers to:
- Compare Division A's sales trend to Division B's sales trend (across a row)
- Compare Division A's sales to Division A's return on assets (down a column)
- Spot patterns (e.g., which divisions are improving on which measures)

## Usage

Line graph matrices are appropriate when:
- Comparing many data series across multiple dimensions
- Looking for patterns across entities and measures
- Space is available for a grid of small graphs
- The audience needs to understand relative performance across a portfolio

Construction guidelines:
- Use consistent time scales across all graphs
- Align quantitative scales within rows (same measure should use same scale)
- Keep individual graphs simple (one or few lines each)
- Label rows and columns clearly
- Consider grouping related measures in adjacent rows

## Notes

The line graph matrix is a form of small multiples, a technique for showing change over time across many instances. The matrix structure adds a second organizational dimension, creating a systematic overview that would be impossible to achieve with a single large graph.
