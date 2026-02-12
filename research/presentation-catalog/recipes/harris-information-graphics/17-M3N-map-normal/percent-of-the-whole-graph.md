---
name: Percent-of-the-Whole Chart/Graph
slug: percent-of-the-whole-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Percent-of-the-Whole Chart/Graph, p. 272"

intent: Show what percent each component represents of a whole (100%), enabling comparison of proportions
direction: both

components:
  - element: whole-representation
    encodes: Total (100%) represented by full area, height, or circumference
    required: true
  - element: component-segments
    encodes: Portions representing each component's percentage
    required: true
  - element: percent-labels
    encodes: Percentage values for each component (optional)
    required: false
  - element: legend-or-labels
    encodes: Identification of what each segment represents
    required: true

parameters:
  chart_type: pie | circle-graph | stacked-column | stacked-bar | stacked-area
  application: single-group-point-in-time | multiple-groups-point-in-time | single-group-over-time

related:
  - slug: pie-chart
    relationship: variant-of
  - slug: stacked-bar-graph
    relationship: variant-of
  - slug: stacked-column-graph
    relationship: variant-of
  - slug: stacked-area-graph
    relationship: variant-of

extensions:
  harris_entry: "Percent-of-the-Whole Chart/Graph"
  alternate_names:
    - "100% chart"
    - "100% graph"
    - "one hundred percent chart"
  typical_use: "showing proportional composition of a whole"
  applications:
    single_group_point: "pie chart, column chart, bar chart"
    multiple_groups_point: "100% stacked bar graph, 100% stacked column graph, multiple pie charts"
    single_group_time: "100% column graph, 100% area graph"
---

## Description

A percent-of-the-whole chart or graph shows what percent each component represents of a whole. For example, if a theater sells a total of 250 tickets (100%), distributed between children, adults, and seniors, a percent-of-the-whole chart might be used to show what percent of the total number of tickets were sold to each of the three age groups.

If units are used instead of percent, the figure is sometimes referred to as a part-of-the-whole chart or graph.

Stacked graphs and proportional charts are among the most widely used formats for displaying percent-of-the-whole data. With proportional charts, generally the areas of the data graphics represent the percents. With graphs, the data point or the line or edge of the data graphic designates the percents.

## Examples

Harris illustrates three major applications (p. 272):

**One group of data at a point in time:**
- Pie chart showing Children 75 (30%), Adults 125 (50%), Seniors 50 (20%), Total = 250
- Column chart with same data
- Bar chart with same data
- Circle graph (pie with scale) showing same proportions

**Multiple groups of data at a point in time:**
- 100% stacked bar graph comparing Countries A through F
- 100% stacked column graph with same data
- Series of pie charts (one per country) for comparison

> "Multiple pie charts... can be used; however, they tend to require more space and comparisons are more difficult to make."

**One group of data at multiple points in time:**
- 100% column graph showing daily composition (S M T W T F S)
- 100% area graph showing same data with Seniors, Children, Adults segments

> "Multiple pie charts or circle graphs, each representing a different time period, can be used as shown above; however, they tend to require more space and comparisons are more difficult to make."

## Usage

**Choosing chart type by application:**

| Application | Recommended Types |
|-------------|------------------|
| Single group at point in time | Pie chart, column chart, bar chart, circle graph |
| Multiple groups at point in time | 100% stacked bar/column graphs (preferred); multiple pie charts (requires more space) |
| Single group over time | 100% column graph, 100% area graph (preferred); multiple pie charts (difficult to compare) |

**Design considerations:**
- Stacked graphs work well for time series and multiple group comparisons
- Pie charts work well for single snapshots but are difficult to compare across multiple entities
- Units may be shown in addition to percents

## Notes

With both charts and graphs, units may be shown in addition to percents. The choice between chart types often depends on whether comparison across groups/time is important (favor stacked graphs) or a single composition snapshot suffices (pie charts acceptable).
