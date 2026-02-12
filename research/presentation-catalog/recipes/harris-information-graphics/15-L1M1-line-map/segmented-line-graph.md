---
name: Segmented Line Graph
slug: segmented-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Terminology/Curve variations, p. 219"

intent: Connect adjacent data points with straight line segments to show transitions and enable interpolation between measured values
direction: both

components:
  - element: data-points
    encodes: Actual measured or observed values
    required: true
  - element: connecting-segments
    encodes: Linear interpolation between adjacent points
    required: true

parameters:
  data_type: "continuous | discrete"

related: []  # TBD: see also stepped-line-graph, curved-line-graph

warnings:
  - "Connecting points implies interpolation - that intermediate values follow the line"
  - "May be inappropriate for discrete data where transitions between points are not meaningful"
  - "Segmented lines may represent either linear or nonlinear data"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["point-to-point line graph", "connected scatter"]
  typical_use: "time series, continuous data, showing change between measured points"
---

## Description

A segmented line is made up of a series of straight lines connecting adjacent data points of a data series. This is the most common form of line graph, where each pair of consecutive points is joined by a straight diagonal line.

The segmented line implicitly assumes linear interpolation between measured points - that values between data points fall along the connecting line.

## Examples

**Curve variations** (p. 219):
> "A segmented line is made up of a series of straight lines connecting adjacent data points of a data series. Segmented lines may represent linear or nonlinear data."

The illustration shows a segmented line as one of several curve variations, demonstrating how it creates angular transitions at each data point where two segments meet.

**Discrete data example** (p. 216):
The same population data for Paris, Rome, London, and Moscow is shown on a segmented line graph, demonstrating how diagonal connections are drawn between the cities' values even though they represent distinct, non-transitioning entities.

## Usage

Use segmented line graphs when:
- Data is continuous (like temperature over time)
- Linear interpolation between measured points is reasonable
- You want to show both individual values and the transitions between them
- Connecting points aids visual tracking across the series

Consider alternatives when:
- Data points represent distinctly different things with no meaningful transition
- Nonlinear interpolation would be more accurate (consider curved lines)
- You want to emphasize discrete values (consider stepped lines)

## Notes

Harris notes that while "most people agree that data points representing continuous data can be connected with lines," there is disagreement about discrete data. The segmented line graph makes an implicit claim about what happens between measured points - that change is linear and continuous. When this assumption is questionable, stepped lines or point graphs may be more appropriate.
