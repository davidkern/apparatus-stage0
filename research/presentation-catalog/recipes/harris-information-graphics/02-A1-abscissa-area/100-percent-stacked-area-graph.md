---
name: 100% Stacked Area Graph
slug: 100-percent-stacked-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Graph, 100% stacked area graph, p. 15"

intent: Show how the percentage composition of a whole changes over time, with each data series displayed as its proportion of the total rather than absolute values
direction: both

components:
  - element: percentage-bands
    encodes: Data series shown as percent of total, stacked to always sum to 100%
    required: true
  - element: top-boundary
    encodes: Constant 100% line at top of graph
    required: true
  - element: filled-regions
    encodes: Shaded areas between curves representing each series' proportion
    required: true
  - element: horizontal-axis
    encodes: Zero baseline for percentages
    required: true
  - element: percentage-scale
    encodes: Vertical scale from 0% to 100%
    required: true
  - element: legend
    encodes: Key identifying which band represents which data series
    required: true

parameters:
  number_of_series: integer
  series_order: "custom arrangement"
  curve_type: segmented | stepped | smooth

related: []  # TBD: see also stacked-area-graph, grouped-area-graph

warnings:
  - "Absolute values are not shown; viewers cannot determine actual quantities"
  - "The constant 100% top line can give a false impression of stability in the total"
  - "Changes in one component necessarily affect the visual representation of all others"

extensions:
  harris_entry: "Area Graph"
  alternate_names: ["percent stacked area graph", "100 percent area graph"]
  typical_use: "showing how the proportional composition of a whole changes over time"
  scale_requirements:
    vertical: "0% to 100%, linear"
---

## Description

An important variation of the stacked area graph is the 100% stacked area graph, which displays percent-of-the-whole data. With this type of graph, instead of plotting the actual values for each data series, the percents that the values represent of the total of all the data series are plotted. For example, if the total sales for a company were $16 million and the sales for a product line in a given year were $4 million, 25% would be plotted for that product line instead of $4 million.

In this type of graph, the sum of all the components, which is represented by the top curve, is always 100%. This makes it ideal for showing how proportions shift over time, even when the total varies.

## Examples

> "An important variation of the stacked area graph is the 100% stacked area graph which displays percent-of-the-whole data. With this type of graph, instead of plotting the actual values for each data series, the percents that the values represent of the total of all the data series are plotted." (p. 15)

> "In this type of graph, the sum of all the components, which is represented by the top curve, is always 100%." (p. 15)

The PDF on page 15 shows a comparison of grouped, stacked, and 100% stacked area graphs using the same data, illustrating:
- Grouped graph: shows actual values of each series from zero axis
- Stacked graph: shows actual values with series added together
- 100% stacked graph: shows percentage each series represents of the total

In the 100% stacked example, the vertical axis runs from 0% to 100%, with labels for each data series showing "Percent data series A is of the whole," "Percent data series B is of the whole," and "Percent data series C is of the whole."

## Usage

100% stacked area graphs are appropriate when:
- The relative proportions of components are more important than absolute values
- You want to show how the composition of a whole changes over time
- Comparing how different categories' market share or contribution shifts
- The total varies significantly, making absolute comparisons misleading

100% stacked area graphs are less appropriate when:
- Absolute values matter to the analysis
- The audience needs to understand the magnitude of change
- There are many components (more than 4-5 becomes difficult to read)

**Reading the graph:**
- The bottom of each band represents the cumulative percentage of all series below it
- The height of each band represents that series' percentage of the total
- The top is always 100%, representing the complete whole

## Notes

When using a 100% stacked area graph, consider providing a companion graph or annotation showing the absolute totals, as viewers often want to know whether a growing percentage represents growth in a growing market or a larger share of a shrinking market.
