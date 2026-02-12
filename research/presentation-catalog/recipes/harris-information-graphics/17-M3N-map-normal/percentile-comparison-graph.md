---
name: Percentile Comparison Graph
slug: percentile-comparison-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Percentile Comparison Graph, p. 270"

intent: Compare two sets of data by plotting percentile values from each set against each other to reveal distributional differences
direction: both

components:
  - element: x-axis-percentiles
    encodes: Percentile values or associated values from first data set
    required: true
  - element: y-axis-percentiles
    encodes: Corresponding percentile values or associated values from second data set
    required: true
  - element: comparison-curve
    encodes: Line connecting plotted points showing relationship between distributions
    required: true
  - element: diagonal-reference
    encodes: Line of equal distribution (optional reference)
    required: false

parameters:
  construction_method: common-percentiles | common-values
  
related:
  - slug: cumulative-frequency-graph
    relationship: combines-with
  - slug: lorenz-graph
    relationship: variant-of

warnings:
  - "A percentile comparison graph sometimes makes the relationship between two sets of data stand out more clearly than when both sets are plotted on a standard cumulative frequency graph"

extensions:
  harris_entry: "Percentile Comparison Graph"
  typical_use: "comparing distributions of two data sets"
  construction_methods:
    common_percentiles: "X coordinate is value at nth percentile of set A; Y coordinate is value at nth percentile of set B"
    common_values: "X coordinate is percentile associated with value V in set A; Y coordinate is percentile associated with value V in set B"
  interpretation:
    diagonal_cluster: "distributions are the same"
    above_diagonal: "set B values higher for same percentile"
    below_diagonal: "set A values higher for same percentile"
---

## Description

Percentile comparison graphs are used for comparing two sets of data using percentile values. There are two ways of constructing this type of graph.

## Examples

Harris illustrates both construction methods (p. 270):

**Method 1: Values associated with common percentiles**

The value for the 95th percentile of one data series is the X coordinate of one data point on the comparison graph, and the value for the 95th percentile of the data series it is being compared with is the Y coordinate. This continues for 90th, 75th, 50th, 25th, 10th percentiles, etc.

Example comparing Group A and Group B employee scores:
- Shows cumulative frequency graphs for both groups
- Percentile comparison graph plotting Group A scores (X) against Group B scores (Y)
- Includes "Line of equal distribution" diagonal reference

> "The percentile comparison graph shown here indicates that the lower 75% of group A achieved better scores than the lower 75% of group B, but the 25% of group B with the highest scores had scores better than those of the upper 25% of group A."

If the distributions are the same, data points cluster around a diagonal.

**Method 2: Percentiles associated with common values**

Select common values and plot the percentiles associated with them. For example:
- The percentile associated with a $35,000 annual salary for one data set is the X coordinate
- The percentile associated with $35,000 for the other data set is the Y coordinate

Example comparing employee income distribution to total payroll distribution:
- Cumulative percent of employees (X) vs. cumulative percent of total payroll (Y)
- Shows how income is distributed relative to population

> "A percentile comparison graph sometimes makes the relationship between the two sets of data stand out more clearly than when both sets of data are plotted on a standard cumulative frequency graph."

A graph with percentiles on both axes is sometimes referred to as a Lorenz graph and is widely used for comparing income and population.

## Usage

**When to use:**
- To compare distributions of two data sets
- To identify where one group outperforms another
- To analyze income inequality (Lorenz graph application)

**Construction choice:**
- **Common percentiles**: Use when comparing values achieved at same percentile rankings
- **Common values**: Use when comparing what percentile is associated with fixed values

**Interpretation:**
- Points on the diagonal: distributions are identical
- Points above diagonal: second set has higher values/percentiles
- Points below diagonal: first set has higher values/percentiles

## Notes

The percentile comparison graph can reveal relationships more clearly than overlaying two cumulative frequency curves on the same graph. This is particularly useful when the curves would otherwise be difficult to distinguish.
