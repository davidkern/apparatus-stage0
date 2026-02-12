---
name: Circular Bar Graph
slug: circular-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Circular bar graph, p. 47"

intent: Display categorical data using bars arranged radially in a circle, primarily for aesthetic appeal
direction: both

components:
  - element: radial-bars
    encodes: Values represented by bar ends on circular scale
    required: true
  - element: circular-axis
    encodes: Value scale wrapped around the circle (quantitative)
    required: true
  - element: radial-axis
    encodes: Category positions radiating from center
    required: true
  - element: circular-scale
    encodes: Numeric values; can have any range and direction
    required: true
  - element: category-labels
    encodes: Names for each radial position
    required: true
  - element: circular-grid-lines
    encodes: Concentric circles for radial value reading
    required: false
  - element: radial-grid-lines
    encodes: Lines from center for circular value reading
    required: false

parameters:
  scale_direction: clockwise | counterclockwise
  scale_start: any-angle (12-oclock, 3-oclock, etc.)
  scale_range: any (not constrained to 0-360)
  variations: simple | stacked | grouped | paired | 100-percent

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: polar-graph
    relationship: variant-of

warnings:
  - "Bar lengths have no significance and can be misleading since they are not proportional to the values they represent"
  - "Offers little or no functional advantage over rectangular bar graphs"
  - "The circular format distorts comparison due to varying bar lengths for same values at different radii"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "radial bar graph"
    - "polar bar graph"
  typical_use: "aesthetic presentations; circular scheduling (Gantt-style); cyclical data"
  axis_mapping:
    rectangular_horizontal: "becomes circular/value axis"
    rectangular_vertical: "becomes radial/category axis"
  scheduling_variant:
    name: "circular Gantt chart"
    use: "displaying repetitive schedules on a time-circle"
---

## Description

A circular bar graph wraps a rectangular bar graph into a circle. The horizontal axis of the rectangular graph becomes the circular (value) axis, and the vertical axis becomes the radial (category) axis.

Bars representing various categories are uniformly spaced along the radial axis. The ends of the bars designate the values they represent on the circular scale.

**Important limitation:** The lengths of the bars have no significance and can be misleading. Bars at different radial distances will have different lengths even if they represent the same value, because they must travel different distances to reach the same point on the circular scale.

## Examples

Harris illustrates (p. 47):

**Standard circular bar graph:**
- Circular scale from 0 to 24 around the circumference
- Categories A, B, C labeled at radial positions
- Bars extend from center outward to value positions
- Components labeled: circular/value axis, radial/category axis, circular grid lines, radial grid lines

**Scheduling/Circular Gantt chart:**
- Time series scale on circumference (Midnight, 2AM, 4AM... through full 24 hours)
- Activities shown as bars spanning time periods
- Useful for displaying repetitive daily schedules
- Shows activities: "Shift A," "Guard," "Batch" spanning different time windows

## Usage

**When to use:**
- Primarily for aesthetic value
- Cyclical or periodic data (24-hour schedules, seasonal patterns)
- When the circular metaphor matches the data domain

**When NOT to use:**
- When accurate value comparison is critical
- When bar length comparisons matter
- Standard business/scientific contexts where precision is needed

**Scale flexibility:**
- Can have any upper and lower values
- Can progress in either direction (clockwise or counterclockwise)
- Can start at any point on the circle

**Variations possible:**
Although simple circular bar graphs are most common, the technique can be applied to:
- Stacked bar graphs
- Grouped bar graphs
- Paired bar graphs
- 100% bar graphs

## Notes

Harris is explicit about the functional limitations: "Circular bar graphs are generally used for their aesthetic value. Functionally, they offer little or no advantage over the rectangular bar graph."

The scheduling variant (circular Gantt chart) is a legitimate specialized use where the circular format meaningfully represents cyclic time.
