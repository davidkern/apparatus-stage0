---
name: Curve Fitting
slug: curve-fitting
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Curve Fitting, pp. 121-123"

intent: Superimpose a curve or surface that most closely approximates a data series over a plot of data points to reveal trends, relationships, and patterns
direction: both

components:
  - element: data-points
    encodes: Individual observed values plotted on the graph
    required: true
  - element: fitted-curve
    encodes: Mathematical approximation of the data's underlying pattern
    required: true
  - element: residuals
    encodes: Distances between data points and the fitted curve
    required: false
  - element: confidence-interval
    encodes: Region indicating probable location of true curve with given confidence level
    required: false
  - element: equation
    encodes: Mathematical formula describing the fitted curve
    required: false

parameters:
  curve_type: linear | polynomial | exponential | power | spline
  fitting_method: freehand | least-squares | other-mathematical
  application: scatter-graph | line-graph | column-graph | bar-graph | area-graph

related: []  # TBD: see also linear-regression-line, residuals

warnings:
  - "Multiple different curves can be fitted to the same data; the analyst must decide which is appropriate for the application"
  - "Unusual data points (outliers) can dramatically shift the angle of regression lines"
  - "The choice of which variable is independent versus dependent affects the fitted curve's location"
  - "Fitted curves are best estimates; projections based on them carry inherent uncertainty"
  - "Three-dimensional fitted surfaces are much more difficult to interpret than two-dimensional fitted curves"

extensions:
  harris_entry: "Curve Fitting"
  alternate_names: ["smoothing", "line-of-best-fit", "trend line"]
  typical_use: "establishing trends, determining relationships, comparing intermingled data series, making projections"
---

## Description

Curve fitting is a process in which a curve or surface that most closely approximates a data series is superimposed over a plot of the data points. Fitted curves may be drawn freehand based on visual estimates or plotted using well-established mathematical procedures.

The technique serves multiple analytical purposes:
- Establishing the general trend of data
- Determining the type of relationship between two variables (linear, exponential, etc.)
- Comparing data series that are intermingled
- Making forecasts or projections
- Determining the degree of variation of individual data points from a theoretical or expected curve
- Determining whether data points vary randomly, symmetrically, uniformly, etc., from a theoretical curve

## Examples

**Multiple Fitted Curves for Same Data** (p. 121)
> "Computers can generate many different curves for the same data. It is up to an individual to decide which of the curves either most closely approximates the actual data or is best for a given purpose."

Harris illustrates four different computer-generated curves (linear, power, exponential, third-degree polynomial) fitted to identical data points, demonstrating that curve selection requires judgment about the application.

**Spline Type Fitted Curve** (p. 121)
> "It is rare for a fitted curve to intersect every data point. Among the few exceptions are certain variations of spline curves. With this type of fitted curve, the fitted line passes through every point."

**Linear Regression Line** (p. 121)
> "The straight line variation of a fitted curve is sometimes referred to as linear regression line. When the location of the line is developed mathematically, a technique called least-squares is commonly used and the curve is occasionally called a least squares line."

**Independent versus Dependent Variable** (p. 122)
> "When there are two quantitative variables, the decision as to which variable is a function of the other (i.e., which is the independent and dependent variable) can have an effect on the location of the fitted curve."

Harris shows identical data plotted twice with Y dependent in one graph and X dependent in the other, producing different fitted curve positions.

**Projections** (p. 122)
> "Fitted curves are often used for making projections. The examples shown here illustrate how important it is that the proper fitted curve be selected when making projections."

The example shows a linear fit indicating continued growth while a polynomial fit to the same data indicates a potential serious downturn.

**Effect of Unusual Data Points** (p. 123)
> "Unusual data points (sometimes called outliers) can sometimes have a significant effect on the curve fitted to the data. For example, a single unusual data point can cause a dramatic shift in the angle of the regression line."

**Curves Fitted to Multiple Data Series** (p. 122)
> "Curves can be fitted to multiple data series on the same graph. This is particularly advantageous when data series are interspersed... With the fitted curves, the difference stands out more clearly."

## Usage

Curve fitting is most frequently applied to scatter graphs but can also be used with column, bar, line, and area graphs.

**When to apply:**
- Data shows apparent trend but individual points scatter around the pattern
- Need to compare slopes or patterns between multiple overlapping data series
- Making projections beyond the range of observed data
- Determining whether data conforms to a theoretical relationship

**Analysis techniques:**
- Use residuals to determine which curve type best fits the data
- Plot residuals separately to check for systematic patterns indicating poor fit
- Add confidence intervals to show estimation uncertainty
- Include the equation when mathematical calculations will be performed

**Confidence Interval or Band** (p. 122)
> "A confidence interval indicates the region in which the fitted curve would probably lie, with a given degree of confidence such as 90% or 95%, if information for the entire family of data was available."

## Notes

When curve fitting is done with a computer, the equation for the fitted curve is often accessible. With this equation, the fitted curve can be reproduced on other graphs, mathematical calculations can be performed, and specific observations about the curve can be noted.

Harris provides example equations: linear (Y = 0.825X + 0.3) and polynomial (Y = -0.0244X^3 + 0.378X^2 - 0.874X + 2.447) fitted to the same data.
