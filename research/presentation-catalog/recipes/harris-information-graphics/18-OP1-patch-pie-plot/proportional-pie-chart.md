---
name: Proportional Pie Chart
slug: proportional-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Size of circles proportional to overall value, p. 283"

intent: Compare multiple wholes by making pie chart circle sizes proportional to their total values
direction: both

components:
  - element: variable-size-circles
    encodes: Total values through circle diameter or area
    required: true
  - element: segments
    encodes: Parts of each whole as proportional wedges
    required: true
  - element: total-labels
    encodes: Numeric values of each whole
    required: true

parameters:
  size_basis: "diameter | area"
  arrangement: "side-by-side | overlapping"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "Viewer must know whether sizes are based on diameter or area to interpret correctly"
  - "Diameter-proportional circles exaggerate differences (area grows with square of diameter)"
  - "Area comparisons are frequently recommended over diameter comparisons"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["variable-size pie chart"]
  typical_use: "comparing both overall totals and component breakdowns across groups or time"
  size_methods:
    - "diameters proportional to overall values"
    - "areas proportional to overall values (recommended)"
---

## Description

Proportional pie charts address a limitation of standard pie chart comparisons: they show how component proportions differ but not how overall totals differ. By making the size of each circle proportional to its total value, viewers can get both comparisons simultaneously.

Two methods exist for sizing the circles:
1. **Diameter proportional**: Circle diameters match the ratio of total values
2. **Area proportional**: Circle areas match the ratio of total values (recommended)

The choice significantly affects perception. If Total A is twice Total B:
- Diameter-proportional: Circle A has 2x the diameter, but 4x the area
- Area-proportional: Circle A has 2x the area, with ~1.4x the diameter

## Examples

Harris illustrates with sales comparison (p. 283):
> "In the two pairs of pie charts at left, in addition to showing the numerical value of the overall sales, the sizes of the circles are drawn proportional to the total sales. In this way the viewer can get a graphical comparison of overall sales, as well as a graphical comparison of individual department sales."

The example shows:
- 1995: Total sales $10 million
- 1996: Total sales $20 million

Two versions are shown:
> "The upper pair of circles are drawn with the diameters of the circles proportional to overall sales. The lower pair are drawn with the areas of the circles proportional to overall sales. Comparisons based on area are frequently recommended."

Harris notes:
> "Even though the graphical representation gives only a crude indication of the difference, it does alert the viewer to the fact that there is a difference in the overall totals, the direction of the difference, and whether the difference is major or minor."

## Usage

**When to use:**
- Comparing groups where both totals and breakdowns matter
- Showing growth or decline alongside compositional changes
- When the difference in totals is an important part of the story

**Design choices:**
- Area-proportional sizing is generally recommended
- Always include numeric totals as graphical comparison is crude
- Ensure smallest circle remains legible

**Limitations:**
- Only provides crude indication of size differences
- Viewers may not know whether diameter or area was used
- Small circles may have illegible segment labels

## Notes

The proportional approach adds valuable context that standard pie charts omit. A component might grow from 20% to 40% of its whole, but if the whole simultaneously doubled, the absolute size of that component actually quadrupled. Proportional sizing makes such relationships visible.

However, the graphical size comparison is inherently imprecise. Harris emphasizes that the technique "alerts the viewer" to differences rather than enabling accurate measurement. Numeric labels remain essential.
