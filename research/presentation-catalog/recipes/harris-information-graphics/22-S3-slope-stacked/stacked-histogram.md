---
name: Stacked Histogram
slug: stacked-histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Histogram, p. 358"

intent: Show how subcategories of a data series affect the overall frequency distribution pattern
direction: both

components:
  - element: stacked-columns
    encodes: Frequency counts for each class interval, subdivided by subcategory
    required: true
  - element: class-intervals
    encodes: Value ranges along horizontal axis
    required: true
  - element: frequency-axis
    encodes: Count or percentage of observations
    required: true
  - element: subcategory-segments
    encodes: Different groups within each frequency count
    required: true
  - element: segment-differentiation
    encodes: Color or pattern distinguishing subcategories
    required: true

parameters:
  subcategory_count: "typically 2-3 for readability"
  fill_type: "color | pattern | shade"
  frequency_type: "count | percent"

related: []  # TBD: histogram, stacked-column-graph

warnings:
  - "Interpretation of subportions becomes difficult with more than two data series"
  - "Intermediate subcategories cannot be compared easily across class intervals"
  - "Distribution shape of individual subcategories is obscured except for bottom layer"

extensions:
  harris_entry: "Stacked Histogram"
  typical_use: "analyzing how subgroups contribute to overall frequency distribution"
  example_application: "distribution of orders by dollar value, subdivided into export vs. domestic"
---

## Description

A stacked histogram applies the stacking principle to frequency distribution displays. Each column in the histogram is subdivided to show how different subcategories contribute to the total frequency count for each class interval. The top of each column indicates the total number of observations in that interval, while the segments reveal the breakdown by subcategory.

Harris provides a concrete example: "a histogram similar to the one at the right might be generated to study the distribution of orders based on dollar value. The black portions might represent the number of export orders and the white portions the number of domestic orders. The tops of the columns would indicate the total number of orders."

## Examples

From the illustration on p. 358, Harris shows a stacked histogram with:
- Class intervals from 1 to 15 on the horizontal axis
- Frequency values up to 18 on the vertical axis
- Two subcategories shown as black and white segments within each column
- A roughly normal distribution shape for the total, with the breakdown showing varying proportions of each subcategory across the distribution

The example demonstrates how the overall frequency pattern (the distribution shape) can be examined alongside the contribution of each subgroup.

## Usage

Stacked histograms are most effective when:
- Examining how two subcategories contribute to overall distribution
- The total distribution pattern is the primary interest
- Subcategory breakdown provides additional insight
- Comparing whether subcategories have similar or different distributions

Less effective when:
- More than two subcategories create visual complexity
- Precise subcategory comparisons across intervals are needed
- Individual subcategory distributions are the primary focus
- The distribution has many class intervals

Harris explicitly warns: "More than two data series can be plotted on this type of graph; however, interpretation of the subportions of the graph sometimes becomes difficult."

## Notes

For detailed analysis of individual subcategory distributions, consider using separate histograms (small multiples) rather than stacking. The stacked format privileges the total distribution shape while making individual subcategory patterns harder to discern. This is a specific application of stacking principles to frequency distribution analysis.
