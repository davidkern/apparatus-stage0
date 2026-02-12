---
name: Scatter Graph
slug: scatter-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Point Graph and Scatter Graph, pp. 290-294"

intent: Explore relationships and correlations between two or more sets of data by plotting data points on a two-dimensional graph with quantitative scales on both axes
direction: both

components:
  - element: horizontal-axis
    encodes: First quantitative variable (independent variable)
    required: true
  - element: vertical-axis
    encodes: Second quantitative variable (dependent variable)
    required: true
  - element: data-points
    encodes: Individual observations as positioned symbols
    required: true
  - element: plot-symbols
    encodes: Geometric shapes (circles, squares, triangles) marking data points
    required: true

parameters:
  data_series_count: "one | multiple"
  symbol_encoding: "uniform | size-varies | shape-varies | color-varies"
  axis_scale_type: "linear | logarithmic"

related: []  # TBD: see line-graph, point-graph

warnings:
  - "Exact values are difficult to read; used primarily for pattern detection"
  - "Correlation does not imply causation"
  - "Dense point clouds may require transparency or jittering"

extensions:
  harris_entry: "Point Graph and Scatter Graph"
  alternate_names: ["scattergram", "scatterplot", "XY graph", "XY scatter graph", "XY scattergram"]
  typical_use: "exploring relationships between two variables; detecting correlations"
  correlation_patterns:
    strength: ["strong (tight cluster)", "weak (loose cluster)", "none (random)"]
    direction: ["direct/positive (slopes up)", "inverse/negative (slopes down)"]
    type: ["linear", "exponential", "U-shaped"]
---

## Description

Scatter graphs are probably the most widely used type of point graph. They generally have quantitative scales on both axes and can accommodate many data points. Scatter graphs are used extensively for exploring relationships and correlations between two or more sets of data - for example, the relationship between efficiency and speed, dollars spent on food versus dollars of income, or rate of chemical reaction versus temperature.

After data is plotted on a scatter graph, patterns formed by the data points are used to make observations about the relationships of the data sets graphed.

## Examples

Harris describes the interpretation of scatter plot patterns (pp. 290-291):

**Strength of correlation:**
> "How tightly the data points are clustered around an imaginary slanted line indicates the strength of the relationship/correlation. If a sequence scale is used the pattern may be referred to as a trend."

Examples shown: Strong (tight cluster), Weak (loose cluster), No correlation (random scatter)

**Direct or inverse correlation:**
> "The slope of the imaginary line around which the points are clustered indicates whether the correlation is direct (positive), inverse (negative), or nonexistent."

Examples shown: Direct/positive (upward slope), Inverse/negative (downward slope), No correlation

**Type of correlation:**
> "The shape of the imaginary curve indicates whether the correlation is linear or nonlinear. The shape also sometimes indicates distinguishing characteristics about the data."

Examples shown: Linear, Exponential, U-shaped

A simple scatter graph example shows 100 data points with values on both axes ranging 0-10 and 0-30 respectively.

## Usage

**Primary uses:**
- Detecting correlation between variables
- Identifying outliers
- Exploring data distribution patterns
- Finding clusters in multivariate data

**Pattern interpretation:**
1. Look at tightness of clustering (strength)
2. Determine slope direction (positive/negative)
3. Assess linearity vs. curvilinear patterns
4. Identify unusual data points (outliers)

**Multiple data series:**
- Use different symbols for each series
- Consider if series share X-axis values (grouped) or have unique pairs (paired)

**Three-dimensional extension:**
- XYZ scatter graphs add a third quantitative axis
- Exact values are difficult to read
- Useful for observing general patterns, distribution, unusual points
- Techniques like rotation/spinning and brushing improve interpretation

## Notes

Harris emphasizes that scatter graphs serve exploration and pattern detection rather than precise value reading. The strength lies in revealing relationships that might not be apparent from tabular data.

The naming varies by context: "scatter graph" or "scatterplot" when exploring correlation, "XY graph" when emphasizing the two-axis structure, and "point graph" in the broader family that includes category and sequence scale variations.
