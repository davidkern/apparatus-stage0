---
name: Cumulative Sum Chart
slug: cumulative-sum-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cumulative Sum Chart, pp. 120, 123"

intent: Detect small changes in a process by plotting the cumulative sum of deviations from a reference value rather than actual values
direction: both

components:
  - element: cumulative-deviation-line
    encodes: Running sum of differences between actual values and reference
    required: true
  - element: reference-value
    encodes: Target or historical average against which deviations are measured
    required: true
  - element: zero-axis
    encodes: Line representing no cumulative deviation from reference
    required: true
  - element: control-limits
    encodes: V-shaped templates or boundaries for detecting significant change
    required: false

parameters:
  reference_type: historical-average | target-value | specification

related: []  # TBD: see also control-chart

warnings:
  - "Establishing control limits is more difficult than with standard control charts since the angle of the line must be taken into consideration"
  - "V-shaped templates are sometimes needed to properly interpret whether a process has changed"
  - "The cumulative nature means early deviations affect all subsequent points"

extensions:
  harris_entry: "Cumulative Sum Chart"
  alternate_names: ["cusum chart"]
  typical_use: "quality control, process monitoring, detecting gradual drift in manufacturing"
---

## Description

A cumulative sum chart (cusum chart) is a variation of a control chart used when a high degree of sensitivity to small changes in a process is desired. Unlike most control charts that plot actual values or averages of actual values, a cusum chart plots the accumulation of the differences or deviations of actual values from a reference value.

The technique offers three major advantages over standard control charts:
- Small changes can be detected more easily
- Changes that occur over long periods of time are easier to spot
- It is easier to determine when a change in the process began

## Examples

**Calculation Method** (p. 120)
> "For example, if the historical average of a process is 10 and the first sample measured 10.5, 0.5 is plotted on the graph. If the second sample tested 10.2, the difference from specification of 0.2 is added to the 0.5 for the first sample, and 0.7 is plotted. If the third sample measured 10.7, the deviation of 0.7 from the center line value is added to the previous total of 0.7 and 1.4 is plotted, and so on."

**Detecting Drift** (p. 120)
> "The upward slope indicates the process is drifting. This trend is not readily apparent in the graph of actual values."

Harris shows side-by-side comparison of a standard control chart and cusum chart with identical data. The standard chart shows values fluctuating around the reference with no obvious pattern. The cusum chart reveals a clear upward trend indicating process drift.

**Increased Sensitivity** (p. 123)
The comparison demonstrates that small systematic shifts that are invisible in plots of actual values become obvious slopes in the cumulative deviation plot.

## Usage

**When to use cusum charts:**
- Monitoring processes where small shifts matter
- Detecting gradual drift that would be masked by normal variation
- Determining the precise point when a process began to change
- Quality control applications requiring high sensitivity

**Construction steps:**
1. Establish a reference value (historical average, target, or specification)
2. For each new measurement, calculate deviation from reference
3. Add this deviation to the cumulative sum of all previous deviations
4. Plot the cumulative sum
5. Interpret slope: upward indicates values consistently above reference; downward indicates values below reference; horizontal indicates process centered on reference

**Control limits:**
> "Establishing control limits for cumulative sum charts is more difficult than with the other types of control chart since the angle of the line must be taken into consideration as well as the actual values. V-shaped templates are sometimes used for this purpose."

## Notes

The cusum chart transforms the question from "Is this individual value unusual?" to "Is there a persistent pattern of deviation?" A horizontal line on a cusum chart means the process is centered on the reference. Any sustained slope indicates systematic deviation that may warrant investigation, even if individual values remain within normal ranges.
