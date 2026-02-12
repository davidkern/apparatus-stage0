---
name: Difference Line Graph
slug: difference-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Difference Line Graph, p. 140"

intent: Highlight the differences between two intersecting data series by shading the areas between curves with distinct fills for each dominance condition
direction: both

components:
  - element: curve-pair
    encodes: Two data series that intersect over time or sequence
  - element: positive-difference-area
    encodes: Regions where first series exceeds second (one shade/color)
  - element: negative-difference-area
    encodes: Regions where second series exceeds first (different shade/color)
  - element: intersection-points
    encodes: Moments when the two series are equal

parameters:
  fill_type: color | shading | pattern

related: []  # TBD: see area-graph, filled-line-graph

warnings:
  - "Works best when curves actually intersect; if one series always dominates, consider a simple area difference graph"
  - "Legend must clearly explain which fill represents which dominance condition"

extensions:
  harris_entry: "Difference Line Graph"
  alternate_names: ["intersecting silhouette graph", "intersecting band graph", "curve difference graph"]
  typical_use: "comparing imports vs exports, revenue vs costs, supply vs demand over time"
  scale_types:
    horizontal: "sequence (typically time)"
    vertical: "quantitative"
---

## Description

A difference line graph displays two data series that intersect one another, with the areas between the curves highlighted through shading or color. The key feature is the use of different fills depending on which series has the higher value at any given point.

This visualization makes it immediately apparent not just the magnitude of difference between two series, but critically, which series dominates at each point in time. The visual encoding through distinct fills creates a clear narrative of shifting relationships.

## Examples

Harris provides an exports/imports example (p. 140):

> "For example, one curve might represent the dollar value of exports each year and the other the dollar value of imports... When exports have a higher value than imports, one shade or color is used. When exports are lower than imports, another shade or color is used."

The illustrated example shows:
- Exports and Imports curves from 1985-1999
- Areas labeled "Differences" showing trade surplus (exports > imports) in one shade
- Areas showing trade deficit (imports > exports) in another shade

## Usage

Difference line graphs are most effective when:
- Two related measures naturally compare to each other
- The relationship between the two measures changes over time (they cross)
- The direction of difference (which is larger) carries meaning
- Viewers need to quickly identify periods of surplus/deficit, profit/loss, etc.

The technique works less well when:
- The curves never intersect (use simple difference shading instead)
- More than two series need comparison
- The focus should be on absolute values rather than relative position

## Notes

The choice of fills should reinforce meaning where possible. For financial data, green might indicate favorable conditions (profit, surplus) while red indicates unfavorable (loss, deficit). However, be cautious about color associations that may not transfer across contexts or cultures.

This is sometimes called an "intersecting silhouette graph" because the shaded regions create silhouette-like shapes bounded by the two curves.
