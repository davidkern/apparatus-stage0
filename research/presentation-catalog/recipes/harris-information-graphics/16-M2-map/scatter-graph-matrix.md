---
name: Scatter Graph Matrix
slug: scatter-graph-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Matrix Display, Scatter graph matrix, p. 239"

intent: Analyze multiple variables for correlations by displaying all pairwise combinations in a systematic grid
direction: both

components:
  - element: scatter-plots
    encodes: Pairwise relationships between all variable combinations
    required: true
  - element: variable-labels
    encodes: Identification of each variable along rows and columns
    required: true
  - element: diagonal-cells
    encodes: Position where a variable would be plotted against itself (often empty or contains distribution)
    required: false

parameters:
  matrix_format: "full | half"
  diagonal_content: "empty | histogram | density | variable-name"
  scales: "present | absent"

related:
  - slug: matrix-display
    relationship: variant-of

warnings:
  - "Full matrices contain duplicate plots (different orientation only) which waste space"
  - "Half-matrices conserve space but are harder to read because viewer must follow both rows and columns"

extensions:
  harris_entry: "Matrix Display"
  alternate_names: ["stacked scatter graph", "pairs plot", "scatterplot matrix"]
  typical_use: "exploratory analysis for correlations among multiple variables"
---

## Description

When all the charts in a matrix are scatter graphs, the display is called a scatter graph matrix or stacked scatter graph. This type of display is frequently used to analyze a series of variables for correlations. By arranging all pairwise combinations systematically, the viewer can observe all potential relationships at one time.

If only correlations are being studied, scales may not be necessary - the visual patterns reveal relationships without precise value reading.

## Examples

Harris explains the structure:

> "When all the charts in a matrix are scatter graphs, the display is sometimes called a scatter graph matrix or stacked scatter graph. This type of display is frequently used to analyze a series of variables for correlations. For example, if four sets of data are being studied for correlations, they could be put in a matrix form, as shown at the right, and all combinations of the four sets could be observed at one time." (p. 239)

The illustration shows a 4x4 matrix for Variables A, B, C, and D. Harris notes the redundancy:

> "The graphs in the examples shaded gray are actually duplicates of the unshaded graphs, except for a different orientation. The duplicates can be eliminated to conserve space, resulting in the half-matrix shown at the left." (p. 239)

On the trade-offs of half-matrices:

> "Although space is conserved, the half-matrix is a little more difficult to analyze because the viewer must visually follow along both rows and columns to check for possible correlations with a particular variable." (p. 239)

Harris also describes an enhanced variation:

> "Distribution graphs are sometimes placed in the blank cells in scatter graph matrixes to display the distribution of one set of data. For instance, in the example at the right, there are three small histograms displaying the distributions of the three sets of data represented in the display." (p. 239)

## Usage

Use scatter graph matrices when:
- Exploring relationships among three or more variables
- Screening for correlations before detailed analysis
- Presenting a comprehensive view of multivariate relationships

Format choices:
- **Full matrix**: Easier to read (each variable pair adjacent), but uses more space with redundant plots
- **Half matrix**: Space-efficient, but requires more effort to trace relationships

Diagonal cell options:
- **Empty**: Simplest approach
- **Histograms/distributions**: Shows each variable's distribution, adding value to otherwise unused space
- **Variable names**: Large labels for quick identification

Scale considerations:
- Include scales when precise values matter
- Omit scales when only patterns/correlations are of interest, allowing smaller plots

## Notes

The scatter graph matrix is a fundamental tool in exploratory data analysis and is implemented in most statistical software packages. The technique scales reasonably well - a matrix showing 6-8 variables remains readable, though beyond that the individual plots become quite small.
