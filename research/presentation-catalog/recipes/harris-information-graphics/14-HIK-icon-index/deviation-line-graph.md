---
name: Deviation Line Graph
slug: deviation-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Difference line and deviation line graphs, p. 211"

intent: Plot differences between a data series and a reference value to show how performance varies from a baseline, budget, or target
direction: both

components:
  - element: deviation-values
    encodes: Difference between actual and reference at each point
    required: true
  - element: zero-reference-line
    encodes: The baseline representing no deviation (actual equals reference)
    required: true
  - element: positive-region
    encodes: Values above the baseline (actual exceeds reference)
    required: true
  - element: negative-region
    encodes: Values below the baseline (actual falls short of reference)
    required: true

parameters:
  reference_type: "constant | variable"
  cumulative: "yes | no"
  fill_areas: "yes | no"

related: []  # TBD: see also difference-line-graph

warnings:
  - "The reference series may be constant or variable - ensure this is clear"
  - "Cumulative deviation can obscure month-to-month patterns"

extensions:
  harris_entry: "Line Graph"
  typical_use: "budget variance analysis, quality control, performance tracking"
---

## Description

A deviation graph plots the differences between a data series and a known reference. Only the deviations are shown, not the actual values. If the actual values are above the reference, the plotted values are positive; if below, they are negative. The zero line represents perfect alignment with the reference.

The reference against which deviations are calculated might be:
- **Constant**: The same target value each period (e.g., monthly budget of $10,000)
- **Variable**: Different reference values each period (e.g., seasonal sales targets)

A **cumulative deviation graph** plots the running sum of all prior deviations plus the current one. This shows year-to-date performance against the reference rather than period-by-period performance.

## Examples

Harris demonstrates with budget variance:

> "If profit is being compared against budget, only the differences might be plotted. If actual profits are over budget, the values plotted are positive. If actual profits are under budget, the values plotted are negative." (p. 211)

The example shows monthly deviations from budget (J-F-M-A-M-J-J-A-S-O-N-D) as a line graph that crosses above and below zero. Positive values indicate months when actual exceeded budget.

Harris also shows the cumulative version:

> "A cumulative deviation graph plots the cumulative sum of all of the prior deviations plus the current deviation. For example, a regular deviation graph might show how profit compared to budget each month. A cumulative deviation graph shows the difference between actual profit and budget on a year-to-date basis." (p. 211)

The cumulative graph using the same data shows an upward trend through mid-year (accumulating positive deviations) followed by decline (negative deviations eroding the surplus).

## Usage

Deviation graphs are appropriate when:
- Comparing performance against a target, budget, or baseline
- The variance from reference matters more than absolute values
- Showing periods of over- or under-performance
- Tracking cumulative surplus or deficit over time

Construction considerations:
- The zero line should be clearly marked as the reference
- Consider whether period-by-period or cumulative view better serves the analysis
- Areas above and below zero can be filled or color-coded for emphasis
- Drop lines can connect data points to the reference for additional emphasis

## Notes

The deviation graph is related to but distinct from the difference graph. A deviation graph compares one measured series against a reference (which may be theoretical, budgeted, or expected). A difference graph compares two measured series against each other, filling the area between their actual curves.
