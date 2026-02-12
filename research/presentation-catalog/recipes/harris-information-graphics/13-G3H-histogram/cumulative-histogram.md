---
name: Cumulative Histogram
slug: cumulative-histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, p. 192"

intent: Show the running total of frequencies across class intervals to determine what percentage of data elements fall above or below selected values
direction: both

components:
  - element: columns
    encodes: Cumulative frequency up to each class interval boundary
    required: true
  - element: class-intervals
    encodes: Value ranges along horizontal axis
    required: true
  - element: vertical-axis
    encodes: Cumulative frequency or cumulative percent (0-100%)
    required: true
  - element: horizontal-axis
    encodes: Class interval boundaries
    required: true
  - element: connecting-curve
    encodes: Smooth interpolation between boundary values (optional)
    required: false

parameters:
  cumulation_direction: "smallest-to-largest | largest-to-smallest"
  frequency_type: "count | percent"

related: []  # TBD: histogram, cumulative-frequency-graph

warnings:
  - "Direction of cumulation affects interpretation; specify clearly"
  - "Boundary values used differ based on cumulation direction (upper for smallest-to-largest, lower for reverse)"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  alternate_names: ["cumulative frequency histogram", "ogive histogram"]
  typical_use: "determining percentiles and proportion above/below thresholds"
---

## Description

In a cumulative histogram, the value plotted for each class interval is determined by adding that interval's frequency to the frequencies of all preceding intervals. This creates a monotonically increasing (or decreasing) stepped graph that allows readers to determine what percentage of data elements fall above or below any given value.

When the columns are eliminated and only the boundary values are connected with a curve, the result is called a cumulative frequency graph. The cumulative histogram is the stepped column version of this concept.

## Examples

Harris provides a detailed example on p. 192:

> "In a cumulative histogram, the value to be plotted for a particular class interval is determined by adding the frequency value or percent for that class interval to the frequencies or percents for all class intervals preceding it. Frequencies can be cumulated from the smallest value to the largest, or vice-versa."

On reading the graph:
> "For example, using the class interval of 2.0 to 2.1 in the graph at the right, one may determine that 63% of the data points are equal to or less than 2.1, and 37% of the data elements are equal to or greater than 2.1."

The example shows cumulative percent on the vertical axis (0-100%) with class intervals on the horizontal axis, demonstrating how to read greater-than and less-than values.

## Usage

Cumulative histograms answer questions like:
- What percentage of values fall below a certain threshold?
- At what value does 90% of the data fall below?
- How do two distributions compare in terms of cumulative proportions?

Harris notes (p. 192):
> "A cumulative histogram allows one to determine what percentage of the data elements in the data set are above or below selected values. Those selected values are the upper and lower boundaries of the class intervals."

For continuous reading at any point (not just boundaries), connect the boundary values with a curve; if the columns are then eliminated, the result is a cumulative frequency graph.

## Notes

Sometimes described as an "elongated S" shape when cumulating from smallest to largest with a normal distribution. The inflection point of the S-curve occurs near the median value.
