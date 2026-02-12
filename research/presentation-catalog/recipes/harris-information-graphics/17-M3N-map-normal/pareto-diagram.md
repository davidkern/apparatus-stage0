---
name: Pareto Diagram
slug: pareto-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pareto Diagram/Graph, pp. 267"

intent: Highlight the major types, causes, or sources of defects by plotting them in descending order so primary contributors can be identified and addressed first
direction: both

components:
  - element: category-axis
    encodes: Types, causes, sources, or locations of defects in descending order
    required: true
  - element: frequency-bars
    encodes: Columns or bars showing frequency of occurrence (units, percents, or both)
    required: true
  - element: cumulative-line
    encodes: Running total showing cumulative percentage (optional but common)
    required: false
  - element: dual-scales
    encodes: Left scale for frequency, right scale for cumulative percent
    required: false

parameters:
  graph_type: column | bar
  column_style: standard | joined
  cumulative_line: present | absent
  data_point_alignment: center | edge

related:
  - slug: column-graph
    relationship: variant-of
  - slug: bar-graph
    relationship: variant-of
  - slug: cumulative-frequency-graph
    relationship: combines-with

warnings:
  - "The cumulative percent line data points can coincide with center or edge of columns; joined columns work better with edge alignment"

extensions:
  harris_entry: "Pareto Diagram/Graph"
  alternate_names:
    - "Pareto chart"
    - "Pareto graph"
  typical_use: "quality control, identifying primary contributors to problems"
  applications:
    - "reducing rejects"
    - "reducing costs"
    - "reducing time"
    - "reducing parts"
---

## Description

The purpose of the Pareto graph is to highlight the major types, causes, sources, etc., of defects so the primary contributors can be identified and addressed first.

In its simplest form, the major defects, causes of defects, locations where defects occur, etc., are plotted in descending order along the category axis of either a column or bar graph. The value axis displays the frequency of occurrence of the defects in terms of units, percents, or both over a prescribed period of time or for a given number of units.

From such a chart, it is generally apparent which factors are the biggest contributors to a quality problem.

## Examples

Harris illustrates multiple Pareto variations (p. 267):

**Basic Pareto graphs:**
- Type of defect (B, E, D, C, A) on horizontal axis, ranked by frequency
- Number of defective units on vertical axis
- Defect B has highest count, defect A has lowest

**Multiple graphs for same situation:**
Three graphs showing same data different ways:
1. Defects by type
2. Rejects by part number
3. Stacked column combining type of defect and part number

> "From these graphs it can be seen that part number 2 has the highest number of rejects, and defect B represents the highest percent of the total defects."

**Before and after corrective actions:**
Two Pareto graphs showing:
- Quantities and cumulative percentages before corrective actions
- Same metrics after corrective actions
- Overall improvement visible in reduced totals and changed rankings

**Cumulative line variations:**
- Bar type Pareto chart with cumulative data points aligned with centers
- Joined column type Pareto chart with cumulative data points aligned with edges

> "The joined variation tends to work better when the data points for the cumulative line coincide with the edges of the columns."

## Usage

**When to use:**
- To identify which factors contribute most to a problem
- To prioritize improvement efforts
- To track improvement before and after corrective actions
- Any situation where the goal is to reduce something (rejects, costs, time, parts)

**Multiple graph strategy:**
Sometimes multiple graphs are generated for the same situation to give further insight. For example, with four parts and five defect types:
- One graph plots failures by defect type
- Another plots rejects by part number
- A third uses stacked columns to show both dimensions

**Design options:**
- Column graphs are most frequently used; bar graphs work equally well
- Cumulative line data points can align with column centers or edges
- Standard or joined column graphs can be used

## Notes

Although Pareto graphs are most frequently used in the field of quality control, they can be employed in any situation where the goal is to reduce something, whether that be rejects, costs, time, parts, etc.
