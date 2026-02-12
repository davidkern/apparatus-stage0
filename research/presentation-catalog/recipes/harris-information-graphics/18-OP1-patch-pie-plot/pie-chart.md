---
name: Pie Chart
slug: pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, pp. 281-286"

intent: Show the relative sizes of components to one another and to the whole using wedge-shaped segments of a circle
direction: both

components:
  - element: circle
    encodes: The whole (100%) being divided into parts
    required: true
  - element: segments
    encodes: Individual parts as wedge-shaped slices; area proportional to percentage of whole
    required: true
  - element: radii
    encodes: Boundaries between segments; all equal length in standard pie charts
    required: true
  - element: segment labels
    encodes: Description, value, and/or percentage for each segment
    required: false
  - element: reference angle
    encodes: Starting point for plotting segments (often 12 o'clock)
    required: false

parameters:
  segment_arrangement: "smallest-to-largest | largest-to-smallest | natural-grouping | alphabetical"
  direction: "clockwise | counterclockwise"
  reference_position: "12-oclock | 3-oclock | 6-oclock | centered"
  label_placement: "inside | outside | legend"

related: []  # TBD: see exploded-pie-chart, donut-chart, three-dimensional-pie-chart

warnings:
  - "Negative numbers cannot be displayed on pie charts"
  - "Percentages over 100% go contrary to the major advantage that people naturally think of a circle as encompassing 100%"
  - "Without labels, it is difficult for viewers to estimate segment sizes accurately"
  - "Using a legend instead of direct labels makes it more difficult for viewers because of extra eye movement required"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["cake chart", "divided circle", "circular percentage chart", "sector chart", "circle diagram", "sectogram", "circle graph", "segmented chart"]
  typical_use: "showing parts of a whole; percent-of-the-whole comparisons"
  chart_family: "proportional area chart"
  segment_measurement:
    - "angle of wedge (percent of 360 degrees)"
    - "area of wedge (percent of total circle area)"
    - "length of arc (percent of circumference)"
---

## Description

Pie charts are members of the proportional area chart family. Their major purpose is to show the relative sizes of components to one another and to the whole. They are used extensively as communication tools in presentations and publications.

A pie chart consists of a circle divided into wedge-shaped segments. The area of each segment (sometimes called slice or wedge) is the same percent of the total circle as the data element it represents is of the sum of all the data elements in its data set. For example, if 10% of cars are red, the segment representing red cars constitutes 10% of the total pie.

The 10% can be determined in three different ways, all yielding the same result:
1. The angle of the wedge (10% of 360 degrees)
2. The area of the wedge (10% of the total area of the circle)
3. The length of the arc (10% of the circumference of the circle)

Pie charts are classified as percent-of-the-whole charts or 100% charts.

## Examples

Harris illustrates a pie chart showing distribution of car colors (p. 281):
> "Total cars equals 200. Since there is a total of 200 cars and 10% of them are red, the segment of the pie representing red cars constitutes 10% of the total pie."

The segments show: Red 20 (10%), Black 50 (25%), Blue 60 (30%), Gray 70 (35%).

## Usage

**General characteristics:**
- With rare exceptions, negative numbers cannot be displayed
- Percentages over 100% can be used but rarely are
- Segments can be arranged in any order but are typically organized meaningfully (smallest to largest, natural groupings, alphabetical)
- Information typically proceeds clockwise
- The starting/reference radius can be located at any point but frequently is at 12 o'clock
- Values depicted by segments are independent of the radius of the circle
- Radii of segments in a given pie chart are generally all the same

**Labeling methods:**
- All key data inside segments (generally recommended)
- Legend to identify segments (makes it more difficult due to extra eye movement)
- Some or all data shown outside segments (necessary when segments are small)

**Reference angle positioning:**
- Major segment starts at 12 o'clock
- Major segment centered at 12 o'clock
- Major segment centered at 3 o'clock
- Major segment centered at 6 o'clock (particularly when pie is elongated for depth)

## Notes

When comparing multiple data series or studying changes over time, a series of pie charts may be shown side-by-side or superimposed (stacked pie chart). The segment representing a given element should be kept in the same relative position in each pie. More than four or five side-by-side or more than two stacked pies generally becomes confusing.

The sizes of circles in side-by-side arrangements may or may not have significance; when they do, they can be proportional to overall values (by diameter or by area, with area comparisons frequently recommended).
