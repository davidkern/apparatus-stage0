---
name: Linear Regression Line
slug: linear-regression-line
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Linear Regression Line, p. 206"

intent: Superimpose a straight line that best approximates a data series to quantify slope, compare series, make projections, and assess linearity
direction: both

components:
  - element: data-points
    encodes: The actual measured values
    required: true
  - element: regression-line
    encodes: The straight line that best fits the data (by least squares)
    required: true
  - element: residuals
    encodes: Distances between data points and the regression line
    required: false

parameters:
  fitting_method: "visual estimation | least squares (mathematical)"
  use_for: "slope quantification | series comparison | projection | linearity assessment"

related: []  # TBD: see also fitted-curve, trend-line

warnings:
  - "The line may pass through few or none of the actual data points"
  - "Projections beyond the data range assume the linear relationship continues"
  - "Linearity assumption should be validated before relying on the regression"

extensions:
  harris_entry: "Linear Regression Line"
  alternate_names: ["least squares line", "trend line (when sequential data)"]
  typical_use: "trend analysis, forecasting, comparing slopes of data series"
---

## Description

A linear regression line is a straight line superimposed over the data points of a data series. It is considered the straight line that best approximates the data. When sequential information (like time) is on the horizontal axis, this line is often called a trend line.

The line can be positioned by visual estimation, but its location and slope are generally determined mathematically using the least squares method. This technique makes the sum of the squares of the distances (residuals) between the line and data points as small as possible.

Importantly, the regression line does not attempt to pass through all data points - in fact, it may pass through few or none of them. Its purpose is to represent the overall linear tendency of the data.

## Examples

Harris describes four primary uses:

> "Linear regression lines are used for several purposes including:
> - Quantify the slope of a data series or the relationship between two sets of data;
> - Compare multiple data series and make forecasts and projections;
> - Determine how closely the data series follows a straight line; and
> - Analyze the data for unusual patterns such as seasonal and cyclical fluctuations." (p. 206)

**Comparing multiple series**: Harris shows two interspersed data series (circles and squares) with separate regression lines fitted to each:
> "Regression lines can be fitted to multiple data series on the same graph to compare the slopes of the two series. This is particularly advantageous when data series are interspersed." (p. 206)

**Making projections**: An extended regression line projects beyond the actual data:
> "When data is closely approximated by a linear regression line, the line can sometimes be extended to make projections beyond the actual data available. This can be done with point, line, area, or column graphs." (p. 206)

**Residuals analysis**: The distances between the regression line and data points can be plotted separately to look for patterns within the residuals.

## Usage

Linear regression lines are appropriate when:
- Quantifying the overall trend direction and rate
- Comparing trends across multiple data series
- Making projections based on assumed linear continuation
- Assessing how well a linear model fits the data

Residual analysis can reveal:
- Seasonal patterns (regular oscillation around the line)
- Cyclical fluctuations
- Non-linearity (systematic curvature in residuals)
- Outliers (unusually large residuals)

## Notes

The mathematical technique behind the regression line minimizes the sum of squared residuals - hence the name "least squares line." This provides an objective, reproducible fit rather than depending on subjective visual estimation.
