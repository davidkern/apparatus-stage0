---
name: Chart Classification
slug: chart-classification
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Chart, p. 71"

intent: Organize the universe of information graphics into five major categories based on key features and primary functions
direction: recognition

components:
  - element: graph-category
    encodes: Charts showing quantitative patterns and comparisons (area, bar, line, scatter, etc.)
    required: true
  - element: map-category
    encodes: Charts showing spatial and directional relationships
    required: true
  - element: diagram-category
    encodes: Charts showing nonquantitative interrelationships
    required: true
  - element: table-category
    encodes: Charts providing preciseness of information and ease of reference
    required: true
  - element: other-category
    encodes: Charts that don't fit the other four categories
    required: true

parameters:
  classification_criteria: shape | format | function | scale_type | data_type | usage | axis_count

related: []

warnings:
  - "Individual charts can be classified into multiple subcategories depending on criteria used"
  - "Classification boundaries are not always clear-cut"

extensions:
  harris_entry: "Chart"
  alternate_names: ["information graphic"]
  typical_use: "organizing thinking about chart selection, understanding chart types"
---

## Description

A chart is a vehicle for consolidating and displaying information for purposes such as analysis, planning, monitoring, communicating, etc. There are five major categories of charts: graphs, maps, diagrams, tables, and other (those charts that do not fit into one of the other four categories).

Each major category is broken into multiple subcategories. All individual information graphics can be included in multiple subcategories depending on the criteria used, such as shape, format, function, type of scales, type of data displayed, usage, number of axes, etc.

## Examples

Harris provides an extensive classification table (p. 71) organizing charts by both category and primary function:

**By Category - Key Features**:
- Graphs (plots): Quantitative patterns and comparisons
- Maps: Spatial and directional relationships
- Diagrams: Nonquantitative interrelationships
- Tables: Preciseness of information and ease of reference
- Other Charts: Differs depending on specific chart

**By Function - "Shows patterns and/or relationships of quantitative data at point in time"**:
- Graphs: Area, Bar, Circle, Column, Line, Nomograph, Polar, Radar, Scatter, Trilinear
- Maps: Contour, Demographic, Distorted, Elevation, Prism, Shaded, Smooth statistical, Weather
- Tables: Analytical, Bidirectional, General, Quantitative, Reference, Spreadsheet
- Other: Icon comparison display, Pie chart, Proportional chart, Ranking chart, Unit chart, Venn diagram

**By Function - "Shows how/where things are distributed or located"**:
- Graphs: 100%, Border plot, Box plot, Histogram, Pareto, Population pyramid, Probability, Quantile
- Maps: Block, Blot/patch, Dot density, Geological, Pin, Profile, Topographic, Weather
- Diagrams: Block, Network, Voronoi
- Tables: Analytical, Frequency, General, Percent, Quantitative, Reference, Spreadsheet
- Other: Business matrix, Conceptual chart, Floor plan

Multiple naming example:

> "A widely used graph for plotting the distribution of data elements in a data set might be called a histogram, data distribution graph, joined column graph, column graph, two-axis graph, two-dimensional graph, rectangular graph, quantitative graph, graph, or chart. All 10 terms are perfectly correct." (p. 71)

## Usage

The classification system helps in:
- Selecting appropriate chart types for specific communication goals
- Understanding relationships between different chart types
- Recognizing that the same chart may serve multiple functions
- Learning the vocabulary of information graphics

The matrix of categories by functions provides a quick reference for chart selection based on what you want to communicate.

## Notes

Harris emphasizes that charts should be discussed "in terms of content, function, format, etc." rather than medium - whether paper, display board, or electronic display. The classification transcends the technology used to create or display the chart.
