---
name: Tally Chart
slug: tally-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Tally Chart, p. 397"

intent: Record and display the distribution of data elements using tally marks that simultaneously collect data and form a histogram
direction: both

components:
  - element: value-axis
    encodes: Values or class intervals for the data being recorded
    required: true
  - element: frequency-axis
    encodes: Count accumulation through tally marks
    required: true
  - element: tally-marks
    encodes: Individual occurrences of values using hatch marks (typically grouped in fives)
    required: true
  - element: resulting-histogram
    encodes: Visual distribution pattern formed by accumulated tally marks
    required: true

parameters:
  axis_orientation: "horizontal | vertical"
  class_interval_width: "numeric range per category"
  grouping_convention: "typically 5 marks per group (4 vertical + 1 diagonal)"

related: []

warnings:
  - "If only looking for mode, spread, and general pattern, tally marks do not need to be counted"
  - "For exact values, hatch marks must be counted for each column or row"

extensions:
  harris_entry: "Tally Chart"
  typical_use: "analyzing distribution of data elements during collection"
  unique_feature: "histogram develops as data is collected rather than after"
---

## Description

A tally chart is a type of frequency distribution chart in which tally or hatch marks are used to record and graphically show the distribution of data elements in data sets. The technique has the unique feature that a histogram is developed as the data is collected, as opposed to collecting all the data and then developing the histogram.

This simultaneous collection and visualization makes tally charts particularly useful for real-time quality control, survey data entry, and situations where immediate visual feedback on distribution patterns is valuable.

## Examples

### Basic Structure (p. 397)

Harris shows two forms of tally charts:

1. **Manual tally chart**: Values or class intervals shown on one axis (either horizontal or vertical). Each time a value occurs in the data set, a tally is added to the chart in the appropriate column or row. When all data elements are accounted for, the resulting series of tally marks forms the equivalent of a simple histogram.

2. **Preprinted form tally chart**: For repetitive tasks, preprinted forms with class intervals already marked allow frequencies to be read directly from the form without additional counting.

Harris's example shows a distribution of values from 66-74 across frequencies from 5-55, with tally marks (grouped in fives) building up a bell-curve-like distribution pattern.

### Reading Without Counting

> "If one is only looking for such things as the value that occurs most frequently (mode), the spread, and general pattern of the data, the tally marks do not have to be counted." (p. 397)

The visual pattern alone reveals:
- **Mode**: The column/row with the most marks
- **Spread**: The range from minimum to maximum values
- **Distribution shape**: Normal, skewed, bimodal, etc.

## Usage

### When to use tally charts
- Real-time data collection where immediate pattern recognition is needed
- Quality control processes monitoring manufacturing tolerances
- Survey response collection
- Situations where both recording and visualization serve the same purpose
- Educational contexts for teaching distribution concepts

### Construction process
1. Determine values or class intervals to track
2. Create axis with these values/intervals
3. For each data element encountered, add one tally mark in the appropriate position
4. Group marks in fives (four vertical marks crossed by one diagonal) for easier counting
5. Continue until all data is recorded

### Reading the result
- The accumulated marks form a histogram shape
- Visual inspection reveals distribution characteristics
- Count marks only if precise frequencies are needed

## Notes

The tally chart elegantly combines data collection with visualization. Unlike standard histograms that require complete data before graphing, tally charts show the emerging pattern throughout the collection process. This makes them particularly valuable in manufacturing and quality control contexts where detecting distribution shifts early can prevent defects.

Harris notes that preprinted forms streamline the process for repetitive tasks, allowing frequencies to be read directly without counting individual marks.
