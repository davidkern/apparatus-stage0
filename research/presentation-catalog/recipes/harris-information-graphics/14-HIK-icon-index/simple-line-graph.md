---
name: Simple Line Graph
slug: simple-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Simple line graph, p. 207"

intent: Display a single data series as connected points to show trends, patterns, or relationships over a sequence or quantitative range
direction: both

components:
  - element: data-points
    encodes: Individual values in the data series
    required: true
  - element: connecting-line
    encodes: Continuity and trend between data points
    required: true
  - element: vertical-axis
    encodes: Quantitative scale for the measured values
    required: true
  - element: horizontal-axis
    encodes: Category, sequence, or quantitative scale for the independent variable
    required: true
  - element: plotting-symbols
    encodes: Location of actual data points (optional)
    required: false

parameters:
  line_type: "segmented | stepped | smooth curve"
  horizontal_scale: "category | sequence | quantitative"
  show_symbols: "yes | no"

related: []  # TBD: see also grouped-line-graph, area-graph

warnings:
  - "With category scales, all categories must be shown for proper interpretation"
  - "Smooth curves imply interpolation that may not reflect actual data behavior"
  - "When quantitative scales are on both axes, connection order affects meaning"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["curve graph", "fever graph", "thermometer graph", "zigzag graph"]
  typical_use: "showing trends over time, displaying continuous relationships"
---

## Description

A simple line graph displays a single data series. It typically has a quantitative scale on the vertical axis and a category, quantitative, or sequence scale on the horizontal axis. The graph is constructed by plotting data points and connecting them with lines.

Three major line types are used:
- **Segmented line**: Straight lines connect adjacent data points (also called broken, fever, thermometer, or zigzag graph)
- **Stepped line**: Horizontal and vertical segments create a staircase pattern
- **Smooth curve**: A curved line passes through or near the data points

Plotting symbols may or may not be shown at the actual data point locations.

## Examples

Harris shows simple line graphs with three scale types on the horizontal axis:

> "With the category scale, a data point is located directly above every label (category) on the horizontal scale. All categories must be shown on the scale in order for the viewer to properly interpret the graph." (p. 207)

Examples include:
- Category scale: Blue, Red, White, Tan, Gray on horizontal axis
- Sequence scale: Years '95, '96 on horizontal axis
- Quantitative scale: Numeric values 0-14 on horizontal axis

Harris also demonstrates that positive and negative values can be plotted on quantitative scales on either axis, with the zero baseline clearly marked.

## Usage

Simple line graphs are appropriate when:
- Showing how one variable changes across a sequence or continuous range
- Emphasizing trends and patterns in time series data
- The relationship between variables is more important than individual values
- A single data series is being presented

Scale type selection:
- **Category scale**: Use when horizontal values are discrete named items
- **Sequence scale**: Use for time series or ordinal data
- **Quantitative scale**: Use when both variables are numeric measurements

When quantitative scales are used on both axes, the graph is sometimes called a simple XY line graph.

## Notes

The choice between segmented, stepped, and smooth curve lines should reflect the nature of the data. Segmented lines are most common and make no assumptions about values between points. Stepped lines emphasize discrete changes. Smooth curves suggest continuous underlying processes but may imply more precision between points than the data supports.
