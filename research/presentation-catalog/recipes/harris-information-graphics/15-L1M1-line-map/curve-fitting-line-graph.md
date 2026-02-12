---
name: Curve Fitting with Line Graphs
slug: curve-fitting-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Curve fitting with line graphs, p. 216"

intent: Reveal underlying trends in irregular data by superimposing fitted curves over actual data points
direction: both

components:
  - element: data-points
    encodes: Actual observed values
    required: true
  - element: fitted-curve
    encodes: Mathematical approximation of overall trend
    required: true
  - element: original-data-line
    encodes: Segmented line connecting actual data points (optional but common)
    required: false

parameters:
  curve_type: "linear | polynomial | other mathematical functions"
  fitting_method: "visual | mathematical"

related: []  # TBD: see also line-of-best-fit

warnings:
  - "The fitted curve is an approximation; it may obscure important fluctuations in the data"
  - "Different curve types can produce different interpretations of the same data"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["smoothing", "trend line", "line-of-best-fit"]
  typical_use: "discerning overall trends, making projections, comparing multiple data series"
---

## Description

When irregularities and fluctuations in line graph curves make it difficult to discern overall trends, make meaningful projections, or compare multiple data series, fitted curves can help. A curve that best approximates the data series is superimposed over a plot of the data points.

The fitting can be done visually (by eye) or through well-established mathematical techniques. Common curve types include linear (straight line) and polynomial curves, though many other mathematical functions can be used.

## Examples

**Linear and polynomial curves** (p. 216):
The illustration shows the same data points with two different fitted curves:
- A linear curve fit (straight line) showing the simplest trend approximation
- A polynomial curve fit showing a more complex trend that follows the data more closely

Both curves are superimposed over the original scattered data points, allowing viewers to see both the actual data and the underlying trend simultaneously.

## Usage

Use curve fitting when:
- Data fluctuations obscure the overall trend
- You need to make projections beyond the data range
- Comparing trends across multiple data series that have different volatility levels

The choice between linear and polynomial (or other) fits depends on:
- The expected nature of the underlying relationship
- Whether the goal is simple trend identification or precise modeling
- How closely the curve needs to follow the actual data

## Notes

Harris cross-references this technique with the Curve Fitting entry for more detailed mathematical treatment. The Line-of-Best-Fit entry (p. 220) provides additional context, describing it as "a process in which a curve that most closely approximates a data series is superimposed over a plot of the data points of that data series."
