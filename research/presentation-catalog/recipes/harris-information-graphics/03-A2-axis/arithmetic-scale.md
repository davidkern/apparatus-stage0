---
name: Arithmetic Scale
slug: arithmetic-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Arithmetic Scale, p. 21"

intent: Configure a linear scale where equal distances represent equal value increments
direction: both

components:
  - element: scale-line
    encodes: The physical line along which values are displayed
    required: true
  - element: major-tick-marks
    encodes: Primary divisions at regular intervals (e.g., every 10 units)
    required: true
  - element: minor-tick-marks
    encodes: Subdivisions between major marks (e.g., every 1 unit)
    required: false
  - element: scale-labels
    encodes: Numeric values at major tick positions
    required: true

parameters:
  major_interval: numeric value between major tick marks
  minor_interval: numeric value between minor tick marks
  start_value: scale origin value
  end_value: scale maximum value

related: []  # TBD: see also logarithmic-axis, quantitative-axis

extensions:
  harris_entry: "Arithmetic Scale"
  alternate_names: ["linear scale"]
  key_property: "Equal distance always represents equal value throughout the scale"
---

## Description

An arithmetic scale (also called a linear scale) is arranged so that the distance and value between any two major tick marks is always the same throughout the entire length of the scale. This constant relationship between physical distance and numeric value makes arithmetic scales intuitive for reading absolute values and comparing magnitudes.

Harris specifies that both the distance between tick marks AND the value those distances represent must be consistent. For example, if major tick marks are one inch apart and represent 10 units, this relationship holds at every point along the scale.

## Examples

> "An arithmetic scale is arranged such that the distance and value between any two major tick marks (major values) is always the same for a given scale." (p. 21)

Harris provides a detailed example:
- Distance between major tick marks: one inch
- Value represented: 10 units (e.g., 10 gallons, 10 houses)
- Distance between minor tick marks: one-tenth of an inch
- Value represented: 1 unit (e.g., 1 gallon, 1 house)

The illustrated scale runs from 0 to 30, with major marks at 0, 10, 20, 30 and minor marks at each integer value. Annotations show "Equal distances and equal amounts" spanning different portions of the scale to emphasize the consistency.

> "On an arithmetic scale, these two criteria would apply at any point along the entire length of the scale." (p. 21)

## Usage

Arithmetic scales are appropriate when:
- Absolute values and direct magnitude comparisons matter
- Data does not span multiple orders of magnitude
- Viewers need to estimate intermediate values by interpolation
- Changes should be interpreted in absolute terms (not percentages)

An arithmetic graph is one that has linear scales on one or more of its quantitative axes.

## Notes

The arithmetic scale contrasts with logarithmic scales where equal distances represent equal ratios. The choice between arithmetic and logarithmic depends on whether absolute differences or percentage changes are more meaningful for the analysis. Most general-purpose graphs use arithmetic scales by default.
