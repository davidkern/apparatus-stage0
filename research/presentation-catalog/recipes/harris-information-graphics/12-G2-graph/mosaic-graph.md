---
name: Mosaic Graph
slug: mosaic-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs intermingled, p. 172"

intent: Combine 100% bar and 100% column graphs into a single display showing proportions across two categorical dimensions
direction: both

components:
  - element: column-segments
    encodes: Proportional divisions along vertical (typically rows of categories)
  - element: row-segments
    encodes: Proportional divisions along horizontal (typically columns of categories)
  - element: cells
    encodes: Individual rectangles representing proportions of whole
  - element: labels
    encodes: Category names for rows and columns

parameters:
  row_variable: "categorical dimension defining rows"
  column_variable: "categorical dimension defining columns"

related: []  # TBD: stacked-bar-graph, 100-percent-stacked

warnings:
  - "Complex to read; requires viewer training"
  - "Small cells may be hard to label or distinguish"
  - "Works best with limited number of categories in each dimension"

extensions:
  harris_entry: "Graph"
  alternate_names: ["marimekko chart", "mosaic plot", "treemap variant"]
  typical_use: "showing how proportions relate across two categorical dimensions"
---

## Description

A mosaic graph is an example of how two different types of graphs can be intermingled to form a single meaningful graph. It combines elements of 100% bar and 100% column graphs, with width representing one variable's proportions and height representing another's. The result shows how categories of one variable are distributed across categories of another.

## Examples

Harris describes the mosaic graph as an intermingled combination (p. 172):

> "A mosaic graph, as shown at the right, is an example of how two different types of graphs can be intermingled to form a single meaningful graph. In this case it is a mixture of 100% bar and 100% column graphs."

The illustrated example shows:
- **Horizontal dimension (width)**: Total sales divided proportionally into categories (Cost of goods sold, R&D, Marketing, Admin)
- **Vertical dimension (height)**: Within each cost category, subdivisions (e.g., Cost of goods sold contains Supervision, Direct labor, Material, etc.)

Both dimensions use proportional widths/heights, so the area of each cell represents its proportion of the whole.

## Usage

**When to use:**
- Show how proportions of one variable are distributed across another
- Understand two-way categorical data structure
- Identify which combinations of categories are most prevalent

**Structure:**
- Total width = 100% of one categorical variable
- Total height = 100% of another categorical variable
- Each column's width proportional to its category's total
- Each cell's height proportional to its subcategory within the column

**Reading the graph:**
- Column widths show relative size of major categories
- Cell heights within columns show composition
- Cell areas represent proportion of total

**Design considerations:**
- Label cells when large enough
- Use color/shading to distinguish categories
- Limit to 4-6 categories per dimension for readability
- May need legend if labels don't fit

## Notes

The mosaic graph encodes information in both position and area, making it information-dense but also demanding for viewers. It's particularly useful for understanding contingency tables or cross-tabulations visually, revealing patterns that might be hidden in numeric tables.
