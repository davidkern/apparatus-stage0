---
name: Time and Activity Bar Chart
slug: time-and-activity-bar-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Time and Activity Bar Chart, pp. 412-414"

intent: Relate events, activities, and actions to time using horizontal bars to designate blocks of time for scheduling, loading, project planning, and monitoring purposes
direction: both

components:
  - element: time-axis
    encodes: Temporal progression displayed horizontally
    required: true
  - element: activity-axis
    encodes: Activities, people, places, or things displayed vertically
    required: true
  - element: horizontal-bars
    encodes: Blocks of time during which activities occur
    required: true
  - element: bar-attributes
    encodes: Additional information through color, shading, patterns, or annotations
    required: false
  - element: milestones
    encodes: Key checkpoints or completion points within activities
    required: false
  - element: dependency-arrows
    encodes: Relationships showing which tasks must complete before others can start
    required: false

parameters:
  chart_function: "scheduling | loading | project-planning | monitoring"
  bar_encoding: "simple | annotated | progress-tracked"
  milestone_style: "text | numbered | symbol-coded"
  dependency_display: "none | arrows | PERT-style"

related: []

warnings:
  - "Bar charts typically do not indicate interdependencies between activities; arrows can partially overcome this"
  - "For complete dependency visualization, see PERT chart and Critical Path Method (CPM)"
  - "The only limitation on activities or time span is physical chart size"

extensions:
  harris_entry: "Time and Activity Bar Chart"
  alternate_names:
    - "Gantt chart"
    - "milestone chart"
  major_functions:
    - "scheduling"
    - "loading"
    - "project planning"
    - "monitoring/managing"
    - "communicating"
---

## Description

The time and activity bar chart is the most widely used type of time and activity chart, with many variations and applications. All variations share common features: time displayed on the horizontal axis, activities or responsible parties on the vertical axis, and horizontal bars designating blocks of time. The technique serves five major functions: scheduling, loading, project planning, monitoring/managing, and communicating.

## Examples

### Charts for Scheduling (p. 412)

Harris shows two scheduling examples:

1. **Vacation Schedule**: People's names on vertical axis, weeks on horizontal axis. Bars show when each person is scheduled for vacation.

2. **Meeting Schedule**: Activities on vertical axis, hours on horizontal axis. Shows breakfast, introductions, presentations, lunch, assignments, etc.

> "Key objectives of this type of chart include indicating when things will happen, assuring that things do not overlap, coordinating multiple activities or individuals, etc. There generally is no attempt to fill all of the cells." (p. 412)

### Charts for Loading (p. 412)

> "When time and activity bar charts are used for assigning work to individuals, machines, facilities, etc. (sometimes referred to as loading), the charts are laid out basically the same as above; however, they are filled in differently."

Harris's machine loading example shows:
- Machines #1-8 on vertical axis
- Hours (8AM-3PM) on horizontal axis
- Shaded cells = work assigned
- White cells = no work assigned
- Hatched cells = maintenance

> "In this type of chart, the objective frequently is to have every cell filled since that would indicate maximum utilization of the resource." (p. 412)

### Charts for Project Planning - Gantt Charts (pp. 412-413)

> "Time and activity bar charts are frequently used to plan activities such as projects that have a distinct beginning and end. Such charts are sometimes referred to as Gantt charts."

Each subprogram or activity is represented by a horizontal bar where:
- Bar ends represent start and finish times
- Bar appearance can encode additional information (internal vs. external work, uncertainty ranges, major steps)

Harris shows bars encoding:
- Minimum/maximum time uncertainty
- Work time vs. calendar time differences
- Major steps (Design, Fabrication, Approval)
- Cost information (93 manhours - 3 people - $17,000)

### Charts for Monitoring and Managing (p. 413)

Monitoring charts expand planning charts to include:
- Responsible department/individual
- Budgeted vs. spent dollars
- Reference lines showing update dates
- Progress bars showing completion status

> "In some cases bars are darkened or a second set of bars is added to indicate the amount of an activity that has been completed." (p. 413)

Harris's example shows planned (white) vs. completed (black) bars, with annotations like "Activity #3 started late, was completed late, and took longer than planned."

### Milestone Charts (p. 414)

> "When a subprogram or activity is scheduled to take a fair amount of time, it is sometimes broken into smaller pieces and the completion of each smaller piece recorded."

Milestone variations shown:
1. Text labels above bar (Material available, Machining complete, etc.)
2. Numbers inside bar with legend
3. Numbers in circles with breaks between
4. Separate bars for each subprogram with milestone markers at ends

### Milestone Symbols for Tracking (p. 414)

Harris shows milestone symbol variations encoding status:
- Scheduled but not started (empty triangles)
- Started and finished (filled triangles)
- On schedule, behind schedule, ahead of schedule
- Started late, finished late
- External activity scheduled/finished

### Interdependencies (p. 413)

> "Bar charts typically do not indicate interdependencies between the various bars or subprograms; thus, there typically is no way to know which tasks must be completed before which other tasks can be started."

Solution: Add arrows from one bar to another indicating dependencies.

> "If an arrow leads from one bar to another, it indicates that the task represented by the bar at the base of the arrow must be completed before the task at the tip of the arrow can be started. If bars are one above the other without interconnecting arrows, it indicates that the tasks represented by the bars can proceed independently." (p. 413)

## Usage

### Selecting chart function
- **Scheduling**: Coordinating people, rooms, equipment without overlap
- **Loading**: Maximizing utilization of resources (machines, personnel)
- **Project planning**: Managing complex projects with multiple interdependent tasks
- **Monitoring**: Tracking progress against planned schedules

### Bar encoding options
- Simple filled bars for basic time spans
- Color/pattern coding for activity types (internal/external, priority levels)
- Dual bars (planned vs. actual) for progress tracking
- Annotations for budgets, resources, completion percentages

### When to add milestones
- Activities lasting more than a few time units
- Need for intermediate progress checkpoints
- Multiple stakeholders needing visibility into sub-task completion

### When to add dependency arrows
- Tasks have prerequisite relationships
- Schedule changes need impact analysis
- Full PERT/CPM not needed but basic dependencies matter

## Notes

Harris notes that bar lengths are generally proportional to activity duration. For scheduling and loading charts, completed activities are often deleted, while Gantt and milestone charts typically retain completed items for historical reference.

An alternative to one large comprehensive chart is a master chart plus several detailed charts covering major program segments. This allows both overview and detailed views of complex projects.

For applications requiring complete dependency visualization, Harris references PERT charts and Critical Path Method (CPM) as more comprehensive alternatives.
