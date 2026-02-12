---
name: Sequence Graph
slug: sequence-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Sequence Graph, pp. 348-349"

intent: Display data with a sequence scale on one axis and a value scale on the other to show progression or ordering
direction: both

components:
  - element: sequence-scale
    encodes: Ordered or progressive axis (time series, order of occurrence, or ordinal)
    required: true
  - element: value-scale
    encodes: Quantitative axis measuring the variable of interest
    required: true
  - element: data-graphics
    encodes: Points, lines, columns, or areas representing data values
    required: true

parameters:
  sequence_type: "time-series | order-of-occurrence | ordinal"
  graph_type: "point | line | column | area"
  data_series_count: "single | multiple"

related: []  # TBD: time-series-scale, order-of-occurrence-scale, ordinal-scale

warnings:
  - "Labels on sequence scales cannot be reordered without degrading information"
  - "Sequence information cannot be mathematically manipulated meaningfully"
  - "Missing data should leave blank space, not compress the sequence"

extensions:
  harris_entry: "Sequence Graph"
  typical_use: "trend analysis, process monitoring, forecasting, sequential comparisons"
---

## Description

A sequence graph is a graph with a sequence scale on one axis and a value scale on the other. In two-dimensional graphs, the sequence scale is generally on the horizontal axis. In three-dimensional graphs, the sequence scale is on either the X or Y axis, and the value scale is on the vertical axis.

A sequence scale consists of words or numbers in an ordered or progressive sequence. When numbers are used, they are only for locating, identifying, or ordering purposes and have no quantitative significance. The three major types of sequence scales are:

1. **Time series**: Equal intervals represent equal time increments
2. **Order of occurrence**: Sequential ordering without equal time intervals
3. **Ordinal**: Ranked positions without quantified differences

## Examples

> "A sequence scale is the only type of scale that incorporates the concept of nonquantitative progression. The progression might be in terms of time, the order in which things occur irrespective of time, or the progression or succession of ordinal information such as small, medium, large or first place, second place, third place." (p. 349)

The PDF provides examples of all three sequence graph types:

**Time series graph**: Shows values from 1987-1993 with equal year intervals, demonstrating how a time series scale has equal physical distances representing equal time.

**Order of occurrence graph**: A control chart showing samples 1-23 with upper and lower control limits. The numbers indicate sample sequence, not time intervals.

**Ordinal graph**: Bar chart showing percent values for "First place," "Second place," "Third place," and "Fourth place."

## Usage

Sequence graphs are used extensively for:
- Monitoring and controlling processes, activities, performance
- Analyzing for trends
- Looking for repetitive fluctuations (seasonal, cyclical)
- Forecasting and projecting
- Comparing performance of multiple entities
- Studying repetitive phenomena
- Communicating sequential information

**Missing data handling**: When data is missing, provide empty space so the pattern is not distorted and the viewer is alerted. If using a line graph, the line may be broken, left continuous, or bridged with a dashed line.

## Notes

Key distinctions between sequence and other scale types:

> "A sequence scale is differentiated from a category scale in that the labels on a sequence scale cannot be reordered without degrading the information plotted on the graph." (p. 349)

> "Sequence scales are differentiated from quantitative scales in that sequence information cannot be mathematically manipulated in any meaningful way. For example, even if it could be done, taking the logarithm of dates or lot numbers would yield meaningless numbers." (p. 349)

Point, line, area, and column graphs are most frequently used for displaying sequential information. Multiple data series can be plotted on the same graph.
