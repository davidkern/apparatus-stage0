---
name: Ogive Graph
slug: ogive-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Ogive Graph, p. 256"

intent: Display cumulative frequency distribution as a smooth curve showing the running total of occurrences up to each value or class interval
direction: both

components:
  - element: cumulative-curve
    encodes: Running total of frequency up to each point; replaces histogram columns
    required: true
  - element: horizontal-axis
    encodes: Values or class intervals being measured
    required: true
  - element: vertical-axis
    encodes: Cumulative frequency (count or percentage)
    required: true

parameters:
  frequency_unit: count | percentage
  cumulation_direction: ascending | descending

related:
  - slug: cumulative-frequency-graph
    relationship: variant-of
  - slug: histogram
    relationship: contrasts

warnings:
  - "Ensure the curve starts at zero cumulative frequency for the lowest class interval"

extensions:
  harris_entry: "Ogive Graph"
  alternate_names:
    - "cumulative frequency graph"
    - "summation graph"
  typical_use: "showing cumulative distribution of values"
---

## Description

An ogive graph is the equivalent of a cumulative histogram with the columns replaced by a curve. It is a line graph with values or class intervals typically plotted on the horizontal axis and the cumulative number of times each of those values or groups of values occurs (cumulative frequency) plotted on the vertical axis.

The frequency may be plotted in terms of cumulative counts or percentages.

## Examples

Harris illustrates (p. 256) an ogive graph showing:
- Value or class interval on horizontal axis (11-23)
- Cumulative Frequency on left vertical axis (0-250)
- Cumulative Percent on right vertical axis (0%-100%)
- Smooth ascending curve from lower left to upper right

## Usage

**When to use:**
- To show the distribution of data in cumulative form
- To determine what percentage of data falls below a certain value
- To compare distributions across different data sets

**Relationship to histograms:**
The ogive replaces the stepped appearance of a cumulative histogram with a smooth curve, making it easier to read intermediate values and identify percentiles.

## Notes

See Cumulative Frequency Graph for additional information on this visualization technique.
