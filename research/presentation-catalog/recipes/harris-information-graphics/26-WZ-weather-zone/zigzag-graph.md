---
name: Zigzag Graph
slug: zigzag-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Zigzag Graph, p. 443"

intent: Connect data points with straight lines to show values across a sequence, creating a zigzag pattern
direction: both

components:
  - element: data-points
    encodes: Individual values at each position
    required: true
  - element: connecting-lines
    encodes: Straight line segments between adjacent points
    required: true
  - element: horizontal-axis
    encodes: Sequence, time, or categories
    required: true
  - element: vertical-axis
    encodes: Quantitative values
    required: true

parameters:
  line_style: solid | dashed
  markers: visible | hidden

related: []  # TBD: line-graph, segmented-line-graph

warnings:
  - "Straight line connections may imply interpolation between actual data points"

extensions:
  harris_entry: "Zigzag Graph"
  alternate_names: ["fever graph", "thermometer graph", "broken line graph", "segmented line graph"]
  typical_use: "showing values over time or sequence, tracking trends"
---

## Description

A zigzag graph is a variation of a line graph in which the data points are connected by straight lines. The resulting visual appearance shows a series of connected line segments that typically rise and fall, creating a zigzag pattern.

This is one of the most common forms of line graph, used extensively for time series and sequential data.

## Examples

> "Sometimes referred to as fever, thermometer, broken line, or segmented line graph. A zigzag graph is a variation of a line graph in which the data points are connected by straight lines, as shown at the right." (p. 443)

Harris illustrates a zigzag graph with values ranging from 0-10 showing the characteristic pattern of connected straight line segments moving up and down as values change.

## Usage

Zigzag graphs are appropriate for:
- Time series data
- Sequential measurements
- Trend visualization
- Comparing patterns across data series

### Alternative Names Context

The various names reflect different contexts of use:
- **Fever/thermometer graph**: Medical context (patient temperature over time)
- **Broken line graph**: Emphasizes the discrete nature of connections
- **Segmented line graph**: Technical description of the construction method

### Interpretation

The straight line connections between points:
- Show the direction and magnitude of change
- Do not necessarily represent actual intermediate values
- Create visual patterns (trends, cycles, volatility) at a glance

## Notes

The zigzag graph is perhaps the most familiar form of line graph to general audiences. Its simplicity makes it effective for communicating trends and changes over time, though users should understand that the lines between points are visual connections rather than measured values.
