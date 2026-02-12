---
name: Mosaic Graph
slug: mosaic-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Mosaic graph, p. 90"

intent: Display a system of interrelated values showing hierarchical groupings and relative sizes
direction: both

components:
  - element: nested-rectangles
    encodes: Hierarchical breakdown of values
    required: true
  - element: horizontal-divisions
    encodes: Primary categories (100% stacked columns)
    required: true
  - element: vertical-divisions
    encodes: Secondary categories within primary (100% stacked bars)
    required: true
  - element: percentage-scales
    encodes: Proportions on both axes
    required: true
  - element: labels
    encodes: Category names and percentage values
    required: true

parameters:
  hierarchy_depth: "typically 2-3 levels"
  labeling: "category names | percentages | both"

related:
  - slug: 100-percent-stacked-column-graph
    relationship: contains
  - slug: 100-percent-stacked-bar-graph
    relationship: contains
  - slug: treemap
    relationship: variant-of

warnings:
  - "Complex hierarchies can become difficult to read"
  - "Small segments may be too small to label"
  - "Requires understanding of nested proportions"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["marimekko chart", "mekko chart"]
  typical_use: "showing budget breakdowns, cost structures, hierarchical market analysis"
---

## Description

A mosaic graph combines 100% stacked column graphs and 100% stacked bar graphs. The major purpose is to display a system of interrelated values such that groupings and relative sizes of various elements can be seen graphically.

The visualization creates a nested structure where the horizontal axis shows primary categories (like a 100% stacked column arrangement) and within each primary category, vertical subdivisions show secondary breakdowns (like 100% stacked bars).

## Examples

> "A mosaic graph is a combination of 100% stacked column graphs and 100% stacked bar graphs. The major purpose of a mosaic graph is to display a system of interrelated values in such a way that groupings and relative sizes of the various elements can be seen graphically." (p. 90)

Harris illustrates with a business cost structure:
- Total sales broken into: Cost to manufacture (50%), R&D, Marketing, Admin, Profit
- Cost to manufacture subdivided into: Supervision, Indirect, Labor (Straight time, Double time, Triple time), Material (Raw material, Fabricated parts, Small parts), Overhead
- Each subdivision further broken down with labeled percentages

From the example, the viewer can see:
- 50% of sales dollars go into manufacturing costs
- Within manufacturing, about 55% goes to materials
- About 36% of material dollars goes to raw materials

## Usage

Construction approach:
1. Start with primary categories as column widths (proportional to their values)
2. Divide each column vertically into subcategories
3. Continue subdividing as needed for hierarchy depth
4. Label categories and percentages

Design considerations:
- Percentage scales on both axes (0% to 100%)
- Labels for all significant segments
- Color or shading to distinguish categories
- Consider readability limits for small segments

When to use:
- Budget and cost breakdowns
- Market segmentation analysis
- Organizational structure visualization
- Any hierarchical part-to-whole relationship

## Notes

Harris references a separate Mosaic Graph entry for additional detail. The format is particularly powerful for showing how nested percentages relate to each other and to the whole, though complexity grows quickly with hierarchy depth.
