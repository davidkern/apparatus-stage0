---
name: Frequency Polygon
slug: frequency-polygon
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, pp. 187, 189"

intent: Display frequency distribution as a line graph by connecting the midpoints of histogram columns, enabling easier comparison of multiple data series
direction: both

components:
  - element: line
    encodes: Frequency values at class interval midpoints
    required: true
  - element: data-points
    encodes: Frequency count or percent at each class interval midpoint
    required: true
  - element: vertical-axis
    encodes: Frequency or relative frequency
    required: true
  - element: horizontal-axis
    encodes: Class interval values or midpoints
    required: true
  - element: zero-endpoints
    encodes: Distribution tails extending to zero frequency
    required: false

parameters:
  line_style: "segmented (straight) | smooth (curved)"
  multiple_series: "single | overlaid for comparison"

related: []  # TBD: histogram, cumulative-frequency-graph

warnings:
  - "Not suitable for irregular width intervals"
  - "Additional intervals should be added at both ends so the curve starts and ends at zero"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  alternate_names: ["frequency diagram"]
  typical_use: "comparing multiple frequency distributions on the same graph"
---

## Description

A frequency polygon is a segmented or smooth line version of a histogram. It is created by connecting the midpoints of histogram columns with straight lines and eliminating the columns. This format can make visualization easier and is particularly helpful when comparing multiple data series.

Harris notes that frequency polygons offer advantages for comparison that histograms do not easily provide, since multiple overlapping histograms can be visually confusing while multiple frequency polygon lines can be distinguished clearly.

## Examples

From p. 189:
> "Sometimes the midpoints of the columns of a histogram are connected by straight lines and the columns eliminated. This type of graph is generally called a frequency polygon."

Harris illustrates both segmented (straight line) and smooth line versions:
> "The straight lines connecting the data points are sometimes converted to smooth lines to improve the appearance of the curve."

On extending to zero (p. 189):
> "An additional interval is often added to both ends of a histogram when it is converted to a frequency polygon, so the curve starts and ends at zero."

## Usage

Frequency polygons are preferred when:
- Comparing multiple frequency distributions on the same graph
- A smoother visual representation is desired
- The focus is on the overall shape rather than precise interval values

They should not be used with irregular width intervals.

## Notes

Harris presents nine typical distribution shapes that frequency polygons reveal (p. 189):

1. **Symmetrical bell-shaped (mesokurtic)**: Normal distribution, unimodal
2. **Positively skewed**: Values concentrated left, tail extends right
3. **Negatively skewed**: Values concentrated right, tail extends left
4. **Bimodal/twin-peaked**: Suggests two different populations
5. **Platykurtic (flat)**: May indicate multiple populations mixed
6. **Flat-sided**: May indicate screening/removal of values above or below a threshold
7. **Multimodal**: Several populations or multiple distinct influences
8. **Leptokurtic (narrow/spiked)**: Data concentrated in narrow range with long tails
9. **End spike**: Values above or below a threshold lumped into single category
