---
name: Dual Axis
slug: dual-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Axes designated by position on graph, p. 24"

intent: Display two different scales on opposite sides of a graph to compare variables with different units or ranges
direction: both

components:
  - element: left-vertical-axis
    encodes: Primary quantitative scale (often the main variable)
    required: true
  - element: right-vertical-axis
    encodes: Secondary quantitative scale (different units or range)
    required: true
  - element: horizontal-axis
    encodes: Shared category or sequence axis
    required: true
  - element: data-series-indicators
    encodes: Visual cues linking each data series to its axis
    required: true

parameters:
  left_scale: units and range for left axis
  right_scale: units and range for right axis
  scale_alignment: independent | aligned-zeros

related: []  # TBD: see also quantitative-axis, reference-axis

warnings:
  - "With the increasing ability to rotate graphs 360 degrees, terms like right and left become less precise"
  - "Readers may misinterpret relationships when scales differ significantly"

extensions:
  harris_entry: "Axis, Graph"
  alternate_names: ["secondary axis", "two-axis graph", "dual Y-axis"]
  typical_use: "comparing two variables measured in different units on the same chart"
---

## Description

A dual axis configuration uses two vertical quantitative scales on opposite sides of a rectangular graph. This allows a single graph to display data series measured in different units or spanning different ranges. The left and right vertical axes can have independent scales, enabling comparison of trends between variables that would otherwise require separate graphs.

Harris describes how axes are sometimes referenced by their position on the graph, noting that on two-dimensional graphs it is common to refer to the upper and lower horizontal axes or the right and left vertical axes.

## Examples

> "On two-dimensional graphs it is common to refer to the upper and lower horizontal axes or the right and left vertical axes." (p. 24)

Harris illustrates a two-dimensional graph with:
- Left Y or vertical axis with one scale (0-8 in units)
- Right Y or vertical axis with a different scale (0%-40% in percentages)
- Lower (bottom) X or horizontal axis with categories A-E
- Upper (top) X or horizontal axis (optional duplicate)

## Usage

Dual axes are appropriate when:
- Comparing two metrics with different units (e.g., units sold vs. revenue dollars)
- Displaying variables with vastly different ranges on the same timeline
- Showing correlations or inverse relationships between related metrics

Configuration considerations:
- Clearly label which data series corresponds to which axis
- Use visual differentiation (color, line style) to link series to axes
- Consider whether zero alignment between scales is meaningful
- Avoid creating misleading visual correlations through scale manipulation

## Notes

The vertical scale may be shown on the left side, right side, or both. For stock price charts and similar applications with large amounts of data, having the scale on the right side is common since the most current data (of greatest interest) appears on that side.

On three-dimensional graphs, caution should be exercised when referring to axes as right or left, since they reverse their relative positions from top to bottom.
