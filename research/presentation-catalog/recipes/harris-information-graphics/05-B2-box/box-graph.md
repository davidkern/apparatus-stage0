---
name: Box Graph
slug: box-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Box Graph, pp. 57-59"

intent: Summarize the distribution of data within a data set by encoding key statistical measures (median, quartiles, percentiles, outliers) into a single compact symbol
direction: both

components:
  - element: box (rectangle)
    encodes: The interquartile range, typically 25th to 75th percentiles
    required: true
  - element: whiskers
    encodes: Extended range, typically 5th/95th or 10th/90th percentiles
    required: true
  - element: center line (median)
    encodes: The median or 50th percentile of the data set
    required: true
  - element: average marker
    encodes: The mean value of the data set (often a different line style or symbol)
    required: false
  - element: outlier points
    encodes: Individual data points beyond the whisker range
    required: false
  - element: whisker ticks
    encodes: Terminal markers at whisker ends indicating exact percentile values
    required: false

parameters:
  orientation: vertical | horizontal
  box_fill: unfilled | solid | patterned
  whisker_width: narrow | medium | full-box-width
  whisker_terminals: ticks | symbols | none | box-ends
  percentile_convention: "5th-95th | 10th-90th | min-max | standard-deviation"

related: []  # TBD: see also histogram, frequency-distribution

warnings:
  - "Many modifications to the original design have been made; it is sometimes unclear what the various elements represent without an accompanying explanation"
  - "Except for very technical works, many of the original definitions of the various indicators on box symbols are seldom used"
  - "When using notched or variable-width boxes, ensure the encoding is explained to viewers"

extensions:
  harris_entry: "Box Graph"
  alternate_names:
    - "box plot"
    - "box-and-whisker plot"
    - "box diagram"
    - "percentile graph"
  typical_use: "comparing distributions across multiple data sets or time periods"
  scale_types:
    vertical: "quantitative"
    horizontal: "category or sequence"
---

## Description

A box graph (also called box plot, box-and-whisker plot, or box diagram) uses a specialized symbol to summarize the distribution of data within a data set. Unlike a simple average or point, the box symbol encodes multiple statistical measures simultaneously: typically the median, quartiles, extended percentiles, and outliers.

The box symbol consists of a rectangle (box) that generally has a line extending from both ends (whiskers). The ends of the rectangle generally designate the 25th and 75th percentiles of the data set. The ends of the whiskers generally designate the 5th and 95th or the 10th and 90th percentiles. Lines across the rectangle indicate the average and/or median values. Data points above and below the outer percentiles are generally indicated as individual data points.

Harris notes this is "a relatively new type of graph that is widely used" and that "wide usage plus efforts to simplify its construction and interpretation have resulted in many modifications to the original design."

## Examples

From the individual box symbol (p. 57), the following can be observed:
- Individual data points beyond the 90th or 95th percentile
- The whisker extending to the 90th or 95th percentile
- The 75th percentile (upper quartile) at the top of the box
- The average/mean marked within the box
- The 50th percentile (median) marked within the box
- The 25th percentile (lower quartile) at the bottom of the box
- The 10th or 5th percentile at the end of the lower whisker
- Individual outlier data points below the lower percentile

Harris provides a table of key measure variations (p. 57):
- Average, 10th, 25th, 75th and 90th percentiles
- Average, 5th, 25th, 75th and 95th percentiles
- Average, 25th percentile, 75th percentile, minimum and maximum
- Average, median, 25th, 75th percentiles, plus/minus one standard deviation
- Median plus and minus one standard deviation, minimum and maximum

## Usage

Based on information encoded in a box symbol, one can frequently make the following observations:
- What the key values are such as average, median, 75th percentile, etc.
- Whether there are outliers (unusual data points) and what their values are
- Whether the data is symmetrical and how tightly the data is grouped
- Whether the data is skewed and if so which direction
- What values do 50% and 90% of the data points lie within (i.e., 25% to 75% and 5% to 95%, respectively)

**Orientation**: Box symbols can run vertically or horizontally. When used individually, they typically have a single axis.

**Comparing multiple data sets**: Box symbols can be used to analyze multiple data sets on a graph. By superimposing a set of box symbols over the point graph or line graph of the averages, one can see not only how the averages compare but also how distributions and unusual data points compare.

**Grouped box graphs**: Sometimes called a clustered box graph. Box graphs can be used to compare multiple data series similar to the grouping of columns in a grouped column graph. With this type of graph, one can make comparisons and see changes in the distribution of the data elements in each data set in addition to making observations about the averages.

## Notes

### Variable Width Boxes

Normally the widths of all the rectangles in a box graph are the same and have no significance. Occasionally, the widths are varied to encode additional information. Box widths might be proportional to such things as the size of the sample represented by the box, the size of the entire family of data from which the sample was taken, market share, or relative importance. Either quantitative or qualitative characteristics might be encoded.

### Confidence Intervals

Confidence intervals can be indicated by means of notches or shading. The two ends of the notch or shading indicate the two limits of the confidence interval. This communicates to the viewer that there is a 90% or 95% probability that the overall average lies somewhere within the confidence interval. If the confidence intervals of any two box plots do not overlap, the averages of those data sets are said to have a significant difference.

### Combined with Point Graphs

When additional detail on the distribution of the data is desired, the actual data points are sometimes superimposed over the box symbol. In this way the viewer can see the summary information of the box plot as well as the distribution and clustering of the actual data points. Either dots or stripes can be used in this application.

### Original Terminology

Harris provides original box plot designations (p. 59) including:
- **H-spread**: The distance between the low hinge and high hinge
- **Low hinge**: Equal to the median of the data elements between the lowest value in the data set and the median of the entire data set
- **High hinge**: Equal to the median of the data elements between the highest value in the data set and the median of the entire data set
- Whisker endpoints defined as hinge +/- 1.5 times the H-spread
- Outlier ranges defined as hinge +/- 3.0 times the H-spread
