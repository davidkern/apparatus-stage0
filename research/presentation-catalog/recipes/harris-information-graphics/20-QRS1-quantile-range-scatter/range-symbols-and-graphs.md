---
name: Range Symbols and Graphs
slug: range-symbols-and-graphs
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Range Symbols and Graphs, pp. 323-325"

intent: Graphically designate upper and lower boundaries of data groups, with optional intermediate and central values, to show spread, variability, or uncertainty
direction: both

components:
  - element: upper-boundary
    encodes: Maximum, highest percentile, upper confidence limit, or upper specification value
    required: true
  - element: lower-boundary
    encodes: Minimum, lowest percentile, lower confidence limit, or lower specification value
    required: true
  - element: intermediate-values
    encodes: Additional boundaries between upper and lower (e.g., 75th/25th percentile, inner confidence intervals)
    required: false
  - element: central-value
    encodes: Average, median, midpoint, or other central tendency measure
    required: false
  - element: connecting-element
    encodes: Line, bar, or box connecting the boundary markers
    required: true

parameters:
  symbol_type: "bar | line | error-bar | box"
  orientation: "vertical | horizontal"
  boundary_meaning: "measured | calculated | tolerance | theoretical | projected | specification"

related:
  - slug: error-bar
    relationship: contains
  - slug: high-low-graph
    relationship: contains
  - slug: band-graph
    relationship: variant-of

warnings:
  - "The same symbol can have many different meanings; a legend clearly identifying what each element designates is generally recommended"
  - "Elements of symbols designating different types of information may or may not be symmetrical in actual applications"

extensions:
  harris_entry: "Range Symbols and Graphs"
  alternate_names: ["range bar", "floating column", "sliding bar", "high-low graph", "box symbol"]
  typical_use: "showing data spread, uncertainty, variability, tolerance limits, confidence intervals"
---

## Description

Range symbols and graphs form a family of visualization techniques that graphically designate upper and lower boundaries of data groups. These boundaries might represent measured values, calculated statistics, tolerance limits, theoretical ranges, projections, or specifications.

Harris identifies four major symbol types used extensively for range designation: bars, lines, error bars, and boxes. Each can encode up to three types of information:

**Upper and Lower Values**: Maximum/minimum, percentiles (95th/5th, 90th/10th), standard deviations, confidence intervals, specification limits

**Intermediate Values**: Values between the extremes, such as 75th/25th percentile, inner confidence intervals, or open/close prices

**Central Values**: Average/mean, median, specification midpoint, actual value, or other reference point

In any given graph, symbol elements always designate the same values. However, the same symbol configuration can represent different statistics in different graphs, making legends essential.

## Examples

> "For example, in one graph a symbol might designate the minimum and maximum values, the tenth and ninetieth percentile values, and the average value of a data set. In another graph, that same configuration of symbol might designate plus and minus two and three standard deviations and the median value of the data." (p. 323)

Harris provides examples of data suited for range designation:
- Maximum, minimum, and average salaries by profession
- Average test values and the 10th and 90th percentile values by test series
- High, low, open, and close stock prices by day
- Average, high, and low temperatures by month
- Projected performance and associated confidence limits

## Usage

Range symbols integrate with most basic graph types:

**Vertical configurations**: Range bars alone (floating columns), range bars with columns, error bars on point/line/column graphs

**Horizontal configurations**: Sliding bars showing ranges along a horizontal axis

**Band graphs**: When upper and lower values are connected with lines, creating filled area silhouettes showing how range changes over time

**Three-dimensional**: Floating block or flying box graphs, though inner values are seldom used

**Distribution indication**: Shading density or embedded histograms can show how data is distributed within the range

## Notes

Multiple values can be designated by range symbols. For example, if upper/lower values represent 95% confidence interval, intermediate values might show 75% and 50% confidence intervals. If upper/lower represent three standard deviations, intermediate values might show one and two standard deviations. Both average and median can be displayed as central values.

Multiple data series can use range symbols either to compare spread across groups or to provide supplemental variability information alongside primary data graphics like lines or columns.
