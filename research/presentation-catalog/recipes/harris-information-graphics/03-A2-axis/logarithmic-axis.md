---
name: Logarithmic Axis
slug: logarithmic-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Chart, Reasons for using logarithmic scales, p. 30"

intent: Configure an axis with logarithmic scale to display data spanning wide ranges or to reveal rate-of-change patterns
direction: both

components:
  - element: scale-line
    encodes: The axis line with logarithmic spacing
    required: true
  - element: major-tick-marks
    encodes: Marks at powers of 10 (1, 10, 100, 1000)
    required: true
  - element: minor-tick-marks
    encodes: Marks at intermediate values within each decade
    required: false
  - element: scale-labels
    encodes: Numeric values, often powers of 10
    required: true
  - element: cycle-indicators
    encodes: Visual grouping of each decade (bank)
    required: false

parameters:
  base: 10 | e | 2
  cycles: number of decades displayed
  orientation: vertical | horizontal

related: []  # TBD: see also quantitative-axis, arithmetic-scale

warnings:
  - "Logarithmic scales cannot include zero or negative values"
  - "The readability of values at one end of the chart may decrease as the other end becomes more readable"

extensions:
  harris_entry: "Axis, Graph"
  alternate_names: ["log scale", "ratio scale"]
  bank_definition: "The major interval on a logarithmic scale, sometimes called cycle, deck, tier, or phase"
  use_cases:
    - "Making certain values more legible when the range of values is large"
    - "Making changes in growth rates more visible"
    - "Comparing the growth rates of multiple entities"
---

## Description

A logarithmic axis uses a scale where equal distances represent equal ratios rather than equal amounts. This makes the axis particularly useful for data spanning multiple orders of magnitude or for analyzing rates of change. On a logarithmic scale, the distance from 1 to 10 equals the distance from 10 to 100 equals the distance from 100 to 1000.

Harris identifies three major reasons for using logarithmic scales on vertical price axes:
1. To make certain values more legible when the range is large
2. To make changes in growth rates more visible
3. To compare growth rates of multiple entities

## Examples

> "Both linear and logarithmic scales are widely used on the vertical price axis." (p. 30)

**Making values legible across wide ranges:**
When data ranges from 1 to 600 on a linear scale, values near 1 become difficult to read. The same data on a logarithmic scale (1 to 1000) makes the lower values readable, though values at the upper end become less precise.

**Revealing growth rate changes:**
> "Based on the graph on the left with the linear scale it might appear that the stock has had a steady and uniform growth rate. The graph of the same data with the logarithmic scale indicates that the rate of growth of the stock has steadily decreased over time." (p. 30)

A stock showing 250% growth between early intervals but only 4-5% growth in later intervals appears as a straight line on a linear scale, but the decreasing slope on a logarithmic scale reveals the slowing growth rate.

**Comparing growth rates:**
On a linear scale, a stock with higher absolute values appears to grow faster. On a logarithmic scale, parallel lines indicate equal growth rates, making it clear when a lower-priced stock actually has faster percentage growth.

## Usage

Logarithmic axes are appropriate when:
- Data spans multiple orders of magnitude
- Percentage changes matter more than absolute changes
- Comparing growth rates across entities with different starting values
- Displaying exponential growth or decay patterns

The major interval on a logarithmic scale (one power of 10) is called a bank, cycle, deck, tier, or phase.

## Notes

An arithmetic graph has linear scales on one or more quantitative axes. The choice between arithmetic (linear) and logarithmic scales depends on whether the analyst needs to compare absolute values or percentage changes. Price scales for stocks are often expanded (not starting at zero) but very uncommonly have breaks or discontinuities.
