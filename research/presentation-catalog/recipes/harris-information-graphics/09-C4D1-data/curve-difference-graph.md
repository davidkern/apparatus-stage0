---
name: Curve Difference Graph
slug: curve-difference-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Curve Difference Graph, p. 120"

intent: Highlight the differences between two intersecting data series by shading the areas between their curves with distinct colors or patterns
direction: both

components:
  - element: curve-one
    encodes: First data series (e.g., exports over time)
    required: true
  - element: curve-two
    encodes: Second data series (e.g., imports over time)
    required: true
  - element: positive-difference-fill
    encodes: Area where first series exceeds second, shaded distinctively
    required: true
  - element: negative-difference-fill
    encodes: Area where second series exceeds first, shaded differently
    required: true
  - element: intersection-points
    encodes: Points where the two curves cross, marking sign changes
    required: false

parameters:
  fill_method: shading | coloring
  series_comparison: exports-imports | actual-budget | this-year-last-year

related: []  # TBD: see also difference-graph, area-graph

warnings:
  - "The meaning of each fill color or shade must be clearly indicated in a legend"
  - "Works best when curves intersect multiple times; single intersection may not need this treatment"

extensions:
  harris_entry: "Curve Difference Graph"
  alternate_names: ["intersecting silhouette graph", "intersecting band graph", "difference line graph"]
  typical_use: "comparing two related time series that cross each other, such as imports vs exports"
---

## Description

A curve difference graph is a graph on which the curves representing two data series intersect one another and the areas between the two curves are highlighted by means of shading or coloring. This technique makes it immediately visible which series dominates at any point in time and by how much.

The visual encoding is straightforward: when one series exceeds the other, one shade or color is used; when the relationship reverses, another shade or color is used. The areas between the curves directly represent the magnitude of the difference.

## Examples

**Exports vs Imports** (p. 120)
> "For example, one curve might represent the dollar value of exports each year and the other the dollar value of imports... When exports have a higher value than imports, one shade or color is used. When exports are lower than imports, another shade or color is used."

Harris illustrates this with a graph showing exports and imports from 1985-1999, with the areas between curves filled to show trade surplus (exports > imports) and trade deficit (imports > exports) periods distinctly.

## Usage

This technique is particularly effective when:
- Two related quantities fluctuate and cross each other over time
- The magnitude of difference matters, not just which is larger
- Viewers need to quickly identify periods of surplus vs deficit, profit vs loss, or similar comparisons

The filled areas make patterns immediately visible that would require careful comparison if only lines were shown.

**Construction steps:**
1. Plot both data series as curves on the same axes
2. Identify all intersection points
3. Fill areas where series A > series B with one color/shade
4. Fill areas where series B > series A with a different color/shade
5. Add legend explaining what each fill represents

## Notes

This is a specialized form of area graph that emphasizes comparison rather than absolute values. The technique is most effective when the two series have similar scales and cross each other multiple times, creating a pattern of alternating fills that tells a story about the relationship over time.
