---
name: Matrix Display
slug: matrix-display
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Matrix Display, pp. 238-239"

intent: Simplify analysis of large quantities of data by enabling simultaneous comparison of multiple charts arranged in rows and columns
direction: both

components:
  - element: chart-grid
    encodes: Organized arrangement of multiple charts in rows and columns
    required: true
  - element: row-labels
    encodes: Identification of what each row represents
    required: false
  - element: column-labels
    encodes: Identification of what each column represents
    required: false
  - element: individual-charts
    encodes: The component visualizations being compared
    required: true
  - element: scales
    encodes: Value references for interpreting charts (may be individual or shared)
    required: false

parameters:
  chart_type: "column | scatter | line | bar | mixed"
  scale_approach: "individual | shared-by-row | shared-by-column | none"
  spacing: "abutting | separated"

related: []

warnings:
  - "Legibility sets the practical limit on number of rows and columns"
  - "As the number of variables increases, it becomes more difficult to spot trends and relationships"

extensions:
  harris_entry: "Matrix Display"
  typical_use: "analysis, monitoring, and communication across multiple dimensions"
---

## Description

A matrix display consists of multiple charts arranged in rows and columns in an organized fashion. The display's major purpose is to simplify the analysis of large quantities of data by enabling the viewer to study multiple charts at one time. This format is used for analysis, monitoring, and communication purposes across most fields.

The arrangement allows systematic comparison: each row might represent one entity (company, region, time period) while each column shows a different measure or variable. The intersecting cells show specific combinations.

## Examples

Harris describes the core concept:

> "A matrix display consists of multiple charts arranged in rows and columns in some organized fashion. The display's major purpose is to simplify the analysis of large quantities of data by enabling the viewer to study multiple charts at one time." (p. 238)

The illustrations show two common formats:
1. Column graph matrix with spaces between graphs and separate scales for each graph
2. Bidirectional scatter graph matrix without spaces between graphs and with common scales for each row and column

General observations from Harris:

> "Individual scales can be used for each graph, or a single scale can be used for an entire row or column. When one is simply looking for correlations or deviations, scales are sometimes not used at all." (p. 238)

> "Individual charts may abut one another or have spaces between them." (p. 238)

> "Almost any type of chart can be used. A matrix might be made up of all the same type of charts or a combination of several types of charts." (p. 238)

A comprehensive example shows a matrix comparing three companies across multiple dimensions including headquarters location, ownership type, sales figures, profit graphs, expense bar charts, distribution maps, and market share trend lines - demonstrating that text, graphs, maps, and symbols can all be combined.

## Usage

Matrix displays are effective when:
- Comparing multiple entities across multiple measures
- Monitoring several variables simultaneously for deviations or trends
- Looking for correlations between variables
- Presenting comprehensive profiles of comparable entities

Design considerations:
- **Scale choice**: Individual scales allow precise reading; shared scales enable direct comparison; no scales work when patterns matter more than values
- **Spacing**: Spaces improve visual separation; abutting charts save space and emphasize the matrix structure
- **Chart type**: Uniform types simplify reading; mixed types can match each variable's nature but increase complexity
- **Size**: Charts can be very small when looking for patterns, deviations, or correlations

## Notes

Most enhancement techniques used with individual charts can be applied to charts in matrices, including curve fitting, color coding, confidence limits, and symbol variations. This flexibility makes the matrix display one of the most versatile formats for multivariate data presentation.
