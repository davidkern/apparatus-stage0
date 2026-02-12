---
name: Circular Area Graph
slug: circular-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Circular Area Graph, p. 73"

intent: Display quantitative data over a cyclical sequence (typically time) by wrapping a rectangular area graph into a circle
direction: both

components:
  - element: circular-axis
    encodes: Sequential scale (typically time series) around the circumference
    required: true
  - element: radial-axis
    encodes: Quantitative value scale from center outward
    required: true
  - element: filled-area
    encodes: Data values shown as shaded region between center and data line
    required: true
  - element: circular-grid-lines
    encodes: Concentric circles for reading values on radial axis
    required: false
  - element: radial-grid-lines
    encodes: Lines from center for reading positions on circular axis
    required: false

parameters:
  circular_scale_type: time_series | other_sequence
  circular_direction: clockwise | counterclockwise
  start_position: top | right | custom
  radial_lower_value: zero | other

related: []

warnings:
  - "Visual area distortion: same value creates larger visual area at outer radii than inner"
  - "More difficult to read precise values than rectangular equivalent"

extensions:
  harris_entry: "Circular Area Graph"
  alternate_names: []
  typical_use: "displaying cyclical/recurring data patterns, 24-hour cycles, seasonal patterns"
---

## Description

A circular area graph is the equivalent of a rectangular area graph wrapped into a circle. The horizontal axis of the rectangular graph becomes the circular axis of the circular graph and the vertical axis of the rectangular graph becomes the radius axis of the circular graph.

Sequential, particularly time series scales are frequently used on the circular axis. The quantitative value being measured is shown on the radial or value axis.

## Examples

Harris provides a daily power usage example (p. 73):

> The example represents average electric power usage recorded for a 24-hour period. The circular axis shows time from Midnight at the top, proceeding clockwise through 2AM, 4AM, 6AM, 8AM, 10AM, Noon, 2PM, 4PM, 6PM, 8PM, 10PM, and back to Midnight. The radial axis shows Kilowatts from center outward. The shaded area shows power usage varying throughout the day.

Major elements described:
- Circular axis with circular scale (normally sequential, frequently time series)
- Can have any upper and lower values
- Can progress in either direction
- Can start at any point on the circle
- Radial or value scale (can have any upper and lower values; lower value normally at center)
- Circular grid lines for radial axis
- Radial grid lines for circular axis
- Symbols for data points (many times not shown)
- Multiple data series can be plotted on the same graph

**Percent-of-the-whole variation** (p. 73):

> "A circular area graph can be used as a percent-of-the-whole or 100% graph. When used in this manner, the viewer can see how the relationships between the elements of a data series change over time - for example, the relative percent that each product line contributes to the overall sales of a company as the seasons change."

The example shows three product lines (A, B, C) stacked to total 100% at each month around the year.

## Usage

Circular area graphs are particularly effective for:
- Data with natural cycles (daily, weekly, monthly, yearly)
- Emphasizing the continuous, repeating nature of cyclical data
- Comparing values at the same point across cycles
- When the area under the curve is meaningful

Advantages over rectangular area graphs:
- No visual interruption between end of one cycle and start of next
- Easier to compare same time point across cycles when superimposed
- More clearly indicates repetitive nature of data
- More compact for certain displays

## Notes

When plotting repetitive data, successive periods can be superimposed over each other on the same circular graph, making it easy to spot similarities and differences at the same point in each cycle.
