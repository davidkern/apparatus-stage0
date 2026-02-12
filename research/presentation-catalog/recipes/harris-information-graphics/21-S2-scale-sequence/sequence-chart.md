---
name: Sequence Chart
slug: sequence-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Sequence Chart, p. 347"

intent: Display past and future events or activities in chronological order on a single time axis
direction: both

components:
  - element: time-axis
    encodes: Chronological progression (typically horizontal)
    required: true
  - element: event-markers
    encodes: Points or labels indicating when events occur
    required: true
  - element: event-labels
    encodes: Names or descriptions of events
    required: true
  - element: connecting-lines
    encodes: Visual links showing progression between events (optional)
    required: false

parameters:
  axis_orientation: "horizontal | vertical"
  time_range: "start and end dates or times"
  event_density: "number of events displayed"
  label_position: "above | below | alternating"

related: []  # TBD: time-series-scale, time-line-chart

warnings:
  - "Crowded events may require staggered labels or multiple rows"
  - "Distinguish between completed and planned/future events if both are shown"

extensions:
  harris_entry: "Sequence Chart"
  alternate_names: ["time line chart"]
  typical_use: "project planning, historical timelines, process sequences"
---

## Description

A sequence chart is generally a one-axis chart used to display past and/or future events, activities, requirements, etc., in chronological order. The major function of sequence charts is to consolidate and graphically display time-related information for purposes of analysis and communication.

Unlike multi-axis graphs that show quantitative relationships, sequence charts focus on the temporal ordering and spacing of discrete events along a single time dimension.

## Examples

> "Sometimes referred to as a time line chart. A sequence chart is generally a one-axis chart used to display past and/or future events, activities, requirements, etc., in chronological order." (p. 347)

The PDF illustrates a construction project sequence chart with a horizontal time axis spanning 1/1/96 to 11/1/96. Events marked along the timeline include:
- Quotes received
- Vendor selection
- Contracts awarded
- Foundation laid
- Exterior complete
- Interior complete
- Inspection
- Occupy

Curved connecting lines show the flow from one milestone to the next.

## Usage

Sequence charts are appropriate when:
- Communicating project milestones and deadlines
- Showing historical sequences of events
- Planning and tracking scheduled activities
- Comparing planned versus actual timing

Sequence charts consolidate multiple events onto a single visual, making it easier to:
- See the overall timeline at a glance
- Identify gaps or overlaps between activities
- Communicate schedules to stakeholders

## Notes

The sequence chart is primarily a communication and planning tool rather than an analysis tool. It differs from Gantt charts in that it focuses on point events (milestones) rather than duration bars, though the two can be combined. Time line charts and sequence charts are closely related and often used interchangeably.
