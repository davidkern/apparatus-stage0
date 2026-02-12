---
name: Difference Line Graph
slug: difference-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Difference line and deviation line graphs, p. 211"

intent: Highlight the areas between two intersecting data curves to emphasize when and by how much one series exceeds the other
direction: both

components:
  - element: two-data-curves
    encodes: The series being compared (e.g., exports vs. imports)
    required: true
  - element: filled-areas
    encodes: Differences between the curves, often color-coded by which is higher
    required: true
  - element: intersection-points
    encodes: Where the curves cross (differences change sign)
    required: true

parameters:
  fill_style: "solid | pattern | color-coded by direction"

related: []  # TBD: see also deviation-line-graph, area-graph

warnings:
  - "The visual emphasis on area can exaggerate differences"
  - "Ensure the two series being compared use the same scale and baseline"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["curve difference graph", "intersecting silhouette", "intersecting band graph"]
  typical_use: "showing trade balances, comparing actual vs. budget, highlighting surpluses and deficits"
---

## Description

A difference graph displays two intersecting data curves with the areas or differences between them filled. This format emphasizes when and by how much one series exceeds the other, making sign changes (curve crossings) immediately visible.

The filled areas can be differentiated to show direction - for example, one color when exports exceed imports, another color when imports exceed exports. This creates a visual map of surpluses and deficits over time.

## Examples

Harris demonstrates with exports and imports:

> "The term difference graph is occasionally used when referring to a graph with intersecting data curves in which the areas or differences between the curves are filled. For example, one curve might represent the dollar value of exports each year, and the other the dollar value of imports. The areas between the two would represent the differences." (p. 211)

The example shows exports and imports from '85 to '99, with the area labeled "Differences" filled between the two curves. The visual immediately shows periods when exports exceeded imports and vice versa.

## Usage

Difference graphs are appropriate when:
- Comparing two related time series
- Emphasizing periods when one series exceeds the other
- Showing cumulative surpluses or deficits
- The magnitude and duration of differences matter

Construction considerations:
- Both curves must share the same quantitative scale
- Color or pattern can differentiate positive vs. negative differences
- The fill draws attention to the between-curve area rather than absolute values
- Consider whether this emphasis on differences serves the communication goal

## Notes

The difference graph is related to but distinct from the deviation graph. A difference graph shows the actual gap between two measured series. A deviation graph plots the differences themselves as a single series relative to a reference (often zero).
