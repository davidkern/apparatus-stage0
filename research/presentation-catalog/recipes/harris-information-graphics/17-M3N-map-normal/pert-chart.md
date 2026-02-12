---
name: PERT Chart
slug: pert-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "PERT Chart, p. 274"

intent: Represent the major events and activities of a large program and show their interrelationships for planning, analyzing, and monitoring
direction: both

components:
  - element: nodes
    encodes: Events (review meetings, decision points, activity completions); circles, squares, or triangles
    required: true
  - element: arrows
    encodes: Activities connecting events; show sequence and dependencies
    required: true
  - element: start-node
    encodes: Single beginning node for the program
    required: true
  - element: end-node
    encodes: Single ending node for the program
    required: true

parameters:
  node_shape: circle | square | triangle | oval
  dependency_type: sequential | parallel | convergent | divergent

related:
  - slug: critical-path-method-chart
    relationship: contrasts
  - slug: flow-chart
    relationship: variant-of

warnings:
  - "PERT focuses on events; CPM focuses on activities"
  - "Multiple arrows meeting at a node means all preceding activities must complete before subsequent activities can start"

extensions:
  harris_entry: "PERT Chart"
  full_name: "Program Evaluation and Review Technique"
  alternate_names:
    - "node diagram"
    - "arrow diagram"
  typical_use: "planning, analyzing, and monitoring large programs"
  functions:
    - "determine how programs can be shortened"
    - "identify critical subprograms for on-time completion"
  terminology:
    node: "symbol representing an event"
    arrow: "link, branch, or arc representing an activity"
  difference_from_cpm: "PERT focuses on events; CPM focuses on activities"
---

## Description

PERT charts are time and activity networks that represent the major events and activities of a large program and show their interrelationships. PERT charts are used to plan, analyze, and monitor programs.

Among other things, they are helpful in determining how programs can be shortened and identifying which of the many subprograms are the most critical in assuring the overall program is completed on time.

PERT charts accomplish basically the same functions as critical path method (CPM) charts. The major difference is that PERT charts focus on events (e.g., complete the foundation) while CPM charts focus on activities (e.g., pour the foundation).

## Examples

Harris illustrates (p. 274):

**Basic structure:**
- A PERT chart uses a separate symbol (circle, square, triangle, etc.) for each event (called node)
- An event may be a review meeting, a decision point, or simply the time at which one activity is completed and another begins
- Lines or arrows (sometimes referred to as links, branches, or arcs) are then used to connect the events in sequential fashion

**Layout rules:**
- The main body of a PERT chart generally starts and ends with a single node
- The arrows and nodes are arranged in the same order they actually occur
- First event is represented by first symbol on the left
- Last event is represented by last symbol on the right
- All others in their proper sequence in between

**Dependency relationships:**
Three types of activity relationships illustrated:
1. **Sequential**: Activity B can not start until activity A is completed (tip of arrow A joins base of arrow B with node in between)
2. **Divergent**: Activities A and B can not start until activity C is completed (multiple arrows leaving a node)
3. **Convergent**: Activity D can not start until activities A and B are completed (multiple arrows entering a node)

> "If neither activity is dependent on the completion of the other, the tip of one arrow and the base of the other arrow do not meet."

**Complete example:**
PERT chart showing house construction:
- Events (ovals): Award contracts, Foundation laid, Power installed, Wiring installed, Outer walls up, Plumbing complete, Inner walls up, Shrubs planted, Woodwork finished, Decorating complete, Move complete
- Activities shown as arrows between events

## Usage

**When to use:**
- Planning large programs with many interdependent activities
- Identifying critical paths and potential bottlenecks
- Monitoring progress against planned milestones
- Analyzing how to shorten program duration

**Reading the chart:**
- Follow arrows from left to right to understand sequence
- Nodes where multiple arrows converge indicate dependencies
- All activities entering a node must complete before activities leaving can begin

**PERT vs. CPM:**
- PERT: Focus on events (milestones, completions)
- CPM: Focus on activities (tasks, work items)
- Both accomplish similar planning and monitoring functions

## Notes

PERT charts represent one of the fundamental tools for program management and project planning. The visual representation of dependencies helps identify which activities are most critical to maintaining the overall schedule.
