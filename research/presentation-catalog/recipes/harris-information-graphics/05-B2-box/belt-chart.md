---
name: Belt Chart
slug: belt-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Belt Chart, p. 54"

intent: Display multiple interrelated categorical distributions simultaneously, enabling viewers to observe relationships and patterns across different segmentation dimensions
direction: both

components:
  - element: concentric rings
    encodes: Hierarchical levels of categorical breakdown
    required: true
  - element: angular segments
    encodes: Proportional sizes of categories at each level
    required: true
  - element: labels
    encodes: Category names and percentage values
    required: true
  - element: center point
    encodes: The total or whole being subdivided
    required: true

parameters:
  ring_count: "2-5 (typical)"
  segmentation_hierarchy: "gender > job-type > location (example)"
  label_style: "percentage | count | both"

related: []  # TBD: see also pie-chart, stacked-pie-chart

warnings:
  - "Can become difficult to read with many segments or deeply nested hierarchies"
  - "Relationships between non-adjacent rings may be hard to trace"

extensions:
  harris_entry: "Belt Chart"
  alternate_names:
    - "stacked pie chart variation"
  typical_use: "workforce composition analysis, multi-dimensional demographic breakdowns"
---

## Description

A belt chart is a variation of a stacked pie chart that enables the viewer to look concurrently at the distribution of interrelated data in a number of different ways. By doing this, patterns and relationships sometimes are easier to note than with separate charts.

The chart uses concentric rings, with each ring representing a different dimension of categorization. Angular segments show proportions, and the hierarchical structure allows tracking how subcategories relate to their parent categories.

## Examples

Harris provides an example (p. 54) showing workforce composition that enables multiple observations:

> "Using the example shown below, the following are representative of the types of observations that can be made from a belt chart:
> - 64% of the work force is female and 36% male
> - Of the 64% females, 48% are nonexempt and 16% exempt
> - Of the 36% males, 15% are nonexempt and 21% male
> - 64% of all employees work in the office and 36% in the field
> - 63% of the employees are nonexempt and 37% are exempt
> - Of the 63% nonexempt, 48% are female and 15% are male
> - Of the 37% exempt, 16% are female and 21% male
> - Of the 63% nonexempt, 51% work in the office and 12% in the field
> - Of the 37% exempt, 13% work in the office and 24% in the field"

The example shows "Total Company Work force 100%" at the center, with rings expanding outward showing gender breakdown, exempt/nonexempt status, and office/field location.

## Usage

Belt charts are most effective when:
- Multiple categorical dimensions need to be shown together
- The relationships between dimensions are meaningful
- Readers need to trace proportions through hierarchical levels
- The total number of final segments remains manageable

**Reading the chart**: Start from the center (the whole) and move outward through successive levels of categorization. Each segment's width at any ring level shows its proportion of the parent segment.

**Design considerations**: Limit the number of rings and segments to maintain readability. Label clearly, as the angular text orientation can be challenging. Consider whether a tree diagram or Sankey diagram might serve the same purpose more clearly.

## Notes

The belt chart allows the same data to be read in multiple ways depending on which dimension the viewer chooses to follow first. This flexibility is its main advantage over separate charts, but also requires the viewer to understand the hierarchical structure.
