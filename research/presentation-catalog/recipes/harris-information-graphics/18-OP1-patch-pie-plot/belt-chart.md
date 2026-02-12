---
name: Belt Chart
slug: belt-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Belt Chart, p. 286"

intent: Enable concurrent viewing of interrelated data distributions in multiple different ways to reveal patterns and relationships
direction: recognition

components:
  - element: concentric-rings
    encodes: Different categorical divisions of the same whole
    required: true
  - element: radial-divisions
    encodes: Primary categorization (e.g., gender)
    required: true
  - element: ring-subdivisions
    encodes: Secondary and tertiary categorizations within primary divisions
    required: true
  - element: segment-labels
    encodes: Category names and percentages
    required: true

parameters:
  ring_count: "two | three | four"
  categorization_levels: "list of categorical variables"

related:
  - slug: stacked-pie-chart
    relationship: variant-of
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "Complex to construct and interpret"
  - "Requires clear labeling to understand multiple categorization levels"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: []
  typical_use: "cross-tabulating multiple categorical variables simultaneously"
---

## Description

A belt chart is a variation of a stacked pie chart that enables the viewer to concurrently look at the distribution of interrelated data in a number of different ways. By doing this, patterns and relationships sometimes are easier to note than with separate charts.

The belt chart uses concentric rings where each ring represents a different way of categorizing the same population. The radial alignment between rings shows how categories nest within each other.

## Examples

Harris provides a detailed example analyzing workforce composition (p. 286):

> "Using the example shown below, the following are representative of the types of observations that can be made from a belt chart:
> - 64% of the work force is female and 36% male
> - Of the 64% females, 48% are nonexempt and 16% exempt
> - Of the 36% males, 15% are nonexempt and 21% male [exempt]
> - 64% of all employees work in the office and 36% in the field
> - 63% of the employees are nonexempt and 37% are exempt
> - Of the 63% nonexempt, 48% are female and 15% are male
> - Of the 37% exempt, 16% are female and 21% male
> - Of the 63% nonexempt, 51% work in the office and 12% in the field
> - Of the 37% exempt, 13% work in the office and 24% in the field"

The example shows the total company work force (100%) at the center, with rings showing:
- Gender breakdown (Female 64%, Male 36%)
- Exempt/Nonexempt status within each gender
- Office/Field location within each status

## Usage

**When to use:**
- Cross-tabulating three or more categorical variables
- Showing hierarchical breakdowns (whole > primary category > secondary)
- When relationships between categorizations matter

**Reading strategies:**
- Start from center (the whole) and move outward
- Trace radial sections to see how one category breaks down
- Compare angular widths across rings for the same radial section

**Design requirements:**
- Clear labels at each level
- Logical ordering of categorizations (general to specific outward)
- Consistent radial alignment between related segments

## Notes

The belt chart is conceptually similar to a sunburst diagram or multi-level donut chart. Its strength lies in showing cross-tabulations that would otherwise require multiple separate charts or a complex table.

However, the format requires significant viewer effort to decode. The interrelationships Harris lists would take time to extract from the visual. For analytical purposes, the belt chart serves as an overview or navigation aid, with detailed numbers still needed for precise understanding.
