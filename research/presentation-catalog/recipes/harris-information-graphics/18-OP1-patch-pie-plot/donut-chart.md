---
name: Donut Chart
slug: donut-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Size of circles proportional to overall value, p. 283"

intent: Display part-to-whole relationships while emphasizing the total value by placing it in a blanked-out center
direction: both

components:
  - element: outer-ring
    encodes: Segments representing parts of the whole
    required: true
  - element: center-hole
    encodes: Blanked-out area containing total value
    required: true
  - element: total-value
    encodes: Numeric sum displayed in center
    required: true
  - element: segments
    encodes: Individual parts as arc-shaped sections
    required: true

parameters:
  center_content: "total-value | label | both"
  ring_width: "thin | medium | thick"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "The size, shape, and color of the blanked area are insignificant to the data encoding"
  - "Ring segments may be harder to compare than full wedges"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["ring chart"]
  typical_use: "emphasizing total values alongside part-to-whole breakdown"
---

## Description

A donut chart is a variation of a pie chart in which a circle is blanked out of the center of the pie and the overall value is written in the blank space. This technique calls the viewer's attention to differences in overall values while still showing the proportional breakdown of components.

The donut format converts the wedge-shaped segments of a traditional pie chart into arc-shaped segments forming a ring around the center. The size, shape, and color of the blanked center area are insignificant to the data representation.

## Examples

Harris illustrates donut charts comparing two years of data (p. 283):
> "Totals for pie charts are occasionally included in their centers for emphasis. The result is sometimes referred to as a donut chart."

The example shows two donut charts side by side:
- 1995: "$10 million" displayed in center
- 1996: "$20 million" displayed in center

Both show department breakdowns (A: 20%, B: 40%, C: 10%, D: 30%) with the total prominently displayed in each center.

## Usage

**When to use:**
- When the total value is as important as the breakdown
- When comparing multiple wholes that have different totals
- When you want to emphasize that components sum to a specific value

**Design considerations:**
- Center hole size should be large enough for legible text
- Ring width should allow segments to be distinguishable
- Consider whether segment labels fit better inside the ring or outside

**Comparison with standard pie charts:**
- Standard pie charts: Focus purely on proportional relationships
- Donut charts: Add emphasis on the absolute total value

## Notes

The donut chart addresses a common limitation of standard pie charts: they show proportions but not absolute values prominently. By dedicating the center to the total, the donut format makes it immediately clear what the 100% represents in concrete terms.

When using multiple donut charts for comparison, the numeric totals in the centers provide explicit comparison that might otherwise require the viewer to read labels or legends.
