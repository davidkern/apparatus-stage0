---
name: One-Axis Line Graph
slug: one-axis-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, One-axis line graph, p. 213"

intent: Combine data for both variables onto a single axis, creating a compact visualization along the horizontal or vertical dimension only
direction: both

components:
  - element: single-axis
    encodes: Both the category/sequence and the quantitative values
    required: true
  - element: data-points
    encodes: Positions along the combined scale
    required: true
  - element: connecting-lines
    encodes: Relationship between adjacent points (optional)
    required: false

parameters:
  orientation: "horizontal | vertical"
  scale_type: "category with quantitative | sequence with quantitative"

related: []  # TBD: see also simple-line-graph

warnings:
  - "May be harder to interpret than conventional two-axis graphs"
  - "The collapsed dimension limits the types of comparisons possible"

extensions:
  harris_entry: "Line Graph"
  typical_use: "compact data display, space-constrained presentations"
---

## Description

A one-axis line graph combines information typically shown on two axes onto a single axis, either horizontal or vertical. Where a conventional two-dimensional graph plots data on separate vertical and horizontal axes, a one-axis graph collapses this into a single dimension.

The same data can be displayed using a horizontal one-axis graph (data points distributed along a horizontal line) or a vertical one-axis graph (data points distributed along a vertical line).

## Examples

Harris shows the same data displayed four ways:

> "Shown below are examples of the same data plotted on horizontal and vertical one-axis line graphs." (p. 213)

The horizontal one-axis version shows countries (Guatemala, Malta, Israel, Australia, Canada) positioned along a horizontal scale from 0 to 18,000, with their values marked by position along this single axis.

The vertical one-axis version shows the same countries stacked vertically, with values (Guatemala at ~4,000, Malta at ~8,000, Israel at ~12,000, Australia at ~15,000, Canada at ~18,000) marked by position along a vertical scale.

Harris also provides two-axis versions for comparison:
> "For comparison, two conventional two-axis graphs are shown below displaying the same data used in the one-axis graphs above." (p. 213)

These show a two-axis column graph and a two-axis point graph with drop lines, demonstrating how the data appears in conventional formats.

## Usage

One-axis line graphs are appropriate when:
- Space is constrained and a compact display is needed
- The relationship is straightforward (values for named categories)
- A simplified visual is preferred over a full two-axis graph

Harris notes: "Many times, one of the scales on a one-axis graph is of the category type; however, this is not a prerequisite."

## Notes

The one-axis format sacrifices some of the visual clarity of two-axis graphs in exchange for compactness. It works best when the data relationship is simple and viewers can easily understand how position along the axis encodes value. For complex comparisons or when precise value reading matters, two-axis formats are generally clearer.
