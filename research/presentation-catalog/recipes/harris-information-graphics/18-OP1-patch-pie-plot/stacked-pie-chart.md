---
name: Stacked Pie Chart
slug: stacked-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Methods for showing changes over time, p. 282"

intent: Compare multiple data series or changes over time by superimposing pie charts on top of one another
direction: both

components:
  - element: multiple-pies
    encodes: Different time periods or conditions
    required: true
  - element: aligned-segments
    encodes: Same category maintained in same relative position across pies
    required: true
  - element: concentric-arrangement
    encodes: Pies stacked with larger behind smaller (typically)
    required: true

parameters:
  pie_count: "two | three (rarely more)"
  size_significance: "none | proportional-to-value"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "More than two stacked pie charts generally becomes confusing"
  - "The relative sizes of the various circles generally have no significance"
  - "Overlapping segments can be difficult to read"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["superimposed pie chart", "nested pie chart"]
  typical_use: "comparing same categories across two time periods or conditions"
---

## Description

A stacked pie chart is created by superimposing multiple pie charts on top of one another to show changes over time or compare different conditions. This technique allows viewers to see how the proportional breakdown of categories changes between periods while maintaining visual connection between corresponding segments.

The key principle is that the segment representing a given element must be kept in the same relative position in each of the multiple pies. This alignment enables direct comparison of how each category's share has changed.

## Examples

Harris illustrates the stacked approach (p. 282):
> "Occasionally they are superimposed on top of one another in a stacked pie chart. In both methods the segment representing a given element is kept in the same relative position in each of the multiple pies."

The example shows two conditions (Time 1/Condition 1 and Time 2/Condition 2) with segments A, B, C, and D aligned across both pies. The pies are nested concentrically, allowing viewers to see both distributions simultaneously.

Harris notes:
> "The relative sizes of the various circles in the stacked variation generally have no significance."

## Usage

**When to use:**
- Comparing exactly two time periods or conditions
- When segment alignment makes comparison clearer
- When space is limited and side-by-side display isn't feasible

**Limitations:**
- Maximum of two pies recommended
- More than two stacked pies "generally becomes confusing"
- Works best when outer segments don't completely obscure inner ones
- Circle sizes typically don't encode additional information

**Alternative: Side-by-side arrangement:**
- More than four or five side-by-side pie charts also becomes confusing
- Side-by-side allows circle size to encode total values
- Generally clearer than stacking for more than two periods

## Notes

The stacked pie chart is a space-efficient alternative to side-by-side pie charts but introduces visual complexity. The technique requires careful attention to segment ordering so that corresponding categories align. When the data shows dramatic changes in proportions, the stacking can create visual confusion as segments from different pies intersect at various angles.

For tracking changes across many time periods, line graphs or area charts typically provide clearer trend visualization than multiple pie charts in any arrangement.
