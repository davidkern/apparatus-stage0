---
name: Critical Path Method Chart
slug: critical-path-method-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Critical Path Method, pp. 113-115"

intent: Represent major activities and events of a large program in a network diagram to plan, analyze, and monitor projects, identifying the critical path that determines overall duration
direction: both

components:
  - element: activity-arrows
    encodes: Tasks or activities (links, branches, or arcs)
    required: true
  - element: event-nodes
    encodes: Milestones, decision points, or transitions between activities
    required: true
  - element: node-numbers
    encodes: Sequential identification of events
    required: true
  - element: activity-labels
    encodes: Names or codes identifying each activity
    required: false
  - element: time-annotations
    encodes: Duration estimates for activities
    required: false
  - element: critical-path-highlight
    encodes: Bold or colored arrows showing the longest time path
    required: false

parameters:
  identification_method: word-descriptions | codes | node-numbers
  time_notation: single-estimate | with-slack | three-point | start-finish
  path_highlighting: none | critical-only | critical-and-secondary

related: []

warnings:
  - "Arrow length is not proportional to activity duration unless placed on a time scale"
  - "Dummy arrows may be needed to maintain unique activity identification"
  - "Complex programs may require dozens or hundreds of activities"

extensions:
  harris_entry: "Critical Path Method (CPM)"
  alternate_names:
    - arrow diagram
    - Critical Path Analysis (CPA)
  typical_use: "Project planning, schedule analysis, identifying schedule-critical activities"
  related_method: "PERT (focuses on events rather than activities)"
---

## Description

Critical Path Method (CPM) charts are time and activity graphic networks that represent the major activities and events of a large program and show their interrelationships. They are used to plan, analyze, and monitor programs, helping determine how programs can be shortened and identifying which subprograms are most critical for completing the overall program on schedule.

CPM charts accomplish basically the same functions as PERT charts, with the major difference being that PERT charts focus on events (e.g., "foundation completed") while CPM charts focus on activities (e.g., "pour the foundation").

A separate arrow represents each major activity, with all arrows starting and ending at nodes (except sometimes the first and last). Nodes represent events such as review meetings, decision points, or transition points between activities.

## Examples

**Arrangement of arrows and nodes (p. 113):**

> Activity B can not start until activity A is completed: arrows are drawn such that the tip of arrow A joins with the base of arrow B with a node symbol in between.

> Activities A and B can not start until activity C is completed: multiple arrows emerge from the right side of a common node.

> Activity D can not start until activities A and B are completed: multiple arrows converge at the left side of a common node.

**House construction example:**
> Award contracts -> Grade land -> [branch to: Pour foundation -> Put up outer walls -> Install plumbing with Install inner walls and Install appliances] -> Do decorating -> Move in

**Methods for identifying activities (p. 113):**

> Word descriptions of activities can be placed alongside arrows, or code numbers/letters can be used with a cross-reference table. Events (nodes) can be coded the same way.

> An alternative way of identifying activities is by the numbers at the ends of the arrows. For example, activity g might be referred to as activity 50-60.

**Incorporating time (p. 114):**

Four methods for noting time on arrows:
> Estimated time to accomplish activity: A single number (e.g., "12")

> Estimated time plus slack or float time: Two numbers (e.g., "12(4)")

> Three-point estimate: Shortest, expected, and longest times (e.g., "10-12-15")

> Start and finish times: Earliest start (E) and latest finish (L) times (e.g., "E32, L41")

**Critical path (p. 114):**

> Once times are entered, the longest time path can be determined. This is called the critical path and is generally designated with bold or colored arrows. This is the path along which a delay in any event will cause a delay in the overall program.

**Dummy arrows (p. 115):**

> Dummy arrows (indicated with dashes) are used to overcome layout and identification problems. If two activities occur between the same two events, a dummy arrow with no time creates unique identification for each activity.

## Usage

**General construction guidelines:**
- Arrows generally proceed from left to right
- Arrows run parallel when possible and seldom cross
- Where possible, the number at the base of an arrow is smaller than the head
- The main body generally starts and ends with a single activity or node

**Time incorporation methods:**
- Single estimate: Just the expected duration
- With slack/float: Duration plus available buffer time
- Three-point: Optimistic, expected, and pessimistic estimates
- Earliest/Latest: Reference from program start

**Time scales:**
- Arrow lengths are normally not proportional to duration
- CPM charts can be arranged along a time scale for visual indication of relative times

**Supplementary information** can be added:
- Costs and budgets
- Responsible departments
- Required documentation
- Disciplines involved

Charts can be updated periodically and are increasingly generated and maintained on computers, with information available in both graphical and tabular form.

## Notes

The second most critical path is sometimes indicated by arrows drawn with intermediate line width. When two activities would have the same node-number designation, dummy arrows solve the identification problem without affecting the schedule logic.
