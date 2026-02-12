---
name: Overlaid Graph
slug: overlaid-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Overlaid Charts and Graphs, p. 265"

intent: Display multiple groups of data superimposed on top of one another on a single graph
direction: both

components:
  - element: base-graph
    encodes: Primary graph structure with axes and scales
    required: true
  - element: multiple-data-series
    encodes: Two or more data series plotted on the same graph space
    required: true
  - element: visual-differentiation
    encodes: Colors, patterns, or styles distinguishing each data series
    required: true

parameters:
  data_series_count: 2 | 3 | 4+
  graph_type: line | area | column | mixed

related:
  - slug: overlapped-area-graph
    relationship: variant-of
  - slug: overlapped-line-graph
    relationship: variant-of
  - slug: combination-graph
    relationship: variant-of

extensions:
  harris_entry: "Overlaid Charts and Graphs"
  alternate_names:
    - "superimposed charts"
    - "superimposed graphs"
  typical_use: "comparing multiple data series on shared axes"
---

## Description

An overlaid chart or graph has multiple groups of data superimposed on top of one another. This technique allows direct comparison of multiple data series using shared axes.

A quantitative map is a specific application: quantitative information overlaid on a base map.

## Examples

Harris illustrates (p. 265) an overlaid graph showing:
- Three data series (lines) superimposed on a single graph
- Years '90-'97 on horizontal axis
- Values 0-10 on vertical axis
- Each series distinguished by different line style

## Usage

**When to use:**
- To compare trends across multiple data series
- When data series share common scales
- To identify relationships or divergences between series

**Related techniques:**
- Overlapped area graph: Multiple areas measured from same zero baseline
- Overlapped line graph: Multiple lines measured from same zero baseline
- Overlay (combination) graph: Multiple data types using different visual forms

## Notes

The overlaid technique is fundamental to many comparison graphs. The key design challenge is ensuring visual distinction between data series while maintaining readability.
