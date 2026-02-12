---
name: Circle Graph
slug: circle-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Circle Graph, p. 73"

intent: Show relative sizes of components to one another and to the whole using a divided circle with a quantitative circumference scale
direction: both

components:
  - element: divided-circle
    encodes: The whole being analyzed, divided into wedge-shaped segments
    required: true
  - element: circumference-scale
    encodes: Quantitative scale around the circle (typically 0-100%)
    required: true
  - element: tick-marks
    encodes: Scale divisions on the circumference (internal or external)
    required: true
  - element: segment-labels
    encodes: Names and/or values of each component
    required: true

parameters:
  scale_range: zero_to_100_percent | custom
  scale_direction: clockwise | counterclockwise
  zero_position: top | right | other
  tick_position: internal | external

related: []

warnings:
  - "Same visual limitations as pie charts regarding comparison accuracy"

extensions:
  harris_entry: "Circle Graph"
  alternate_names: ["circular percentage graph"]
  typical_use: "showing part-to-whole relationships with precise percentage reading"
  scale_type: "one-axis graph"
---

## Description

A circle graph looks and functions like a pie chart. The only difference is that the circle graph has a scale around the circumference which classifies it as a graph. A circle graph has no radial scale and therefore is considered a one-axis graph.

## Examples

Harris illustrates a circle graph with typical characteristics (p. 73):

> The example shows a circle divided into four segments (Vans 20/10%, Trucks 70/35%, Buses 50/25%, Cars 60/30%). Around the circumference is a percentage scale from 0% at the top, increasing clockwise through 10%, 20%, 30%, 40%, 50% at the bottom, continuing through 60%, 70%, 80%, 90% back to 100%/0% at the top.

> Tick marks appear on the outside of the circle at regular intervals (every 10%).

Typical characteristics of the circular scale:
- It is almost always linear
- Units of measure can be anything but usually are percent
- Can have any lower and upper value; typically 0% to 100%
- Zero and 100% are frequently located at the top of the circle
- Values can proceed in either direction; typically increase clockwise
- Tick marks can be internal or external; external is typical

## Usage

Circle graphs serve the same purpose as pie charts - showing how parts relate to each other and to a whole - but add a quantitative scale for more precise reading of values.

Many observations that apply to pie charts also apply to circle graphs, including:
- Best for showing a small number of segments
- Difficult to compare non-adjacent segments accurately
- Most effective when one segment dominates or when showing simple proportions

## Notes

The addition of a circumference scale technically transforms the pie chart (a proportional chart without scales) into a graph. This distinction matters in Harris's classification system where graphs are defined by having quantitative scales.
