---
name: Outlier
slug: outlier
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Outlier, p. 265"

intent: Identify and visualize data points that are significantly outside the pattern of the rest of the data in a set or series
direction: recognition

components:
  - element: data-distribution
    encodes: The pattern formed by the majority of data points
    required: true
  - element: outlier-point
    encodes: Data element significantly distant from the main pattern
    required: true
  - element: visual-separation
    encodes: Graphical distance showing the outlier's deviation from the pattern
    required: true

parameters:
  visualization_type: scatter-graph | histogram | stripe-graph | box-plot

related:
  - slug: one-axis-data-distribution-graph
    relationship: combines-with
  - slug: scatter-graph
    relationship: combines-with
  - slug: histogram
    relationship: combines-with

warnings:
  - "Without looking into each specific situation, there is generally no way to know whether an outlier is caused by an error in collecting or transcribing the data, or whether it is representative of whatever is being studied"
  - "When only average or median values are plotted, outliers are not apparent"

extensions:
  harris_entry: "Outlier"
  typical_use: "identifying unusual or potentially erroneous data points"
  graph_types_for_detection:
    - "scatter graph"
    - "histogram"
    - "stripe graph"
---

## Description

An outlier is a data point that is significantly outside of the pattern of the rest of the data points in a given data set or series. For example, if there are 50 numbers in a set of data, 49 of which lie between zero and seven, and one point is 11.5, the 11.5 is considered an outlier since it is distinctly different from all the other data elements in the set.

Without looking into each specific situation, there is generally no way to know whether an outlier is caused by an error in collecting or transcribing the data, or whether it is representative of whatever is being studied.

## Examples

Harris illustrates (p. 265) three graph types showing the same data set with an outlier:

**Scatter graph:**
Shows a cluster of points between 0-8 on one axis and 0-20 on the other, with a single outlier point labeled at approximately (20, 24).

**Histogram:**
Shows frequency distribution with most values clustered in lower bins, with one isolated bar at the high end representing the outlier.

**Stripe graph:**
Shows a one-dimensional distribution where most marks cluster between 0-7, with a single isolated mark at 11.5 labeled as "Outlier."

> "When only average or median values are plotted, outliers are not apparent. They generally are easy to spot graphically when individual data points or groups of data points are plotted."

## Usage

**When outliers are visible:**
- When individual data points are plotted (scatter graphs, stripe graphs)
- When grouped data shows distribution (histograms)

**When outliers are hidden:**
- When only summary statistics (average, median) are shown

**Interpretation:**
Outliers require investigation to determine if they represent:
- Data collection or transcription errors
- Genuine extreme values in the phenomenon being studied

## Notes

The ability to visually detect outliers is one advantage of plotting individual data points rather than just summary statistics. Graph types that show distribution (scatter, stripe, histogram, box plot) are particularly effective for outlier detection.
