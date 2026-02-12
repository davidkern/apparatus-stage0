---
name: Stacked Pie Chart
slug: stacked-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Pie Chart, p. 358"

intent: Compare multiple data series or track changes over time by superimposing concentric pie charts
direction: both

components:
  - element: concentric-pies
    encodes: Multiple pie charts of different sizes, centered on the same point
    required: true
  - element: aligned-segments
    encodes: Corresponding data elements positioned consistently across all pies
    required: true
  - element: size-variation
    encodes: Total value for each time period or condition (via pie diameter)
    required: false
  - element: segment-differentiation
    encodes: Color or pattern identifying each data element
    required: true
  - element: time-or-condition-labels
    encodes: What each pie represents
    required: true

parameters:
  pie_count: "2 or more pies"
  size_encoding: "same size | proportional to total"
  segment_position: "aligned across all pies"

related: []  # TBD: pie-chart, proportional-pie-chart

warnings:
  - "Outer pies obscure portions of inner pies"
  - "Comparison between pies is difficult due to different radii"
  - "Side-by-side arrangement is typically clearer for comparison"
  - "Segment alignment is critical for tracking changes"

extensions:
  harris_entry: "Stacked Pie Chart"
  typical_use: "comparing proportional breakdowns across multiple conditions or time periods"
  comparison_note: "side-by-side pies typically preferred over stacked arrangement"
---

## Description

A stacked pie chart superimposes multiple pie charts on top of one another, with each pie representing a different time period, condition, or data series. The pies are typically arranged concentrically (sharing a common center), with segments for corresponding data elements kept in the same angular position across all pies.

Harris notes: "When comparing multiple data series or studying changes in the same series over time, a series of pie charts is sometimes used. Typically the series of charts is shown side-by-side. Occasionally they are superimposed on top of one another, as shown at the right, in an arrangement called a stacked pie chart."

## Examples

From the illustration on p. 358, Harris shows a stacked pie chart with four concentric pies labeled A, B, C, and D. The diagram indicates:
- "Time 1 or condition 1" for one layer
- "Time 2 or condition 2" for another layer
- Segments are aligned so corresponding data elements occupy the same angular position in each pie

The nested arrangement allows comparison of how proportions change from one condition or time to another by examining the same angular segment across different rings.

## Usage

Stacked pie charts may be appropriate when:
- Comparing proportional breakdown across 2-4 conditions
- Tracking how segment proportions change over time
- Space constraints prevent side-by-side display
- The visual impact of nested circles serves the communication goal

Generally prefer side-by-side arrangement when:
- Precise comparison of segment sizes is important
- More than 3-4 pies need comparison
- Outer pies would significantly obscure inner pies
- Audience is unfamiliar with nested pie convention

The critical requirement is maintaining consistent segment positioning across all pies so viewers can track the same data element through the layers.

## Notes

Harris's description suggests this is a less common alternative to the more typical side-by-side pie arrangement. The stacked format creates a compact display but introduces comparison difficulties due to the different radii of the concentric circles. Modern visualization practice generally recommends side-by-side small multiples for pie comparisons.
