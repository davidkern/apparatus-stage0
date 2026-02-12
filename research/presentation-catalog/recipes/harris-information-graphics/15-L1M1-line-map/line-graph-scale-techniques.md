---
name: Line Graph Scale Techniques
slug: line-graph-scale-techniques
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Scales on line graphs, p. 217"

intent: Configure scales to maximize readability of line graphs while maintaining data integrity
direction: construction

components:
  - element: vertical-scale
    encodes: Quantitative values (typically)
    required: true
  - element: horizontal-scale
    encodes: Category, sequence, or quantitative values
    required: true
  - element: secondary-scales
    encodes: Duplicate scales, different units, or different variables
    required: false

parameters:
  vertical_scale_type: "linear | nonlinear (except stacked)"
  horizontal_scale_type: "category | sequence | quantitative"
  scale_breaks: "none | single break | multiple breaks"
  multiple_scales: "none | identical both sides | different units | different variables"

related: []  # TBD: see also scale-break, dual-axis-graph

warnings:
  - "Scale breaks can distort perception of the data if not clearly indicated"
  - "Eliminating the lower portion of a scale risks viewers overlooking that it is missing"
  - "As a general rule, quantitative scales should include zero and be continuous"

extensions:
  harris_entry: "Line Graph"
  alternate_names: []
  typical_use: "optimizing readability when values are large but differences small"
---

## Description

Line graphs are among the most versatile graph types regarding scales. Harris identifies key features:
- Typically have a quantitative scale on the vertical axis
- Can have category, sequence, or quantitative scale on the horizontal axis
- Quantitative scales can be linear or nonlinear (except on stacked line types)
- Both positive and negative values can be plotted (except on stacked types)
- Multiple scales are often used on the vertical axis

## Examples

**Scale break techniques** (p. 217):
When actual values are large but differences between values are small, the scale can be enlarged using several methods:

1. **Scale break with gap indicators**: Three examples show expanding the scale while taking a section out of the middle. The center example (with offset segments) makes the break most obvious; the right example (smooth continuation) makes it least obvious.

2. **Uneven lower portion**: "Making the lower portion of the graph uneven helps to call the viewer's attention to the fact that the lower portion of the scale is missing."

3. **Eliminated lower portion**: "An alternative to a scale break when there is only one data series or multiple data series are clustered at the top, is to eliminate the lower portion of the scale. This variation presents the danger of the viewer overlooking the fact that the lower portion of the scale is missing."

4. **Dual graphs**: "An alternative is to use two graphs. One with a scale starting at zero with no breaks which lets the viewer put the data in perspective. The other, an enlargement of the area with the data (called an expanded scale), which lets the viewer better determine exact values."

**Multiple scale purposes** (p. 217):
> "Three of the major reasons for additional quantitative scales on the right side are:
> - Identical scales on both sides improves the ease and accuracy of reading the graph, particularly when it is wide, when there are multiple data series plotted, and/or when grid lines are not used
> - The right-hand scale can specify the same thing as the left scale, except in different units such as kilometers and miles
> - When multiple data series use different units of measure or significantly different values, a second scale is often required"

## Usage

Choose scale configuration based on:
- Whether precise value reading or overall pattern recognition is primary
- How large the values are relative to the differences between them
- Whether multiple data series use compatible units and ranges
- The width of the graph and presence of grid lines

When using scale breaks:
- Make the break visually obvious to prevent misinterpretation
- Consider using dual graphs as an alternative
- Always consider whether the break could mislead viewers

## Notes

The recommendation that "quantitative scales include zero and be continuous" is a general guideline to prevent distortion, but Harris acknowledges situations where this makes differences impossible to discern, justifying scale breaks or expanded scales as alternatives.
