---
name: 100% Stacked Column Graph
slug: 100-percent-stacked-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, 100% stacked column graph, p. 83"

intent: Show the relative proportions of components within a whole, with all columns summing to 100%
direction: both

components:
  - element: percentage-segments
    encodes: Component values as percentages of total
    required: true
  - element: 100-percent-column-tops
    encodes: Constant total (always 100%) for each interval
    required: true
  - element: differentiated-fills
    encodes: Each component via distinct color, shade, or pattern
    required: true
  - element: legend
    encodes: Mapping of colors/patterns to components
    required: true
  - element: percentage-scale
    encodes: 0% to 100% on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true

parameters:
  component_order: "largest on bottom | most important on bottom | least variable on bottom"

related:
  - slug: stacked-column-graph
    relationship: variant-of
  - slug: 100-percent-stacked-bar-graph
    relationship: variant-of

warnings:
  - "Absolute values are not shown; only relative proportions"
  - "Changes in actual totals are invisible since all columns reach 100%"
  - "Viewers may incorrectly assume actual values grew or shrank based on segment size changes"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["percent-of-the-whole graph", "100% column graph"]
  typical_use: "comparing compositional changes over time, showing market share evolution, budget allocation proportions"
  scale_types:
    vertical: "percentage (0% to 100%)"
    horizontal: "category or sequence"
---

## Description

A 100% stacked column graph is a variation of the percent-of-the-whole graph. Instead of plotting actual values for each data series, the percentages that the values represent of the total of all data series are plotted. The sum of all components, represented by the tops of the columns, is always 100%.

This format emphasizes proportional relationships rather than absolute values, making it ideal for showing how the composition of a whole changes across categories or time periods.

## Examples

> "With this type of graph, instead of plotting the actual values for each data series, the percents that the values represent of the total of all of the data series are plotted." (p. 83)

Harris provides an example: if total company sales are $16 million and one product line sold $4 million, 25% would be plotted for that product line instead of $4 million.

> "In this type of graph, the sum of all the components, which is represented by the tops of the columns, is always 100%." (p. 83)

The illustration shows columns for years 1991-1995, each reaching 100%, with three product lines showing their percentage of total sales.

## Usage

When to use:
- When relative proportions matter more than absolute values
- When comparing how composition changes across categories or time
- When the whole is divided into mutually exclusive, exhaustive parts

Design considerations:
- Vertical scale runs from 0% to 100%
- All columns reach the same height (100%)
- The linking technique from standard stacked graphs can also be applied
- Component ordering follows the same principles as regular stacked graphs

## Notes

The critical limitation is that absolute magnitude changes are hidden. A segment might grow from 20% to 40%, but this could represent actual shrinkage if the total decreased significantly. Consider pairing with a separate graph showing absolute totals when both proportions and magnitudes matter.
