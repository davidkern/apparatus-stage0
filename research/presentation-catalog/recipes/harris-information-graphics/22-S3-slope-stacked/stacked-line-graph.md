---
name: Stacked Line Graph
slug: stacked-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Line Graph, p. 358"

intent: Show cumulative totals from multiple data series using lines rather than filled areas
direction: both

components:
  - element: baseline
    encodes: Zero reference for the bottom data series
    required: true
  - element: stacked-lines
    encodes: Multiple data series, each measured from the line below
    required: true
  - element: top-line
    encodes: Cumulative total of all component series
    required: true
  - element: sequence-axis
    encodes: Time or ordered categories (typically horizontal)
    required: true
  - element: quantitative-axis
    encodes: Cumulative values (typically vertical)
    required: true

parameters:
  series_count: "2 or more data series"
  line_style: "solid | dashed | varied"
  fill_between: "none | partial shading"

related: []  # TBD: stacked-area-graph, grouped-line-graph

warnings:
  - "Potential confusion with grouped line graph format where each line references zero"
  - "Viewers may misinterpret stacked lines as independent series"
  - "Use cautiously and label clearly to indicate cumulative nature"
  - "Stacked area graph is often clearer for the same data"

extensions:
  harris_entry: "Stacked Line Graph"
  alternate_names:
    - "layer line graph"
  typical_use: "showing cumulative totals over time when area fills are not desired"
  confusion_risk: "high - easily confused with grouped line graph"
---

## Description

A stacked line graph displays multiple data series as lines stacked on top of one another, where each line is plotted from the line immediately below it rather than from a common zero baseline. The top line represents the cumulative total of all component data series.

Harris notes this format "is used cautiously because of the potential confusion with the more familiar grouped line graph format, in which each curve is referenced from the same zero axis." This warning is significant: viewers accustomed to standard line graphs may misread stacked lines as independent series.

## Examples

From the illustrations on p. 358, Harris shows two variations:

1. A two-dimensional stacked line graph with three series (A, B, C) over years 1994-1998, with values up to 20. The "Total" label points to the top line, emphasizing that it represents the sum of all components.

2. A three-dimensional perspective version showing the same stacking principle with added depth.

Both examples include clear labeling of the total line to help viewers understand the cumulative nature of the display.

## Usage

Stacked line graphs may be appropriate when:
- Showing cumulative totals is the goal but filled areas are not desired
- The audience is familiar with the stacked line convention
- Clear labeling can indicate the cumulative nature
- Comparing the pattern of the total line to component contributions

Generally prefer alternatives when:
- The audience expects standard grouped line graphs
- Risk of misinterpretation is high
- Stacked area graph would communicate the same information more clearly
- Precise component values need to be read (only bottom series can be read accurately)

If using this format, explicit labeling (e.g., "Total" for top line, "cumulative" in title) helps prevent misinterpretation.

## Notes

This is one of the less common stacking formats due to the confusion risk Harris identifies. The stacked area graph conveys the same information with filled regions that make the stacking visually obvious. When stacking is not clearly communicated, viewers naturally assume each line references zero, leading to misinterpretation of the data.
