---
name: Cumulative Graph
slug: cumulative-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cumulative Graph, p. 119"

intent: Display running totals where each plotted value represents the sum of the current period plus all preceding periods from a common starting point
direction: both

components:
  - element: sequential-scale
    encodes: Time periods or sequence (horizontal axis)
    required: true
  - element: cumulative-value-scale
    encodes: Running total values (vertical axis)
    required: true
  - element: cumulative-data-line
    encodes: Line or points showing cumulative values over time
    required: true
  - element: reference-line
    encodes: Optional cumulative goal or target line for comparison
    required: false
  - element: incremental-indicators
    encodes: Optional highlighting of each period's contribution to the total
    required: false

parameters:
  cumulation_type: absolute-values | deviations
  display_format: line | column | area
  show_increments: true | false
  data_series_count: single | multiple

related: []

warnings:
  - "Cumulative deviation graphs are generally more sensitive for monitoring than absolute cumulative graphs"
  - "Algebraic summing is used, so both positive and negative values can appear"
  - "The starting point resets periodically (e.g., annually for YTD graphs)"

extensions:
  harris_entry: "Cumulative Graph"
  alternate_names:
    - running total graph
    - YTD (year-to-date) graph
    - MTD (month-to-date) graph
  typical_use: "Tracking progress toward goals, monitoring cumulative performance"
---

## Description

All values on a cumulative graph reflect totals with respect to some common starting point. The value plotted for any given period equals the incremental value for that period plus the sum of incremental values for all prior periods back to the starting point.

Month-to-date (MTD) and year-to-date (YTD) graphs are among the better known types of cumulative graphs. In a YTD graph, the first month's value is plotted alone, the second month plots the sum of months one and two, and this continues until December shows the sum of all 12 months. In January, the process starts again.

Cumulative graphs are particularly useful for monitoring progress toward goals or targets over time.

## Examples

Harris illustrates several cumulative graph variations on page 119:

**Actual values vs cumulative:**

> Comparison of a graph of actual data (left) versus two forms of cumulative data graphs. Actual sales by month shown for reference alongside cumulative sales (solid line) and cumulative goal (dashed).

**Cumulative deviation:**

> Cumulative deviation of sales from goal. This graph shows when cumulative actual sales exceed or fall below cumulative expected sales.

> Cumulative deviation or difference is generally more sensitive for monitoring purposes.

**Column graph with increments highlighted:**

> If one wants to display individual increments for each period as well as cumulative values, a column graph is sometimes used. The cumulative values are designated by the tops of the columns, while the incremental values are indicated by a shaded or colored component at the bottom of each column.

**Cumulative sum (cusum) for quality control:**

> Comparison of a standard control graph plotting actual values and a cumulative sum chart plotting cumulative deviations from a reference. Cusum graphs are more sensitive to small, gradual variations than a graph of actual values.

## Usage

**Types of cumulative graphs:**

1. **Absolute cumulative**: Shows running total of actual values
   - YTD sales, MTD production, etc.
   - Useful for tracking progress toward annual/monthly targets

2. **Cumulative deviation/difference**: Shows running total of differences from expected values
   - More sensitive for monitoring purposes
   - Reveals trends earlier than absolute cumulative graphs

**Display formats:**
- **Line graph**: Most common, shows continuous cumulative trend
- **Column graph with highlights**: Shows both cumulative total and each period's increment
- **Stacked area graph**: When multiple sources contribute to cumulated values

**Key considerations:**
- Algebraic summing takes plus and minus signs into account
- Both positive and negative values can be used in calculations and appear on the graph
- Multiple data series can be plotted on the same cumulative graph
- Stacked column or stacked area graphs show how each source contributes to overall cumulative values

**Monitoring applications:**
- Compare cumulative actual to cumulative goal
- Cumulative deviation graphs highlight departures from expected performance
- Earlier detection of trends compared to period-by-period graphs

## Notes

As a general rule, cumulative deviation or difference graphs tend to be more sensitive for monitoring purposes than overall cumulative graphs. This is because deviations accumulate, making small consistent differences more visible over time.
