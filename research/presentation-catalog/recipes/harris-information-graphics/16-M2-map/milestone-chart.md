---
name: Milestone Chart
slug: milestone-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Milestone Chart, p. 240"

intent: Track project progress by showing the start and completion status of subtasks with identifiable beginning and ending points
direction: both

components:
  - element: task-bars
    encodes: Time duration allocated to each subtask
    required: true
  - element: start-milestones
    encodes: Symbols marking subtask initiation, filled when started
    required: true
  - element: end-milestones
    encodes: Symbols marking subtask completion, filled when finished
    required: true
  - element: time-axis
    encodes: Project timeline
    required: true
  - element: task-labels
    encodes: Names of each subtask
    required: true

parameters:
  milestone_style: "triangle | diamond | circle"
  status_encoding: "filled-unfilled | color-change | checkmark"

related: []

warnings:
  - "Only suitable for tasks with clear, identifiable start and end events"
  - "Does not show task dependencies or relationships"

extensions:
  harris_entry: "Milestone Chart"
  typical_use: "project management, progress tracking"
  parent_technique: "time and activity bar chart"
---

## Description

A milestone chart is a variation of a time and activity bar chart in which major projects are broken into smaller tasks that have identifiable activities at their beginning and end. Each subtask is assigned a bar with a symbol (milestone) at both ends.

When a subtask has been started, the milestone symbol at the left is filled or modified to communicate the start. When the subtask is completed, the milestone at the right end is similarly modified. This process continues until all milestones indicate completion of the entire project.

## Examples

Harris describes the technique using a construction analogy:

> "A variation of a time and activity bar chart in which major projects are broken into smaller tasks that have identifiable activities at their beginning and end. For example, when building a house, pouring the foundation, putting the roof on, and installing the plumbing are examples of subtasks with identifiable activities at the beginning and end." (p. 240)

> "When a milestone chart is generated, each subtask is assigned a bar with a symbol (milestone) at both ends. When a subtask has been started, the symbol (milestone) at the left is filled or modified in some way to communicate to the viewer that the task has been started. When the subtask is completed the milestone at the right end is modified for the same purpose. This procedure is repeated until all milestones indicate that all subtasks are finished and the overall project is complete." (p. 240)

The illustration shows a project with four subtasks:
- Acquire materials (March-April)
- Machine parts (April-June)
- Assemble (May-July)
- Paint (July-August)

Each bar has triangular milestone symbols at both ends. The legend shows "Start" and "Finish" with filled vs unfilled triangles indicating status. The bars also show "Time period subtask is expected to take" spanning between the milestones.

## Usage

Milestone charts are effective when:
- Tracking progress on projects with discrete, identifiable task boundaries
- Communicating project status to stakeholders
- Multiple subtasks run in parallel or sequence
- Clear start/end events exist (permits issued, deliverables received, inspections passed)

Design considerations:
- Milestone symbols should be clearly distinguishable between started/not-started and completed/not-completed states
- Common symbol choices include triangles, diamonds, or circles
- Status is typically shown through fill (open vs. solid) or color change
- The bar between milestones represents the expected duration

Milestone charts are simpler than PERT or Gantt charts and work well when task dependencies don't need explicit visualization. They focus on status (started? completed?) rather than on relationships between tasks.

## Notes

The milestone chart trades the complexity of dependency tracking for clarity of status communication. For audiences who need to quickly assess "what's done and what's not," this simplified format may be more effective than more sophisticated project management visualizations.
