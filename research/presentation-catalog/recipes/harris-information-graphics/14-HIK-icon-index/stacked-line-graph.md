---
name: Stacked Line Graph
slug: stacked-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Stacked line graph, p. 209"

intent: Display multiple data series positioned on top of one another so the top curve represents the total and individual series are shown as vertical distances between curves
direction: both

components:
  - element: base-series
    encodes: First data series, plotted from zero axis
    required: true
  - element: stacked-series
    encodes: Additional series, each added to cumulative total below it
    required: true
  - element: top-curve
    encodes: Sum of all data series
    required: true
  - element: inter-curve-distances
    encodes: Individual series values as vertical gaps between curves
    required: true

parameters:
  value_type: "actual values | percent-of-whole (100% stacked)"
  line_type: "segmented | stepped | smooth"
  fill_between_lines: "yes | no"

related: []  # TBD: see also grouped-line-graph, stacked-area-graph

warnings:
  - "Potential confusion with grouped line graphs where each curve is referenced from zero"
  - "Filling areas between lines increases chance for misunderstanding"
  - "Combinations of positive and negative values create very confusing graphs"
  - "Features like multiple scales, fitted curves, and error bars are generally not used"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["layer line graph"]
  typical_use: "showing how components contribute to a changing total"
  recommendation: "use stacked area graph instead for clearer communication"
---

## Description

In a stacked line graph, multiple data series are positioned on top of one another. The first series is plotted with all data points measured from the zero axis. Each subsequent series is determined by adding its values to the cumulative total of all series below it. The top curve represents the sum of all data series, and the values for any particular series are represented by the vertical distance between two adjacent curves (or between a curve and the axis).

A **100% stacked line graph** uses the same principle but with percent-of-the-whole values instead of actual values. The top line is always at 100%, and each curve below shows what percent of the total each component represents.

## Examples

Harris illustrates with product sales:

> "For example, if a company sells three products and the sales for each of the three product lines are plotted, the difference between each pair of lines represents the sales for an individual product, and the top curve represents the total sales of all three products." (p. 209)

The example shows sales of product lines A, B, and C from '95 to '99:
- Product A values shown as distance from zero to first curve
- Product B values shown as distance between first and second curves
- Product C values shown as distance between second and third curves
- Top curve labeled "Total = A + B + C"

For the 100% stacked variation:
> "The lower curve indicates the percent of the total company sales that product A represented each year. The middle curve is arrived at by adding the percents that product B represented to the percents for product A." (p. 209)

## Usage

Stacked line graphs are appropriate when:
- Showing how component parts contribute to a changing total
- The total is as important as the individual components
- All values are positive (or all negative)
- Categorical or sequential horizontal scales are used

Harris recommends using this format with caution:
> "The stacked variation of line graph is used with caution because of potential confusion with the more widely used grouped line graph." (p. 209)

Mitigation strategies:
- Place titles directly on the curves
- Avoid filling areas between lines (which makes it look like a stacked area graph)
- When stacking is needed, a stacked area graph is often clearer

## Notes

The stacked line graph is functionally similar to the stacked area graph, but without fill between the lines. Harris notes that "When stacking data series, a stacked area graph is most frequently used" rather than a stacked line graph, suggesting the area version communicates the stacking concept more clearly.
