---
name: Stacked Histogram
slug: stacked-histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, p. 191"

intent: Show how subcategories of a data series contribute to the overall frequency distribution pattern within each class interval
direction: both

components:
  - element: stacked-columns
    encodes: Frequency contribution of each subcategory within each class interval
    required: true
  - element: class-intervals
    encodes: Value ranges along horizontal axis
    required: true
  - element: vertical-axis
    encodes: Total frequency (sum of all subcategories)
    required: true
  - element: horizontal-axis
    encodes: Class interval values
    required: true
  - element: fill-patterns
    encodes: Different subcategories (color, shade, or pattern)
    required: true

parameters:
  number_of_series: "2+ subcategories"
  fill_differentiation: "color | shade | pattern"

related: []  # TBD: histogram, stacked-bar-graph, stacked-column-graph

warnings:
  - "Interpretation becomes difficult with more than two or three data series"
  - "Only the bottom series and total can be read accurately from the axis; middle series require estimation"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  typical_use: "analyzing how subcategories affect overall distribution patterns"
---

## Description

A stacked histogram shows how subcategories within a data series affect the overall frequency distribution pattern. Each column is divided into segments representing different subcategories, with the total column height showing the overall frequency for that class interval.

This variation allows analysts to see both the total distribution and the contribution of each component simultaneously.

## Examples

Harris provides a practical business example (p. 191):

> "Stacked histograms are sometimes used to show how subcategories of a data series affect the overall frequency distribution pattern. For example, a histogram similar to the one at the right might be generated to study the distribution of orders based on dollar value. The black portions might represent the number of export orders in the various sales dollar ranges and the white portions might represent the number of domestic orders. The tops of the columns indicate the overall number of orders."

The example shows sales order sizes in thousands of dollars on the horizontal axis, with export (black) and domestic (white) orders stacked within each column.

## Usage

Stacked histograms are useful when:
- Understanding how different groups contribute to an overall distribution
- Comparing the distribution patterns of subcategories
- Identifying whether certain value ranges are dominated by particular subcategories

Harris cautions (p. 191):
> "More than two data series can be plotted on this type of graph; however, interpretation sometimes becomes difficult."

The limitation arises because only the bottom series and the total are easily read from the axis; intermediate series require visual estimation.

## Notes

This technique combines the frequency distribution analysis of histograms with the part-to-whole comparison of stacked graphs. It answers questions like: "In which price ranges are export orders concentrated compared to domestic orders?"
