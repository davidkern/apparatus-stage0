---
name: One-Axis Graph
slug: one-axis-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "One-Axis Graph, pp. 256-257"

intent: Display data along a single axis to save space, improve readability, and enable more accurate decoding in certain situations
direction: both

components:
  - element: single-axis
    encodes: Scale for positioning data; may run vertical or horizontal
    required: true
  - element: data-markers
    encodes: Points, lines, or columns positioned along the single axis
    required: true
  - element: category-labels
    encodes: Names or identifiers for each data element (optional)
    required: false

parameters:
  axis_orientation: vertical | horizontal
  data_type: category | quantitative
  marker_type: point | line | column
  circular_form: linear | circular

related:
  - slug: two-axis-graph
    relationship: contrasts
  - slug: circle-graph
    relationship: variant-of
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "When scale is removed from a circle graph, it becomes a pie chart"

extensions:
  harris_entry: "One-Axis Graph"
  typical_use: "compact display of category or quantitative data"
  advantages:
    - "generally require less space"
    - "easier for some people to read"
    - "additional space available for labels and supporting information"
    - "information can be decoded more accurately in some situations"
---

## Description

When the scale and data are displayed along a single axis, the graph is sometimes called a one-axis graph. The axis may run vertical or horizontal. For category type information, the data points can often be plotted directly onto the single axis. With quantitative information, the data is sometimes first plotted on a two-axis graph and the key points transferred to a single axis.

One-axis graphs offer several potential advantages over two-axis graphs:
- They generally require less space and are easier for some people to read
- Additional space is sometimes available for labels and supporting information
- In some situations the information can be decoded more accurately

## Examples

Harris illustrates multiple one-axis graph types (pp. 256-257):

**One-axis rectangular graphs:**
- One-axis line graph: categories have specific values displayed as horizontal lines
- One-axis point graph: categories have specific values displayed as points
- One-axis column graph: displaying percent-of-the-whole data
- One-axis scatter graph: displaying quantitative information

Each type is shown alongside its two-axis equivalent for comparison.

**One-axis circle graph:**
> "When the same data in the one-axis column graph above is wrapped into a circle, as shown at the right, it is called a circle graph. When the scale is removed from a circle graph, it is called a pie chart."

Both single-axis column graphs and single-axis circle graphs can plot either units or percent. Generally percent-of-the-whole data is plotted.

**Scales on one-axis graphs:**
- Typically have only one scale
- Exceptions: multiple scales presenting same information in different forms (units and percents, miles and kilometers)
- When the single scale is a time scale, the display is frequently called a time line chart

## Usage

**When to use:**
- When space is limited
- When simpler presentation improves comprehension
- When labels or supporting information need prominent display
- For percent-of-the-whole data

**Category vs. quantitative data:**
- Category data: plot directly onto single axis
- Quantitative data: sometimes first plot on two-axis graph, then transfer key points

**Circular form:**
Wrapping a one-axis column graph into a circle creates a circle graph. Removing the scale from a circle graph creates a pie chart.

## Notes

Variable information is positioned along the axis based on that one scale. The one-axis format works well for both categorical and quantitative information, with different visual treatments appropriate for each.
