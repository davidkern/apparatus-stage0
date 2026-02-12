---
name: Stepped Area Graph
slug: stepped-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Graph, Stepped area graph, p. 17"

intent: Emphasize discrete changes in data that remain constant between change points, using horizontal and vertical segments rather than diagonal lines
direction: both

components:
  - element: stepped-curve
    encodes: Data line consisting of horizontal and vertical segments forming a staircase pattern
    required: true
  - element: filled-area
    encodes: Shaded region between stepped curve and horizontal axis
    required: true
  - element: horizontal-segments
    encodes: Level portions showing constant values between changes
    required: true
  - element: vertical-segments
    encodes: Transitions between different value levels
    required: true
  - element: plot-symbols
    encodes: Markers at data points (may be at left, center, or right of horizontal segments)
    required: false

parameters:
  symbol_position: left | center | right
  horizontal_scale_type: category | sequence | quantitative

related: []  # TBD: see also simple-area-graph

warnings:
  - "Symbol position conveys meaning: left indicates start, center indicates average, right indicates end of the constant period"

extensions:
  harris_entry: "Area Graph"
  alternate_names: ["left stepped graph", "center stepped graph", "right stepped graph"]
  typical_use: "displaying prices, interest rates, plant capacity, or other values that change abruptly and remain constant"
---

## Description

Stepped area graphs are sometimes used to differentiate various data series more clearly, to highlight differences or comparisons rather than trends, and to emphasize the nature of the data such as abrupt changes and then constant values. They are particularly appropriate for data like prices, interest rates, or plant capacity that change abruptly and then remain level for a period of time.

The stepped curve consists of horizontal segments (showing constant values) and vertical segments (showing transitions between values), creating a staircase pattern that is then filled to create the area graph.

## Width of Horizontal Portions

The width of horizontal portions depends on the scale type:

- **Category scale**: The widths of the horizontal portions of the curve are as wide as the space allocated to each category
- **Sequence or quantitative scale**: The horizontal portions of the curve extend from data point to data point, regardless of how near or far apart the points are

Plot symbols may or may not be used to designate the data points.

## Examples

> "Stepped area graphs are sometimes used to differentiate various data series more clearly, to highlight differences or comparisons rather than trends, and to emphasize the nature of the data such as abrupt changes and then constant values - for example, prices, interest rates, plant capacity, etc., that change abruptly and then remain level for a period of time." (p. 17)

The PDF (p. 17) shows an example of a selling price chart from '90 to '95, where the stepped format "clearly illustrates when the price changed, by how much, and how long each price was in effect."

## Location of Plotting Symbols

The locations of plotting symbols on stepped area graphs convey additional information about the data:

| Symbol Position | Name | Meaning |
|-----------------|------|---------|
| Left end | Left stepped graph | Actions or processes start at these points, causing the curve to move to a new level |
| Center | Center stepped graph | Values are averages over a period of time |
| Right end | Right stepped graph | Actions or processes stop at these points |

The PDF (p. 17) illustrates all three variants with examples showing how the symbol placement changes the visual emphasis.

## Stepped versus Segmented Curves

Depending on the nature of the data and what one is attempting to accomplish, a stepped graph can sometimes highlight differences and similarities more dramatically than an area graph using segmented lines. As shown in the comparison on page 17:

- **Segmented version** tends to give a better impression of how two series compare
- **Stepped version** accentuates the differences and similarities more dramatically

## Usage

Stepped area graphs are appropriate when:
- Data changes abruptly then remains constant (prices, rates, capacity)
- You want to emphasize when changes occurred and how long values persisted
- Highlighting differences between data series is more important than showing smooth trends
- The discrete nature of the data should be emphasized

Stepped area graphs are less appropriate when:
- Data changes continuously
- Smooth trends are more important than discrete changes
- Interpolation between points is meaningful

## Notes

The curves on area graphs almost always progress from left to right. Although it is technically possible to have them run up and down, it is only occasionally done, probably because area graphs are so firmly associated with time series, and time series typically progress from left to right.
