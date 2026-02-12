---
name: Scatter Graph Matrix
slug: scatter-graph-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Correlation Graph, p. 110"

intent: Display correlations between all pairs of multiple variables in a compact grid arrangement, enabling quick visual comparison
direction: recognition

components:
  - element: grid-of-scatter-plots
    encodes: Individual scatter graphs for each pair of variables
    required: true
  - element: variable-labels
    encodes: Names of variables on row and column headers
    required: true
  - element: shared-axes
    encodes: Consistent scales across rows and columns for the same variable
    required: true
  - element: pattern-in-each-cell
    encodes: Correlation pattern (or lack thereof) for each variable pair
    required: true

parameters:
  variable_count: 3 | 4 | 5 | 6+
  include_diagonal: true | false
  show_fitted_lines: true | false

related: []

warnings:
  - "Small graph size may obscure subtle patterns"
  - "Number of graphs grows quadratically with variables"
  - "Viewer looks for patterns only, not precise values"

extensions:
  harris_entry: "Correlation Graph"
  alternate_names:
    - scatterplot matrix
    - pairs plot
    - SPLOM
  typical_use: "Exploratory data analysis with multiple variables"
---

## Description

A scatter graph matrix arranges multiple two-variable scatter plots into a grid, allowing the viewer to examine potential correlations between all pairs of variables at once. Each cell in the matrix shows the relationship between two variables, with variables listed along both the rows and columns.

This technique enables rapid visual scanning to identify which variable pairs show strong correlations, inverse correlations, or no correlation at all.

## Examples

Harris illustrates a scatter graph matrix on page 110:

> When there are more than two variables and one wants to see if there is a correlation between any given pair, it is necessary to generate a separate graph for each combination of variables. An alternate method is to arrange graphs of two data sets each into a matrix. There is no limit as to how many individual graphs can be incorporated into such a matrix.

The example shows a 3x3 matrix examining correlations among variables A, B, and C:
- Variable A vs Variable B
- Variable A vs Variable C  
- Variable B vs Variable C

Each small scatter plot shows the distribution of points for that variable pair.

## Usage

The scatter graph matrix is most effective when:
- Exploring relationships among three or more variables
- Conducting initial exploratory data analysis
- Needing a compact overview of all pairwise correlations
- The viewer needs only to identify patterns, not read precise values

**Advantages:**
- Compact size allows many comparisons in limited space
- Easy comparison across all variable pairs
- Patterns are visible even at small scale
- No need to generate and arrange individual graphs manually

**Limitations:**
- Small graph size makes detailed analysis difficult
- Technical audiences may want numerical correlation coefficients
- Very large numbers of variables create unwieldy matrices
- Plotting multiple data sets on a single scatter graph produces cluttered, hard-to-interpret results

Since the viewer is generally looking only for patterns of data points, the small size of the individual graphs is seldom a problem.

## Notes

This technique is now standard in statistical software and is often called a "pairs plot" or "SPLOM" (scatter plot matrix). Harris's description anticipates the widespread adoption of this exploratory data visualization technique.
