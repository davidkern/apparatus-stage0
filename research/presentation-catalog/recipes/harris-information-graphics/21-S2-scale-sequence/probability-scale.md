---
name: Probability Scale
slug: probability-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Probability scale, p. 336"

intent: Configure a scale for probability graphs that linearizes normally distributed cumulative frequency data
direction: both

components:
  - element: tick-marks
    encodes: Percent values from near 0% to near 100%
    required: true
  - element: labels
    encodes: Cumulative percent values (e.g., 0.01, 1, 5, 10, 20, 50, 80, 90, 95, 99, 99.99)
    required: true
  - element: axis-line
    encodes: Reference line along which scale is drawn
    required: true
  - element: symmetric-spacing
    encodes: Mirror image spacing around 50% center point
    required: true

parameters:
  lower_bound: "smallest percent value shown (e.g., 0.01%)"
  upper_bound: "largest percent value shown (e.g., 99.99%)"

related: []  # TBD: linear-scale, logarithmic-scale

warnings:
  - "No distances between any two major tick marks on the same side of the scale are equal"
  - "The scale cannot reach exactly 0% or 100%"

extensions:
  harris_entry: "Scale"
  typical_use: "probability graphs for testing normal distribution"
  scale_property: "non-uniform spacing designed to linearize normal distribution"
---

## Description

A probability scale is one of the lesser-used quantitative scales, labeled in percent and used on probability graphs to determine whether a data series has a normal distribution. The scale is constructed such that if the cumulative percent frequencies of a data series form a straight line when plotted, the data series has a normal distribution.

The spacing on a probability scale is distinctive: no distances between any two major tick marks on the same side of the scale are the same. However, the spacings on the right side (above 50%) are mirror images of those on the left side (below 50%). The scale is compressed at the extremes (near 0% and near 100%) and expanded near the middle (around 50%).

## Examples

> "One of the lesser-used scales is labeled in percent and is used on a probability graph to determine whether a data series has a normal distribution. If the cumulative percent frequencies of a data series form a straight line when plotted on a graph with this type of scale, it indicates that the data series has a normal distribution." (p. 336)

The PDF illustrates a probability scale with values: .01, .1, 1, 5, 10, 20, 30, 50, 70, 80, 90, 95, 99, 99.9, 99.99. Note the symmetric but non-uniform spacing around the 50% center point.

## Usage

Probability scales are appropriate when:
- Testing whether data follows a normal (Gaussian) distribution
- Analyzing cumulative frequency data
- Creating probability plots or normal probability paper
- Quality control applications requiring normality testing

Probability scales are inappropriate when:
- Working with non-percentage data
- The goal is to show absolute values rather than distribution characteristics
- The audience is unfamiliar with statistical probability analysis

## Notes

The mathematical basis for probability scale spacing derives from the inverse cumulative distribution function (probit function) of the normal distribution. This transformation converts the S-shaped cumulative normal distribution curve into a straight line, making visual assessment of normality straightforward.
