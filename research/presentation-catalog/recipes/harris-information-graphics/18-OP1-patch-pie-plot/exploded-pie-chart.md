---
name: Exploded Pie Chart
slug: exploded-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Methods for highlighting selected segments, p. 283"

intent: Emphasize selected segments of a pie chart by separating them from the main body of the pie
direction: both

components:
  - element: circle
    encodes: The whole (100%) being divided into parts
    required: true
  - element: segments
    encodes: Individual parts as wedge-shaped slices
    required: true
  - element: separated-segment
    encodes: Emphasized segment pulled away from center
    required: true
  - element: gap
    encodes: Visual separation between exploded segment and main pie
    required: true

parameters:
  segments_exploded: "one | several | all"
  separation_distance: "small | medium | large"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "The more segments that are exploded, the less effective the technique becomes"
  - "Exploding all segments reduces emphasis since nothing stands out"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["separated pie chart"]
  typical_use: "drawing attention to one or more specific segments"
  highlight_methods:
    - "distinctive color, shade, or fill"
    - "separation from main body (exploded)"
    - "tilting with depth and segment in front"
    - "elevating segment height (multiheight)"
---

## Description

An exploded pie chart is a variation of a standard pie chart where one or more segments are physically separated from the main body of the pie to draw attention to them. This visual separation creates emphasis by pulling the selected wedge(s) away from the center point, creating a gap between the exploded segment and the remaining pie.

The technique is one of several methods for highlighting selected segments. Harris identifies four main approaches:
1. Apply distinctive color, shade, or fill to selected segment(s)
2. Separate the segment(s) from the main body (exploded/separated)
3. Graphically tilt (elongate) the pie chart with selected segment(s) in front
4. Elevate the selected segment(s) (multiheight pie chart)

These methods can be used separately or combined for greater effect.

## Examples

Harris illustrates (p. 283) four variations of highlighting techniques applied to the same pie chart:
> "Segment highlighted by separating it from the main chart (called exploded or separated)"

The example shows a single dark segment pulled away from the main circular body of the pie, creating clear visual separation.

## Usage

**When to use:**
- To draw viewer attention to a specific data point
- To emphasize the most important segment
- When one category is the focus of discussion

**Effectiveness considerations:**
- Most effective with a single exploded segment
- Any number of segments can be exploded, ranging from one to all
- The more segments exploded, the less effective the technique becomes
- Exploding all segments essentially removes the emphasis effect

**Combining techniques:**
- Can combine explosion with distinctive color for stronger emphasis
- Can combine with 3D tilting for additional visual impact
- Can combine with multiheight for complex emphasis

## Notes

The exploded pie chart trades some of the visual unity of the standard pie chart for emphasis capability. When multiple segments need emphasis, consider whether other highlighting methods (color, pattern) might be more effective while maintaining the visual coherence of the complete circle.
