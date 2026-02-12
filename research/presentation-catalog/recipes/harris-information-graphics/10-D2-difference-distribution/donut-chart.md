---
name: Donut Chart
slug: donut-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Donut Chart, p. 142"

intent: Display part-to-whole relationships while also communicating the overall total by using the center space for aggregate information
direction: both

components:
  - element: ring-segments
    encodes: Proportional wedges as in pie chart
  - element: center-space
    encodes: Overall value or total (blanked area for labeling)
  - element: segment-labels
    encodes: Component names and values/percentages
    required: false

parameters:
  center_content: total-value | label | empty

related: []

warnings:
  - "The size, shape, and color of the blanked center area typically have no significance"
  - "Center values should be actual totals, not percentages that always sum to 100 percent"

extensions:
  harris_entry: "Donut Chart"
  alternate_names: []
  typical_use: "budget breakdowns with total, market share with market size, any part-to-whole with important total"
---

## Description

A donut chart is a pie chart with an area blanked out in the center, allowing display of supplementary information such as the overall total. This design addresses a common criticism of pie charts: they show relative component sizes but obscure absolute magnitude, especially when comparing multiple pies.

The center space creates an opportunity to display the aggregate value prominently, making it easier for viewers to understand both proportions and scale.

## Examples

Harris shows a comparison example (p. 142):

> "A donut chart is a pie chart with an area blanked out in the center so information such as the overall value of all the pieces of the pie can be shown."

The illustration displays two donut charts side by side:
- 1995: Center shows "$10 million" with segments A, B, C, D at varying percentages
- 1996: Center shows "$20 million" with segments showing changed proportions

Harris explains the advantage:

> "One of the criticisms sometimes expressed about pie charts is that they focus on the relative sizes of the components to one another and to the whole, but give no indication of changes in the whole when two or more pie charts are shown. The donut chart partially addresses this issue by somewhat more forcefully bringing changes in overall values to the viewer attention."

## Usage

Donut charts are most valuable when:
- Comparing multiple part-to-whole breakdowns
- The total magnitude matters as much as proportions
- The center space can meaningfully display aggregate information
- Space efficiency matters (center doubles as label area)

Standard guidance:

> "The size, shape, nor color of the blanked area typically have any significance."

The technique maintains pie chart limitations (difficulty comparing non-adjacent segments, distortion with many segments) while adding the ability to show totals.

## Notes

When showing multiple donut charts, the center values immediately reveal whether the whole is growing, shrinking, or stable. This context is crucial for interpretation: a segment shrinking from 40 percent to 20 percent means something very different if the total doubled versus stayed constant.
