---
name: Confidence Interval Display
slug: confidence-interval-display
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Confidence Band, p. 101"

intent: Graphically indicate the range of values within which a given value probably exists, showing margin of error or uncertainty
direction: both

components:
  - element: sample-value-marker
    encodes: The observed or estimated value (point, bar, or line)
    required: true
  - element: error-bar
    encodes: The range of the confidence interval extending from the sample value
    required: true
  - element: upper-confidence-limit
    encodes: The maximum value of the confidence interval
    required: true
  - element: lower-confidence-limit
    encodes: The minimum value of the confidence interval
    required: true
  - element: confidence-level-label
    encodes: The probability level (e.g., 90%, 95%) associated with the interval
    required: false

parameters:
  display_method: error-bar | rectangle | area-band | vertical-lines
  confidence_level: 50 | 68 | 90 | 95 | 99
  graph_type: point | column | box | scatter | line
  tier_count: single | two-tiered

related: []

warnings:
  - "If confidence intervals of two data sets overlap, their averages may not be significantly different"
  - "Upper and lower limits may or may not be equidistant from the reference data point"
  - "Should include information about confidence level and reasons for potential spread"

extensions:
  harris_entry: "Confidence Band"
  alternate_names:
    - confidence band
    - confidence interval
    - possible margin of error
  typical_use: "Comparing statistical estimates, showing uncertainty in measurements"
  common_confidence_levels:
    - 50
    - 68
    - 90
    - 95
    - 99
---

## Description

A confidence interval graphically indicates the range of values within which a given value probably exists. This technique is essential when presenting statistical estimates derived from samples, as it communicates the uncertainty inherent in the estimation process.

For example, if a survey of 10% of members indicates 15.2% will participate in an activity, the confidence interval shows the range (such as 11.8% to 18.6% at 90% confidence) within which the true participation rate probably lies.

## Examples

Harris demonstrates multiple methods for displaying confidence intervals (p. 101):

> Error bar used to designate sample value, confidence interval, and upper and lower confidence limits. The error bar extends vertically from the sample value to show the confidence interval (e.g., plus/minus 3.4%) for a given confidence level (e.g., 90%).

> Box graph with confidence interval outside the 25th and 75th percentiles, showing averages with intervals.

> Column graph with confidence interval designated by vertical rectangles extending above and below the sample values.

> Scatter graph with fitted curve and confidence interval designating the area in which the true fitted curve probably lies with a given degree of confidence.

> Point graph with confidence interval designated by vertical lines, where upper and lower limits may or may not be connected by lines and the resulting area filled.

> Two-tiered confidence interval showing two confidence levels (e.g., 50% and 95%) for the same set of data.

## Usage

Confidence intervals can be displayed for:
- Single data sets (showing uncertainty for one measurement)
- Multiple data sets (enabling comparison of estimates)

When comparing multiple data sets, confidence intervals help determine whether the averages of two sets are significantly different. If the confidence intervals overlap, the averages may not be significantly different.

When displaying confidence intervals, consider including:
- The level of confidence associated with the interval (e.g., 50%, 90%, 95%)
- The reasons for the potential spread in values (sample size, sample-to-sample variations, biases, data processing methods)

Display methods include:
- Error bars (most common)
- Rectangles around columns
- Curved boundary lines on scatter plots
- Vertical lines with optional fill
- Two-tiered intervals showing multiple confidence levels

## Notes

Confidence intervals can be shown in units or percent. The upper and lower limits may or may not be equidistant from the reference data point, depending on the distribution of the underlying data.
