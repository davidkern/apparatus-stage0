---
name: Frequency Distribution Graph
slug: frequency-distribution-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Frequency Distribution Graphs, p. 161"

intent: Show how data elements are distributed across values or class intervals using incremental or cumulative frequencies
direction: both

components:
  - element: horizontal-axis
    encodes: Values or class intervals
    required: true
  - element: vertical-axis
    encodes: Frequency count or cumulative frequency
    required: true
  - element: data-graphics
    encodes: Frequency for each value/interval (bars, columns, lines, points)
    required: true

parameters:
  frequency_type: "incremental | cumulative"
  display_format: "histogram | frequency polygon | stem-and-leaf | tally | dot array | quantile"

related:
  - slug: frequency-polygon
    relationship: variant-of

warnings:
  - "Incremental and cumulative presentations answer different questions; choose based on analytical need"

extensions:
  harris_entry: "Frequency Distribution Graphs"
  typical_use: "showing how data elements are distributed in data sets"
  variant_of: "data distribution graphs"
  subtypes:
    incremental:
      - "Stem and leaf"
      - "Tally"
      - "Histogram"
      - "Frequency polygon"
      - "Dot array"
    cumulative:
      - "Cumulative histogram"
      - "Cumulative frequency graph"
      - "Quantile graph"
---

## Description

Most frequency distribution graphs are two-dimensional graphs used to show how data elements are distributed in data sets. They are a variation of data distribution graphs. Within the frequency distribution graph family, there are two major categories:

1. **Incremental frequency graphs**: Show frequencies for individual values or class intervals
2. **Cumulative frequency graphs**: Plot cumulative values that accumulate across the distribution

## Types of Frequency Distribution Graphs

### Incremental Frequency Graphs

Harris illustrates these types showing incremental frequencies (p. 161):

- **Stem and leaf**: Displays individual data values organized by leading digits
- **Tally**: Shows frequency counts using tally marks for each value
- **Histogram**: Columns showing frequency for each class interval
- **Frequency polygon**: Line connecting midpoints of histogram columns
- **Dot array**: Individual dots representing each data element

### Cumulative Frequency Graphs

Harris illustrates these types showing cumulative frequencies:

- **Cumulative histogram**: Columns showing accumulated frequency up to each class interval
- **Cumulative frequency graph**: Line showing accumulated frequency
- **Quantile graph**: Shows the distribution of values against cumulative proportions

## Examples

Harris provides visual examples of all major types arranged in a comparison layout (p. 161), showing how the same underlying data distribution appears in each format. The incremental formats emphasize where values concentrate, while cumulative formats emphasize what proportion of data falls below any given value.

## Usage

Choose **incremental frequency** displays when:
- The question is "How many observations fall in each interval?"
- Identifying the mode or most common values is important
- Showing the shape of the distribution (normal, skewed, bimodal)

Choose **cumulative frequency** displays when:
- The question is "What proportion falls below a given value?"
- Identifying percentiles or quantiles is important
- Comparing distributions via their cumulative shapes

## Notes

Each subtype is discussed in detail under its individual heading in Harris. This entry provides the organizing framework for understanding how different frequency distribution visualizations relate to each other.
