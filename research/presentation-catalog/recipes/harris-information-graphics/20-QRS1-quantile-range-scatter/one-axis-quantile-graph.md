---
name: One-Axis Quantile Graph
slug: one-axis-quantile-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Quantile Graph, p. 319"

intent: Display major quantile categories (quartiles, deciles) on a single axis without requiring visual interpolation between two scales
direction: both

components:
  - element: value-axis
    encodes: Quantitative scale showing actual data values
    required: true
  - element: quantile-markers
    encodes: Labels indicating quantile positions (deciles, quartiles, median) placed directly on the value axis
    required: true
  - element: tick-marks
    encodes: Marks showing where specific quantile values fall on the value scale
    required: true

parameters:
  quantile_categories: "quartiles | deciles | custom"

related:
  - slug: quantile-graph
    relationship: variant-of

warnings:
  - "Interpolation of values between quantile labels can potentially yield incorrect results"
  - "Only suitable when major categories (quartiles, deciles) are sufficient; detailed distribution analysis requires two-axis graphs"

extensions:
  harris_entry: "Quantile Graph"
  alternate_names: []
  typical_use: "quick display of distribution summary statistics without requiring curve interpretation"
---

## Description

A one-axis quantile graph is a simplified variant of the standard quantile graph used when only major quantile categories such as quartiles and deciles are required. Instead of plotting a curve across two axes, this format transfers the quantile values directly to a single vertical axis, eliminating the visual task of moving from one scale to a curve and then to another scale.

The resulting display shows the actual data values with labels indicating the corresponding quantile positions (upper decile at 90%, upper quartile at 75%, median at 50%, lower quartile at 25%, lower decile at 10%).

## Examples

> "When only the major categories such as quartiles and deciles are required, the data can be displayed on a one-axis graph." (p. 319)

> "In this type of graph the quantile values are transferred to the vertical axis so that the visual task of going from one scale to the curve to the other scale is eliminated." (p. 319)

Harris shows an example with a vertical axis displaying values from 0.0 to 5.0, with markers indicating upper decile (90%), upper quartile (75%), median (50%), lower quartile (25%), and lower decile (10%) positions.

## Usage

One-axis quantile graphs are appropriate when:
- A quick summary of distribution percentiles is needed
- The audience does not need to trace specific values along a curve
- Space is limited and a compact representation is preferred
- Only standard summary statistics (quartiles, deciles) are relevant

This format trades detailed distribution shape information for simplicity and direct readability of key percentile values.

## Notes

The limitation on interpolation accuracy arises because the spacing between labeled quantile values on a one-axis display does not preserve the mathematical relationship that would allow accurate intermediate value estimation. For precise analysis beyond the marked quantile positions, a standard two-axis quantile graph is preferred.
