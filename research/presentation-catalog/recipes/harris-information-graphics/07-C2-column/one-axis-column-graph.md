---
name: One-Axis Column Graph
slug: one-axis-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Stacked column graph with a single column, p. 93"

intent: Show part-to-whole relationships at a single point in time using one stacked column with scale on its side
direction: both

components:
  - element: single-stacked-column
    encodes: Components of a whole at one point in time
    required: true
  - element: side-scale
    encodes: Quantitative values directly on column edge
    required: true
  - element: segment-labels
    encodes: Component names on or adjacent to data graphic
    required: true
  - element: percentage-scale
    encodes: Percent-of-whole values (optional, may be in addition to or instead of value scale)
    required: false

parameters:
  scale_type: "value only | percentage only | both"
  scale_position: "left | right | both sides"
  label_position: "on segments | adjacent to segments"

related:
  - slug: stacked-column-graph
    relationship: variant-of
  - slug: pie-chart
    relationship: contrasts

warnings:
  - "Functions like a circle graph but in rectangular form"
  - "Without a scale, becomes a column chart (proportional chart) rather than a graph"
  - "Limited to showing one point in time or one condition"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["single column graph", "column chart", "proportional chart"]
  typical_use: "budget breakdowns, composition analysis, alternative to pie charts"
---

## Description

A typical stacked column graph shows how relative sizes of components change over time, with each column representing one point in time. When interest is in just one point in time or one condition, a single column is used. This functions similarly to a circle (pie) graph but in rectangular form.

When a single column is used, the quantitative scale can be placed directly on the side of the column. This variation is sometimes called a one-axis column graph.

## Examples

> "Sometimes the interest is in just one point in time or one condition in which case a single column is used. When used in this way the graph functions very much like a circle graph." (p. 93)

Harris shows several variations:
- One-column stacked graph with quantitative value scale attached
- One-column stacked graph with percent-of-the-whole scale attached  
- One-column stacked graph with both percentage and value scales
- Labels located directly on the data graphic (one-axis format)
- Pictures or icons used to identify categories (pictorial variant)

> "Without the scale, the graphic is called a column chart or proportional chart instead of a column graph." (p. 93)

## Usage

Scale options:
- Actual value scales (e.g., dollars, units)
- Percent-of-the-whole scales (0% to 100%)
- Both scales together (values on one side, percentages on other)
- No scales with values placed directly on segments

Label options:
- Text labels on segments
- Values noted on data graphics
- Icons or pictures to identify categories

When to use:
- Showing composition at a single point in time
- When linear format is preferred over circular (pie chart)
- When precise percentage reading matters (easier with rectangular form)
- Space-constrained layouts where single column fits better than pie

Advantages over pie charts:
- Easier to read precise percentages from linear scale
- Segments are easier to compare (same baseline width)
- More compact in some layouts

## Notes

The distinction between column graph and column chart: with a quantitative scale, it is a graph; without a scale (values noted directly), it becomes a proportional chart. Both communicate similar information but with different precision implications.
