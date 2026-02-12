---
name: Circular Line Graph
slug: circular-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Circular Line Graph, p. 76"

intent: Display sequential data (typically time series) by wrapping a rectangular line graph into a circle, enabling comparison of cyclical patterns
direction: both

components:
  - element: circular-axis
    encodes: Sequential scale (typically time series) around the circumference
    required: true
  - element: radial-axis
    encodes: Quantitative value scale from center outward
    required: true
  - element: data-line
    encodes: Connected data points forming a closed or open curve
    required: true
  - element: data-point-symbols
    encodes: Markers at individual data points (optional)
    required: false
  - element: circular-grid-lines
    encodes: Concentric circles for reading values on radial axis
    required: false
  - element: radial-grid-lines
    encodes: Lines from center for reading positions on circular axis
    required: false

parameters:
  circular_scale_type: time_series | other_sequence
  circular_direction: clockwise | counterclockwise
  start_position: any_point_on_circle
  radial_lower_value: typically_at_center
  multiple_series: single | superimposed

related: []

warnings:
  - "More difficult to read precise values than rectangular equivalent"
  - "Multiple superimposed cycles can become cluttered"

extensions:
  harris_entry: "Circular Line Graph"
  alternate_names: ["clock graph (when clockwise time scale)"]
  typical_use: "displaying cyclical data, comparing same time points across cycles, pollution monitoring, temperature recording"
---

## Description

A circular line graph is the equivalent of a rectangular line graph wrapped into a circle. The horizontal axis of the rectangular graph becomes the circular axis of the circular graph, and the vertical axis of the rectangular graph becomes the radial axis of the circular graph.

Sequential scales, particularly time series, are often used on the circular axis. The quantitative value being measured is shown on the radial or value axis.

## Examples

Harris illustrates a monthly pollution monitoring example (p. 76):

> The graph shows months (Jan through Dec) arranged clockwise around the circle starting from the top. A line connects monthly pollution level values, creating an irregular closed curve. The radial scale shows pollution levels 1, 2, 3 from center outward. The shape of the curve reveals seasonal patterns at a glance.

**Superimposed repetitive data** (p. 76):

> "It is common when plotting repetitive data to have successive periods or cycles plotted over top of one another. If, for instance, the temperature is recorded every two hours for four days, all four days of data might be superimposed over each other."

> The example shows a 24-hour clock (Midnight at top, proceeding clockwise through 2AM, 4AM... Noon... 10PM back to Midnight) with four temperature lines superimposed. The radial scale shows temperature in Fahrenheit (68-78 degrees).

> "By doing this, it is sometimes easier to spot similarities and dissimilarities at the same time during each cycle. In the example at the right, the data graphic clearly shows that at 4 PM each day, the temperature was exactly the same, while at 10PM the spread was about four degrees."

## Usage

Circular line graphs are effective for:
- Data with natural cycles that repeat (daily, monthly, yearly)
- Comparing patterns at the same point across multiple cycles
- Showing continuity between end of one period and start of next
- Emphasizing the repetitive nature of cyclical data

Advantages:
- When recurring data is plotted, continuity is not interrupted as it would be between left and right edges of rectangular graph
- Easier to compare values at a given time in each cycle
- More compact in some cases
- More clearly indicates repetitive nature of data

A circular line graph with a clockwise time scale may be called a clock graph.

## Notes

Multiple data series can be plotted on the same graph, either representing different variables or the same variable across different cycles (superimposition technique).
