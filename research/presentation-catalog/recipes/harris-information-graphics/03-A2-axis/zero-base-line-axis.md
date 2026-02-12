---
name: Zero Base Line Axis
slug: zero-base-line-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Zero base line axis for quantitative scales, p. 22"

intent: Establish the reference line from which quantitative values are measured on a graph
direction: both

components:
  - element: base-line
    encodes: The zero reference from which values are measured
    required: true
  - element: origin-point
    encodes: The intersection defining the graph origin
    required: true
  - element: perpendicular-axis
    encodes: The quantitative axis running perpendicular to the base line
    required: true

parameters:
  position: bottom | top | middle | outside
  visibility: shown | implied

related: []  # TBD: see also quantitative-axis, reference-axis

warnings:
  - "Zero base line axes exist whether or not they are actually drawn on a graph"
  - "If zero is outside the graph range, the zero base line will also be outside and not shown"

extensions:
  harris_entry: "Axis, Graph"
  functions:
    - "Reference line from which quantitative values are measured"
    - "Defines the origin of the graph"
    - "Forms two-dimensional quadrants and three-dimensional octrants"
    - "Runs perpendicular to quantitative axes"
---

## Description

The zero base line axis serves as the fundamental reference from which quantitative values are measured on rectangular graphs. It defines the origin of the graph and establishes the baseline for all data point positions. In two-dimensional graphs, the zero base line axes form the traditional four quadrants. In three-dimensional graphs, they form octrants and the base planes from which values along each axis are measured.

Harris emphasizes that zero base line axes exist whether or not they are actually drawn on a graph. Their conceptual presence establishes the measurement reference even when not visually displayed.

## Examples

> "Zero base line axes on rectangular graphs serve as reference lines from which quantitative values are measured in order to establish the proper location of data points." (p. 22)

Harris illustrates four common locations for the Y-axis zero base line:
1. Zero base line axis located at bottom (most common)
2. Zero base line axis located at top
3. Zero base line axis located between top and bottom
4. Zero base line axis located outside of graph (not shown)

> "The zero base line axis is independent of the label axis." (p. 22)

Three variations show the same data with different label axis positions, but the zero base line remains unchanged at the bottom.

## Usage

The zero base line should be positioned based on the data range:
- At bottom when all values are positive
- At top when all values are negative
- Between top and bottom when values span positive and negative
- May be outside graph when scale is truncated (though this should be indicated)

In three-dimensional graphs, the X and Y base line axes form the plane from which Z values are measured.

## Notes

Although the zero base line axis often serves as the label axis, this is not a requirement. Harris demonstrates that label axes can appear at the bottom, top, or be omitted entirely while the zero base line axis remains in its fixed position relative to the data.
