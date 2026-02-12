---
name: Drop Line Graph
slug: drop-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Point Graph and Scatter Graph, Drop lines used with point and scatter graphs, p. 294"

intent: Improve readability of point graphs by adding faint lines extending from data points to axes, between points, or across the graph
direction: both

components:
  - element: data-points
    encodes: Individual data values as positioned symbols
    required: true
  - element: drop-lines
    encodes: Reference lines connecting points to axes or other points
    required: true
  - element: axes
    encodes: Reference frame for reading values
    required: true

parameters:
  line_destination: "to-axis | full-length | between-points"
  line_style: "solid | dashed"
  application: "value-reading | difference-highlighting | 3D-clarity"

related:
  - slug: point-graph
    relationship: variant-of
  - slug: scatter-graph
    relationship: variant-of

warnings:
  - "Too many drop lines can create visual clutter"
  - "On 3D graphs, drop lines help with two axes but third remains difficult"

extensions:
  harris_entry: "Point Graph and Scatter Graph"
  alternate_names: []
  typical_use: "improving value estimation; highlighting differences; clarifying 3D graphs"
---

## Description

Drop lines are faint lines extending from data points to an axis, from one data point to another, or in some cases extending completely across the graph. The lines might be solid or dashed and can be used with two- and three-dimensional graph formats.

The major function of drop lines is to improve the readability of graphs. Point graphs with drop lines are sometimes substituted for column and bar graphs because they focus the viewer's attention on the data points instead of the data graphics. They also tend to reduce problems associated with scale breaks and missing portions of scales.

## Examples

Harris illustrates multiple drop line applications (p. 294):

**To horizontal axis:**
> "The drop lines in the example on the left extend from the data points to the horizontal axis."

**Full length:**
> "In the example on the right, the drop lines run the full length of the graph to deemphasize the distance from the point to the zero axis and instead, focus attention on the location of the data point itself."

**Multiple data series:**
> "In the example on the left, the data points of the two data series use common values on the horizontal axis. In the example on the right, each data point has a unique pair of X and Y values. Different types of drop lines are used to assist in differentiating the two sets of data points."

**Highlighting differences:**
> "When the emphasis is on differences, drop lines can be drawn between data points to make what is sometimes called a drop line graph. Differences may be noted at a fixed point in time (left) or over time (right). Two different types of drop lines can be used to indicate reversals in the direction of the difference."

**Three-dimensional:**
> "Drop lines can be of particular value with three-dimensional graphs. They help the viewer more accurately estimate values on two axes; however, the values on the third axis are still a problem."

## Usage

**Drop lines to axis:**
- Show distance from zero
- Aid in reading values
- Similar function to bar/column but with less visual weight

**Full-length drop lines:**
- Deemphasize absolute magnitude
- Focus attention on point position
- Useful when zero baseline is less important than relative position

**Drop lines between points:**
- Highlight differences between data series
- Show magnitude of gaps
- Can use different line styles for direction of difference

**Horizontal drop lines (whole and pieces):**
- Display totals and components together
- Alternative to stacked bars
- Components and total visible in same visual space

**Three-dimensional applications:**
- Help with value reading on two axes
- Third axis values remain difficult
- With few points, actual values can be noted directly

## Notes

Drop lines bridge the gap between point graphs and bar/column graphs. They provide some of the value-reading assistance that bars offer while maintaining the visual simplicity of points. This makes them useful when the goal is to compare positions rather than emphasize magnitudes.

The technique is particularly valuable for 3D scatter graphs, where the inherent difficulty of reading values makes any additional reference helpful. However, Harris notes the fundamental limitation remains: drop lines help with two dimensions but the third axis value estimation stays problematic.
