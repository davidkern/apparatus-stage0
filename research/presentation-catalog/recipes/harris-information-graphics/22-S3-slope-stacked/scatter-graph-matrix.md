---
name: Scatter Graph Matrix
slug: scatter-graph-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Scatter Graph, p. 359"

intent: Simplify analysis of correlations among multiple variables by displaying all pairwise scatter plots in a matrix arrangement
direction: recognition

components:
  - element: matrix-cells
    encodes: Individual scatter plots for each variable pair
    required: true
  - element: variable-labels
    encodes: Variable names on rows and columns
    required: true
  - element: diagonal-cells
    encodes: Blank or containing distribution graphs for each variable
    required: false
  - element: scatter-points
    encodes: Data observations plotted for each variable pair
    required: true

parameters:
  variable_count: "3 or more variables"
  diagonal_content: "blank | distribution graph | histogram"
  symmetry: "full matrix | upper/lower triangle only"

related: []  # TBD: scatter-graph, matrix-display

warnings:
  - "Matrix size grows quadratically with number of variables"
  - "Individual scatter plots may be small, reducing detail visibility"
  - "Diagonal cells where same variable appears on both axes are left blank (self-correlation is always perfect)"

extensions:
  harris_entry: "Stacked Scatter Graph"
  alternate_names:
    - "stacked scatter graph"
    - "scatter plot matrix"
    - "SPLOM"
    - "pairs plot"
  typical_use: "exploratory data analysis looking for correlations among multiple variables"
---

## Description

A scatter graph matrix (which Harris calls a "stacked scatter graph") is a matrix display where each cell contains a scatter plot showing the relationship between two variables. With n variables, the matrix contains n x n cells, with each row and column representing one variable. The cells along the diagonal, where the same variable would be plotted against itself, are typically left blank or used to display the distribution of that variable.

Harris explains: "Their major purpose is to simplify the analysis of large quantities of data, particularly when one is looking for correlations or other meaningful relationships."

## Examples

From the illustration on p. 359, Harris shows a 3x3 scatter graph matrix for Variables A, B, and C:
- The matrix shows all pairwise scatter plots
- Each row corresponds to one variable on the Y-axis
- Each column corresponds to one variable on the X-axis
- The diagonal cells (A vs A, B vs B, C vs C) are blank

The scatter plots reveal different correlation patterns:
- Some pairs show positive correlation (points trending upward)
- Some show negative correlation (points trending downward)
- Some show no clear pattern (scattered points)

Harris notes: "The cells where the same variable appears on both axes are left blank, since a given variable plotted against itself always produces a straight line which yields no useful information."

## Usage

Scatter graph matrices are most effective when:
- Exploring relationships among 3-6 variables simultaneously
- Looking for unexpected correlations in multivariate data
- Initial exploratory analysis before detailed investigation
- Comparing correlation patterns across variable pairs

Less effective when:
- Many variables (>8) make individual plots too small
- Data points are numerous enough to create overplotting
- Detailed analysis of a single relationship is needed
- The audience is unfamiliar with matrix displays

The blank diagonal cells can optionally display distribution graphs (histograms or density plots) for each variable, adding marginal distribution information to the correlation display.

## Notes

Harris mentions that "sometimes distribution graphs for each of the variables are shown in the blank cells," which is a common enhancement in modern statistical software. This technique is foundational for multivariate exploratory data analysis and remains widely used in statistical computing environments.
