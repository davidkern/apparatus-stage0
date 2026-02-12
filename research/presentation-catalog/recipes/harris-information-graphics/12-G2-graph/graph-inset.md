---
name: Graph Inset
slug: graph-inset
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Graphs used as insets, p. 172"

intent: Embed a smaller graph within a larger graph to provide additional context, magnification, or summary information
direction: both

components:
  - element: main-graph
    encodes: Primary visualization with full data
  - element: inset-graph
    encodes: Secondary graph embedded within the main graph
  - element: inset-frame
    encodes: Border distinguishing inset from main graph
  - element: visual-link
    encodes: Connection showing relationship between inset and main (optional)

parameters:
  inset_purpose: "magnification | context | summary"
  inset_position: "corner | alongside data"

related: []  # TBD: detail-view, overview-plus-detail

warnings:
  - "Inset must not obscure critical data in main graph"
  - "Relationship between inset and main graph must be clear"
  - "Inset should be large enough to be readable"

extensions:
  harris_entry: "Graph"
  alternate_names: ["detail inset", "context inset", "magnified view"]
  typical_use: "showing detail of a specific region or placing data in broader context"
---

## Description

Insets are used to provide additional insight into the data or to help orient the viewer. A smaller graph is embedded within the plot area of a larger graph, serving one of several purposes: magnifying a particular region of interest, showing the broader context for the main data, or providing summary information.

## Examples

Harris describes two primary uses for insets (p. 172):

**Magnification inset:**
> "Sometimes an inset magnifies particular data in a graph."

This use case zooms in on a region of the main graph where detail is important but would be lost at the scale needed to show all the data.

**Context inset:**
> "Other times it lets the viewer see the data in the basic graph in terms of a larger family of data."

The illustrated example shows a bar graph with an inset that displays:
> "Inset graph showing how the totals of the five data elements compared in the two years."

The main graph shows individual category values for 1992 and 1993, while the inset shows the totals, providing summary context.

## Usage

Most effective when:
- A region of the main graph needs magnification for detail
- The main data needs to be placed in broader context
- Summary statistics complement the detailed view
- Space efficiency matters (avoiding separate graphs)

Inset purposes:
1. **Magnification**: Zoom into crowded or small-scale regions
2. **Context**: Show where the main data fits in a larger picture
3. **Summary**: Provide totals, averages, or aggregations

Placement considerations:
- Position inset where it won't obscure important data
- Make the frame distinct from the main graph
- If showing magnification, consider a visual link (lines connecting to source region)

Less effective when:
- Inset would obscure critical main graph content
- The relationship between inset and main is unclear
- Both views need equal prominence (use juxtaposition instead)

## Notes

Insets are a form of "overview plus detail" display, allowing the viewer to see both the forest and the trees. The technique saves space compared to showing two separate graphs while maintaining the visual connection between the views.
