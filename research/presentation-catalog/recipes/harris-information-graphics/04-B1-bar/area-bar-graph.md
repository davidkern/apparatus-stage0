---
name: Area Bar Graph
slug: area-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Area bar graph, p. 46"

intent: Encode additional information in bar width, making both bar length and width meaningful dimensions
direction: both

components:
  - element: variable-width-bars
    encodes: Width proportional to a second measure (e.g., population, market share)
    required: true
  - element: bar-length
    encodes: Primary quantitative value (standard bar encoding)
    required: true
  - element: bar-area
    encodes: May represent combined meaning of width and length (e.g., total revenue)
    required: false
  - element: horizontal-scale
    encodes: Values for bar length (quantitative)
    required: true
  - element: vertical-scale
    encodes: Values for bar width; may be percent, units, or in legend
    required: false
  - element: width-legend
    encodes: Scale for interpreting bar widths if not on axis
    required: false

parameters:
  width_scale_location: vertical-axis | legend | on-graph | none
  width_units: percent | absolute-units | relative
  bar_spacing: joined | spaced
  cumulative: true | false

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: histogram
    relationship: variant-of
  - slug: mosaic-graph
    relationship: combines-with

warnings:
  - "The concept of using bar width is generally not applied to grouped bar graphs"
  - "When widths are cumulative (add to 100%), bars should be joined to avoid unaccounted spaces"
  - "Area interpretation requires both dimensions to be related; descriptive widths yield areas with no clear meaning"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "variable-width bar graph"
    - "width-encoded bar graph"
  typical_use: "showing two related measures simultaneously, such as profitability (length) and market share (width)"
  width_communication:
    - "scale on vertical axis (percent or units)"
    - "scale in legend"
    - "values noted directly on graph"
  area_significance:
    descriptive: "width and length unrelated; area has no meaning"
    related: "width and length mathematically related; area is meaningful (as in histograms)"
---

## Description

Area bar graphs are the only bar graph variation where bar width has significance. The widths are proportional to some measure or characteristic of the data element. For example:

- Bars comparing average salary might have widths indicating group population
- Bars displaying profitability might have widths showing percent of total sales

This creates a two-dimensional encoding where both length and width carry information.

## Examples

Harris illustrates several formats (p. 46):

**Simple area bar graph:**
- Products A-D on vertical axis (with varying heights)
- Percent profitability (0-25) on horizontal axis
- Bar widths show percent of total sales for each product
- Vertical axis shows cumulative percent (0% to 100%)

**100% stacked area bar graph:**
- Products A-D stacked vertically
- Percent scale (0-100) on horizontal axis showing composition
- Bar widths (heights) indicate relative size/importance
- Units scale on right side

**Width scale options:**
1. Scale on vertical axis (percent or units)
2. Scale provided in legend
3. Values noted directly on the graph

## Area Interpretation

Harris distinguishes two categories based on whether area is meaningful:

**Descriptive widths (area not significant):**
- Width denotes one thing (e.g., city population)
- Length denotes another (e.g., violent crimes)
- Little or no relationship between width and length
- Area has no interpretable meaning

**Related widths (area is significant):**
- Width and length are mathematically related
- As width changes, length changes correspondingly
- Area becomes meaningful
- Example: Histograms where wider class intervals have correspondingly adjusted bar heights

> "In a histogram, if the width of a bar is increased to encompass a broader class interval, the length of the bar must be changed accordingly. In these cases the area of the bar can be as or more meaningful with regards to the data element it represents as either the length or the width of the bar."

## Usage

**When to use:**
- Showing two related measures for each category
- When relative importance (width) affects interpretation of values (length)
- Histograms with unequal class intervals

**Bar spacing considerations:**
- If widths are cumulative (add to total like 100%), use joined bars
- If widths are non-cumulative and total is unimportant, spaces are acceptable

**Width indication:**
- Width can be approximate/relative (no scale) or precise (with scale)
- Scale can appear on vertical axis, in legend, or as direct labels

**Limitations:**
- Generally not applied to grouped bar graphs
- Adds complexity; use only when the second dimension adds value

## Notes

Histograms are a special case of area bar graphs where width (class interval) and length (frequency density) are related such that area represents frequency. The histogram entry provides more detail on this specific application.
