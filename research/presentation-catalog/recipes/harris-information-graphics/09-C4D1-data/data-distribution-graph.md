---
name: Data Distribution Graph
slug: data-distribution-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Data Distribution Graphs, pp. 124-125"

intent: Show how the data elements of a data set are distributed, including clustering, spread, and frequency of values
direction: both

components:
  - element: value-axis
    encodes: Scale of possible data values
    required: true
  - element: frequency-representation
    encodes: Visual encoding of how often each value or range occurs
    required: true
  - element: distribution-shape
    encodes: Overall pattern revealing clustering, skewness, or uniformity
    required: false

parameters:
  graph_type: point-graph | stripe-graph | box-graph | stem-and-leaf | tally-chart | dot-array | histogram | frequency-polygon | cumulative-histogram | ogive | quantile-graph | normal-probability-plot
  data_representation: individual-elements | grouped-summaries | cumulative
  comparison_mode: single-set | multiple-sets

related: []  # TBD: see also histogram, box-graph, frequency-polygon

warnings:
  - "Tally charts and dot array charts are not normally used for comparing multiple data sets"
  - "Choice of class interval width significantly affects histogram appearance"
  - "Normal probability plots require special non-linear graph paper or computer generation"

extensions:
  harris_entry: "Data Distribution Graphs"
  typical_use: "understanding data spread, identifying clusters and outliers, testing for normality"
  subtypes:
    - "one-axis graphs: point, stripe"
    - "summary graphs: box, stem-and-leaf, tally, dot-array"
    - "frequency graphs: histogram, frequency polygon"
    - "cumulative graphs: cumulative histogram, ogive, quantile"
    - "probability graphs: normal probability plot, quantile-quantile"
---

## Description

Many times an average or median value is inadequate to describe a set of data, and a graph showing the distribution of the data is necessary. Data distribution graphs answer questions such as:
- Are the data elements distributed evenly or clustered?
- If clustered, how many clusters and where?
- What are the maximum and minimum values?
- Are there any unusual data elements?
- What percent of data elements are over a certain value?
- Which value occurs most frequently?

Harris organizes these graphs into several categories based on how they represent and summarize data.

## Examples

**One-Axis Data Distribution Graphs** (p. 124)

*Point Graph:*
> "Sometimes referred to as a one-axis point graph. In this type of graph every element of a data set is plotted as a separate point. Occasionally used in conjunction with other types of graphs such as in the borders of scatter graphs."

*Stripe Graph:*
> "Similar to a one-axis point graph except the points are replaced by short lines (stripes). Frequently used in conjunction with other types of graphs such as in the borders of scatter graphs."

**Summary Distribution Graphs** (p. 124)

*Box Graph:*
> "Summarizes key features of the distribution of a data set. The example displays one combination of key elements that might be shown... maximum, 90th percentile, 75th percentile, upper confidence limit, median, average/mean, lower confidence limit, 25th percentile, 10th percentile, minimum."

*Stem and Leaf Chart:*
> "The first digit(s) of each data element in a data set is shown to the left of a vertical line. The last significant digit(s) are shown to the right of the vertical line. The digits to the right of the vertical line form a sort of histogram. This type of chart enables the viewer to identify every data element in the data set."

**Frequency Distribution Graphs** (p. 125)

*Histogram:*
> "Probably the most widely used method for displaying data distributions. Can be used for discrete or continuous data. Sets of data can be of any size."

*Frequency Polygon:*
> "The data points on a frequency polygon represent the same values as the tops of the columns in a histogram. The data points are plotted at the midpoint of the class intervals. Polygons are often better than histograms for comparing multiple distributions."

**Cumulative Frequency Graphs** (p. 125)

*Cumulative Frequency Graph (Ogive):*
> "Sometimes referred to as Ogive curve or cumulative relative frequency (percent) graph... A key difference [from cumulative histogram] is that the data points are plotted at the class interval boundaries."

*Quantile Graph:*
> "Quantile graphs function similar to cumulative frequency graphs but are constructed very differently. With this type of graph, specific data points are plotted as opposed to the class interval summaries used by cumulative frequency graphs."

**Normal Probability Testing** (p. 125)

*Cumulative Frequency on Probability Grid:*
> "To determine whether a data series has a normal distribution, cumulative relative frequency data are plotted on a special normal probability grid. The grid has a non-linear percent axis... If the distribution is normal, the data points cluster around a straight line."

*Quantile-Quantile Plot:*
> "When using a quantile graph to determine whether a data series has a normal distribution, the data series under study is compared against a theoretical data series with a known normal distribution, a median value of zero, and a standard deviation of one. If the distribution of the data series under study is normal, the data points will cluster around a straight line."

## Usage

**Selecting the appropriate graph type:**

| Purpose | Recommended Types |
|---------|-------------------|
| Show every data point | Point graph, stripe graph, stem-and-leaf |
| Summarize key statistics | Box graph |
| Show frequency pattern | Histogram, frequency polygon |
| Compare multiple distributions | Frequency polygon, side-by-side box graphs |
| Find percentiles | Cumulative histogram, ogive, quantile graph |
| Test for normality | Normal probability plot, Q-Q plot |

**Multiple data sets:**
Most distribution graphs can display multiple data sets side-by-side or overlaid. However, Harris notes that tally charts and dot array charts are not normally used for comparing multiple data sets.

## Notes

Harris organizes the discussion around a visual taxonomy showing graphs arranged by:
- Whether every element is shown vs. data summarized
- Whether emphasis is on concentrations, deciles/quartiles, or values above/below thresholds
- Whether the graph shows a single distribution or compares multiple distributions

This organization helps practitioners select the appropriate visualization based on what questions they need to answer about their data.
