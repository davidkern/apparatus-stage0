---
name: Radar Graph
slug: radar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Radar Graph, pp. 320-322"

intent: Compare multiple entities across several variables using a circular layout where each variable forms a radial axis and data points connect to form characteristic polygons
direction: both

components:
  - element: radial-axes
    encodes: Category axes radiating from center, each representing a different variable
    required: true
  - element: circular-grid-lines
    encodes: Concentric circles or polygons indicating value levels on the quantitative scale
    required: false
  - element: data-points
    encodes: Values plotted along each radial axis for each data series
    required: true
  - element: polygon
    encodes: Shape formed by connecting adjacent data points in same data series
    required: true
  - element: scale-labels
    encodes: Numeric or descriptive labels indicating values along radial axes
    required: false
  - element: category-labels
    encodes: Names of variables at the outer ends of radial axes
    required: true

parameters:
  number_of_variables: "3 or more"
  scale_type: "uniform | variable-per-axis"
  zero_position: "center | circumference"
  shading: "none | filled | translucent"

related: []

warnings:
  - "When polygons intersect, determining which entity has better overall evaluation becomes difficult and involves judgment"
  - "Whether larger or smaller polygon is 'better' depends on whether favorable values are near center or circumference - must be consistent throughout"
  - "Ring graphs can be misleading because viewers may assume values are proportional to areas instead of widths"

extensions:
  harris_entry: "Radar Graph"
  alternate_names: ["star graph", "spider graph", "web chart"]
  typical_use: "comparing nutritional content of foods, evaluating job candidates across multiple criteria, product feature comparisons"
---

## Description

A radar graph is a circular graph used primarily as a comparative tool for displaying multivariate data. Each variable is represented by a radial axis extending from the center, with axes distributed equally around the 360 degrees of the circle. Data points for each entity are plotted along these axes and connected by straight lines to form closed polygons.

The graph can be interpreted by either reading actual values on the axes or by comparing the areas enclosed by the polygons. When one polygon is distinctly larger than others, interpretation is straightforward. When curves intersect, interpretation becomes more difficult and may involve judgment.

## Examples

> "For example, the nutritional content of two different foods might be compared based on the percentage of recommended daily allowances of five different ingredients that each contains." (p. 320)

Harris illustrates with Food A and Food B compared across Protein, Vitamin A, Vitamin C, Thiamin, and Niacin. Food A's larger polygon indicates higher overall nutritional value based on these measures.

> "In radar graphs, each category axis (radii) represents a different variable. Other than readability, there is no limitation as to the number of variables that can be included in a single graph." (p. 320)

## Usage

**Scale Variations**:
- All axes can have the same upper limit and intervals
- Each axis can have different upper limits appropriate to the data
- Upper limit can equal the largest value in any plotted data series
- Zero can be at center (most common) or at circumference (when smaller is better)
- Logarithmic scales can be used

**Multiple Data Series**:
- Multiple series can be overlaid on one graph using different colors/line styles
- When many series are compared, each can be placed on a separate graph with graphs arranged adjacent to one another
- With tick marks removed and axes shortened, the polygons become icons (stars, snowflakes, profiles) useful for quick overall comparisons

**Qualitative Data**:
Radar graphs can incorporate qualitative information by establishing arbitrary scales (e.g., 0 to 10) and ranking entities. Since each axis has its own scale, qualitative and quantitative information can coexist on the same graph.

**Grouping**:
Arcs can be drawn around groups of categories to indicate they share something in common (e.g., technical skills vs. people skills when comparing job candidates).

## Notes

Harris demonstrates that radar graphs work well for comparing data series with many variables, showing an example comparing two series across 26 variables. When more than two data series with large numbers of variables need comparison, each series is generally plotted on a separate graph.

Grid lines include radial/category grid lines (radiating from center) and circular/radius/value grid lines (concentric circles or polygons). The general tendency is to minimize grid lines; circular grid lines are frequently omitted entirely.
