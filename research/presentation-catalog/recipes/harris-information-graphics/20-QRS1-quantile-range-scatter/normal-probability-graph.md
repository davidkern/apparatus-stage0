---
name: Normal Probability Graph
slug: normal-probability-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Quantile Graph, pp. 317-318"

intent: Determine whether a data series has a normal distribution by comparing it to a theoretical normal distribution
direction: both

components:
  - element: observed-values
    encodes: Data points from the data series being tested
    required: true
  - element: expected-values
    encodes: Theoretical values from a normal distribution (median 0, standard deviation 1)
    required: true
  - element: probability-grid
    encodes: Special grid with probability scale that linearizes normal distributions
    required: true
  - element: reference-diagonal
    encodes: Straight line indicating perfect normal distribution fit
    required: false

parameters:
  method: "probability-grid | quantile-comparison"
  grid_type: "normal probability | linear"

related:
  - slug: quantile-graph
    relationship: variant-of
  - slug: quantile-quantile-graph
    relationship: combines-with

warnings:
  - "Data points that deviate significantly from the diagonal line indicate departure from normal distribution"
  - "This is a visual assessment tool; statistical tests may be needed for rigorous analysis"

extensions:
  harris_entry: "Quantile Graph"
  alternate_names: ["probability plot", "normal plot"]
  typical_use: "testing normality assumption before parametric statistical analysis"
---

## Description

A normal probability graph is a specialized quantile graph used to determine whether a data series follows a normal (Gaussian) distribution. Harris describes two methods for this assessment:

**Method 1 - Probability Grid**: Plot the data on a special normal probability grid. If the distribution is normal, data points will cluster around a straight line.

**Method 2 - Quantile Comparison**: Compare the data series under study to a theoretical data series with a normal distribution (average of zero, standard deviation of one). The quantile plot of the observed data is compared against the quantile plot of the theoretical normal distribution.

In both methods, if the data has a normal distribution, the points will cluster around a diagonal straight line. Deviations from this line indicate departures from normality.

## Examples

> "The graph in the upper right-hand corner of this box is sometimes referred to as a normal probability graph. It is used to determine whether a data series has a normal distribution." (p. 317)

> "If the data series under study has a normal distribution, the data points cluster around a straight line as it does in this example." (p. 317)

Harris illustrates the method with accompanying diagrams showing how observed values relate to expected values from a theoretical normal distribution.

## Usage

Normal probability graphs are used when:
- Testing whether data meets normality assumptions required for parametric statistical tests
- Identifying the nature of departures from normality (skewness, heavy tails)
- Visually assessing data distribution before more formal analysis

The graph works by exploiting the property that cumulative normal distributions become linear when plotted on a probability scale. Any data following a normal distribution will therefore form a straight line on such a grid.

## Notes

The theoretical reference data series has a normal distribution with a median of zero and a standard deviation of one. These values are sometimes referred to as "expected values" when comparing to observed data.
