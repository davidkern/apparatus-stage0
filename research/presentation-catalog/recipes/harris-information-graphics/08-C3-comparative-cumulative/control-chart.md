---
name: Control Chart
slug: control-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Control Charts, pp. 104-108"

intent: Monitor a quantifiable characteristic of a repetitive process by plotting values over time with reference lines indicating control limits
direction: both

components:
  - element: sequential-scale
    encodes: Time or sequence of observations (horizontal axis)
    required: true
  - element: quantitative-scale
    encodes: Measured values, averages, ranges, or deviations (vertical axis)
    required: true
  - element: data-points-or-line
    encodes: Actual measured values or calculated statistics
    required: true
  - element: center-line
    encodes: Average or expected value (CL)
    required: true
  - element: upper-control-limit
    encodes: Upper boundary for acceptable variation (UCL), typically average plus 3 standard deviations
    required: true
  - element: lower-control-limit
    encodes: Lower boundary for acceptable variation (LCL), typically average minus 3 standard deviations
    required: true
  - element: warning-limits
    encodes: Optional secondary limits at 2 standard deviations (UWL, LWL)
    required: false

parameters:
  data_type: variable | attribute
  chart_type: X-M | MR | X-Bar | R | S-Sigma | NP-np | P-p | C-c | U-u
  grouping: individual | subgroup
  measure: value | range | standard-deviation | fraction | count

related: []

warnings:
  - "Staying within control limits only means the process performs as when limits were established"
  - "Control limits are typically more restrictive than specification limits"
  - "A process can be in control yet produce out-of-specification results"
  - "Different lot sizes require different control limit calculations"

extensions:
  harris_entry: "Control Charts"
  alternate_names:
    - Shewhart charts
  typical_use: "Quality control, process monitoring, detecting process drift"
  chart_families:
    variable_data:
      - X-M (individual values)
      - MR (moving range)
      - X-Bar (subgroup averages)
      - R (range)
      - S/Sigma (standard deviation)
    attribute_data:
      - NP/np (number exceeding spec)
      - P/p (fraction or percent exceeding spec)
      - C/c (count of defects)
      - U/u (defects per unit)
---

## Description

Control charts operate on the principle of monitoring some quantifiable characteristic of a repetitive process or operation. Actual values, average values, or spreads (ranges) are recorded and plotted on either a point or line graph. All control charts have a sequential scale on the horizontal axis, a quantitative scale on the vertical axis, and one or more horizontal lines indicating control limits.

When values and ranges stay within the prescribed limits and the data does not indicate the process is drifting out of limits, the process is generally said to be "in control." Originally used almost exclusively in manufacturing, control charts are now applied in medical, financial, cost reduction, and many other fields.

## Examples

Harris presents nine major types of control charts (pp. 104-105):

**For variable data (measured numerically):**

> X, M chart: The measured value of each individual unit is plotted. Used when subgroups are not practical or possible.

> MR (Moving Range) chart: The difference between each value and the preceding value(s) is plotted.

> X-Bar chart: The average of each subgroup is plotted. Frequently used with R or S type charts.

> R (Range) chart: Range values obtained by subtracting smallest from largest value in subgroup. Generally used with smaller subgroup sizes.

> S, Sigma chart: Standard deviations calculated and plotted for each subgroup. Generally used with larger sample sizes (more than 10). Considered slightly more accurate than R type chart.

**For attribute data (counted but not measured):**

> NP, np chart: Plots number of units in each subgroup exceeding specification. Used when subgroup sizes are the same.

> P, p chart: Plots fraction or percent of nonconforming units. Can be used with equal or unequal subgroup sizes.

> C, c chart: Total number of defects in the subgroup is plotted. Used when subgroup sizes are the same.

> U, u chart: Number of defects per unit of measure plotted. Can be used with equal or unequal subgroup sizes.

**X-Bar/R Chart construction (pp. 105-106):**

> Frequently pairs of control charts are used in conjunction with one another. One of the most widely used combinations is the X-bar (subgroup averages) and R (range) chart. The example shows five samples measured every half hour, with averages plotted as black dots connected by a segmented line, a center line (CL) representing the average of averages, and UCL/LCL lines at plus/minus three standard deviations.

## Usage

**Relationship of control limits and specifications (p. 107):**
- Control limits are typically more restrictive than specification values
- Control limits function as early warning systems
- Multiple control limits (warning limits at 2 standard deviations) can aid early detection
- Areas between limits are called zones or regions

**Lots with different numbers of samples:**
- Control limits vary with sample size
- Three methods: separate limits per lot, blended single limit, or representative lot size limits

**Construction details (p. 108):**
- Grid lines: vertical common, horizontal less frequent
- Expanded scales frequently used (showing zero is secondary consideration)
- Frames may or may not be used
- Vertical orientation is possible but rare

**For lots with different sample sizes**, three approaches exist:
1. Show separate control limits for each lot size
2. Show a single blended limit based on average lot size
3. Show control limits for representative lot sizes

## Notes

Just because a process stays within control limits does not mean it will produce acceptable results. Control limits indicate the process is continuing to perform as it was when limits were established. If specifications are more restrictive than control limits, out-of-specification parts can be produced while the process is still considered "in control."
