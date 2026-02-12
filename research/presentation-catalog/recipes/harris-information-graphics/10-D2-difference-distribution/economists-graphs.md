---
name: Economists Graphs
slug: economists-graphs
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Economists Use of Graphs, p. 145"

intent: Convey economic concepts and relationships through simplified abstract graphs that omit scales and use idealized curves
direction: both

components:
  - element: conceptual-axes
    encodes: Variables being related (often without numeric scales)
  - element: idealized-curves
    encodes: Theoretical relationships (smooth lines representing general principles)
  - element: labeled-regions
    encodes: Areas with economic significance (surplus, shortage, etc.)
    required: false
  - element: intersection-points
    encodes: Equilibrium or threshold conditions
    required: false

parameters:
  curve_type: straight | smooth | stepped
  scale_detail: none | labeled-only | with-values

related: []

warnings:
  - "Abstract graphs sacrifice precision for conceptual clarity"
  - "Viewers may assume idealized relationships hold precisely in real data"

extensions:
  harris_entry: "Economists Use of Graphs"
  alternate_names: ["abstract graphs", "conceptual diagrams"]
  typical_use: "teaching economic principles, illustrating theoretical relationships, communicating concepts without specific data"
---

## Description

Economists use graphs extensively not just to display empirical data but to analyze, understand, and communicate concepts and relationships. When the purpose is conceptual rather than data-driven, scales, grid lines, and tick marks are often omitted. Straight or smooth idealized lines represent variables even though actual data would show irregular patterns.

These abstract or conceptual graphs prioritize communicating relationships and principles over showing specific numeric values.

## Examples

Harris shows multiple economic graph types (p. 145):

> "When the major purpose of a graph is to convey a concept, scales, grid lines, and tick marks are often omitted, and straight or smooth lines are frequently used to represent variables even though with actual data the line might be irregularly shaped. Such graphs are sometimes referred to as abstract graphs or conceptual diagrams."

Illustrated examples include:
- **Supply and demand curves**: Showing relationship of price to quantity, with "Surplus" and "Shortages" regions labeled
- **Lorenz curve**: Distribution of income and wealth within a population (line of equality vs. actual distribution)
- **Cost curves**: Average total cost, marginal cost, average variable cost, average fixed cost vs. output
- **Laffer Curve**: Tax revenues versus tax rates
- **GNP relationship**: Government spending components and relationship to total
- **Income-expenditure**: 45-degree reference line showing savings vs. dissavings

## Usage

Abstract economic graphs are appropriate when:
- Teaching or explaining theoretical relationships
- The shape of the relationship matters more than specific values
- Concepts need to be communicated without detailed data
- Visual models help structure thinking about complex systems

The technique trades data precision for conceptual clarity. Viewers understand that "supply curves slope upward" as a general principle, not that any particular supply curve matches the idealized shape exactly.

## Notes

This entry describes a style of graphing rather than a specific chart type. The underlying forms (line graphs, area graphs) are conventional, but the application is distinctive: showing how things theoretically relate rather than showing measured data.

The same graph style appears in other fields (physics, engineering) where idealized relationships need visualization. The key is the deliberate simplification: omitting noise and detail to reveal essential structure.
