---
name: Range Bar Graph
slug: range-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Range bar graph, p. 42"

intent: Show upper and lower boundaries (and optionally inner values) for each category using bars that span a range rather than extend from zero
direction: both

components:
  - element: range-bars
    encodes: Span from lower to upper boundary values
    required: true
  - element: upper-boundary
    encodes: Maximum, upper limit, or high value (typically right end of bar)
    required: true
  - element: lower-boundary
    encodes: Minimum, lower limit, or low value (typically left end of bar)
    required: true
  - element: inner-value-marker
    encodes: Average, median, or other central value shown as line across bar
    required: false
  - element: quantitative-scale
    encodes: Value axis (horizontal)
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true

parameters:
  boundary_type: measured | calculated | percentile | confidence-limits
  inner_value: none | average | median | other
  bar_style: simple | box-type
  grouping: simple | grouped

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: box-graph
    relationship: variant-of
  - slug: bar-graph-with-error-bars
    relationship: contrasts

warnings:
  - "Without inner value markers, only the range is communicated—central tendency is unknown"
  - "Box-type range bars with distribution information can become visually complex"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "high-low bar graph"
    - "floating bar graph"
    - "spanning bar graph"
  typical_use: "showing ranges of values such as test score distributions, price ranges, or confidence intervals"
  boundary_examples:
    - "measured values (min/max)"
    - "calculated values"
    - "maximum and minimum"
    - "confidence limits"
    - "10th and 90th percentile values"
---

## Description

Range bar graphs use short bars to designate upper and lower boundaries rather than extending bars from zero to a single value. The boundaries might be measured or calculated values, maximum and minimums, confidence limits, percentile values, etc.

One end of the bar (normally the right end) designates the upper value; the other end designates the lower value. When an inner value is included, it is often shown as a vertical line across the bar.

## Examples

Harris illustrates multiple variations (p. 42):

**Basic range bar graph:**
- Items 1-5 on vertical axis
- Scale 0-100 on horizontal axis
- Each bar spans from lower to upper value
- Arrows indicate "Lower values" and "Upper values"

**Range bar with inner values (test scores):**
- Tests #1-5 on vertical axis
- Scale 0-100 on horizontal axis
- Left edge = lowest score on test
- Right edge = highest score on test
- Vertical line across bar = average or median score
- Caption: "When inner values are included it is often called a high-low bar graph"

**Box-type range bars:**
When distribution information is desired beyond just boundaries and central value, additional markers can show:
- Minimum
- 10th percentile
- 25th percentile
- Average/mean
- Median
- 75th percentile
- 90th percentile
- Maximum

This creates a box plot variant (see Box Graph for more examples).

**Grouped range bars:**
- Compare ranges of multiple entities
- When ranges overlap: plotted side-by-side
- When ranges don't overlap: can be plotted in line with one another

Harris shows grouped range bars comparing:
- Class scores in Reading, Math, History, Science for Class 1, 2, and 3
- Department gross profit ranges for Store #1 and Store #2

## Usage

**When to use:**
- Showing variability or spread within categories
- Displaying confidence intervals
- Comparing ranges across groups (e.g., score distributions)
- When both boundaries and central tendency matter

**Inner value considerations:**
Inner values always lie at or between the upper and lower values. Common inner values:
- Average
- Median
- Target value

**Grouped range bars:**
When comparing multiple entities' ranges:
- Overlapping ranges → place side-by-side
- Non-overlapping ranges → can align in same position

## Notes

Harris references "Range Symbol and Graph" entry for additional examples and techniques. The range bar graph is conceptually related to box plots but uses simpler visual encoding. For richer distribution information, see box-type variations or the Box Graph entry.
