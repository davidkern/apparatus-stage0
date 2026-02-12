---
name: Order of Occurrence Scale
slug: order-of-occurrence-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Order of occurrence scale, p. 337"

intent: Configure an axis that preserves the sequential order of events without implying equal time intervals between them
direction: both

components:
  - element: sequence-labels
    encodes: Numbers or identifiers indicating order (1, 2, 3... or sample numbers, lot numbers)
    required: true
  - element: tick-marks
    encodes: Division points for each sequential entry
    required: true
  - element: axis-line
    encodes: Reference line representing progression of events
    required: true

parameters:
  label_type: "sequential numbers | sample numbers | lot numbers | event identifiers"
  starting_number: "first sequence number"
  ending_number: "last sequence number in data"

related: []  # TBD: time-series-scale, ordinal-scale, sequence-graph

warnings:
  - "Equal physical distances do not indicate equal time intervals"
  - "Numbers are for identification and ordering only, not quantitative significance"
  - "Cannot determine actual elapsed time between entries from the graph"

extensions:
  harris_entry: "Scale"
  typical_use: "control charts, process monitoring, sequential sampling"
  scale_property: "equal physical distances, unknown time gaps"
---

## Description

An order of occurrence scale plots data in the same order or progression as it occurred or is planned to occur. This type of scale indicates which came before and which came after, but not necessarily how long the gap was between the two entries. The numbers or words used as labels are primarily for identification, location, and ordering purposes and generally have no quantitative significance.

Unlike time series scales where equal physical distances represent equal time intervals, order of occurrence scales have equal physical distances between entries but provide no indication of the actual time, distances, or frequencies between the data elements.

## Examples

> "This type of scale plots data in the same order or progression as it occurred or is planned to occur. An order of occurrence scale indicates which came before and which came after, but not necessarily how long the gap was between the two entries." (p. 337)

The PDF shows a scale numbered 1 through 12 with equal spacing. Below it: "Equal physical distances but no indication of how the times, distances, frequencies, etc., between the actual data elements compare."

For example, entry number 7 may have occurred 10 minutes after number 6, but 30 minutes before number 8. The scale does not convey this temporal information.

## Usage

Order of occurrence scales are appropriate when:
- Plotting sequential samples in quality control (sample 1, 2, 3...)
- The order of events matters but precise timing does not
- Data was collected at irregular intervals but sequence matters
- Creating control charts where sample number is the identifier

Order of occurrence scales are inappropriate when:
- Precise timing between events is important for interpretation
- Trends over calendar time need to be shown
- Viewers might incorrectly assume equal time intervals

## Notes

In control charts, values on the vertical axis are often plotted successively along a horizontal order of occurrence scale. The trend is the key focus, and the actual sample number may be unimportant. Labels such as lot number, sample number, or patient number might appear along the horizontal axis.
