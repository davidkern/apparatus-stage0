---
name: Circular Symbol Scale
slug: circular-symbol-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Scales for circular symbols, p. 337"

intent: Provide a legend that relates circle size to quantitative values in proportional symbol displays
direction: both

components:
  - element: reference-circles
    encodes: Sample circles at known values for comparison
    required: true
  - element: value-labels
    encodes: Numeric values corresponding to each reference circle
    required: true
  - element: scale-type-indicator
    encodes: Whether circles use absolute or apparent-magnitude sizing
    required: false

parameters:
  scaling_method: "absolute | apparent-magnitude (modified)"
  circle_arrangement: "nested | linear | ramped"
  value_range: "minimum and maximum values represented"

related: []  # TBD: bubble-graph, proportional-symbol-map

warnings:
  - "Viewers tend to underestimate the relative sizes of larger circles"
  - "Modified (apparent-magnitude) circles compensate for perceptual bias"
  - "Clearly indicate whether absolute or modified scaling is used"

extensions:
  harris_entry: "Scale"
  typical_use: "bubble graphs, proportional symbol maps"
  perceptual_issue: "area perception does not scale linearly with actual area"
---

## Description

When symbols such as circles are used to convey quantitative information (as in bubble graphs or proportional symbol maps), a scale or legend is normally required so the viewer can relate the symbol size to a value. Several methods exist for constructing such scales.

Studies on circles have shown that viewers tend to underestimate the relative sizes of larger circles. To compensate for this perceptual problem, techniques have been developed to systematically enlarge circles in proportion to their diameters, meaning the larger the circle, the greater the enlargement. Circles sized this way are called "modified" or "apparent-magnitude" circles, while unadjusted circles are called "absolute" circles.

## Examples

> "Studies on circles have shown that viewers tend to underestimate the relative sizes of larger circles. In order to compensate for this problem, techniques have been developed to systematically enlarge the circles in proportion to their diameters, i.e., the larger the circle, the greater the enlargement." (p. 337)

The PDF illustrates several scale formats:
1. **Strung out**: Circles arranged in a row with values labeled (e.g., 1,000; 500; 250; 100)
2. **Nested**: Circles stacked concentrically, sharing a common baseline
3. **Ramped**: Circles arranged along a diagonal with values
4. **Diameters**: Circles shown with diameter measurements

A comparison diagram shows modified circles alongside unmodified circles for the same values (100, 250, 500, 1,000, 2,000), demonstrating how the difference between modified and unmodified becomes greater as circles get larger.

## Usage

Scale formats for circular symbols:
- **Strung out/Linear**: Easy to compare individual sizes
- **Nested**: Space-efficient, shows size relationships
- **Ramped**: Combines linear arrangement with visual progression

The scale can be:
- Linear or logarithmic
- Using absolute (area-proportional) or modified (perception-corrected) circles

Modified circles are used primarily on maps where accurate size perception is critical.

## Notes

> "Sometimes the unadjusted circles are referred to as having an absolute scale and the modified circles as having an apparent-magnitude scale. Modified circles are used primarily on maps." (p. 337)

When designing proportional symbol displays, consider whether perceptual accuracy or mathematical precision is more important. For technical audiences who will read exact values, absolute scaling may be appropriate. For general audiences making visual comparisons, apparent-magnitude scaling may improve accuracy of interpretation.
