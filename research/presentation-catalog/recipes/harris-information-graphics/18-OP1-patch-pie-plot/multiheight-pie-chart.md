---
name: Multiheight Pie Chart
slug: multiheight-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Encoding an additional quantitative variable, pp. 283, 285"

intent: Encode an additional quantitative variable by varying the height or radius of individual pie segments
direction: both

components:
  - element: circle-base
    encodes: The whole being divided into parts
    required: true
  - element: variable-height-segments
    encodes: Parts with height/radius encoding a second variable
    required: true
  - element: legend-or-scale
    encodes: Explanation of what height/radius represents
    required: true

parameters:
  encoding_method: "height | radius | symbols-in-segment | arc-subdivision"
  variable_type: "quantitative second variable"

related:
  - slug: pie-chart
    relationship: variant-of
  - slug: three-dimensional-pie-chart
    relationship: combines-with

warnings:
  - "Accuracy in decoding graphical methods is generally marginal"
  - "An explanation and/or scale is required for viewer to decode the information"
  - "Visual complexity increases significantly"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["variable-height pie chart", "elevated pie chart"]
  typical_use: "showing two variables simultaneously - part-of-whole plus a second measure"
  encoding_variations:
    - "heights of individual segments"
    - "radii of individual segments"
    - "symbols placed in segments (e.g., framed rectangles)"
    - "subdividing each segment radially into two pieces"
    - "subdividing the arc of each segment"
---

## Description

A multiheight pie chart encodes an additional quantitative variable beyond the standard part-to-whole relationship. While the angular size of each segment still represents its proportion of the whole, a second variable is encoded through variations in segment height, radius, or other visual properties.

Harris describes several methods for encoding additional variables:
1. **Height variation**: Each segment has a different vertical height
2. **Radius variation**: Each segment extends to a different distance from center
3. **Symbols in segments**: Framed rectangles or other markers encode values
4. **Radial subdivision**: Each segment divided into pieces that sum to 100%
5. **Arc subdivision**: The arc of each segment broken into sub-percents

## Examples

Harris illustrates multiple encoding methods (p. 285):
> "Additional variable encoded into the heights of the individual segments. Sometimes called multiheight."

And:
> "Additional variable encoded into radii of the individual segments"

Examples show segments labeled A, B, C, D with varying heights or radii, plus a variation where:
> "With this variation, each segment of the pie is divided into two pieces. The radii of the two pieces add to 100%."

Another variation shows:
> "Each segment is divided into two pieces, the sum of which equal 100%. Each segment could have been divided into 3 or 4 pieces."

## Usage

**When to use:**
- When two related variables need simultaneous display
- When showing both proportion and magnitude for each category
- In analytical contexts where bivariate relationships matter

**Design requirements:**
- Always include legend or scale explaining the second encoding
- Consider whether numeric values should supplement the visual encoding
- Ensure the additional encoding doesn't overwhelm the primary part-to-whole message

**Limitations:**
- Viewers find it difficult to accurately decode non-angular visual variables
- Graphics serve primarily to orient the reader; actual numbers provide exact values
- Complexity may reduce comprehension speed

## Notes

The multiheight pie chart attempts to pack more information into the pie chart format, but at a cost to readability. Harris notes that "with all graphical methods, the accuracy in decoding is generally marginal." The technique works best when the goal is to show general patterns rather than enable precise value reading.

For situations requiring accurate comparison of two variables, separate charts or a different chart type (like a scatter plot) may be more effective.
