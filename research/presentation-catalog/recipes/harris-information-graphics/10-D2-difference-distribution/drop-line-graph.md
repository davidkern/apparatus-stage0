---
name: Drop Line Graph
slug: drop-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Drop Line Graph, p. 144"

intent: Highlight differences between two or more data series at each time point by connecting their data points with vertical lines
direction: both

components:
  - element: data-points
    encodes: Values for each data series at each time point
  - element: vertical-connectors
    encodes: Lines linking data points at same time point, showing gap
  - element: time-axis
    encodes: Sequential time periods (typically horizontal)
  - element: value-axis
    encodes: Quantitative measure being compared

parameters:
  series_count: two | three | paired-groups
  point_style: filled | unfilled | mixed

related: []

warnings:
  - "Works best when series values differ noticeably; overlapping points make connectors unclear"
  - "With many time periods, the vertical lines may create visual clutter"

extensions:
  harris_entry: "Drop Line Graph"
  alternate_names: []
  typical_use: "comparing paired measurements over time, showing gap between forecasts and actuals, tracking performance differences"
  scale_types:
    horizontal: "sequence (time series)"
    vertical: "quantitative"
---

## Description

A drop line graph is a variation of a point graph designed to emphasize differences between data series. Two or more series are plotted on the same graph with a time series scale, and vertical lines connect the data points at each time interval. The length of these connecting lines directly shows the magnitude of difference at each point.

Unlike line graphs that emphasize trend through connected points within a series, drop line graphs emphasize comparison through connected points across series.

## Examples

Harris illustrates three configurations (p. 144):

**Two data series:**
> "A variation of a point graph in which two or more data series are plotted on the same graph, generally with a time series scale on the horizontal axis. After plotting, the data points for each time interval are connected with vertical lines. The major purpose of drop line graphs is to highlight the differences between the individual data points of two or more data series."

Shows data from 1985 to 1999 with two point styles (filled squares and unfilled squares) connected by vertical lines at each year.

**Three data series:**
Similar format but with three distinct point styles, creating two connecting segments per time point.

**Two pairs of data series:**
Shows Measure 1 and Measure 2 pairs, allowing comparison of gaps across two different metrics simultaneously.

## Usage

Drop line graphs are effective when:
- The gap between series matters more than individual trends
- Paired or grouped observations exist at each time point
- Visual emphasis on convergence or divergence is needed
- Comparing actual vs. forecast, treatment vs. control, etc.

The vertical lines transform the viewer attention from "what are the trends?" to "what are the gaps?" This makes the technique ideal for gap analysis over time.

Point styles should clearly distinguish series. When three or more series appear, the connecting lines form segments that must be visually trackable.

## Notes

This technique is related to parallel coordinates plots, which also connect values across categories/dimensions. However, drop line graphs specifically use time on the horizontal axis and emphasize temporal gap patterns.

The unfilled vertical space between connected points creates an implicit area-like encoding of difference magnitude, even without explicit shading.
