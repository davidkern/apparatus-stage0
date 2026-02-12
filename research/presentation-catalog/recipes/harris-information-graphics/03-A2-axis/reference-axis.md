---
name: Reference Axis
slug: reference-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Reference axis, p. 24"

intent: Add a secondary reference line to show deviations from a specified value while preserving actual value display
direction: both

components:
  - element: zero-base-line-axis
    encodes: The standard axis from which actual values are measured
    required: true
  - element: reference-axis
    encodes: A shifted axis representing the comparison value
    required: true
  - element: drop-lines
    encodes: Lines or bars connecting data points to the reference axis
    required: true
  - element: data-points
    encodes: Points plotted at actual values from zero base line
    required: true

parameters:
  reference_value: numeric value for the reference line
  deviation_display: drop-lines | bars | columns

related: []  # TBD: see also zero-base-line-axis, deviation-graph

warnings:
  - "Ensure the reference value and its meaning are clearly labeled"

extensions:
  harris_entry: "Axis, Graph"
  alternate_names: ["reference line", "shifted reference axis"]
  typical_use: "comparing actual values against a target, budget, or benchmark value"
---

## Description

A reference axis (sometimes called a reference line or shifted reference axis) adds a secondary horizontal line to a graph positioned at a meaningful comparison value. Data points are plotted from the zero base line according to their actual values, while short drop lines, bars, or columns extend from the data points to the reference axis. This creates a dual-function graph that simultaneously shows actual values and deviations from a reference value.

Harris describes this as a combination of a standard graph showing actual values and a deviation graph showing differences between actual values and some reference value.

## Examples

> "If it is desirable to see fluctuations around a given value as well as the actual values of the data, a reference axis can be used." (p. 24)

Harris shows two examples:
1. A point graph with reference axis at value 10, where data points (15, 13, 11, 8, 6) show actual values while drop lines extend down to the reference axis showing each point's deviation from 10.

2. A horizontal comparison showing countries (Russia, Europe, Africa, Mexico, Canada) where bars extend from a reference value, showing positive and negative deviations while data points indicate actual values.

## Usage

Reference axes are appropriate when:
- Comparing actual performance against a target or budget
- Showing deviations from a mean, median, or expected value
- Highlighting whether values exceed or fall short of a benchmark
- Combining absolute value display with relative comparison

The reference axis value might represent:
- Budget or planned values
- Previous period values
- Industry averages or benchmarks
- Specification limits

## Notes

The graph functions as a combination display: the data points communicate actual values (read against the primary scale), while the drop lines or bars communicate deviations (their length shows distance from the reference value). This dual encoding provides more information than either a standard value graph or a pure deviation graph alone.
