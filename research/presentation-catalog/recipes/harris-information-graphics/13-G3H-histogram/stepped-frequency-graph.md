---
name: Stepped Frequency Graph
slug: stepped-frequency-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, p. 192"

intent: Display frequency distribution using a continuous stepped outline without internal column divisions
direction: both

components:
  - element: stepped-outline
    encodes: Frequency values as continuous silhouette
    required: true
  - element: class-intervals
    encodes: Value ranges along horizontal axis
    required: true
  - element: vertical-axis
    encodes: Frequency
    required: true
  - element: horizontal-axis
    encodes: Class interval values
    required: true

parameters:
  fill: "filled | outline only"

related: []  # TBD: histogram, silhouette-graph

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  typical_use: "cleaner appearance for frequency distributions"
---

## Description

A stepped frequency graph is functionally identical to a histogram but with the internal lines between columns eliminated. The result is a continuous stepped silhouette showing the frequency distribution. This variation is primarily used for aesthetic reasons, providing a cleaner appearance while conveying the same information.

## Examples

Harris describes this variation (p. 192):

> "Typically a histogram is made up of a series of columns. Occasionally, primarily for appearance, the lines between the columns are eliminated and the figure becomes a stepped frequency graph."

On equivalence to histogram:
> "Functionally a stepped frequency graph is the same as a histogram."

The accompanying figure shows the characteristic stair-step outline without vertical lines separating individual columns.

## Usage

Stepped frequency graphs are appropriate when:
- A cleaner visual appearance is desired
- The focus is on the overall distribution shape rather than individual interval values
- Reducing visual complexity in a presentation or report

Since it is functionally identical to a histogram, all the same interpretive techniques apply. The choice between histogram and stepped frequency graph is purely stylistic.

## Notes

This is one of several smoothing or simplification techniques Harris describes for histograms. Others include frequency polygons (connecting midpoints with lines) and density trace curves (using overlapping intervals).
