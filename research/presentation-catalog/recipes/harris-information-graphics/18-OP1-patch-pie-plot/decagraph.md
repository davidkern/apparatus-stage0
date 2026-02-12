---
name: Decagraph
slug: decagraph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Decagraph, p. 286"

intent: Enable easier estimation of segment sizes by replacing the circle with a ten-sided polygon where each chord represents 10%
direction: both

components:
  - element: decagon
    encodes: The whole divided by 10% increments
    required: true
  - element: ten-chords
    encodes: Equal-length sides marking 10% intervals
    required: true
  - element: chord-vertices
    encodes: Points automatically designating every 10% of the total
    required: true
  - element: segments
    encodes: Parts as wedge shapes within the polygon
    required: true

parameters:
  none: "fixed format"

related:
  - slug: pie-chart
    relationship: variant-of
  - slug: circle-graph
    relationship: variant-of

warnings:
  - "Seldom-used variation"
  - "Unusual shape may confuse viewers expecting standard pie chart"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: []
  typical_use: "enabling rapid visual estimation in 10% increments"
---

## Description

A decagraph is a seldom-used variation of a pie chart in which the circle around the pie is replaced by a ten-sided polygon (decagon). With the circumference made up of ten chords of equal lengths, the points where the chords meet automatically designate every 10% of the complete circle.

The objective of the decagraph is to enable the viewer to more easily and rapidly estimate the sizes of individual segments with the assistance of the chords that indicate 10% increments. The straight edges provide visual reference points that circles lack.

## Examples

Harris illustrates the decagraph format (p. 286):
> "A seldom-used variation of a pie chart in which the circle around the pie is replaced by a ten-sided polygon."

The example shows segments A, B, C, and D within a decagonal frame, with annotation:
> "Each chord indicates 10% of the entire circle"

The ten vertices of the polygon correspond to 0%, 10%, 20%, 30%, 40%, 50%, 60%, 70%, 80%, and 90% positions around what would be the circumference.

## Usage

**When to use:**
- When 10% increment estimation is sufficient precision
- In contexts where rapid visual scanning is prioritized
- For informal or internal displays where unusual format is acceptable

**Limitations:**
- Unfamiliar format may require explanation
- Viewers may be distracted by the unusual shape
- Still provides only approximate readings

**Why it remains seldom-used:**
- The benefit over numeric labels is marginal
- The unusual shape draws attention away from data
- Standard pie charts with labels are more universally understood

## Notes

The decagraph is an interesting attempt to solve the fundamental problem of pie charts: people are poor at estimating angles and arc lengths. By providing ten equally-spaced reference points, the decagraph theoretically makes estimation easier.

However, Harris notes this is a "seldom-used variation," suggesting the practical benefits don't outweigh the cost of using an unfamiliar format. The trade-off between estimation assistance and format familiarity typically favors standard pie charts with explicit percentage labels.
