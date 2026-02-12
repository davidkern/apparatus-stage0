---
name: Circular Graphs Overview
slug: circular-graphs-overview
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Circular Graphs, p. 75"

intent: Understand when and why to use circular graph formats instead of rectangular equivalents
direction: recognition

components:
  - element: circular-axis
    encodes: Typically sequential data (time) or angular data (direction)
    required: true
  - element: radial-axis
    encodes: Typically quantitative values
    required: true
  - element: data-representation
    encodes: Lines, areas, columns, bars, or points in circular arrangement
    required: true

parameters:
  graph_type: circle | polar | circular_line | radar | vector | circular_area | circular_column | sector | circular_bar

related: []

warnings:
  - "Some people find circular graphs more difficult to relate to and understand"
  - "Generally more difficult to generate than rectangular equivalents"
  - "Sometimes require more space"

extensions:
  harris_entry: "Circular Graphs"
  alternate_names: []
  typical_use: "cyclical data, directional data, part-to-whole relationships, multi-attribute comparisons"
---

## Description

Circular graphs are used for a number of different reasons, depending on the type of data being plotted, the purpose of the graph, and the type of information to be communicated. Not all features are applicable to all types of circular graphs.

## Examples

Harris lists advantages of circular graphs (p. 75):

> - "Directional information can be encoded more easily by means of vectors or a circular axis with a scale of degrees."
> - "When recurring data is plotted on a circular graph, the continuity of information is not interrupted as it would be between the right- and left-hand edges of a rectangular graph."
> - "When recurring data is plotted, circular graphs make it easier to compare the values at a given time in each cycle."
> - "In some cases the circular graphs are more compact."
> - "In some cases viewers find it easier to relate to a circle as representing the 'whole'."
> - "Circular graphs more clearly indicate the repetitive nature of certain data."
> - "Circular graphs sometimes have a more interesting appearance."

And disadvantages:

> "On the negative side, some people find it more difficult to relate to and understand circular graphs; they generally are more difficult to generate; and they sometimes require more space."

**Nine major types illustrated** (p. 75):

1. **Circle graph**: Shows relationship of parts to one another and to the whole
2. **Polar graph**: Used for plotting data with value and angle associated
3. **Circular line graph**: Used for repetitive cycle data, particularly long cycles like day or week
4. **Radar/spider/star graph**: Uses polygons to compare things regarding multiple characteristics
5. **Vector graph**: Shows direction (angle) and magnitude (length) of each data point
6. **Circular area graph**: Used when area under curve is equally or more important than specific points
7. **Circular column graph**: Same purposes as rectangular column; sometimes advantage when data is repetitive
8. **Sector graph**: Similar to circular column with option of making sector areas proportional to values
9. **Circular bar graph**: Used primarily for aesthetic value; sometimes with time series for repetitive events

## Usage

Choose circular format when:
- Data has directional component (wind direction, compass bearings)
- Data is cyclical and continuity across cycle boundaries matters
- Comparing same time point across multiple cycles
- The "whole" concept is central to the message
- Visual emphasis on repetitive nature adds value

Choose rectangular format when:
- Precise value reading is important
- Audience may be unfamiliar with circular formats
- Generation tools favor rectangular
- Space is constrained and rectangular is more efficient

## Notes

The choice between circular and rectangular formats involves tradeoffs. Circular formats excel at showing cyclical patterns and directional data but sacrifice some precision and familiarity. The best choice depends on the specific data, audience, and communication goal.
