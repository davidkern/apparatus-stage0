---
name: Change Graph
slug: change-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Difference Graph, Change Graph, p. 140"

intent: Compare multiple factors at two points in time or under two different conditions, emphasizing direction and magnitude of change
direction: both

components:
  - element: data-points-pair
    encodes: Values at two time points or conditions for each factor
  - element: connecting-graphic
    encodes: Visual link showing change direction (bar or column)
  - element: direction-coding
    encodes: Whether change is positive or negative (via position, shading, or arrows)
  - element: favorable-unfavorable-coding
    encodes: Whether the change is desirable or not
    required: false
  - element: numeric-labels
    encodes: Actual change values on data graphics
    required: false

parameters:
  orientation: bar | column
  direction_encoding: arrow-direction | shading | position
  favorability_encoding: none | color | pattern

related: []  # TBD: see difference-line-graph

warnings:
  - "Direction coding must be consistent since no particular direction is inherently favorable"
  - "When both direction and favorability need encoding, use two distinct coding systems"

extensions:
  harris_entry: "Difference Graph"
  alternate_names: []
  typical_use: "comparing sales forecasts, employment changes, economic indicators between periods"
  scale_types:
    horizontal: "category (time periods or factors)"
    vertical: "quantitative"
---

## Description

A change graph is a variation of a difference graph that compares multiple factors at two points in time or under two different sets of conditions. Unlike simple difference graphs that might show continuous change, change graphs focus on discrete before-and-after comparisons across multiple items.

The key feature is the coding system for direction of change. Since no particular direction is always favorable or unfavorable (e.g., profit over budget is favorable but expenses over budget are unfavorable), an additional coding system may be needed to designate whether changes are desirable.

## Examples

Harris illustrates three methods for indicating direction of change in column change graphs (p. 140):

> "Three ways of accomplishing this are shown below." The examples show:
> 1. Arrow base indicates March forecast, arrow tip indicates April forecast
> 2. Light shading for favorable change, dark shading for unfavorable change
> 3. Combining direction (April higher/lower than March) with favorability coding

Example data that might be plotted:
- Changes in sales forecasts from one month to another
- Changes in employment from one period to another
- Changes in economic indicators from one period to another

## Usage

Change graphs are appropriate when:
- Comparing the same set of factors across exactly two conditions
- Direction of change is meaningful and should be emphasized
- Multiple factors need comparison in a single view

The numeric value of the change may or may not be shown on the data graphics. When shown, it adds precision but may add clutter.

Both bar (horizontal) and column (vertical) orientations work for change graphs, with the choice depending on the number of factors and labeling needs.

## Notes

This technique requires careful attention to the coding system. When using shading or color to indicate direction, ensure the visual encoding is intuitive or clearly labeled, since viewers may not immediately associate a particular shade with increase vs. decrease.
