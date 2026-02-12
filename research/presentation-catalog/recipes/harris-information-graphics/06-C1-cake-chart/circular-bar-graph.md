---
name: Circular Bar Graph
slug: circular-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Circular Bar Graph, p. 74"

intent: Display categorical data values using bars arranged radially around a circle with a value scale on the circumference
direction: both

components:
  - element: circular-axis
    encodes: Value scale around the circumference
    required: true
  - element: radial-axis
    encodes: Category axis from center outward
    required: true
  - element: bars
    encodes: Data values shown by angular extent (endpoint position on circular scale)
    required: true
  - element: category-labels
    encodes: Names of categories arranged along the radial axis
    required: true

parameters:
  value_scale_direction: clockwise | counterclockwise
  value_scale_start: any_position
  bar_spacing: uniform
  variations: simple | stacked | grouped | 100_percent

related: []

warnings:
  - "Bar lengths are misleading: bars representing the same value can be different lengths depending on radial position"
  - "Functionally offers little or no advantage over rectangular bar graphs"

extensions:
  harris_entry: "Circular Bar Graph"
  alternate_names: []
  typical_use: "aesthetic presentations, scheduling charts with time series on circumference"
---

## Description

A circular bar graph is the equivalent of a rectangular bar graph wrapped into a circle. The horizontal axis of the rectangular graph becomes the circular or value axis of the circular graph, and the vertical axis of the rectangular graph becomes the radial or category axis of the circular graph.

In a typical circular bar graph, the bars representing the various categories are uniformly spaced along the radius or category axis. The ends of the bars designate the values they represent.

**Critical limitation**: The lengths of the bars have no significance and can be misleading, since bars representing the same numerical value can be different lengths depending on where they are located radially.

## Examples

Harris illustrates a basic circular bar graph (p. 74):

> Categories A, B, and C are arranged along the radius. Each has a bar extending from the center toward the circumference. The circular scale around the edge shows values from 0 to about 22. Category A's bar extends to value 4, B to about 14, C to about 22. Even though the differences between values might be equal, the bars appear progressively longer due to their radial positions.

**Scheduling chart variation**:

> "Occasionally a time series is shown on the circumference and the graph is used to display a repetitive type schedule... This configuration might be called a scheduling chart."

The example shows a 24-hour clock face with shift schedules: A shift, B shift, Relief, and Guard positions shown as arcs at different radii indicating when each is on duty.

Although simple circular bar graphs are generally the only type used, Harris notes the concept can be applied to more complicated variations such as stacked, grouped, and 100%.

## Usage

> "Circular bar graphs are generally used for their aesthetic value. Functionally they offer little or no advantage over rectangular bar graphs." (p. 74)

The scheduling chart application is a legitimate use case where the circular format maps naturally to a repeating daily cycle.

The value scale can:
- Have any upper value
- Have lower value typically at zero
- Progress in either direction
- Start at any point around the circle

## Notes

The fundamental geometric problem is that arc length increases with radius. Two bars showing the same numeric value will have different visual lengths if positioned at different distances from the center. This violates the expectation that visual length corresponds to data value.
