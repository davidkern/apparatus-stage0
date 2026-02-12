---
name: Area Column Graph
slug: area-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Area column graph, p. 89"

intent: Encode additional information in column width, making column area meaningful
direction: both

components:
  - element: variable-width-columns
    encodes: A second measure or characteristic via column width
    required: true
  - element: column-height
    encodes: Primary measure (e.g., average salary, profitability percentage)
    required: true
  - element: column-width
    encodes: Secondary measure (e.g., population size, sales volume)
    required: true
  - element: column-area
    encodes: Combined meaning when width and height are related
    required: false
  - element: quantitative-scale-vertical
    encodes: Numeric values for height
    required: true
  - element: width-scale-or-legend
    encodes: How to interpret column widths
    required: true

parameters:
  width_meaning: "descriptive (unrelated to height) | related (area significant)"
  cumulative_width: "yes (columns joined) | no (columns separated)"
  width_display: "scale on horizontal axis | scale in legend | values on graph"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: histogram
    relationship: variant-of

warnings:
  - "This is the only column graph variation where column width has significance"
  - "Area can be misleading if width and height meanings are unrelated"
  - "Viewers may assume area is meaningful even when it is not"

extensions:
  harris_entry: "Column Graph"
  alternate_names: []
  typical_use: "showing profitability vs. sales volume, average values vs. population size, histogram with unequal class intervals"
  scale_types:
    vertical: "quantitative"
    horizontal: "quantitative or cumulative percentage"
---

## Description

Area column graphs are the only variation of column graphs in which the width of the columns has significance. The widths of columns are proportional to some measure or characteristic of the data element represented by the column.

For example:
- If columns compare average salaries of different groups, width might indicate how many people are in each group
- If columns display profitability of various product lines, width might indicate what percentage of total sales each product represents

## Examples

> "Area column graphs are the only variation of column graphs in which the width of the columns has significance. In the area column graphs, the widths of the columns are proportional to some measure or characteristic of the data element represented by the column." (p. 89)

Harris shows three ways to communicate width information:
1. Scale on horizontal axis (percents or units)
2. Scale in legend
3. Values noted directly on the graph

### Width Categorization

Area column graphs can be categorized based on width-height relationships:

1. **Descriptive widths**: Width has little or no relationship to height. Example: width = city population, height = violent crimes. Column area has no meaningful interpretation.

2. **Related widths**: Width and height vary together. Example: in histograms, expanding width to cover a broader class interval adjusts height accordingly. Area is a truer measure than either dimension alone.

3. **Approximate widths**: Width conveys only relative values; no scale shown.

## Usage

When values along the horizontal axis are cumulative:
- Columns are generally joined (no spaces) so there are no unaccounted-for spaces
- Used when all values add up to 100% or when the sum matters
- Examples: market share breakdown, budget allocation

When values are not cumulative:
- Spaces can be used between columns
- Scale is typically shown in legend
- Total of widths is unimportant

The histogram is probably the most widely used application of area column graphs. In histograms, as column width expands to cover a broader class interval, height changes accordingly to maintain area proportionality.

## Notes

The concept of using width to convey additional information is generally applied only to simple, stacked, and range column graphs, including 100% stacked graphs. It adds a second dimension of data but requires careful explanation for correct interpretation.
