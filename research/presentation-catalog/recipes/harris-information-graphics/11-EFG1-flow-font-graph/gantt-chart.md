---
name: Gantt Chart
slug: gantt-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Gantt Chart, p. 162"

intent: Plan, manage, and control programs by showing activities as horizontal bars against a time scale
direction: both

components:
  - element: vertical-axis
    encodes: List of subprograms or activities
    required: true
  - element: horizontal-axis
    encodes: Time scale (weeks, months, etc.)
    required: true
  - element: activity-bars
    encodes: Duration of each activity (start to finish)
    required: true
  - element: progress-indicators
    encodes: Actual vs. planned completion (in tracking applications)
    required: false

parameters:
  chart_purpose: "planning only | planning and tracking"
  time_type: "estimated/projected | actual | both"
  time_granularity: "days | weeks | months"

related: []

warnings:
  - "Planning-only charts show estimated times; tracking charts must distinguish estimated from actual"
  - "Historical portions should show actual times while future portions show estimates/projections"

extensions:
  harris_entry: "Gantt Chart"
  typical_use: "project management for programs with distinct beginning and end"
  see_also: "Time and Activity Bar Chart"
---

## Description

A Gantt chart is a time and activity bar chart that is used for planning, managing, and controlling major programs that have a distinct beginning and end. In this type of chart, each major subprogram or activity involved in the completion of an overall program is represented by a horizontal bar. The two ends of the bar represent the start and finish of the activity.

## Planning vs. Tracking

**Planning purposes only:**
- Start and finish times are estimates or projections
- All bars represent future activities
- Used during project initiation and planning phases

**Planning and tracking purposes:**
- Start and finish times for future activities are estimated or projected
- Historical portions show actual times
- Allows comparison of planned vs. actual progress
- Used during project execution

## Examples

Harris illustrates a Gantt chart used for planning and/or monitoring major programs (p. 162):
- Time scale across top: January through April, broken into weeks 1-16
- Seven subprograms (#1 through #7) listed vertically
- Horizontal bars showing duration of each subprogram
- Some bars overlap, showing concurrent activities
- Some bars are sequential, showing dependencies

The example shows activities of varying durations, with some subprograms spanning several weeks and others being shorter. The visual layout makes it easy to see which activities happen in parallel and the overall timeline of the program.

## Usage

Gantt charts are appropriate when:
- A project has multiple activities with known or estimated durations
- Activities have sequential dependencies or can run in parallel
- Progress tracking against a plan is needed
- Communicating project schedules to stakeholders

The horizontal bar format makes duration comparisons intuitive and allows easy identification of the project's critical path (longest sequence of dependent activities).

## Notes

See Time and Activity Bar Chart for additional related techniques. The Gantt chart is named after Henry Gantt, who developed this charting technique in the 1910s for production scheduling.
