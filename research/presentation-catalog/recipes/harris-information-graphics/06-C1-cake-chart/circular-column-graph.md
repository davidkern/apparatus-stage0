---
name: Circular Column Graph
slug: circular-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Circular Column Graph, p. 74"

intent: Display categorical or sequential data using columns radiating from center, with values shown by column height along the radius
direction: both

components:
  - element: circular-axis
    encodes: Category or sequence scale around the circumference
    required: true
  - element: radial-axis
    encodes: Value scale from center outward
    required: true
  - element: columns
    encodes: Data values shown by radial extent (height from center)
    required: true
  - element: category-labels
    encodes: Names or time points arranged around the circle
    required: true
  - element: circular-grid-lines
    encodes: Concentric circles for reading values
    required: false
  - element: radial-grid-lines
    encodes: Lines from center marking category positions
    required: false

parameters:
  value_scale_type: linear | logarithmic
  lower_value_position: center
  circular_scale_type: category | sequence | time_series
  variations: simple | stacked | grouped | range

related: []

warnings:
  - "Column width varies with distance from center - inner portions narrower than outer"
  - "When columns become very narrow, resembles radial line graph"

extensions:
  harris_entry: "Circular Column Graph"
  alternate_names: ["star graph", "radial line graph", "radial column graph"]
  typical_use: "displaying cyclical data, monthly patterns, categorical comparisons with visual interest"
---

## Description

A circular column graph is the equivalent of a rectangular column graph wrapped into a circle. The horizontal axis of the rectangular graph becomes the circular axis of the circular graph, and the vertical axis of the rectangular graph becomes the radial or value axis of the circular graph.

The value scale can have any upper and lower values. It typically has its lower value at the center and its upper value at the circumference. The value scale might be linear or logarithmic, but is normally linear.

Category or sequence scales are most frequently used on the circular axis. Circular scales can start at any place on the circle and proceed in either direction.

## Examples

Harris illustrates a monthly circular column graph (p. 74):

> The example shows months (Jan through Dec) arranged clockwise around the circle. Columns extend from the center outward to varying heights representing values for each month. The radial scale shows values 1, 2, 3, 4 from center to edge. Circular grid lines (concentric circles) help read values. Radial grid lines separate the months.

**Variations** (p. 74):

> **Stacked circular column graph**: Shows multiple cities (City 1 through City 11) around the circumference, with each column divided into stacked segments representing different data series.

> **Range circular column graph**: Shows categories A through K around the circumference, with each column showing a range (bar extending from a lower to upper value rather than from zero).

> "When the columns become so narrow that they resemble lines, the graph is sometimes called a radial line graph."

## Usage

A single data series is most frequently plotted. More complex variations such as stacked, grouped, and range are occasionally used.

Circular column graphs are effective for:
- Monthly or seasonal data where the cyclical nature should be emphasized
- Categorical comparisons where visual interest is valued
- Data that naturally repeats (daily cycles, annual patterns)

Sometimes offers an advantage when the data is repetitive, as it shows continuity from December to January (or end to beginning of any cycle) without the visual break that occurs at the edges of a rectangular graph.

## Notes

The distinction between circular column graph and radial line graph is primarily about column width - as columns narrow to line width, the terminology shifts. The underlying structure and reading method remain the same.
