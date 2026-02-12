---
name: Index Graph
slug: index-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Index Graph, pp. 197"

intent: Display values as percentages or ratios of a reference value to enable comparison of trends across data series with different units or magnitudes
direction: both

components:
  - element: curves-or-lines
    encodes: Data series values as percent/ratio of reference value
    required: true
  - element: reference-line
    encodes: The 100% baseline representing the reference value
    required: true
  - element: vertical-axis
    encodes: Index value (percent, fraction, or ratio)
    required: true
  - element: horizontal-axis
    encodes: Sequential scale (typically time)
    required: true

parameters:
  reference_value: "first value | middle value | last value | any specified value"
  scale_format: "percent (100%) | decimal (1.0) | index number"

related: []  # TBD: comparative-graph, fan-chart

warnings:
  - "Relative positions of curves may differ between index graph and actual value graph"
  - "Reference value selection affects the visual comparison"

extensions:
  harris_entry: "Index Graph"
  alternate_names: ["comparative graph", "fan chart"]
  typical_use: "comparing growth rates across series with different magnitudes or units"
---

## Description

An index graph displays values as percentages, fractions, or ratios of a reference value rather than as actual values. This allows comparison of trends across data series that have different magnitudes or even different units of measure.

For example, if a house purchased for $20,000 is now worth $40,000, it would be plotted at 200% (an index value of 200). This normalization enables meaningful comparison with other investments regardless of their original purchase prices.

## Examples

Harris defines the technique (p. 197):

> "An index graph is a graph that displays values in terms of a percent, fraction, or ratio of some reference value. For example, a graph might show the value of a house each year as a percent of its purchase price."

On comparing different units:
> "In addition to comparing data series with different values, index graphs are used to compare data series using different units of measure. For instance, in the example at right, the units produced increased at a much greater rate than the sales dollars."

Harris illustrates how index graphs reveal relationships obscured by magnitude differences: actual values might show sales dollars always higher than units produced, but the index graph reveals that unit growth outpaced dollar growth.

On reference value options (p. 197):
> "Often the first value in a data series is used as the reference against which all other values are measured. However, the reference value may be any one of the data elements in the series."

Harris shows three variations using first year, middle year, and last year as reference values.

## Usage

Index graphs are appropriate when:
- Comparing growth rates across series with very different magnitudes
- Comparing series measured in different units
- Highlighting relative change rather than absolute values
- Multiple data series would overlap confusingly in actual-value format

The comparative graph or fan chart format shows only beginning and ending index values, making differences stand out more crisply when there are many values.

## Notes

Scale formats (p. 197):
- **Index value**: 0, 50, 100, 150 (100 = reference)
- **Percent**: 0%, 50%, 100%, 150%
- **Fraction/ratio**: 0, 0.5, 1.0, 1.5

Harris notes that "the relative positions of curves frequently change when plotted on an index graph" compared to actual value plots, which can reveal insights about relative performance that absolute values obscure.
