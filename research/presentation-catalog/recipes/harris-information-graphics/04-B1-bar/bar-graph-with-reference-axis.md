---
name: Bar Graph with Reference Axis
slug: bar-graph-with-reference-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Location of axis from which values are referenced, p. 49"

intent: Display actual values, reference values, and deviations simultaneously by shifting the bar origin from zero to a meaningful reference point
direction: both

components:
  - element: reference-axis
    encodes: Non-zero baseline representing a target, goal, or reference value
    required: true
  - element: deviation-bars
    encodes: Bars extending from reference to actual value (positive or negative direction)
    required: true
  - element: actual-value-endpoints
    encodes: Bar ends positioned at actual values on the scale
    required: true
  - element: zero-baseline
    encodes: Original zero point (may still be visible for context)
    required: false
  - element: quantitative-scale
    encodes: Full value axis from zero through actual values
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true

parameters:
  reference_type: common | unique-per-category
  reference_line_style: straight-vertical | stepped

related:
  - slug: deviation-bar-graph
    relationship: variant-of
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: bar-and-symbol-graph
    relationship: contrasts

warnings:
  - "Viewers may misread if the shifted reference axis is not clearly labeled"
  - "Stepped reference lines for unique-per-category references add visual complexity"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "goal-referenced bar graph"
    - "baseline-shifted bar graph"
  typical_use: "performance analysis showing actual values relative to targets where the target itself varies or is a key reference point"
  information_communicated:
    - "actual values (bar endpoints)"
    - "reference values (baseline position)"
    - "difference between actual and reference (bar length and direction)"
---

## Description

By shifting the axis from which bars are drawn away from zero to a meaningful reference value, a bar graph can communicate three pieces of information simultaneously:

1. **Actual values** — where bar ends are positioned on the scale
2. **Reference values** — where the baseline is positioned
3. **Difference between actual and reference** — bar length and direction

This technique maintains the standard bar graph's ability to show actual values while adding deviation information relative to a goal, target, or benchmark.

## Examples

Harris illustrates three scenarios (p. 49):

**Standard bar graph (for comparison):**
- Salespersons Cramer, Brown, Philips, Story, Whaley on vertical axis
- Sales in $ millions (0-6) on horizontal axis
- Bars extend from zero to actual values
- A vertical "Goal" line marks the $2 million target
- Reader must mentally compare bar ends to goal line

**Common reference value for all categories:**
- Same salespersons and scale
- Reference axis shifted to $2 million (the common goal)
- Bars for salespersons who exceeded goal extend RIGHT (actual > reference)
- Bars for salespersons below goal extend LEFT (actual < reference)
- Bar end positions still show actual values
- Bar lengths show over/under performance magnitude

**Unique reference value for each category:**
- Same salespersons, but each has a different goal
- Reference line becomes STEPPED (different horizontal position per category)
- Each bar extends from that person's goal to their actual value
- Bars extend right if exceeded personal goal, left if below
- More complex visually but shows individual targets

## Usage

**When to use:**
- Comparing performance against targets where the deviation is the primary message
- When both absolute values and relative performance matter
- Budget variance analysis
- Sales performance vs. quotas

**Common vs. unique references:**

*Common reference:*
- All categories share the same target
- Single vertical reference line
- Simpler visual
- Example: All salespersons have the same $2M quota

*Unique references:*
- Each category has its own target
- Stepped reference line
- More complex but shows personalized targets
- Example: Each salesperson has their own quota based on territory

**Reading the graph:**
- Right-extending bars = exceeded reference (favorable if goal is minimum)
- Left-extending bars = below reference (unfavorable if goal is minimum)
- Bar end = actual value (read from scale)
- Reference line position = target value (read from scale)
- Bar length = magnitude of over/under performance

## Notes

This technique differs from a standard deviation bar graph in that actual values remain readable from the scale. In a pure deviation graph, only the differences are plotted, and actual values must be inferred. The reference axis approach preserves both absolute and relative information in a single encoding.
