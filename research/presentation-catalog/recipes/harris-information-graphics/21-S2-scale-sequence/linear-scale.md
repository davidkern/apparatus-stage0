---
name: Linear Scale
slug: linear-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Linear scale, p. 336"

intent: Configure a quantitative axis where equal physical distances represent equal numerical amounts
direction: both

components:
  - element: major-tick-marks
    encodes: Primary scale divisions at regular intervals
    required: true
  - element: minor-tick-marks
    encodes: Subdivisions between major intervals
    required: false
  - element: labels
    encodes: Numeric values at major tick marks
    required: true
  - element: axis-line
    encodes: Reference line along which scale is drawn
    required: true

parameters:
  interval_size: "numeric value between major tick marks (e.g., 1, 2, 5, 10)"
  starting_value: "lowest value on scale"
  ending_value: "highest value on scale"
  minor_divisions: "number of minor intervals per major interval"

related: []  # TBD: logarithmic-scale, power-scale

warnings:
  - "Intervals should be easy-to-read values like 1, 2, 5, 10; avoid unusual intervals like 3, 7, 9"
  - "Minor intervals should be logical divisions of major intervals (e.g., weeks into 7 days, feet into 12 inches)"

extensions:
  harris_entry: "Scale"
  alternate_names: ["arithmetic scale"]
  typical_use: "most common scale type for rectangular graphs"
  scale_property: "equal distances represent equal amounts"
---

## Description

A linear scale, sometimes referred to as an arithmetic scale, is the most widely used quantitative scale for rectangular graphs. The defining characteristic is that the distance and value between any two major tick marks (major intervals) is always the same throughout the entire length of the scale.

For example, a major interval might be one inch representing ten units of measure. On the same scale, minor tick marks might be spaced at one-tenth of an inch intervals, each representing one unit of measure. These proportional relationships apply at any point along the entire length of the scale.

## Examples

> "A linear scale is arranged such that the distance and value between any two major tick marks (major intervals), is always the same in a given scale." (p. 336)

The PDF illustrates a linear scale from 0 to 30, with major tick marks at 0, 10, 20, and 30. Minor tick marks subdivide each major interval into 10 equal parts. The notation "Equal distances & equal amounts" appears three times along the scale to emphasize the consistent proportional relationship.

## Usage

Linear scales are appropriate when:
- The data spans a moderate range where all values can be displayed without compression
- Direct comparison of absolute differences between values is important
- The viewer needs to read precise values from the graph
- Mathematical relationships between plotted points are linear

Linear scales may be less appropriate when:
- Data spans multiple orders of magnitude (consider logarithmic scale)
- Rate of change rather than absolute change is the focus
- Small values would be compressed to illegibility

## Notes

Linear scales can be applied to both horizontal and vertical axes. They are the default assumption when scale type is not specified. The choice of interval size affects readability; common intervals include 1, 2, 5, 10, 20, 50, 100, etc.
