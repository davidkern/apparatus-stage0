---
name: Pie Chart as Histogram
slug: pie-chart-as-histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Pie chart used as a histogram, p. 284"

intent: Display frequency distribution data in circular form where segment sizes represent frequency of occurrence within class intervals
direction: both

components:
  - element: circle
    encodes: Total count of all data elements (100%)
    required: true
  - element: segments
    encodes: Class intervals with size proportional to frequency
    required: true
  - element: interval-labels
    encodes: Class interval ranges (e.g., "4-4.9")
    required: true
  - element: frequency-labels
    encodes: Count or percentage for each interval
    required: true

parameters:
  class_interval_count: "number of bins"
  label_format: "count | percent | both"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "Unconventional format for frequency distributions"
  - "Column histograms better show distribution shape"
  - "Adjacent interval comparison is easier in linear format"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: ["circular histogram"]
  typical_use: "showing frequency distribution as parts of a whole"
---

## Description

Pie charts can be used as circular histograms to display frequency distributions. When used this way, each segment of the chart represents a different class interval, and the size of the segment is proportional to the frequency of occurrence of the values in that class interval.

For example, if a data series has 105 data elements and 16 (15%) of those data elements have values that fall in the class interval between 4 and 4.9, the segment representing the class interval 4 to 4.9 would represent 15% of the total area of the circle.

## Examples

Harris illustrates with a distribution showing class intervals from 0-0.9 through 14-14.9 (p. 284):
> "Pie chart used as a circular histogram"

The circular histogram shows segments for class intervals:
- 2-2.9 (5%)
- 3-3.9 (13%)
- 4-4.9 (15%)
- 5-5.9 (14%)
- 6-6.9 (12%)
- 7-7.9 (10%)
- 8-8.9 (8%)
- And smaller segments for tails of distribution

A conventional column histogram displaying the same data is shown alongside for comparison, with frequency on the vertical axis and class intervals on the horizontal axis.

## Usage

**When to use:**
- When emphasizing that frequencies sum to 100%
- When part-to-whole framing is important
- For audiences more familiar with pie charts than histograms

**When to prefer conventional histogram:**
- When distribution shape matters (normal, skewed, bimodal)
- When comparing adjacent intervals
- When showing spread and central tendency
- For analytical purposes

**Arrangement considerations:**
- Segments should follow natural ordering of class intervals
- Starting position and direction should be consistent
- Consider whether clockwise or counterclockwise better matches reading pattern

## Notes

The circular histogram is an unusual application of the pie chart format. While technically valid - frequencies do form parts of a whole - the format obscures the distribution shape that makes histograms analytically useful.

Standard rectangular histograms excel at showing whether data is normally distributed, skewed, or multimodal. The circular format makes these patterns harder to perceive because the linear sequence is wrapped around a circle.

This format may be most appropriate when the "part of whole" framing is more important than the distribution shape - for instance, showing what percentage of measurements fall within acceptable ranges versus outside them.
