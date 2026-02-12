---
name: Circle Graph
slug: circle-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Circle graph, p. 286"

intent: Enable direct reading of segment percentages by adding a scale to the circumference of a pie chart
direction: both

components:
  - element: circle
    encodes: The whole (100%)
    required: true
  - element: segments
    encodes: Parts as proportional wedges
    required: true
  - element: circumference-scale
    encodes: Percentage values (0-100%) around the circle edge
    required: true
  - element: tick-marks
    encodes: Scale divisions for reading values
    required: true

parameters:
  scale_interval: "1% | 5% | 10%"
  label_frequency: "every-tick | major-ticks-only"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "In practice, it is still easier and more accurate for the viewer to have actual percents noted on segments"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: []
  typical_use: "enabling direct percentage reading from visual position"
---

## Description

A circle graph is a pie chart with a percentage scale added to the circumference. The scale runs from 0% to 100% around the edge of the circle, with tick marks indicating intervals. This allows viewers to read the percentage that each segment represents directly from the scale rather than relying solely on labels.

The term "circle graph" specifically refers to this scaled variation, distinguishing it from standard pie charts without circumference scales.

## Examples

Harris illustrates the circle graph format (p. 286):
> "When a scale is added to the circumference of a pie chart, as shown at the right, the resulting chart is many times referred to as a circle graph."

The example shows a pie chart with percentages marked around the circumference from 0%/100% at the top, through 10%, 20%, 30%, etc., around the full circle. Segments are labeled:
- Red 20 (10%)
- Black 50 (25%)
- Blue 60 (30%)
- Gray 70 (35%)

Harris notes:
> "With the presence of a scale and tick marks, technically the percentages that each segment represents can be read directly from the scale and therefore, the numeric values do not have to be shown on the segments. In practice, it is still easier and more accurate for the viewer to have the actual percents noted in addition to having the scale and tick marks."

## Usage

**When to use:**
- When enabling independent verification of percentages is valuable
- In educational contexts teaching chart reading
- When visual estimation should be more precise

**Design considerations:**
- Include both the scale AND numeric labels on segments
- Choose tick intervals appropriate to data precision
- Ensure tick marks are subtle enough not to dominate

**Practical limitation:**
- Despite the scale, direct labeling remains easier for viewers
- The scale adds visual complexity without eliminating need for labels
- Most effective when combined with segment labels, not replacing them

## Notes

The circle graph represents an attempt to address the inherent difficulty in estimating pie chart segment sizes. However, Harris's practical observation is telling: even with a scale present, numeric labels on segments remain the easier and more accurate method for viewers to extract values. The scale may be most useful as a secondary verification tool rather than the primary data reading mechanism.
