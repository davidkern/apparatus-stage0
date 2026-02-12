---
name: Cumulative Frequency Graph
slug: cumulative-frequency-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cumulative Frequency Graph, pp. 116-118"

intent: Display the cumulative distribution of data to determine probabilities, categorize data into percentiles, test for normal distribution, and compare distributions
direction: both

components:
  - element: value-axis
    encodes: Individual values or class intervals
    required: true
  - element: cumulative-frequency-axis
    encodes: Running total of frequencies or cumulative percent
    required: true
  - element: cumulative-curve
    encodes: S-shaped curve showing accumulated frequencies
    required: true
  - element: reference-lines
    encodes: Optional horizontal lines at key percentiles (25%, 50%, 75%, etc.)
    required: false

parameters:
  cumulation_direction: less-than | more-than
  frequency_type: count | percent | both
  axis_orientation: standard | reversed
  grid_type: linear | normal-probability

related: []

warnings:
  - "Points for 'less than' graphs are plotted at upper class interval boundaries"
  - "Points for 'more than' graphs are plotted at lower class interval boundaries"
  - "Normal probability grids have no zero or 100% on the cumulative percent scale"

extensions:
  harris_entry: "Cumulative Frequency Graph"
  alternate_names:
    - ogive
    - summation graph
  typical_use: "Probability analysis, percentile determination, distribution comparison, normality testing"
---

## Description

A cumulative frequency graph is the equivalent of a cumulative histogram with the columns replaced by a smooth curve. Instead of plotting the individual frequency for each class interval, the cumulative frequency is plotted, which equals the individual interval's frequency plus the frequencies for all preceding intervals.

This type of graph serves four major purposes:
1. Provide a graphical means for determining the percent and/or numeric probability of a given value occurring
2. Graphically categorize data elements into meaningful compartments (quartiles, deciles, percentiles)
3. Determine whether a data set has a normal distribution
4. Provide a convenient method for comparing distributions of multiple data sets

## Examples

**Basic construction (p. 116):**

> Graph showing cumulative frequency curve, cumulative histogram, and a standard histogram for the same data. The cumulative curve rises from 0% to 100% as it progresses through the values.

**"Less than" cumulative frequency graph:**

> When the cumulation process proceeds from the smallest value to the largest, the data points are plotted in line with the upper boundary of the class interval. For instance, 63% of all data elements have values equal to or less than 2.1.

**"More than" cumulative frequency graph:**

> When the cumulation process proceeds from the largest value to the smallest, the data points are generally plotted in line with the lower boundary of the class interval. For instance, 37% of all data elements have values equal to or more than 2.1.

**Combined curves (p. 117):**

> The "more than" and "less than" curves can be combined on a single graph by adding a second scale, or by superimposing both curves with a single scale.

**Percentile graph:**

> Although cumulative percents are frequently plotted on the vertical axis, the axes can be reversed with percents on the horizontal axis. Reference lines simplify relating percentiles to values.

**Normal probability graph (p. 117):**

> A data set with a normal distribution approximates a straight line when plotted on a normal probability grid. This enables determination of whether data is normally distributed.

**Comparison of distributions (p. 118):**

> The graph displays cumulative percent of failures for two product lines against years of service. Observations: median life (50% failures) of product A was only 3 years versus 7.5 years for product B; between years 3-5, 24% of A failed versus 15% for B; only 26% probability that A survives beyond 5 years versus 75% for B.

## Usage

**"Less than" vs "More than" graphs:**
- "Less than": Points at upper class boundaries; reads "X% of values are less than Y"
- "More than": Points at lower class boundaries; reads "X% of values are greater than Y"
- Both can be combined on one graph with dual scales

**Percentile and probability applications:**
- With axes reversed (percent on horizontal), creates a percentile graph
- Reference lines at 25%, 50%, 75% help identify quartiles
- Can convert to one-axis percentile graph by aligning points vertically

**Normal probability testing:**
- Plot cumulative percents on a normal probability grid
- If data points cluster around a straight line, the data has a normal distribution
- The straight line enables easier projections and interpolations
- Note: No zero or 100% exists on the cumulative percent scale of a normal probability grid

**Comparing multiple distributions:**
- Multiple cumulative curves on one graph enable distribution comparison
- Particularly useful for comparing product lifetimes, failure rates, or performance metrics
- No practical limit on the number of curves except readability

## Notes

Due to the nonlinear scale on the cumulative percent axis of a normal probability graph, this type of curve is commonly generated with a computer or by using special preprinted graph paper.
