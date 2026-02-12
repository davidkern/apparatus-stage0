---
name: Reference Axis
slug: reference-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Reference Axis, p. 327"

intent: Show deviations from a reference value (such as budget or target) while still displaying actual values, using a non-zero baseline that may vary across intervals
direction: both

components:
  - element: zero-baseline
    encodes: Standard axis at zero from which actual values are measured
    required: true
  - element: reference-axis
    encodes: Line at reference value(s) showing comparison standard (budget, target, benchmark)
    required: true
  - element: data-points
    encodes: Actual values measured from zero baseline
    required: true
  - element: deviation-graphics
    encodes: Columns, lines, bars, or areas between data points and reference axis showing deviations
    required: true

parameters:
  reference_type: "constant | variable"
  deviation_encoding: "columns | lines | bars | areas"
  favorable_unfavorable_coding: "none | color | shading"

related: []

warnings:
  - "Reference axis must be clearly distinguished from the zero baseline to avoid confusion"
  - "Variable reference axes (different value each period) require clear labeling"

extensions:
  harris_entry: "Reference Axis"
  alternate_names: ["shifted reference axis", "budget line", "target line"]
  typical_use: "showing actual vs. budget performance, comparing to targets that vary over time"
---

## Description

A reference axis is typically located at some value other than zero and is included on graphs to denote differences between actual values and reference values, while still showing the actual values. This dual encoding allows viewers to see both absolute performance and relative performance against a standard.

For example, to show actual profit values while clearly designating deviations from budget, the budget values serve as the reference axis. Data points measured from the zero baseline indicate actual profit values, while the data graphics between data points and the reference axis indicate deviations from budget.

**Constant reference axis**: Same reference value for all intervals (e.g., $4 million budget every month)

**Variable reference axis**: Different reference value for each interval (e.g., budget that varies seasonally)

## Examples

> "For example, if one wanted to show actual profit values but at the same time clearly designate deviations from budget, the budget values might be used as the reference axis." (p. 327)

Harris shows three variations (p. 327):
1. Budget with same dollar amount each month used as reference axis
2. Budget with different dollar amount each month used as reference axis
3. Reference axis used with a category graph (countries on vertical axis)

In each case, the area between actual values and the reference line is often color-coded to distinguish favorable (over budget) from unfavorable (under budget) performance.

## Usage

Reference axes are effective for:
- **Budget variance analysis**: Showing actual spending or revenue against planned amounts
- **Target tracking**: Comparing actual performance to goals
- **Benchmark comparison**: Displaying how values compare to industry standards or historical norms
- **Quality control**: Showing deviations from specification values

The technique works with columns, lines, bars, or areas as the data graphics between data points and the reference axis. Coloring or shading may differentiate favorable and unfavorable deviations.

## Notes

This differs from a simple reference line (which just marks a significant value) in that the reference axis actively structures the visual encoding of deviations. The space between the reference axis and data points becomes a meaningful visual element showing the magnitude and direction of variance.
