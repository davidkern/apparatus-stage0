---
name: Area Bar Graph
slug: area-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Bar Graph, p. 8"

intent: Encode a second variable in the width of bars, making bar area proportional to a meaningful measure while bar length encodes the primary variable
direction: both

components:
  - element: variable-width-bars
    encodes: Bars whose widths are proportional to a second measure
    required: true
  - element: bar-length
    encodes: Primary variable (e.g., profitability) measured along horizontal axis
    required: true
  - element: bar-width
    encodes: Secondary variable (e.g., percent of total sales) measured along vertical axis
    required: true
  - element: width-scale
    encodes: Scale on vertical axis showing the width measure (percents or units)
    required: true
  - element: length-scale
    encodes: Scale on horizontal axis showing the primary measure
    required: true

parameters:
  width_display: percent | units
  graph_type: simple | stacked

related: []  # TBD: see also bar-graph, area-column-graph

extensions:
  harris_entry: "Area Bar Graph"
  typical_use: "showing profitability weighted by market share or sales volume"
---

## Description

In an area bar graph, the widths of the bars are proportional to some measure or characteristic of the data element(s) represented by the bars. This allows the graph to encode two variables simultaneously: the bar length shows one measure while the bar width shows another.

For example, if the bars are displaying the profitability of various product lines, the width of the bars might indicate what percentage of the total sales the various products represent. This makes it possible to see both how profitable each product is and how significant it is to overall business.

## Examples

> "In an area bar graph, the widths of the bars are proportional to some measure or characteristic of the data element(s) represented by the bars. For example, if the bars are displaying the profitability of various product lines, the width of the bars might indicate what percentage of the total sales the various products represent." (p. 8)

The PDF (p. 8) shows two examples:

1. **Simple area bar graph with percent scale**: Shows profitability of each product (A, B, C, D) on the horizontal axis (0% to 25% profitability) with bar widths proportional to percent of total sales (0% to 100% on vertical axis)

2. **Stacked area bar graph with unit scale**: Shows products A through D with different components (Domestic sales, Export sales, Intercompany sales), where "Total units sold equals 250" and widths show "Percent domestic, export, and intercompany sales" (0% to 100%)

## Scale Options

Bar widths can be displayed along the vertical axis in terms of:
- **Percents**: Showing relative contribution to total (e.g., percent of total sales)
- **Units**: Showing absolute quantities (e.g., number of members)

## Graph Types

The concept can be used with:
- **Simple bar graph**: Each bar represents a single value
- **Stacked bar graph**: Bars are divided into segments showing composition

## Usage

Area bar graphs are appropriate when:
- Two related variables need to be shown for each category
- The product of the two variables (the area) has meaning
- You want to weight importance by both measures simultaneously
- Showing profitability relative to market significance

Consider that a very profitable but narrow bar (small market share) may be less significant than a moderately profitable but wide bar (large market share). The visual area captures this relationship.

## Notes

This is the horizontal (bar) variant; see also Area Column Graph for the vertical equivalent. Both encode additional information in the width dimension that traditional bar and column graphs do not capture.
