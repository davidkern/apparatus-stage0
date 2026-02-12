---
name: X-Bar/R Chart
slug: x-bar-r-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "X-Bar/R Chart, p. 442"

intent: Monitor process quality by displaying sample averages (X-Bar) and ranges (R) on paired control charts
direction: both

components:
  - element: x-bar-chart
    encodes: Sample averages of consecutive lots (upper portion)
    required: true
  - element: r-chart
    encodes: Range of values for the same data (lower portion)
    required: true
  - element: horizontal-axis
    encodes: Subgroup or sample numbers (shared by both charts)
    required: true
  - element: vertical-axes
    encodes: Average values (X-Bar) and range values (R), two different scales
    required: true
  - element: control-limits
    encodes: Upper and lower specification limits
    required: false

parameters:
  display_mode: separate | merged
  control_limits: present | absent

related: []  # TBD: control-chart, shewhart-chart

warnings:
  - "Both charts should be analyzed together for complete process assessment"

extensions:
  harris_entry: "X-Bar/R Chart"
  alternate_names: ["X-bar and R chart", "average and range chart"]
  typical_use: "quality control, statistical process control, manufacturing monitoring"
---

## Description

X-bar (sample average) and R (range) type charts are used extensively in the field of quality control. When used together they are often referred to as an X-Bar/R chart. The combination allows simultaneous monitoring of both the central tendency (average) and the variability (range) of a process.

The two charts can be shown separately or merged to appear as a single chart with a common horizontal scale and two different quantitative scales on the vertical axis.

## Examples

> "X-bar (sample average) and R (range) type charts are used extensively in the field of quality control. When used together they are often referred to as an X-Bar/R chart. The two charts are sometimes shown separately, with the R chart below the X-Bar chart. In other cases the two are merged to appear as a single chart with a common horizontal scale and two different quantitative scales on the vertical axis." (p. 442)

Harris illustrates a merged X-Bar/R chart showing:
- Upper portion: Sample averages (ranging approximately 6.44-6.56)
- Lower portion: Range values (ranging approximately 0.00-0.16)
- Dotted horizontal lines indicating control limits
- Subgroup numbers 1-23 along the horizontal axis

### Process Observations
> "Based on the combination of these two charts, observations can be made about the process being monitored." (p. 442)

## Usage

X-Bar/R charts are appropriate for:
- Statistical process control in manufacturing
- Quality assurance monitoring
- Detecting process shifts or trends
- Identifying out-of-control conditions

### Reading the Charts Together

**X-Bar chart analysis**:
- Shows whether the process average is stable
- Points outside control limits indicate shifts in central tendency
- Trends suggest systematic drift

**R chart analysis**:
- Shows whether process variability is stable
- Points outside control limits indicate changes in dispersion
- Increasing range suggests loss of process control

**Combined interpretation**:
- A process is considered in control when both charts show stability
- Out-of-control signals on either chart warrant investigation
- The R chart is typically analyzed first since variability affects average interpretation

## Notes

The X-Bar/R chart is a fundamental tool in Statistical Process Control (SPC) developed from Walter Shewhart's work. See Control Charts for additional context on control chart methodology.
