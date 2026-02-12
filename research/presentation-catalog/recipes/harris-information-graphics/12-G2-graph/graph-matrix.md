---
name: Graph Matrix
slug: graph-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs in matrix form, pp. 172, 179"

intent: Arrange multiple graphs in rows and columns to enable systematic comparison of many variables or entities
direction: both

components:
  - element: matrix-grid
    encodes: Row and column organization structure
  - element: individual-graphs
    encodes: Graph in each cell showing specific variable or entity
  - element: row-headers
    encodes: Labels identifying what varies across rows
  - element: column-headers
    encodes: Labels identifying what varies across columns

parameters:
  graph_type: "column | line | scatter | any"
  common_scales: "yes | no (depending on purpose)"
  matrix_dimensions: "rows x columns"

related: []  # TBD: scatter-graph-matrix, icon-comparison-display

warnings:
  - "Large matrices become difficult to interpret"
  - "Common scales are essential for valid cross-cell comparisons"
  - "Each cell must be large enough for legible graphs"

extensions:
  harris_entry: "Graph"
  alternate_names: ["trellis display", "matrix display", "panel matrix"]
  typical_use: "monitoring multiple variables, comparing multiple entities across multiple measures"
---

## Description

In situations where multiple variables are to be monitored, compared, or analyzed, matrices are often advantageous. A graph matrix consists of multiple graphs, frequently of the same basic type, arranged in rows and columns in some organized fashion. Their major purpose is to simplify the analysis of large quantities of data by enabling the viewer to study multiple graphs at one time.

## Examples

Harris provides three distinctly different ways matrices are used (pp. 172, 179):

**Standard Graph Matrix:**
> "At the right is a typical matrix of graphs. Column graphs are used in this example; however, almost any type of graph will work. Common scales may or may not be used."

The example shows a 3x4 matrix with rows representing metrics (Sales, Operating profit, Return on assets) and columns representing divisions (A, B, C, D), each cell containing a column graph over time.

**Scatter Graph Matrix:**
> "Scatter graph matrices are used to investigate correlations between multiple variables. They frequently utilize a bidirectional tabular format. The histograms in the diagonal squares are optional. They illustrate another case of multiple graphs that complement one another."

This specialized form places scatter plots at intersections of variable pairs, with optional histograms on the diagonal showing individual variable distributions.

**Icon Comparison Display:**
> "Each icon represents a graph of eight characteristics for 16 different brands of desktop computers. An icon comparison display, as this is called, is used to compare multiple variables for multiple entities. A legend is always required for this type of matrix."

## Usage

Most effective when:
- Many variables or entities need systematic comparison
- Patterns across the matrix are meaningful
- Viewers need to examine both individual cells and overall patterns
- Data has natural row/column organization (entity x measure, time x category)

Less effective when:
- Matrix would be too large to display legibly
- Comparisons across cells are not meaningful
- Individual graphs need substantial detail

Design considerations:
- Use common scales when cross-cell comparison matters
- Keep individual graphs simple within cells
- Label rows and columns clearly
- Consider whether scatter matrix or icon format better suits the data

## Notes

Harris distinguishes the graph matrix from the scatter graph matrix, which has the specialized structure of showing all pairwise relationships between variables. The scatter matrix is particularly valuable for correlation analysis and is commonly used in statistical software.
