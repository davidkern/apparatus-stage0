---
name: Line Graph Grid Lines
slug: line-graph-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Grid lines on line graphs, p. 218"

intent: Aid value estimation and visual tracking by adding reference lines to line graphs
direction: construction

components:
  - element: major-horizontal-grid-lines
    encodes: Reference for estimating Y-axis values
    required: false
  - element: major-vertical-grid-lines
    encodes: Reference for tracking X-axis positions
    required: false
  - element: minor-grid-lines
    encodes: Finer subdivision for more precise estimation
    required: false

parameters:
  horizontal_grid: "none | major only | major and minor"
  vertical_grid: "none | major only"
  combination: "none | horizontal only | both axes | full major and minor"

related: []  # TBD: see also drop-lines

warnings:
  - "Too many grid lines can create visual clutter"
  - "Grid lines should be faint enough not to compete with data lines"

extensions:
  harris_entry: "Line Graph"
  alternate_names: []
  typical_use: "improving readability and value estimation accuracy"
---

## Description

Grid lines on line graphs serve as visual references to help viewers estimate values and track positions across the graph. Harris illustrates four common variations showing the progression from no grid lines to increasingly detailed grids.

## Examples

**Four grid line variations** (p. 218):
The same data is shown with:
1. **No grid lines**: Clean appearance but harder to estimate values
2. **Major horizontal grid lines**: Helps estimate Y-axis values
3. **Major horizontal and vertical grid lines**: Aids both value estimation and X-axis tracking
4. **Major and minor horizontal and major vertical grid lines**: Maximum precision for value estimation

All examples show identical data curves, allowing direct comparison of how grid density affects readability.

## Usage

Choose grid line density based on:
- How precisely viewers need to read values
- The complexity of the data (multiple series may need more grid support)
- The width of the graph (wider graphs benefit from vertical grids)
- Whether scales appear on one or both sides

General guidelines:
- Horizontal grid lines are most commonly used as they aid the primary task of reading values
- Vertical grid lines become more useful with time series or when precise X-axis reading matters
- Minor grid lines add precision but increase visual complexity
- Grid lines should be visually subordinate to data lines

## Notes

Harris cross-references the Grid Lines entry for more comprehensive treatment. The choice of grid configuration often depends on whether the graph is for detailed analysis (more grids) or quick overview (fewer grids).
