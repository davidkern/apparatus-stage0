---
name: Logarithmic Scale
slug: logarithmic-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Logarithmic scale, p. 336"

intent: Configure a quantitative axis where equal physical distances represent equal ratios between values
direction: both

components:
  - element: major-tick-marks
    encodes: Primary scale divisions at powers of the base (typically 10)
    required: true
  - element: minor-tick-marks
    encodes: Intermediate values within each cycle following logarithmic spacing
    required: false
  - element: cycle-labels
    encodes: Values at major tick marks (1, 10, 100, 1000, etc.)
    required: true
  - element: axis-line
    encodes: Reference line along which scale is drawn
    required: true

parameters:
  base: "logarithm base, typically 10"
  starting_value: "lowest value (must be greater than zero)"
  number_of_cycles: "how many powers of 10 the scale spans"

related: []  # TBD: linear-scale, semilogarithmic-graph

warnings:
  - "Cannot include zero on a logarithmic scale"
  - "Cannot display negative values"
  - "Minor tick mark spacing is non-uniform within each cycle"

extensions:
  harris_entry: "Scale"
  typical_use: "displaying data spanning multiple orders of magnitude"
  scale_property: "equal distances represent equal ratios"
  cross_reference: "See Logarithmic Graph"
---

## Description

A logarithmic scale is arranged such that the distances between major tick marks (major intervals) are of equal length and represent equal ratios, not equal amounts. The ratio between successive major values is constant, typically ten.

For example, the distance between 1 and 10 is the same as the distance between 10 and 100, and the same as between 100 and 1,000. In each case, the ratio is 10:1. This pattern applies at any point along the entire length of the scale.

The spacing of minor tick marks follows a similar logarithmic pattern, becoming progressively compressed as values approach the next major tick mark.

## Examples

> "A logarithmic scale is arranged such that the distances between major tick marks (major intervals) are of equal length and equal ratios. For example, the distance between any two major tick marks or major values might be one inch and a ratio of ten." (p. 336)

The PDF shows a logarithmic scale spanning from 1 to 1,000 across three decades (cycles). Each decade occupies the same physical distance. The notation "Equal distances & equal ratios" appears along the scale. Minor tick marks within each cycle are visibly compressed toward the higher end (e.g., 2, 3, 4... are more spread out than 7, 8, 9).

## Usage

Logarithmic scales are appropriate when:
- Data spans multiple orders of magnitude (e.g., 1 to 1,000,000)
- Rate of change or percent change is more important than absolute change
- Comparing proportional relationships between different data series
- Data follows exponential growth or decay patterns

Logarithmic scales are inappropriate when:
- Data includes zero or negative values
- Absolute differences between values are the focus
- The audience is unfamiliar with logarithmic representation

## Notes

When a graph has a logarithmic scale on one axis and a linear scale on the other, it is called a semilogarithmic graph (or semi-log graph). Semilogarithmic graphs are useful for identifying exponential trends: data that plots as a straight line on a semi-log graph is growing or decaying at a constant percentage rate.
