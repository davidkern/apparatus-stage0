---
name: Correlation Graph
slug: correlation-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Correlation Graph, pp. 110-112"

intent: Determine whether two or more sets of quantitative information are correlated, exploring meaningful associations and potential cause-and-effect relationships
direction: recognition

components:
  - element: data-points
    encodes: Paired values from two data sets (scatter graph) or multiple values over time (time series)
    required: true
  - element: fitted-line
    encodes: Line or curve fitted to data points to clarify the correlation pattern
    required: false
  - element: axes
    encodes: Scales for the variables being compared
    required: true
  - element: pattern-indication
    encodes: Visual clustering or trend showing correlation type and strength
    required: true

parameters:
  analysis_type: data-sets | data-series
  correlation_type: direct | inverse | none | shifted-in-time | pattern-specific
  strength: strong | weak | none
  linearity: linear | nonlinear | curvilinear
  graph_type: scatter | time-series | paired-bar | matrix

related: []

warnings:
  - "A correlation does not necessarily imply a cause-and-effect relationship"
  - "Weak versus non-existent correlation is often a judgment call"
  - "Two variables may correlate because both are affected by a third variable"

extensions:
  harris_entry: "Correlation Graph"
  typical_use: "Exploring associations, investigating cause-and-effect, establishing leading indicators"
  correlation_patterns:
    - direct (positive)
    - inverse (negative)
    - linear
    - nonlinear
    - time-shifted
    - pattern-specific
---

## Description

A correlation graph's primary purpose is to determine whether two or more sets of quantitative information are correlated, meaning when one set changes, the other simultaneously changes in some orderly fashion. These graphs are used extensively to explore areas where meaningful associations might exist and as tools for investigating possible cause-and-effect relationships.

Correlation graphs fall into two major categories:
1. Analysis of individual data sets (e.g., pollen count vs. sinus pills sold)
2. Analysis of data series over time (e.g., comparing trends in two time series)

## Examples

**Using scatter graphs to check for correlations (p. 110):**

> Scatter graph used to determine whether two data sets are correlated: pollen count plotted on horizontal axis, sales of sinus pills on vertical. The pattern indicates a direct, linear, and strong correlation because the data points are tightly clustered around the inclined fitted line.

**Correlation patterns:**

> Two examples of no correlation: On the left, as variable A changes there is little or no change in Variable B. On the right, as A changes, B changes, but in no meaningful or orderly pattern.

> Two examples of direct correlations: The example on the left shows a strong correlation because points are tightly clustered about the fitted line. The example on the right shows a weak correlation.

> Two examples of inverse or negative correlation: As variable A increases, variable B decreases. The example on the left is linear (straight fitted line), the example on the right is nonlinear or curvilinear.

**Scatter graph matrix (p. 110):**

> When there are more than two variables and one wants to see if there is a correlation between any given pair, arrange graphs of two data sets each into a matrix. The major advantages are compact size and ease of analysis.

**Time series correlations (p. 111):**

> Direct correlation: As time series #1 increases, series #2 also tends to increase.

> Indirect or inverse correlation: As time series #1 increases, #2 decreases.

> Correlations shifted in time: Data series #1 is a leading indicator of data series #2. Whatever happens to data series #1 will happen to data series #2 two months later.

**Pattern-specific correlations (p. 112):**

> An example in which one data series (B) is correlated with reversals in another data series (A). Each time there is a reversal in the slope of data series A (interest rates), there is a short term increase in data series B (stock broker sales).

## Usage

**For data set analysis:**
- Scatter graphs are most widely used
- Plot independent variable on horizontal axis, dependent on vertical
- Fit a line to assist analysis
- The pattern of data points determines correlation existence, type, and strength

**For data series analysis:**
- Time series graphs are frequently used
- Sequence of data collection is very important
- Look for direct correlations, inverse correlations, and time-shifted relationships
- Leading indicators can be established for making projections

**Alternative graph types (p. 111):**
- Line graphs grouping data into intervals with averaged values
- Column graphs with similar interval grouping
- Range indicators showing value spread within intervals

**Paired bar graphs (p. 112):**
- Occasionally used to check for correlations
- Two horizontal scales may represent different units

**Important caution:**
A correlation does not necessarily imply cause-and-effect. In an example showing selling price correlated with both total sales dollars and units shipped, the inverse correlation between total dollars and units shipped exists not because one causes the other, but because both are affected by the same third variable (selling price).

## Notes

Time-shifted correlations are particularly valuable for forecasting. When one data series is a leading indicator of another, changes in the leading series can predict future changes in the lagging series. Sometimes it is necessary to shift one curve on the graph to discover that a correlation actually exists.
