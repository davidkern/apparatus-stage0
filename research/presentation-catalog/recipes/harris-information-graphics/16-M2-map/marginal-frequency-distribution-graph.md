---
name: Marginal Frequency Distribution Graph
slug: marginal-frequency-distribution-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Marginal Frequency Distribution Graph, p. 236"

intent: Display the distribution of data along one or both axes of a two-axis scatter graph to reveal patterns not visible in the scatter alone
direction: both

components:
  - element: scatter-graph
    encodes: The primary two-axis data plot showing relationships between variables
    required: true
  - element: marginal-distribution
    encodes: One-axis distribution graph showing condensed data along an axis
    required: true
  - element: axis-labels
    encodes: Scale values for interpreting both scatter and marginal plots
    required: true

parameters:
  display_type: "point | stripe | box | histogram"
  placement: "outside-frame | inside-frame"
  axes_shown: "horizontal | vertical | both"
  point_handling: "single-line | jittered | stacked"

related: []

warnings:
  - "When displayed inside the frame, scales sometimes need to be shifted so marginal graphs do not interfere with data"
  - "Overlapping points in the marginal display may need jittering or stacking to be visible"

extensions:
  harris_entry: "Marginal Frequency Distribution Graph"
  alternate_names: ["border plot"]
  typical_use: "analyzing distribution characteristics alongside correlation patterns"
---

## Description

A marginal frequency distribution graph provides a means of displaying the distribution of data along one axis of a two-axis scatter graph. This is accomplished by placing a one-axis data distribution graph in the margin or border of the two-axis graph.

In essence, this technique condenses all the data points on the two-axis graph into a single line of data points, revealing the distribution pattern along that dimension. The technique can be applied to one or both axes, using various graphic displays including one-axis point graphs, stripes, boxes, or histograms.

## Examples

Harris describes the condensation process:

> "Marginal frequency distribution graphs provide a means of displaying the distribution of data along one axis of a two-axis scatter graph. This is accomplished by placing a one-axis data distribution graph of the data in the margin or border of a two-axis graph. This in essence condenses all the data points on the two-axis graph into a single line of data points." (p. 236)

The illustrations show:
- A scatter graph with all data points condensed into one horizontal line at the top
- A scatter graph with all data points condensed into one vertical line on the right
- Multiple display variations: Stripe, Jittered, Stacked, Box, and Histogram methods

On point handling:

> "The one-axis point graphs may have the data points in a single line or displaced by means of jittering or stacking to avoid overlapping." (p. 236)

On placement options:

> "The marginal frequency distribution graphs can be displayed outside the frame, as in the example above, or inside the frame of the two-axis graph. When this is done the frame and scales sometimes have to be shifted so the marginal graphs do not interfere with the data." (p. 236)

## Usage

Use marginal frequency distribution graphs when:
- You want to understand the distribution of each variable independently while still seeing their relationship
- The scatter plot alone doesn't reveal clustering or gaps in individual variables
- Combining exploratory analysis of both correlation and distribution

Placement options:
- **Outside frame**: Cleaner separation, no interference with data, may require more space
- **Inside frame**: More compact, but requires careful positioning to avoid overlap

Location options include top, bottom, left, right, or any combination. The graphs can touch the frame or have a space provided.

Display type selection:
- **Points**: Shows individual values, may need jittering for overlapping data
- **Stripes**: Simple indication of data presence
- **Box plots**: Shows quartile summary statistics
- **Histograms**: Shows binned frequency counts

## Notes

This technique is particularly valuable in statistical analysis software and is a standard feature in many modern data visualization tools. It bridges the gap between correlation analysis (scatter plot) and distribution analysis (histogram/density) in a single integrated view.
