---
name: Quantitative Axis
slug: quantitative-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Scale or label axes, p. 23"

intent: Configure an axis to display numeric values on a linear or logarithmic scale
direction: both

components:
  - element: scale-line
    encodes: The physical line along which values are measured
    required: true
  - element: tick-marks
    encodes: Small marks indicating scale divisions (major and minor)
    required: true
  - element: scale-labels
    encodes: Numeric values at tick mark positions
    required: true
  - element: axis-title
    encodes: Unit of measure or variable name
    required: false

parameters:
  scale_type: linear | logarithmic
  orientation: vertical | horizontal
  label_position: left | right | top | bottom

related: []  # TBD: see also category-axis, sequence-axis, logarithmic-axis

warnings:
  - "Alternate terms such as value, interval, numeric, or amount axis may be used instead of quantitative"

extensions:
  harris_entry: "Axis, Graph"
  alternate_names: ["value axis", "interval axis", "numeric axis", "amount axis"]
  typical_use: "displaying measured or calculated numeric values"
  scale_examples:
    - "0, 0.2, 0.4, 0.6, 0.8, 1 (linear)"
    - "1, 10, 100, 1000 (logarithmic)"
---

## Description

A quantitative axis displays numeric values along a scale. The axis serves as the reference from which quantitative values are measured and provides the visual framework for interpreting data point positions. Quantitative axes can use either linear (arithmetic) scales where equal distances represent equal amounts, or logarithmic scales where equal distances represent equal ratios.

Harris notes that an axis is sometimes referred to by the type of scale it has on it. If an axis has a quantitative scale, the axis might be referred to as a quantitative axis, or alternatively as a value, interval, numeric, or amount axis.

## Examples

> "Axes with scales such as these might be referred to as quantitative axes." (p. 23)

Harris illustrates two variations of quantitative axes:
- Linear scale: 0, 0.2, 0.4, 0.6, 0.8, 1
- Logarithmic scale: 1, 10, 100, 1000

The distance and value between any two major tick marks is always the same for a given linear scale. For example, the distance between any two major tick marks might be one inch and represent ten units of measure.

## Usage

Quantitative axes are appropriate when:
- Data values are numeric and continuous
- Precise value reading is important
- Comparisons between data points require consistent scale reference

The axis orientation depends on chart type:
- Vertical quantitative axis (Y-axis): most common for bar graphs, line graphs
- Horizontal quantitative axis (X-axis): used for scatter plots, horizontal bar graphs

## Notes

Lines on which scales are displayed (normally the lines bounding the graph) are sometimes referred to as scale lines. Scale axes or scale lines on rectangular graphs are almost always parallel to their zero base line axis.
