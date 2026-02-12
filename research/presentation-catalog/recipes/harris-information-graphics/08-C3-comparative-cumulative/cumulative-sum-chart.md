---
name: Cumulative Sum Chart
slug: cumulative-sum-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Control Charts, Cumulative sum chart, p. 108"

intent: Detect small changes in a process with high sensitivity by plotting the accumulation of differences between individual values and a reference value
direction: both

components:
  - element: sequential-scale
    encodes: Time or sequence of observations (horizontal axis)
    required: true
  - element: cumulative-deviation-scale
    encodes: Sum of deviations from reference value (vertical axis)
    required: true
  - element: data-line
    encodes: Cumulative sum of deviations plotted over time
    required: true
  - element: reference-value
    encodes: Expected or target value from which deviations are calculated
    required: true
  - element: v-mask-template
    encodes: V-shaped template for determining control limits based on line angle
    required: false

parameters:
  reference_source: historical-average | target-value | specification

related: []

warnings:
  - "Establishing control limits is more difficult than with standard control charts"
  - "Both the angle of the line and actual values must be considered for control determination"
  - "V-shaped templates are sometimes used to assess control status"

extensions:
  harris_entry: "Control Charts"
  alternate_names:
    - cusum chart
    - cusum graph
  typical_use: "Detecting small, gradual process shifts that standard control charts might miss"
  sensitivity: "Higher than standard control charts for detecting gradual drift"
---

## Description

A cumulative sum (cusum) chart is a variation of a control chart used when a high degree of sensitivity to small changes in a process is desired. Unlike most control charts that plot actual values or averages, a cusum chart plots the accumulation of the differences or deviations of individual values from a reference value.

The cumulative nature of this chart makes it particularly sensitive to gradual drift in a process, detecting changes that might not be apparent on a standard control chart plotting actual values.

## Examples

Harris explains the cumulative sum calculation on page 108:

> If the historical average of a process is 10 and the first sample measured 10.5, 0.5 would be plotted on the graph. If the second sample tested 10.2, the difference from specification of 0.2 would be added to the 0.5 for the first sample and 0.7 would be plotted. If the third sample measured 10.7, the deviation of 0.7 from the center line value would be added to the previous total of 0.7, and 1.4 would be plotted.

> Comparison of a standard control chart plotting actual values and a cumulative sum graph plotting the sum of the differences between the actual values and the reference (3 in this example). The same data is plotted on both graphs.

The cusum chart shows a clear upward drift indicating the process is moving away from the reference value, which is less obvious in the standard control chart showing actual values.

## Usage

The cumulative sum chart is most effective when:
- High sensitivity to small, gradual process changes is required
- Standard control charts are not detecting subtle drift
- Early warning of process shift is critical

**Calculation method:**
1. Establish a reference value (historical average, target, or specification)
2. For each observation, calculate the deviation from reference
3. Add this deviation to the running cumulative sum
4. Plot the cumulative sum

**Interpreting the chart:**
- A horizontal line indicates the process is centered on the reference value
- An upward slope indicates values consistently above reference
- A downward slope indicates values consistently below reference
- The angle of the slope indicates the magnitude of the shift

**Control limits:**
Establishing control limits for cusum charts is more complex than for standard control charts because the angle of the line must be considered in addition to the actual values. V-shaped templates are sometimes used to determine if the process is out of control.

## Notes

Cusum charts are more sensitive for monitoring purposes than graphs of actual values, particularly for detecting gradual drift. However, they require more sophisticated interpretation and control limit determination than standard control charts.
