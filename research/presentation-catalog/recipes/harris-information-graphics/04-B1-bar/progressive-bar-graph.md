---
name: Progressive Bar Graph
slug: progressive-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Progressive bar graph, pp. 47-48"

intent: Show how individual components contribute to a cumulative total by displaying segments displaced vertically in a stepped arrangement
direction: both

components:
  - element: displaced-segments
    encodes: Individual component values; positioned to show cumulative buildup
    required: true
  - element: cumulative-scale
    encodes: Running total axis (horizontal); shows where each segment starts and ends
    required: true
  - element: component-labels
    encodes: Names of components (categories) on vertical axis
    required: true
  - element: segment-values
    encodes: Individual values and/or percentages on each segment
    required: false
  - element: total-bar
    encodes: Final sum of all components (optional reference)
    required: false
  - element: percent-scale
    encodes: Secondary scale showing cumulative percent (optional)
    required: false

parameters:
  displacement_direction: up | down
  displacement_amount: "typically slightly more than bar width"
  value_display: dollars | percents | both
  total_bar: included | excluded
  grouping: none | categorical-groups

related:
  - slug: stacked-bar-graph
    relationship: variant-of
  - slug: waterfall-chart
    relationship: variant-of
  - slug: gantt-chart
    relationship: variant-of

warnings:
  - "Displacement direction and amount must be consistent throughout"
  - "Without careful labeling, the stepped arrangement can confuse viewers"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "stepped bar graph"
    - "step-by-step bar graph"
    - "staggered bar graph"
    - "cascade chart"
  typical_use: "showing component breakdown of expenses, costs, or time allocations with emphasis on individual contributions"
  design_notes:
    displacement: "segments shifted vertically by slightly more than bar width"
    consistency: "same displacement amount and direction used throughout"
---

## Description

A progressive bar graph is equivalent to a stacked bar graph with only one bar, where the individual segments are displaced vertically from their adjacent segments. This creates a stepped or staggered appearance that adds visibility and emphasis to individual segments while maintaining the concept that all segments add up to a whole.

Segments can be displaced up or down by any amount, typically shifted slightly more than the bar width. Whatever displacement amount and direction are selected, they are used consistently throughout the graph.

## Examples

Harris illustrates multiple formats (pp. 47-48):

**Overhead expenses breakdown:**
- Components: Personnel, Engineering, R&D, Selling, Administrative
- Two scales: Thousands of Dollars (bottom) and Percent (top, 0% to 100%)
- Each segment shows dollar value and percent
- Stepped arrangement shows cumulative buildup
- Can read both individual values and running totals

**With total bar and category grouping:**
- Events: Drama, Comedy, Musical categories
- Events A-E with ticket counts
- Total bar (400 tickets) included for reference
- Components grouped into similar categories (Drama/Comedy/Musical)

**Time and activity (Gantt-style) variation:**
- Departments A-E on vertical axis
- Tasks #1-5 as segments
- Horizontal scale in Weeks (0-14)
- Each segment positioned at start time, length shows duration
- Shows task sequencing and cumulative timeline

## Usage

**When to use:**
- Breaking down expenses, costs, or budgets into components
- Showing how time allocates across sequential activities
- When individual segment visibility matters more than in standard stacked bars
- Waterfall-style analysis (building up to a total)

**Scale options:**
- Single quantitative scale (values only)
- Dual scales: actual values and cumulative percentages
- Time scale for activity/scheduling applications

**Optional elements:**
- Total bar for reference (shows sum of all components)
- Category groupings (cluster related components)
- Individual segment labels (values, percents, or both)

**Gantt chart relationship:**
When the horizontal scale uses time units (days, weeks, months), the progressive bar graph becomes a time and activity chart. Bar lengths correspond to activity durations, and left edges indicate start times. This enables viewing:
- When each activity begins
- How long each takes
- Cumulative time consumed at any point

## Notes

The progressive bar graph is conceptually similar to modern "waterfall charts" used in financial analysis, though Harris's treatment predates that terminology. The key insight is that vertical displacement adds visual separation and emphasis without losing the cumulative relationship.
