---
name: Run Chart
slug: run-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Run Chart, pp. 332-333"

intent: Record and display sequential data from a repetitive process to observe patterns, trends, or deviations from expected performance
direction: both

components:
  - element: data-points
    encodes: Individual measurements plotted in sequential order
    required: true
  - element: sequential-axis
    encodes: Horizontal axis showing time, sample number, lot number, or simple sequence
    required: true
  - element: quantitative-axis
    encodes: Vertical axis with linear scale for measured values
    required: true
  - element: centerline
    encodes: Horizontal reference line showing average, median, or target value
    required: false
  - element: limit-lines
    encodes: Horizontal reference lines showing specification limits, targets, or control boundaries
    required: false

parameters:
  sequential_scale: "time | lot-number | sample-number | unlabeled-sequence"
  reference_lines: "none | centerline | limits | both"
  point_connection: "none | lines"

related: []

warnings:
  - "Run charts typically use specific limits (manufacturer, customer, government specifications) rather than statistically-derived control limits"
  - "Run charts plot individual data points; control charts often plot averages"
  - "Control charts may be more appropriate when the goal is ensuring process stability rather than inspection"

extensions:
  harris_entry: "Run Chart"
  alternate_names: ["run diagram", "trend chart"]
  typical_use: "monitoring repetitive processes, quality inspection, tracking sequential measurements"
  comparison_to_control_chart: "Run charts use specification limits and individual points; control charts use statistical limits and often plot averages"
---

## Description

A run chart is a point or line graph used to record sequential data from a repetitive process or task. It provides a simple graphical tool for observing, analyzing, monitoring, and controlling processes, with particular attention to establishing baselines, noting trends or sudden changes, and studying erratic or cyclical performance.

**Horizontal axis**: Always sequential (time, lot number, sample number, or simply unlabeled successive order)

**Vertical axis**: Almost always quantitative and linear

**Reference lines**: Often included for the average/median (of plotted points or previously established for the process), specification midpoints, maximums and minimums, targets or goals, or customer preferences.

## Examples

> "Examples include the diameter of a machined part that is mass produced, the quantity of milk dispensed into milk cartons at a dairy, how long patients have to wait to see a doctor in a busy hospital, etc." (p. 332)

Harris illustrates typical patterns to look for in run charts (p. 333):
- **Trend**: Gradual upward or downward movement over time
- **Out of specification**: Points exceeding limit lines
- **Erratic**: Random-appearing large variations
- **Stable**: Consistent performance around centerline
- **Cyclical**: Regular periodic fluctuations

## Usage

Run charts are used to:
- Establish baseline performance levels
- Detect trends before they cause problems
- Identify sudden changes requiring investigation
- Study cyclical or seasonal patterns
- Weed out unacceptable performance (inspection function)

**Differences from control charts**:
- Run charts frequently plot individual data points; control charts often plot averages
- Run charts are often used for inspection; control charts for process monitoring
- Run charts use specification limits (manufacturer, customer, government); control charts use statistically-derived limits based on past performance
- Control charts are sometimes based on the results of run charts

## Notes

The sequential nature of run charts makes them essential for process monitoring where the order of observations matters. Patterns visible in time-ordered data (trends, cycles, sudden shifts) would be invisible if the same data were presented in a non-sequential format.
