---
name: Juxtaposed Graphs with Comparative Data
slug: juxtaposed-graphs-comparative
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs juxtaposed (comparative data), p. 171"

intent: Place multiple graphs adjacent to each other to enable direct comparison of different data series while avoiding the clutter of superimposition
direction: both

components:
  - element: individual-graphs
    encodes: Separate graph for each data series
  - element: common-scales
    encodes: Identical scales across all graphs for valid comparison
  - element: consistent-layout
    encodes: Same graph type and dimensions for each
  - element: aligned-arrangement
    encodes: Grid or linear layout enabling visual scanning

parameters:
  graph_count: "2 or more"
  arrangement: "grid | row | column"
  scale_consistency: "required for valid comparison"

related: []  # TBD: superimposed-graphs, small-multiples

warnings:
  - "All graphs must use identical scales for valid comparison"
  - "Intersection points between series are harder to identify than in superimposed graphs"
  - "Requires more space than superimposition"

extensions:
  harris_entry: "Graph"
  alternate_names: ["small multiples", "trellis display", "panel chart"]
  typical_use: "comparing multiple data series when superimposition would create clutter"
---

## Description

With a juxtaposed group of graphs displaying comparative data, the primary purpose is to compare the data on each graph with the data on each of the other graphs. The alternative to juxtaposing is superimposing them on top of each other. Each method has distinct advantages.

Juxtaposed graphs are less cluttered and allow each data series to be examined independently, while superimposed graphs make it easier to spot exact intersection points and relative positions at any given moment.

## Examples

Harris directly compares juxtaposed versus superimposed approaches (p. 171):

> "With a juxtaposed group of graphs, the primary purpose is to compare the data on each graph with the data on each of the other graphs. The alternative to juxtaposing the graphs is to superimpose them on top of each other."

The example shows four data series (Series A, B, C, D) from 1990-1997 displayed both ways:

> "For ease of comparison, the same scales are used on all four graphs... In these examples, the juxtaposed graphs are less cluttered, but on the superimposed graph it is easier to note that all four data series had approximately the same value sometime between 1994 and 1995."

## Usage

Most effective when:
- Multiple data series would create visual clutter if superimposed
- Each series needs individual examination as well as comparison
- Precise intersection points are less important than overall patterns
- Viewers need to focus on one series at a time

Less effective when:
- Identifying exact crossover points is critical
- Space is limited
- Only 2-3 series need comparison (superimposition may work better)

Critical requirement:
- **Same scales must be used on all graphs** for valid comparison
- Graph dimensions and types should be consistent

Combines well with:
- **Matrix layouts** for organizing many comparisons
- **Consistent styling** to enable rapid visual scanning

## Notes

Harris explicitly notes the trade-off: juxtaposed graphs reduce clutter but make certain comparisons harder. The choice depends on what aspects of comparison matter most for the viewer's task.
