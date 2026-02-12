---
name: Loading Chart
slug: loading-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Loading Chart, p. 220"

intent: Plan and schedule resources to optimize utilization while avoiding overload and minimizing idle time
direction: both

components:
  - element: time-axis
    encodes: Time periods (typically horizontal)
    required: true
  - element: resource-axis
    encodes: Resources being scheduled (typically vertical)
    required: true
  - element: task-blocks
    encodes: Scheduled work assignments
    required: true
  - element: status-encoding
    encodes: Work assignment type (color, shading, symbols)
    required: true

parameters:
  time_granularity: "hours | days | weeks"
  encoding_method: "color | shading | symbols | text"

related: []  # TBD: see also gantt-chart

warnings:
  - "Does not show task dependencies"
  - "Focus is on resource utilization, not project timeline"

extensions:
  harris_entry: "Loading Chart"
  alternate_names: []
  typical_use: "machine scheduling, personnel allocation, capacity planning"
---

## Description

Loading charts are used to plan and schedule resources with the objective of optimizing their utilization. The key goals are to ensure resources are not overloaded while minimizing idle time.

Time is generally shown along the horizontal axis and resources along the vertical axis. Color, shading, symbols, and text encode the information about what each resource is doing at each time.

## Examples

**Machine loading chart** (p. 220):
The illustration shows a "Machine Loading Chart for Tuesday" with:
- Horizontal axis: Time from 8AM to 3PM
- Vertical axis: Machines #1 through #8
- Blocks showing scheduled work in different shades
- Legend indicating: "Work assigned", "No work assigned", "Maintenance"
- A "Lunch" period blocked out

The chart reveals at a glance which machines are heavily scheduled, which have idle time, and when maintenance is planned.

## Usage

Use loading charts when:
- Scheduling multiple resources against time
- Optimizing resource utilization
- Identifying overloaded or underutilized resources
- Planning maintenance or downtime windows

The visual format makes it easy to spot:
- Overloaded resources (solid blocks with no gaps)
- Underutilized resources (many gaps)
- Scheduling conflicts
- Opportunities to redistribute work

## Notes

Loading charts focus on resource perspective (how is each resource being used?) rather than project perspective (how is the project progressing?). This makes them complementary to Gantt charts, which focus on task timelines and dependencies.
