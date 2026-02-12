---
name: Proportional Symbol
slug: proportional-symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, pp. 379-381"

intent: Encode quantitative values through symbol size so that larger values are represented by larger symbols
direction: both

components:
  - element: symbol-shape
    encodes: Consistent shape across all values (typically circles)
    required: true
  - element: symbol-size
    encodes: Quantitative value (area or diameter proportional to value)
    required: true
  - element: legend
    encodes: Scale relating symbol sizes to values
    required: true
  - element: reference-symbols
    encodes: Known sizes for comparison in legend
    required: true

parameters:
  scale_type: absolute | apparent-magnitude
  size_basis: area | diameter | volume
  legend_style: nested | ramped | aligned | separate

related: []  # TBD: see symbol, framed-rectangle-symbol

warnings:
  - "Studies on circles have shown that viewers tend to underestimate the relative sizes of larger circles"
  - "There is not universal agreement as to whether absolute or apparent-magnitude scale should be used"
  - "A scale or legend is normally required when symbols encode quantitative information"

extensions:
  harris_entry: "Symbol"
  alternate_names: ["graduated symbol", "scaled symbol"]
  typical_use: "Maps with regional values, bubble charts"
  perceptual_issue: "Area underestimation increases with circle size"
---

## Description

When symbols are used to encode quantitative information, their size can be varied in proportion to the values they represent. This technique is particularly common with circular symbols on maps and in bubble charts. The approach creates an immediate visual impression of relative magnitudes across the display.

Harris notes a critical perceptual issue: viewers systematically underestimate the relative sizes of larger circles, which has led to the development of compensatory techniques.

## Examples

**Encoding quantitative information** (p. 379):
> "In graphs, the sizes, shapes, and colors of the plot symbols are sometimes varied in proportion to the values they represent. In maps and tables, the size of the symbols are sometimes varied to denote different values."

The table on page 380 shows proportional encoding examples:
- Point symbols with size proportional to value (e.g., employee counts by size class)
- Line symbols with thickness proportional to value (e.g., messages per hour)
- Area symbols scaled to represent quantities (e.g., 500, 1000, 2000)

**Circle variations for quantitative encoding** (p. 381):
- Size proportional to value (single variable)
- Fill designates class interval
- Fill or dashed line proportional to value
- Size of segment proportional to value
- Number of circles proportional to value (count representation)

**For two or more variables:**
- Proportional sizes plus fill for class intervals
- Class interval (fill) plus segments for second variable
- Multiple segments within single circle
- Multiple circles plus color for class intervals

## Legend Construction

**Legend styles for proportional circles** (p. 381):

Harris illustrates several approaches:
1. **Strung out**: Circles arranged vertically with values labeled (can be linear or logarithmic)
2. **Nested**: Circles nested inside each other with value labels
3. **Ramped**: Circles arranged horizontally with values below
4. **Diameters**: Showing the relationship between diameter and value

## Apparent-Magnitude Scaling

**The underestimation problem** (p. 381):
> "Studies on circles have shown that viewers tend to underestimate the relative sizes of larger circles. In order to compensate for this problem, techniques have been developed to systematically enlarge the circles in proportion to their diameters, i.e., the larger the circle, the greater the enlargement."

**Terminology:**
> "Sometimes the unadjusted circles are referred to as having an absolute scale and the modified circles as having an apparent-magnitude scale."

Harris illustrates the difference between unmodified (absolute) and modified (apparent-magnitude) circles, showing how the difference becomes greater as circles get larger.

> "There is not universal agreement as to which scale should be used. ... Modified circles are used primarily on maps."

## Usage

**When to use proportional symbols:**
- Displaying regional quantities on maps
- Showing relative magnitudes across categories
- Creating visual hierarchies based on quantitative values

**Design considerations:**
- Always include a legend with reference sizes
- Consider whether to use absolute or apparent-magnitude scaling
- For maps, apparent-magnitude may improve accuracy of viewer interpretation
- Ensure sufficient size differentiation between value classes

**Alternative: Framed rectangle symbol** (p. 382):
Harris describes this alternative for encoding quantitative information with improved decoding accuracy:
> "Even though circles are widely used to encode quantitative information, there is a general concern about the accuracy of decoding such information. The framed rectangle symbol... offers an alternative that improves the accuracy of decoding."

## Notes

The perceptual challenge with proportional circles is well-documented in visualization research. Harris's presentation acknowledges the debate in the field about whether to compensate for this bias. The choice between absolute and apparent-magnitude scaling depends on the context, audience, and whether precise value reading or general impression is more important.
