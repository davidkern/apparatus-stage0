---
name: Three-Dimensional Pie Chart
slug: three-dimensional-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Pie charts with the appearance of depth, p. 285"

intent: Improve the visual appearance of pie charts by adding the illusion of depth through tilting and perspective
direction: both

components:
  - element: tilted-circle
    encodes: The whole shown at an angle to create depth illusion
    required: true
  - element: segments
    encodes: Individual parts rendered with visible thickness
    required: true
  - element: front-face
    encodes: Top surface of the tilted pie showing proportions
    required: true
  - element: side-surfaces
    encodes: Visible edges creating depth effect
    required: true

parameters:
  tilt_direction: "forward | backward"
  depth_amount: "shallow | medium | deep"
  segment_position: "front-emphasis | back-emphasis | neutral"

related:
  - slug: pie-chart
    relationship: variant-of
  - slug: exploded-pie-chart
    relationship: combines-with

warnings:
  - "When the effect is applied, some or all of the segments are distorted"
  - "Observations based only on the graphics can be misleading"
  - "Segments in front appear larger than they actually are"
  - "Segments at the back appear smaller than their true proportion"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["3D pie chart", "perspective pie chart"]
  typical_use: "improving visual appeal in presentations; highlighting front segments"
  distortion_note: "The depth effect systematically distorts perception of segment sizes"
---

## Description

Three-dimensional pie charts are pie charts given the appearance of depth through tilting and rendering with visible thickness. The technique can be applied to complete pie charts or to individual segments. While the effect improves visual appeal, it introduces distortion that can make accurate interpretation more difficult.

Harris identifies this as one of the methods for highlighting selected segments: "Graphically tilt (elongate) the pie chart with the selected segment(s) in front."

The pie can be tilted forward or backward, with segments positioned strategically. When tilted backward, front segments appear more prominent. When tilted forward, the effect is reversed.

## Examples

Harris illustrates three variations (p. 285):
> "Examples of complete pie charts with the appearance of depth"

The examples show:
- "Tilted backward" - standard 3D effect with depth visible at bottom
- "Tilted forward" - depth visible at top
- "Tilted backward with segment exploded" - combining 3D with explosion

Individual segments with depth are also shown in a time series (1991, 1992, 1993) where single 3D segments show 20%, 45%, and 70% respectively.

## Usage

**When to use:**
- In presentations where visual appeal is prioritized
- When highlighting a specific segment by placing it in front
- For individual segment displays in infographics

**When to avoid:**
- When accurate visual comparison of segments is critical
- In analytical or scientific contexts
- When small differences between segments matter

**Positioning strategy:**
- Place the segment to be emphasized at 6 o'clock position when tilted
- This position creates maximum visual prominence
- Combine with other emphasis techniques (color, explosion) for stronger effect

## Notes

The three-dimensional effect is fundamentally decorative rather than informative. The depth adds no additional data encoding and introduces systematic distortion. Segments positioned at the front of a tilted pie appear larger than their actual proportion, while segments at the back appear smaller.

Harris notes that "observations based only on the graphics can be misleading" - viewers should rely on numeric labels rather than visual estimation when accuracy matters.
