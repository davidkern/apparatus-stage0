---
name: Z Graph
slug: z-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Z Graph, p. 443"

intent: Display three aspects of a variable simultaneously - monthly values, cumulative values, and twelve-month rolling totals - forming a Z shape over a year
direction: both

components:
  - element: monthly-value-line
    encodes: Individual period values (bottom of Z)
    required: true
  - element: cumulative-line
    encodes: Year-to-date running total (diagonal of Z)
    required: true
  - element: rolling-total-line
    encodes: Twelve-month rolling total (top of Z)
    required: true
  - element: horizontal-axis
    encodes: Months of the year (J F M A M J J A S O N D)
    required: true
  - element: vertical-axis
    encodes: Dollars or units
    required: true

parameters:
  value_unit: dollars | units
  scale_type: single | dual

related: []  # TBD: line-graph, time-series-graph, cumulative-graph

warnings:
  - "Dual value scale may be required to make all three curves legible"
  - "Projection accuracy assumes no major seasonal element"

extensions:
  harris_entry: "Z Graph"
  typical_use: "tracking sales, monitoring year-over-year performance, projecting year-end totals"
---

## Description

A Z graph is a special application of a line graph that graphically displays three different aspects of a given variable on the same graph:
1. **Monthly values** - The actual value for each individual month
2. **Cumulative values** - The running year-to-date total
3. **Twelve-month total values** - The rolling sum of the most recent 12 months

The graph gets its name from the Z shape that forms by year-end when the three lines converge.

## Examples

### Formation Process
> "This type of graph is generally started at the beginning of a twelve-month period, at which point the graph consists of three points, two of which are on top on one another (monthly and cumulative). As the year progresses, the Z configuration begins to form, until at the end of the twelve-month period the lines for the three different values converge to form a Z shape." (p. 443)

Harris illustrates the Z graph at three points in time:
1. **End of January**: Three points, with monthly and cumulative values identical
2. **Six months into year**: Z shape beginning to form, cumulative rising, rolling total relatively stable
3. **End of year**: Complete Z shape with all three lines converging at year-end

### Projection Capability
> "After about six months of data, the cumulative and the twelve-month total lines can be projected to get an estimate of what the year-end total will be, assuming no major seasonal element." (p. 443)

### Scale Requirements
> "In some cases a dual value scale is required to make all three curves legible." (p. 443)

## Usage

Z graphs are appropriate for:
- Tracking sales performance over a fiscal year
- Monitoring year-over-year trends through rolling totals
- Projecting year-end results mid-year
- Comparing current performance to prior twelve months
- Identifying acceleration or deceleration in trends

### The Three Lines Explained

**Monthly values** (bottom line): Shows period-by-period performance, revealing seasonality and short-term fluctuations

**Cumulative year-to-date** (diagonal line): Shows progress toward annual goals, always increasing through the year

**Twelve-month rolling total** (top line): Uses the most recent 12 months regardless of fiscal year, smoothing seasonality and showing trend direction

### Interpretation

The rolling total line is particularly valuable because it:
- Automatically adjusts for seasonality (always includes one full year)
- Shows trend direction independent of where you are in the fiscal year
- Rises when recent months exceed year-ago months
- Falls when recent months trail year-ago months

## Notes

Z charts are frequently used for tracking sales-type information. The convergence of all three lines at year-end makes this chart particularly satisfying for annual reviews, as it visually confirms that all three measures reach the same total.
