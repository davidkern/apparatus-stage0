---
name: Bar Graph Labels and Values
slug: bar-graph-labels-and-values
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Labels and supplemental information / Values on graph, pp. 50, 52"

intent: Position labels, supplemental text, and exact values on bar graphs to maximize readability and information density
direction: construction

components:
  - element: category labels
    encodes: Names or descriptions of the items represented by each bar
    required: true
  - element: value labels
    encodes: Exact numeric values represented by bar lengths
    required: false
  - element: supplemental information
    encodes: Additional context such as percentages, ratios, or deviations
    required: false
  - element: legend
    encodes: Meaning of different bar fills in grouped or stacked graphs
    required: false

parameters:
  label_position: left | right | center | outside-bar
  value_position: left-end | center | right-end | outside
  label_lines: single | multi-line
  supplemental_type: "percent-of-whole | ratio | deviation | none"

related: []  # TBD: see also simple-bar-graph

warnings:
  - "Long labels may require multi-line formatting or abbreviated text"
  - "Values shown on bars may reduce the need for precise scale reading but add visual clutter"

extensions:
  harris_entry: "Bar Graph"
  continuation_note: "Continues Bar Graph entry from chunk 04"
  typical_use: "presentations and reports where both visual comparison and exact values are needed"
---

## Description

Bar graphs accommodate long labels and supplemental information better than almost any other type of graph. The horizontal orientation allows category names to be read naturally, and the bar surface provides space for displaying exact values and additional context.

## Examples

### Label Positioning (p. 50)

Harris illustrates several approaches to label placement:

> "Long labels including descriptive information can be accommodated on either the left or right side of a bar graph."

> "An alternative to long lines of text is to shorten the lengths and use two or more lines for each label."

> "One or more bar graphs can conveniently be included in a table of data."

> "In paired bar and certain deviation graphs, the labels can sometimes be positioned in the center."

### Values on Graph (p. 52)

> "When it is desirable to convey exact values, they are sometimes placed directly on the data graphics... Generally only the value represented by the bar is shown; however, it is possible to include additional values - for example, the percent-of-the-whole that each value represents, the percent or ratio the value is to a given reference value, the amount the value deviates from a standard, etc."

Harris shows four value placement positions:
- Values shown at left end of bars
- Values shown in center of bars
- Values shown at right end of bars
- Values shown outside bars

An example shows multiple bits of information with each bar: the raw value (e.g., "7.3") followed by a percentage in parentheses (e.g., "(47%)").

### Bar Fill Conventions (p. 50)

> "When different variations of the same thing are plotted on a simple bar graph, the bars typically all have the same fill to convey the idea that variations of the same thing are being plotted, not a series of different things."

> "When distinctly different items are plotted on a simple bar graph, all the bars might have the same fill, or each one might have a different fill to emphasize the differences."

> "When positive and negative values are plotted, the two types of bars might have the same or different fills. The unfavorable values are sometimes colored red, whether they are positive or negative."

> "In grouped and stacked bar graphs, all bars or segments of bars that represent the same thing (the same data series) typically are the same color, shade, or pattern."

## Usage

**Label length**: When categories have long names, consider:
- Using the full width available on the left side of bars
- Breaking labels into multiple lines
- Positioning labels on the right side if data permits
- Using abbreviations with a key

**Value display**: Adding values directly to bars is most useful when:
- Exact values are important to the message
- The graph will be viewed without interactive tooltips
- Precise scale reading would be difficult

**Multiple information**: When showing supplemental information (percentages, deviations), position it consistently and consider whether it adds value or creates clutter.

## Notes

### Frames (p. 52)

> "Because of the boldness of the bars, the frame around a bar graph can sometimes be reduced significantly without detracting from the value of the graph. This is especially true if the values are shown on the data graphics."

Harris shows variations ranging from a full four-sided frame to no frame at all.

### Bar Chart vs. Bar Graph (p. 52)

> "For presentation purposes, the quantitative scale is sometimes eliminated as well as the frame. When this is done the values are generally noted on or adjacent to the data graphics. Without a quantitative scale, the resulting configuration is no longer a graph, but a proportional area chart."

This entry continues the Bar Graph coverage from chunk 04-B1-bar.
