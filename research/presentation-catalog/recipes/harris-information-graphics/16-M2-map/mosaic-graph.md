---
name: Mosaic Graph
slug: mosaic-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Mosaic Graph, p. 242"

intent: Display a system of interrelated values showing how a whole decomposes hierarchically into parts and subparts
direction: both

components:
  - element: base-bar
    encodes: The total value being decomposed (100% stacked bar)
    required: true
  - element: first-level-segments
    encodes: Major categories that sum to the whole
    required: true
  - element: second-level-columns
    encodes: Breakdown of each first-level segment into components
    required: true
  - element: third-level-bars
    encodes: Further breakdown of second-level components
    required: false
  - element: percent-scale
    encodes: Reference for reading proportions at each level
    required: true

parameters:
  decomposition_levels: "2 | 3 | 4+"
  labeling: "percent-only | dollars-and-percent | labels-only"

related: []

warnings:
  - "Graph begins getting very cluttered with additional levels of decomposition"
  - "Can easily become difficult to read if too many subcomponents are shown"

extensions:
  harris_entry: "Mosaic Graph"
  typical_use: "showing hierarchical breakdown of financial or organizational data"
---

## Description

A mosaic graph is made up of a series of interspersed 100% stacked column graphs and 100% stacked bar graphs. Its major function is to display a system of interrelated values in such a way that groupings and relative sizes of the many elements can be seen at the same time.

The construction proceeds hierarchically: a primary 100% bar shows the total decomposed into major categories; each segment then becomes a 100% column showing its internal breakdown; each of those segments can become a 100% bar showing further decomposition, and so on.

## Examples

Harris demonstrates the construction process using a manufacturing company's sales allocation:

**Step 1**: "The full length of the mosaic graph, which is a 100% stacked bar graph, represents total sales dollars. The components of the bar graph are the five major categories for which the sales dollars are used [Cost to manufacture, R&D, Marketing, Admin., Profit]. A zero to 100% scale is displayed at the bottom of the bar, so the viewer can determine the percent that each component represents of total sales. For example, 50% ($25 million) of the revenue was used to manufacture the product." (p. 242)

**Step 2**: "Each segment of the horizontal bar graph is made into a 100% stacked column graph showing how the dollars are allocated within each major component. For example, in the cost to manufacture, it can be seen that there were three major types of costs: material, labor, and overhead. It can also be seen that material alone accounted for 55% of the total manufacturing costs." (p. 242)

**Step 3**: "In this step, each of the components of the column graphs are made into 100% bar graphs. When this is done with material costs, for example, it can be seen that about 37% went for raw material, 35% for fabricated parts, and about 28% for small parts." (p. 242)

**Final step**: "Additional sets of 100% graphs can be added; however, the graph begins getting very cluttered. In this final variation, the reference arrows have been removed since in practice they are generally not used. Shading or color may be added to highlight certain information, call attention to numbers that are related, aid the viewer in differentiating between various segments and subsegments, etc." (p. 242)

## Usage

Mosaic graphs are effective when:
- Showing how a total value breaks down hierarchically
- Multiple levels of decomposition are meaningful
- The relative sizes at each level need to be visible simultaneously
- Financial, budgetary, or organizational breakdowns need visualization

Design recommendations:
- Limit decomposition to 2-3 levels to maintain readability
- Use shading or color to differentiate levels and highlight related items
- Include actual values and percentages in each component for precision
- Consider whether reference arrows aid understanding or add clutter

The technique works across many applications beyond manufacturing cost analysis: budget allocation, market share breakdown, organizational time allocation, and any hierarchical part-to-whole relationship.

## Notes

Mosaic graphs can be made more useful by noting actual values (dollars, units, etc.) alongside percentages in each component and subcomponent. This gives viewers both the proportional perspective and the absolute scale.
