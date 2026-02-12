---
name: Semilogarithmic Graph
slug: semilogarithmic-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Logarithmic Graph, Semilogarithmic Graph, pp. 221-224"

intent: Display and compare rates of change by using a logarithmic scale on one axis and a linear scale on the other
direction: both

components:
  - element: logarithmic-vertical-scale
    encodes: Values with equal physical distances representing equal percentage changes
    required: true
  - element: linear-horizontal-scale
    encodes: Typically time or sequential values
    required: true
  - element: data-curve
    encodes: Values plotted, where slope indicates rate of change
    required: true
  - element: cycles
    encodes: Major scale intervals on logarithmic axis (also called banks, decks, phases, tiers)
    required: true

parameters:
  base: "typically 10, but can be 5, 22, or other values"
  cycles_count: "one or more complete cycles"
  supplementary_scale: "optional logarithm values or rate-of-change reference"

related: []  # TBD: see also full-logarithmic-graph

warnings:
  - "Logarithmic scales do not include zero"
  - "Negative numbers cannot be plotted on logarithmic scales"
  - "Viewers may inadvertently estimate values linearly instead of logarithmically if minor tick marks are omitted"
  - "Bar, column, and area graph types are seldom used because viewers equate visual size with values, which is incorrect on log scales"
  - "The absolute slope is not the same for equal positive and negative rates of change (e.g., +40% vs -40%)"

extensions:
  harris_entry: "Logarithmic Graph"
  alternate_names: ["semilog", "semi-log", "ratio graph", "rate-of-change graph"]
  typical_use: "comparing growth rates, displaying data spanning multiple orders of magnitude, analyzing percentage changes"
---

## Description

A semilogarithmic graph has one logarithmic scale (typically on the vertical axis) and one linear scale (typically on the horizontal axis). This combination makes the steepness of curves proportional to the actual rate of change of the values being plotted.

Key properties:
- When a data series forms a straight line on a semilog grid, the data is increasing at a constant percentage rate
- When curves are parallel, the rates of change are identical even if actual values differ
- When the slope becomes shallower, rates of change are decreasing
- When the slope becomes steeper, rates of change are increasing

## Examples

**Interpreting curves** (p. 223):
> "The steepness of the curve on a semilog graph at any point or overall is proportional to the actual rate of change of the thing being plotted. The steeper the slope, the greater the rate of change, either positive or negative."

An example shows sales in dollars and sales in units as parallel lines, demonstrating that "the rates of growth for the product are the same (20% per year), both in terms of units and dollars."

**Comparing division growth rates** (p. 224):
> "A logarithmic scale can be helpful when analyzing data to see what is happening to the rates of growth of various entities."

The example shows three divisions:
- Division A: decreasing slope indicates rate of growth decreased each year
- Division B: straight line indicates constant annual growth rate
- Division C: increasing slope indicates growth rate increased each year

**Stock price analysis** (p. 224):
> "Daily stock prices are often plotted on semilog graphs... A supplementary scale is sometimes used" to estimate average annual increases (e.g., 5%, 10%, 15%, 20%, 25% per year).

**Enhancing data point resolution** (p. 224):
> "A logarithmic scale can be useful when displaying data with large differences in numeric values and/or large differences between multiple data series."

When values range from 0.3 to 50,444, a linear scale cannot show small values meaningfully. A logarithmic scale provides better resolution across the entire range.

## Usage

Use semilogarithmic graphs when:
- Comparing rates of growth or change across entities
- Data spans multiple orders of magnitude
- Constant percentage growth should appear as a straight line
- You want to see if growth is accelerating, decelerating, or constant

Avoid when:
- Absolute value comparisons are more important than rate comparisons
- Values include zero or negative numbers
- Viewers are unfamiliar with logarithmic interpretation

## Notes

The choice of logarithmic base (commonly 10, but can be 5, 22, or other values) affects the tick mark values but not the shape of the curves. Harris emphasizes that scatter and line graphs work best with logarithmic scales; column, bar, and area types mislead because viewers equate visual size with values.
