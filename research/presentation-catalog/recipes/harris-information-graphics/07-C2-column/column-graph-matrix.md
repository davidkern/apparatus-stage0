---
name: Column Graph Matrix
slug: column-graph-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Column graph matrix, p. 90"

intent: Arrange multiple column graphs in rows and columns to enable simultaneous comparison of many measures across many entities
direction: both

components:
  - element: grid-of-column-graphs
    encodes: Multiple small column graphs arranged systematically
    required: true
  - element: row-organization
    encodes: One dimension of comparison (e.g., different measures)
    required: true
  - element: column-organization
    encodes: Other dimension of comparison (e.g., different entities/divisions)
    required: true
  - element: consistent-scales
    encodes: Same scale within each row for valid comparison
    required: true
  - element: labels
    encodes: Row and column identifiers
    required: true

parameters:
  row_variable: "measures | entities | time periods"
  column_variable: "entities | measures | locations"
  scale_consistency: "within rows | within columns | global"

related:
  - slug: simple-column-graph
    relationship: contains
  - slug: small-multiples
    relationship: variant-of

warnings:
  - "Scale consistency is crucial for valid cross-graph comparisons"
  - "Large matrices can become overwhelming"
  - "Individual graphs must be large enough to read"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["small multiples", "trellis display", "panel chart"]
  typical_use: "comparing performance across divisions, analyzing multiple KPIs, detecting patterns across entities"
---

## Description

A column graph matrix consists of column graphs arranged in rows and columns in some organized fashion. The major purpose is to simplify the analysis of large quantities of data by enabling the viewer to study multiple graphs at one time.

This arrangement leverages the power of consistent positioning: the same measure appears in the same row across all columns, and the same entity appears in the same column across all rows. Patterns emerge from comparing positions across the matrix.

## Examples

> "A column graph matrix consists of column graphs arranged in rows and columns in some organized fashion. The major purpose of a matrix is to simplify the analysis of large quantities of data by enabling the viewer to study multiple graphs at one time." (p. 90)

Harris illustrates with a business example:
- Four columns: Division A, Division B, Division C, Division D
- Four rows: Sales, Return on assets, AOP Exp. & ACGS, R&D/Eng. and Admin.
- Each cell contains a column graph showing years 1990-1995

From this single display, the viewer can:
- Note trends for seven different measures
- Compare four divisions
- Observe patterns across the entire organization
- Identify outliers or unusual performance

## Usage

Design requirements:
- Consistent scales within rows (or columns) for valid comparison
- Clear row and column labels
- Individual graphs large enough to discern patterns
- Minimal decoration to maximize data density

Organization options:
- Rows = measures, Columns = entities (as in Harris example)
- Rows = entities, Columns = measures
- Rows = time periods, Columns = entities
- Any logical two-dimensional arrangement

When to use:
- Comparing multiple metrics across multiple divisions/products/regions
- Identifying patterns across a large dataset
- Performance dashboards
- Trend analysis across many entities

## Notes

Harris references Matrix Display for additional information. This technique is related to what Edward Tufte calls "small multiples" - the same graphical design repeated for different slices of data, enabling comparison through consistent structure.
