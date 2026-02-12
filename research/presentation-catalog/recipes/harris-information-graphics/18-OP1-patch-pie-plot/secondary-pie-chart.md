---
name: Secondary Pie Chart
slug: secondary-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Methods for improving the legibility of small segments, p. 284"

intent: Improve legibility of small pie chart segments by displaying them in a supplemental chart that provides expanded detail
direction: both

components:
  - element: primary-pie
    encodes: Main breakdown with small segments combined into "other"
    required: true
  - element: combined-segment
    encodes: Aggregation of small segments in primary pie
    required: true
  - element: secondary-chart
    encodes: Expanded view of the small segments
    required: true
  - element: visual-connection
    encodes: Link showing relationship between combined segment and secondary chart
    required: true

parameters:
  secondary_chart_type: "pie | column-graph"
  connection_style: "lines | proximity | color"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "Adds complexity with second chart"
  - "Must clearly show relationship between primary and secondary"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["pie of pie", "bar of pie"]
  typical_use: "showing detail for small segments that would be illegible in main pie"
---

## Description

When several segments of a pie chart are so small that it is difficult to estimate their relative sizes, they are sometimes displayed in a supplemental chart or graph that may be a column graph or another pie chart. This technique extracts the small segments into a secondary visualization where they can be shown at a larger, more legible scale.

The primary pie chart shows the major segments clearly, with the small segments combined into a single "other" or "total" segment. The secondary chart then breaks down this combined segment into its individual components.

## Examples

Harris illustrates both variations (p. 284):
> "Methods for making small segments of pie charts more legible"

**Secondary pie chart:**
The primary pie shows segments A(13%), B(17%), C(22%), D(21%), E(20%) plus a combined small segment (Total 7%). The secondary pie expands this 7% to show: F(1.9%), G(1.3%), H(2.4%), I(0.8%), J(0.6%).

**Secondary column graph:**
The same primary pie is shown, but the small segments are expanded into a column graph showing F, G, H, I, J on a scale from 0% to 7%.

> "Small segments combined into a secondary pie chart"

> "Small segments combined into a secondary column graph"

## Usage

**When to use:**
- Multiple segments are too small to label clearly
- The small segments are still meaningful and shouldn't be hidden in "other"
- Precision matters for the small values

**Choosing secondary chart type:**

*Secondary pie:*
- Maintains visual consistency with primary
- Shows proportions within the small segment group
- Better when comparing small segments to each other

*Secondary column graph:*
- Easier to compare precise values
- Better when exact percentages matter
- Clearer if small segments span a wide range

**Design requirements:**
- Clear visual connection between combined segment and secondary chart
- Consistent labeling conventions
- Explanation of what the secondary chart represents

## Notes

The secondary chart technique acknowledges a fundamental limitation of pie charts: segments below a certain size become illegible. Rather than excluding this data or leaving it undifferentiated in "other," the technique preserves both the overall picture and the detail.

This is sometimes called "pie of pie" or "bar of pie" in charting software, reflecting the two common secondary chart formats. The key design challenge is making the relationship between primary and secondary clear without cluttering the visualization.
