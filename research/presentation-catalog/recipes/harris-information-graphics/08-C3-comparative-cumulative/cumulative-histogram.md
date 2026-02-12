---
name: Cumulative Histogram
slug: cumulative-histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cumulative Histogram, p. 119"

intent: Display cumulative frequencies as columns rather than a curve, showing the running total of observations up to each class interval
direction: both

components:
  - element: class-interval-axis
    encodes: Values or class intervals (horizontal axis)
    required: true
  - element: cumulative-frequency-axis
    encodes: Running total of frequencies or cumulative percent (vertical axis)
    required: true
  - element: cumulative-columns
    encodes: Columns whose heights represent cumulative frequency up to that interval
    required: true

parameters:
  cumulation_direction: ascending | descending
  frequency_type: count | percent | both

related: []

warnings:
  - "A cumulative frequency graph (curve) is generally recommended over cumulative histogram for determining percentages"
  - "Columns show cumulative totals, not individual interval frequencies"

extensions:
  harris_entry: "Cumulative Histogram"
  typical_use: "Showing cumulative distribution when discrete column format is preferred"
  recommended_alternative: "cumulative-frequency-graph"
---

## Description

A cumulative histogram is a variation of a histogram in which cumulative values are plotted instead of incremental values. The frequency or percent to be plotted for a given class interval is determined by adding the frequency value or percent for that class interval to the frequencies or percents for all class intervals preceding it.

Unlike a standard histogram where each column shows only the frequency for that interval, a cumulative histogram shows the total frequency from the beginning up to and including that interval.

## Examples

Harris illustrates the cumulative histogram on page 119:

> Cumulative histogram showing cumulative percent on the vertical axis, with values or class intervals from 1.5 to 2.5 on the horizontal axis. Each column's height represents the cumulative percentage of all data elements up to that class interval.

The example shows values cumulated from the smallest value to the largest, with the final column reaching nearly 100%.

> In this example, the values are cumulated from the smallest value to the largest. An alternative method is to cumulate from the largest value to the smallest.

## Usage

Cumulative histograms serve similar purposes to cumulative frequency graphs:
- Determining what percentage of elements are more than or less than a particular value
- Showing the distribution shape in cumulative form

**Cumulation options:**
- **Ascending (less than)**: Cumulate from smallest to largest value
- **Descending (more than)**: Cumulate from largest to smallest value

**Frequency scales:**
- Count (absolute frequency)
- Percent (relative frequency)
- Both scales can be shown simultaneously

**When to use:**
- When the discrete column format is preferred over a continuous curve
- When the data naturally fits discrete class intervals
- When precise visual comparison at specific intervals is important

**Recommendation:**
Harris notes that for determining what percentage of elements are more than or less than a particular value, a cumulative frequency graph (smooth curve) is generally recommended over the cumulative histogram. The curve allows for easier interpolation between class intervals.

## Notes

The cumulative histogram maintains the discrete, columnar appearance of a standard histogram while showing cumulative rather than incremental frequencies. It provides a stepping-stone visualization between the standard histogram and the smooth cumulative frequency curve (ogive).
