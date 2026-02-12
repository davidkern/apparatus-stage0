---
name: Band Graph
slug: band-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Range Symbols and Graphs, p. 324"

intent: Show how the range or spread between upper and lower values changes over time by connecting boundary values with lines and filling the area between
direction: both

components:
  - element: upper-boundary-line
    encodes: Curve connecting upper values across time periods
    required: true
  - element: lower-boundary-line
    encodes: Curve connecting lower values across time periods
    required: true
  - element: filled-area
    encodes: Shaded region between upper and lower boundaries showing range extent
    required: true
  - element: central-line
    encodes: Optional line showing mean, median, or other central tendency
    required: false
  - element: data-point-symbols
    encodes: Markers at individual data points along the boundaries
    required: false

parameters:
  fill_style: "solid | gradient | pattern"
  boundary_visibility: "lines-visible | fill-only"
  central_indicator: "none | shown"

related:
  - slug: range-symbols-and-graphs
    relationship: variant-of

warnings:
  - "Band graphs emphasize range width; if central tendency is more important, consider adding a central line or using a different chart type"

extensions:
  harris_entry: "Range Symbols and Graphs"
  alternate_names: ["area band", "silhouette", "range band", "envelope chart"]
  typical_use: "showing forecast uncertainty over time, confidence intervals that change, volatility trends"
---

## Description

A band graph is created when upper and lower range values are connected with lines across time periods and the area between is filled. The symbols for individual data points may or may not be shown. This variation is particularly helpful when attempting to illustrate how the range or spread of data changes over time.

The filled area creates a visual "band" or "envelope" that immediately communicates:
- The overall level of values (vertical position of the band)
- The variability or uncertainty at each point in time (width of the band)
- How variability changes over time (widening or narrowing of the band)

## Examples

> "When the upper and lower values are connected with lines, the graph is sometimes referred to as a band graph. The symbols for the data points may or may not be shown. This variation is helpful when attempting to illustrate the changes in the range or spread over time." (p. 324)

Harris illustrates two variations (p. 324):
- Upper and lower values defined by lines only (unfilled band)
- Area between lines filled, creating a silhouette (filled band, also called area band or band graph)

Both examples show data from '90 to '94 with upper values, central values, and lower values marked.

## Usage

Band graphs are particularly effective for:
- **Forecast uncertainty**: Showing prediction intervals that widen further into the future
- **Confidence bands**: Displaying confidence intervals around trend lines or regressions
- **Natural variability**: Temperature ranges, price ranges, or other measurements that fluctuate within bounds
- **Tolerance zones**: Acceptable ranges around a target value over time

The filled area draws attention to the spread rather than individual boundary values, making it easy to see periods of high or low variability at a glance.

## Notes

Band graphs can incorporate multiple levels of boundaries using different shadings or nested bands. For example, one band might show the 50% confidence interval while an outer band shows the 95% confidence interval, creating a layered effect that communicates probability density.
