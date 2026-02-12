---
name: Frequency Polygon
slug: frequency-polygon
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Frequency Polygon, p. 161"

intent: Display frequency distribution as a continuous curve connecting class interval midpoints instead of discrete columns
direction: both

components:
  - element: horizontal-axis
    encodes: Values or class intervals
    required: true
  - element: vertical-axis
    encodes: Frequency count
    required: true
  - element: polygon-line
    encodes: Frequency curve connecting midpoints of histogram columns
    required: true
  - element: data-points
    encodes: Center of top of each hypothetical column (optional, may be shown)
    required: false

parameters:
  histogram_visibility: "hidden (standard) | shown for reference"

related:
  - slug: frequency-distribution-graph
    relationship: contained-by

warnings:
  - "In an actual situation the histogram columns are generally not shown; only the connecting curve appears"
  - "The polygon implies continuity between class intervals that may not exist in the data"

extensions:
  harris_entry: "Frequency Polygon"
  typical_use: "showing frequency distribution with emphasis on shape and continuity"
  variant_of: "histogram"
---

## Description

A frequency polygon is a variation of a histogram where the columns are replaced by a curve that connects the centers of the tops of the columns of a histogram. In an actual situation, the columns are generally not shown - only the connecting line appears.

The frequency polygon emphasizes the continuous shape of the distribution rather than the discrete bins of a histogram.

## Examples

Harris illustrates a frequency polygon with the underlying histogram shown for reference (p. 161):

> "In the example at the right, the columns of the histogram are included for reference only. In an actual situation the columns are generally not shown."

The illustration shows:
- A histogram with columns representing frequency for class intervals 1 through 13
- A line (the frequency polygon) connecting the midpoints of the column tops
- The peak of the distribution visible around class intervals 5-7

## Usage

Frequency polygons are appropriate when:
- Emphasizing the overall shape of a distribution
- Comparing multiple distributions on the same graph (overlapping polygons are cleaner than overlapping histograms)
- The underlying variable is continuous and the class intervals are arbitrary divisions
- A smoother, less chunky appearance is desired

Frequency polygons are less appropriate when:
- The discrete nature of class intervals should be emphasized
- Precise frequency counts for specific intervals need to be read from the graph
- The data is categorical rather than continuous

## Notes

The frequency polygon can be seen as an intermediate form between the discrete histogram and a fitted smooth curve (like a kernel density estimate). It preserves the data-driven nature of the histogram while suggesting the continuous underlying distribution.

See also Histogram and Frequency Distribution Graphs for related techniques.
