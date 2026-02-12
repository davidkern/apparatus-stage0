---
name: Dot Array
slug: dot-array
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Dot Array, p. 142"

intent: Display frequency distribution by stacking dots or symbols for each occurrence, creating a visual equivalent of a histogram
direction: both

components:
  - element: value-axis
    encodes: Values or class intervals being measured
  - element: frequency-axis
    encodes: Count of occurrences (may be implicit from dot stacking)
    required: false
  - element: dot-symbols
    encodes: Individual data elements, one per occurrence
  - element: grid-lines
    encodes: Reference lines for precise frequency reading
    required: false

parameters:
  grid_style: numbered-grid | no-grid
  symbol_type: filled-dot | unfilled-circle | other-symbol
  arrangement: stacked | side-by-side

related: []  # TBD: see histogram

warnings:
  - "Without a frequency scale, only relative comparisons and mode identification are possible"
  - "Large data sets may require class intervals rather than individual values"

extensions:
  harris_entry: "Dot Array"
  alternate_names: ["dot diagram"]
  typical_use: "showing distribution shape, identifying mode, visualizing small-to-medium data sets"
  scale_types:
    value_axis: "quantitative (values or class intervals)"
    frequency_axis: "quantitative (counts)"
---

## Description

A dot array is a frequency distribution display where each data element is represented by a single dot or symbol. As values repeat in the data set, dots accumulate (stack) at that value, creating columns of varying heights that form the distribution shape.

The technique produces a visual equivalent of a histogram but preserves individual data points rather than aggregating into bars. This makes it particularly useful for smaller data sets where seeing each observation matters.

## Examples

Harris shows two variations (p. 142):

**With grid and scale:**
> "Dot array using grid lines and a scale for determining frequency of occurrence"

The example displays values from 52-62 on horizontal axis, with dots stacked on grid intersections. Frequency scale runs 0-10 on vertical axis, allowing precise count reading.

**Without grid:**
> "Dot array with no grid lines or frequency scale, unfilled circles, and the circles stacked beside each other"

This simpler version shows values 50-70 on vertical axis with unfilled circles arranged horizontally. No frequency numbers appear.

Harris notes:
> "When the main purpose of the array is simply to locate the value or class interval with the highest frequency of occurrence (mode), scales on the frequency axis may not be necessary."

## Usage

Dot arrays work well when:
- Data set is small to moderate (dozens to low hundreds of points)
- Showing distribution shape is the goal
- Identifying the mode is important
- Individual data points should remain visible

The technique is less appropriate when:
- Data set is very large (dots become unmanageable)
- Precise frequency counts across many values are needed
- Continuous distribution needs smooth representation

Almost any type of symbol can be used, filled or unfilled. The choice affects visual density and aesthetics.

## Notes

The dot array bridges the gap between raw data and summarized histogram. It preserves granularity while revealing distributional patterns. For teaching statistics, dot arrays help students understand that histograms aggregate individual observations.

When values are continuous, class intervals group nearby values to create meaningful stacks. The choice of interval width affects the apparent shape of the distribution.
