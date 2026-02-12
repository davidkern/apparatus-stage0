---
name: Abscissa
slug: abscissa
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Abscissa, p. 7"

intent: Identify and understand the horizontal axis component of a two-dimensional graph and its role in positioning data points
direction: both

components:
  - element: horizontal-axis
    encodes: The X-axis on a two-dimensional graph
    required: true
  - element: zero-reference
    encodes: The origin point from which distances are measured
    required: true
  - element: data-point-distance
    encodes: The horizontal distance a data point is located from zero
    required: true

parameters:
  scale_type: category | sequence | quantitative

related: []  # TBD: see also ordinate, axis

extensions:
  harris_entry: "Abscissa"
  alternate_names: ["X-axis", "horizontal axis", "abscissa axis"]
  typical_use: "positioning data points horizontally on a graph"
---

## Description

The abscissa refers to two related concepts in graph construction: (1) the horizontal or X-axis on a two-dimensional graph, and (2) the distance a data point is located from zero along that horizontal axis. The term "abscissa axis" is a technical name for the horizontal axis itself.

Understanding the abscissa is fundamental to reading and constructing graphs, as it determines where data points are positioned horizontally. The abscissa works in conjunction with the ordinate (vertical axis) to define the two-dimensional coordinate system used in most graphs.

## Examples

> "The distance a data point is located from zero along the horizontal axis of a graph." (p. 7)

> "A technical name for the horizontal or X-axis on a two-dimensional graph." (p. 7)

## Usage

The abscissa is used in virtually all two-dimensional graphs. When constructing a graph:

- Position the abscissa as the horizontal axis
- Establish a zero reference point where it intersects the vertical axis (ordinate)
- Measure data point positions as distances from zero along this axis
- Choose an appropriate scale type (category, sequence, or quantitative) based on the data

When reading a graph:

- Identify the abscissa to understand what variable is represented horizontally
- Note the scale type and units to correctly interpret data point positions
- Read values by projecting from data points down to the horizontal axis

## Notes

The term "abscissa" comes from Latin and is part of the formal mathematical vocabulary for Cartesian coordinate systems. In common usage, "horizontal axis" or "X-axis" are more frequently used terms, but "abscissa" appears in technical and mathematical contexts.
