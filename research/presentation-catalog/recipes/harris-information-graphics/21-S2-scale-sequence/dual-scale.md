---
name: Dual Scale
slug: dual-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Number and location of scales, pp. 341-342"

intent: Display two or more value scales on a single graph to accommodate multiple data series or alternative units of measure
direction: construction

components:
  - element: primary-scale
    encodes: Main value scale (typically left side for vertical, bottom for horizontal)
    required: true
  - element: secondary-scale
    encodes: Additional value scale with different range or units
    required: true
  - element: scale-labels
    encodes: Numeric values and unit indicators for each scale
    required: true
  - element: data-series-indicators
    encodes: Clear mapping of which data series uses which scale
    required: true

parameters:
  scale_relationship: "same-units-different-range | different-units-same-data | independent-data-series"
  primary_position: "left | bottom"
  secondary_position: "right | top"
  scale_count: "2 | 3 or more (unusual)"

related: []  # TBD: linear-scale, supplementary-scale

warnings:
  - "More than two scales per side is unusual and may cause confusion"
  - "Clear labeling is essential to indicate which scale applies to which data"
  - "Typically only one set of grid lines is used per axis even with multiple scales"

extensions:
  harris_entry: "Scale"
  alternate_names: ["multiple value scales", "dual vertical scales", "dual Y-axis scales", "double Y-axis scales", "binumerical scales"]
  typical_use: "comparing data with different units or magnitudes on one graph"
---

## Description

Multiple scales are used on a single graph in several situations: (1) when multiple data series with different units of measure are plotted on the same graph, (2) when values of two data series are different enough that a single scale would make one difficult to read, or (3) when the viewer needs to read the same data in different units (e.g., Fahrenheit and Celsius, feet and meters, actual values and percentages).

There is no limit to how many scales can be used on a given graph; however, more than two scales per side, top, or bottom is unusual. When two or more vertical scales are used, the graph may be referred to as having dual vertical scales, dual Y-axis scales, double Y-axis scales, or binumerical scales.

## Examples

> "In a good number of cases, multiple scales are used to enable the viewer to estimate the values of the data elements in two different units of measure, as shown at the left. For example, data may be read as actual values and percents-of-the-whole, Fahrenheit and centigrade, feet and meters, etc." (p. 341)

The PDF shows several configurations:
1. Two vertical scales on the same side (left) for different data series
2. Two vertical scales on opposite sides (left and right) for related data
3. Three vertical scales distributed on both sides
4. A single data series with two scales showing different units (actual values and percent)

> "When there are multiple scales, each generally has its own set of tick marks; however, typically only one set of grid lines is used for each axis." (p. 341)

## Usage

Dual scales are appropriate when:
- Comparing trends of data series with different units or magnitudes
- Showing the same data in alternative units for different audiences
- Space constraints require combining graphs that would otherwise be separate
- The relationship between two different measures is the focus

Dual scales require caution when:
- Viewers might confuse which scale applies to which data
- The scales are so different that visual comparison is misleading
- Multiple data series would be clearer as separate graphs

Best practices:
- Label each scale clearly with units
- Use consistent colors or patterns to link data series to their scales
- Position scales logically (typically one left, one right for vertical scales)
- Consider whether separate graphs would be clearer

## Notes

In some cases, a scale is simply duplicated on the opposite side because the graph is large, grid lines are not used, or a higher degree of accuracy in estimating values is desired. This differs from true dual scales where each scale has different values or units.
