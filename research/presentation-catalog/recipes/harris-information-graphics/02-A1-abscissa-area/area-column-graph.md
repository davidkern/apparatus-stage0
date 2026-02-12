---
name: Area Column Graph
slug: area-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Column Graph, p. 9"

intent: Encode a second variable in the width of columns, making column area proportional to a meaningful measure while column height encodes the primary variable
direction: both

components:
  - element: variable-width-columns
    encodes: Columns whose widths are proportional to a second measure
    required: true
  - element: column-height
    encodes: Primary variable measured along vertical axis
    required: true
  - element: column-width
    encodes: Secondary variable measured along horizontal axis
    required: true
  - element: horizontal-scale
    encodes: Scale showing the width measure (may be percent, units, or in legend)
    required: false
  - element: vertical-scale
    encodes: Scale showing the primary measure
    required: true

parameters:
  width_display: "percent scale | unit scale | legend | direct labels"
  graph_type: simple | stacked | "100% stacked"
  column_spacing: joined | separated

related: []  # TBD: see also column-graph, area-bar-graph, histogram

warnings:
  - "If values along horizontal axis are cumulative, columns should be joined with no gaps"
  - "When width and height are related (as in histograms), area is the true measure, not height or width alone"

extensions:
  harris_entry: "Area Column Graph"
  typical_use: "showing values weighted by another measure, histograms"
---

## Description

A variation of column graphs in which the width of the columns has significance. In the area column graph, the widths of the columns are proportional to some measure or characteristic of the data elements represented by the columns. For example, if the columns are displaying the profitability of various product lines, the width of the columns might indicate what percentage of total sales the various products represent.

## Displaying Column Widths

Column widths can be displayed in several ways:

1. **Percent scale on horizontal axis**: Shows relative widths as percentages
2. **Unit scale on horizontal axis**: Shows absolute quantities
3. **Scale in legend**: Width values shown separately from the graph axes
4. **Direct labels**: Values noted directly on the graph

## Column Spacing

The spacing between columns depends on the nature of the data:

- **Joined columns (no gaps)**: If the values along the horizontal axis are cumulative, the columns are generally joined so there are no unaccounted-for spaces. For example, if all columns add up to 100%, or if the sum of all values along the horizontal axis is important, no spaces are left between columns.

- **Separated columns (with gaps)**: Spaces can be used between columns if the values are not cumulative, the total is unimportant, and a scale is part of the legend.

## Examples

> "A variation of column graphs in which the width of the columns have significance. In the area column graph, the widths of the columns are proportional to some measure or characteristic of the data elements represented by the columns." (p. 9)

> "The histogram is probably the most widely used application of an area column graph. In a histogram, as the width of a column is expanded to cover a broader class interval, the height is adjusted accordingly." (p. 9)

The PDF (p. 9) shows several examples:

1. **Simple area column graph**: Products A-D with percent scale (0%-100%) on horizontal axis showing profitability on vertical axis

2. **Stacked area column graph**: Products A-D showing domestic, export, and internal sales with unit scale on horizontal axis ("Total units sold of A, B, C, & D equals 250")

3. **Area column graph with legend scale**: Columns separated by spaces, with scale shown in legend ("Hundreds of members" with 0-5-10 scale)

4. **Histogram**: The most widely used application - as column width expands to cover a broader class interval, height is adjusted accordingly

## Relationship Between Width and Height

Sometimes the widths and heights of the columns are related such that as one varies, the other varies also. The histogram is the primary example: if the width of a column is increased to encompass a broader class interval, the height of the column is adjusted accordingly. In these cases, the area of the column is a truer measure of the thing being represented than either the height or width alone.

## Graph Types

The concept of using the width of columns to convey additional information is generally applied only to:
- Simple column graphs
- Stacked column graphs
- 100% stacked column graphs

## Usage

Area column graphs are appropriate when:
- Two variables need to be shown for each category
- The area (product of height and width) has meaning
- Showing values weighted by another measure
- Displaying frequency distributions with varying class intervals (histograms)

**Histogram application**: The histogram is probably the most widely used application of an area column graph. It is essential for displaying frequency distributions where class intervals may vary in width, ensuring that the visual area remains proportional to frequency.

## Notes

This is the vertical (column) variant; see also Area Bar Graph for the horizontal equivalent. The histogram application is particularly important as it ensures accurate visual representation of frequency data even when class intervals are unequal.
