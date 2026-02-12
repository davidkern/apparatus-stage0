---
name: Range Column Graph
slug: range-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Range column graph, pp. 85-86"

intent: Display upper and lower boundaries of data ranges using short columns, optionally with inner values
direction: both

components:
  - element: range-columns
    encodes: Span from lower to upper boundary values
    required: true
  - element: upper-boundary
    encodes: Maximum, high, or upper limit value
    required: true
  - element: lower-boundary
    encodes: Minimum, low, or lower limit value
    required: true
  - element: inner-value-marker
    encodes: Average, median, or closing value within the range (when present)
    required: false
  - element: quantitative-scale
    encodes: Numeric values on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true

parameters:
  inner_value: "none | average | median | closing | other"
  grouping: "simple | grouped (multiple entities)"
  distribution_info: "none | box plot style"

related:
  - slug: range-bar-graph
    relationship: variant-of
  - slug: box-graph
    relationship: combines-with

warnings:
  - "The scale sometimes does not start at zero since columns do not extend to the zero axis"
  - "When ranges of multiple entities overlap, they must be plotted side-by-side"
  - "Distribution information requires additional visual complexity"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["high-low graph", "high-low-close graph", "open-high-low-close graph", "bar chart (stock)", "floating block graph", "flying box graph"]
  typical_use: "stock prices, salary ranges, temperature ranges, test score distributions, confidence intervals"
  scale_types:
    vertical: "quantitative"
    horizontal: "category or sequence"
---

## Description

Range column graphs designate upper and lower boundaries using short columns (sometimes called bars). The boundaries might be measured or calculated values, represent single or average values, designate confidence limits, or indicate maximums and minimums.

When inner values are included, the graph is sometimes called a high-low graph. Inner values typically designate averages, medians, closing values, etc. They always lie at or between the upper and lower values and are typically indicated by a horizontal line across the column.

## Examples

> "Range column graphs designate upper and lower boundaries of things by means of short columns (sometimes called bars). The boundaries of the ranges might be measured or calculated values, represent single or average values, designate confidence limits, indicate maximums and minimums, etc." (p. 85)

Harris provides examples of data that might have ranges designated:
- Maximum, minimum, and average salaries by year
- Average test results and the 10th and 90th percentile values
- Median, high, and low temperatures by month

> "When a range graph is used to record stock prices it is sometimes called a high-low-close, open-high-low-close, or bar chart." (p. 85)

For stock prices: upper value = highest price during period, lower value = lowest price, inner value = closing price.

**Distribution information**: When distribution details are needed beyond upper, lower, and inner values, additional elements like percentile markers can be added. One example is the box graph (box plot), showing maximum, 90th percentile, 75th percentile, average/median, 25th percentile, 10th percentile, and minimum.

## Usage

**Grouped range column graphs**: Used to compare ranges of multiple entities. When ranges overlap, columns are plotted side-by-side. When ranges do not overlap, columns can be plotted in line with one another.

**Three-dimensional range column graphs**: Compare multiple data series on a three-axis graph. Sometimes called floating block or flying box graphs.

**Range symbols on columns**: Range bars can be added to the tops of regular columns to indicate values bracketing the average or median (such as plus/minus standard deviations or confidence limits). Various symbols are used: same width as column, left/right positioned, or error bar style.

**Gradient range symbols**: When crisp horizontal lines suggest false precision, blurred graphics can replace them. Shading density or stripe heaviness indicates where the actual value most probably lies within the range.

## Notes

This is one of the column graph types where the scale sometimes does not start at zero, since the columns do not extend to the zero axis. The range itself is the key information, not the relationship to zero.
