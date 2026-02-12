---
name: Three-Dimensional Histogram
slug: three-dimensional-histogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, p. 192"

intent: Display frequency distribution across two independent category or class interval dimensions simultaneously
direction: both

components:
  - element: columns
    encodes: Frequency at intersection of two class interval dimensions
    required: true
  - element: x-axis
    encodes: First set of categories or class intervals
    required: true
  - element: y-axis
    encodes: Second set of categories or class intervals
    required: true
  - element: z-axis
    encodes: Frequency (vertical)
    required: true

parameters:
  rotation: "fixed | interactive"
  perspective: "isometric | perspective projection"

related: []  # TBD: histogram, surface-graph, three-dimensional-column-graph

warnings:
  - "Hidden columns in the back make accurate analysis difficult without rotation capability"
  - "Requires ability to rotate the graph for full data visibility"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  typical_use: "analyzing bivariate frequency distributions"
---

## Description

A three-dimensional histogram extends the standard histogram concept by adding a second category or class interval dimension. Instead of a single row of columns, there is a grid of columns where each column's height represents the frequency at a particular combination of two variables.

This format is useful for exploring bivariate distributions but presents significant readability challenges due to occlusion of columns in the back by those in front.

## Examples

Harris describes the technique (p. 192):

> "Histograms have traditionally been two-dimensional. With the developments in computers and software, three-dimensional histograms are becoming more common."

On the structure:
> "Three-dimensional histograms work on the same principles as two-dimensional histograms, except there are two sets of categories or class intervals, one on the X-axis and one on the Y-axis. Frequencies are plotted on the vertical or Z-axis."

The accompanying figure shows a grid of columns extending across two horizontal dimensions with varying heights.

## Usage

Three-dimensional histograms are appropriate when:
- Analyzing the joint distribution of two variables
- Exploring relationships between two categorical or interval dimensions
- The viewer has ability to rotate or interact with the visualization

Harris notes a significant limitation (p. 192):
> "Unless one has the capability to rotate the graph, the hidden columns in a three-dimensional histogram make accurate analysis difficult."

## Notes

Modern interactive visualization tools have made this format more practical by allowing rotation and different viewing angles. Static three-dimensional histograms on paper or in presentations remain problematic due to occlusion issues.
