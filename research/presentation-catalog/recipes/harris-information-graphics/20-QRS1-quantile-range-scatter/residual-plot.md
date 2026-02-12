---
name: Residual Plot
slug: residual-plot
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Residual, p. 329"

intent: Display the differences between actual data points and a fitted curve to assess model fit quality and identify patterns not captured by the model
direction: recognition

components:
  - element: residual-values
    encodes: Vertical distances between data points and fitted curve (positive if above, negative if below)
    required: true
  - element: zero-reference-line
    encodes: Horizontal line at zero representing perfect fit
    required: true
  - element: data-points-or-drop-lines
    encodes: Points, drop lines, or both showing residual magnitudes
    required: true
  - element: horizontal-axis
    encodes: Same scale as original data (time, independent variable)
    required: true

parameters:
  display_mode: "points-only | points-with-droplines | droplines-only"
  value_type: "absolute | percentage"

related: []

warnings:
  - "Residuals plotted as absolute values may hide changing proportional accuracy if underlying values trend upward or downward"
  - "Converting residuals to percentages reveals proportional patterns not visible in absolute value plots"

extensions:
  harris_entry: "Residual"
  alternate_names: ["residual graph", "deviation plot"]
  typical_use: "assessing regression fit quality, detecting patterns in model errors, identifying outliers"
---

## Description

A residual is the vertical distance between a data point and a fitted curve or regression line. Residual plots display these differences on a separate graph for detailed analysis. While residuals can be shown on the same graph as the original data (as vertical lines between points and the fitted curve), plotting them separately generally enables more meaningful observations.

Positive residuals indicate the actual data point is above the fitted curve; negative residuals indicate it is below. The fitted curve to which residuals are measured can be straight (linear regression) or curved (polynomial or other fit).

## Examples

> "Generally speaking, more meaningful observations can be made when the residuals are plotted by themselves." (p. 329)

Harris shows three paired examples (p. 329):
1. Point graph with linear regression - residuals plotted as symbols only
2. Point graph with polynomial fitted curve - residuals plotted as symbols plus drop lines
3. Line graph with polynomial fitted curve - residuals plotted as drop lines only

Each pair shows the original data with fitted curve above and the residual-only plot below.

**Pattern examples** Harris identifies:
- Uniform residuals: Good model fit with random scatter around zero
- Cyclical or seasonal fluctuations: Periodic patterns in residuals
- Size varies with X-axis value: Heteroscedasticity, residuals getting larger or smaller
- Unusual residuals (outliers): Individual points far from the pattern

## Usage

Residuals are analyzed to:
- **Assess fit quality**: Smaller and more homogeneous residuals indicate better fit
- **Detect cyclical patterns**: Periodic waves in residuals suggest seasonal effects not captured by the model
- **Identify trend in errors**: Residuals that grow or shrink systematically indicate model misspecification
- **Find outliers**: Unusually large residuals may indicate data errors or special circumstances

**Percentage conversion**: When actual values change significantly across the data range, converting residuals to percentages of the corresponding fitted value reveals proportional accuracy changes not visible in absolute residual plots.

## Notes

Harris illustrates that residual patterns provide diagnostic information about model adequacy. A well-fitting model produces residuals that appear randomly scattered around zero with consistent spread. Any systematic pattern suggests the model is missing something about the data's structure.
