---
name: Histogram
slug: histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, pp. 187-194"

intent: Display the frequency distribution of continuous data by grouping values into class intervals and representing counts with adjacent columns
direction: both

components:
  - element: columns
    encodes: Frequency or count of data elements in each class interval
    required: true
  - element: class-intervals
    encodes: Equal-width ranges that partition the data range (also called bins, cells, groups)
    required: true
  - element: vertical-axis
    encodes: Frequency count or relative frequency (percent)
    required: true
  - element: horizontal-axis
    encodes: Value scale showing class interval boundaries or midpoints
    required: true
  - element: column-adjacency
    encodes: Continuous nature of the underlying data (no gaps between columns)
    required: true

parameters:
  number_of_intervals: "5-40 class intervals (typically)"
  interval_width: "uniform | irregular (requires area adjustment)"
  frequency_type: "count | percent | relative frequency | proportion"
  orientation: "vertical (column) | horizontal (bar)"

related: []  # TBD: frequency-polygon, cumulative-histogram, bar-graph

warnings:
  - "Too few intervals distort the distribution shape; too many create gaps and blur patterns"
  - "Vertical scale must start at zero with no scale breaks since area represents value"
  - "Column area (not just height) is proportional to value; irregular widths require height adjustment"
  - "Easily confused with bar graphs; histograms show continuous data with adjacent bars, bar graphs show categorical data with spaced bars"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  alternate_names: ["frequency diagram", "histograph"]
  typical_use: "analyzing distribution patterns in continuous data"
  scale_types:
    vertical: "quantitative (frequency)"
    horizontal: "quantitative (values or class intervals)"
  distinction_from_bar_graph: "Histogram bars touch (continuous data); bar graph bars are spaced (categorical data)"
---

## Description

The histogram is the best-known member of the family of data distribution graphs. It shows the frequency with which specific values or values within ranges (class intervals) occur in a data set. Harris describes the construction process: first plot all values on a one-axis distribution graph, then divide into 5-10 equal class intervals and count the data elements in each interval, then construct a joined column graph of those counts.

The key distinguishing feature of a histogram is that columns are adjacent (touching) because the underlying data is continuous. This contrasts with bar graphs where columns are spaced because the data is categorical.

Technically, the area of each column is proportional to the value it represents. When all columns have the same width, height alone indicates value. When widths vary (irregular class intervals), heights must be adjusted so that areas remain proportional to frequencies.

## Examples

Harris provides a detailed worked example using a data set of 73 numbers ranging from 1.9 to 4.7 (p. 187):

> "To address the problem of overlapping and at the same time quantify the distribution, one may divide the axis into five to ten equal intervals (called class intervals, classes, group intervals, bins, or cells) and, using the actual data, count the number of data elements in each interval."

The example shows seven class intervals with counts: 1, 6, 18, 28, 11, 7, 2 for intervals from 1.5 to 5.0.

On displaying relative frequency (p. 187):
> "Many times, in addition to knowing how many data elements fall into each interval, it is desirable to know what percentage those quantities represent of the total number of data elements in the data set. This information can be displayed on a histogram either by showing the percent in or adjacent to each data graphic and/or adding a percent scale to the graph."

## Usage

Histograms are appropriate when:
- Data is continuous (measured on an interval or ratio scale)
- Understanding the distribution shape is important
- Identifying concentration, spread, skewness, or outliers is the goal

The number of class intervals significantly affects interpretation (p. 188):
> "As the number of intervals increases, the more accurately the graph depicts the actual data; however, at some point, distinctive patterns blur, and gaps begin to appear because there are no data elements in some of the class intervals."

Harris recommends 5-40 class intervals as the common range.

Methods for determining interval width include:
- Divide data range by desired number of intervals
- Use whole numbers as boundaries
- Specify a fixed interval width
- Allocate one column per unique value

## Notes

Key terminology illustrated on p. 188:
- **Frequency**: The number of times a value or group of values occurs
- **Mode**: The class interval occurring most frequently
- **Tail**: Low frequency values at the distribution ends
- **Range**: Difference between maximum and minimum values
- **Outliers**: Questionable data points significantly different from the main body

Labeling options (p. 194): Labels can be centered below columns (for single values), placed at boundaries between intervals, or show exact value ranges included in each interval. The boundary method can cause confusion about where boundary values are counted.
