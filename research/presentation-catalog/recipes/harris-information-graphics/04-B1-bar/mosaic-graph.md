---
name: Mosaic Graph
slug: mosaic-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Mosaic graph, p. 48"

intent: Display a system of interrelated values showing hierarchical groupings and relative sizes through nested 100% stacked representations
direction: both

components:
  - element: primary-divisions
    encodes: First-level breakdown of whole (100% stacked bar, horizontal)
    required: true
  - element: secondary-divisions
    encodes: Second-level breakdown within primary divisions (100% stacked, vertical)
    required: true
  - element: tertiary-divisions
    encodes: Third-level breakdown within secondary divisions (optional deeper nesting)
    required: false
  - element: cell-labels
    encodes: Names and/or values for each cell
    required: true
  - element: percent-scales
    encodes: Horizontal and vertical percentage scales
    required: true

parameters:
  nesting_depth: 2 | 3 | more
  label_content: names | values | both
  cell_fill: uniform | differentiated

related:
  - slug: 100-percent-stacked-bar-graph
    relationship: contains
  - slug: treemap
    relationship: variant-of

warnings:
  - "Complex nested structures can be difficult to read"
  - "Cell sizes at deeper levels become very small"
  - "Requires careful labeling to communicate the hierarchy"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "marimekko chart"
    - "mosaic plot"
  typical_use: "displaying hierarchical breakdowns of sales, costs, or other nested categorical data"
  structure: "combination of 100% stacked column graphs and 100% stacked bar graphs"
---

## Description

A mosaic graph combines 100% stacked column graphs and 100% stacked bar graphs to display a system of interrelated values. The result shows hierarchical groupings and relative sizes where viewers can see how each level subdivides into the next.

The major purpose is displaying nested proportional relationships—for instance, how total sales break down into cost categories, and how each cost category further breaks down into subcategories.

## Examples

Harris provides a detailed corporate cost breakdown example (p. 48):

**First level (horizontal 100%):**
- Total sales = 100% across the top
- Major categories: Cost to manufacture (50%), R&D, Marketing, Admin, Profit
- Widths show percent of total sales

**Second level (vertical 100% within first):**
- Cost to manufacture breaks down into: Material (55%), Labor, Overhead
- Each second-level category = 100% of its parent

**Third level (horizontal 100% within second):**
- Material breaks down into: Raw material (36%), Fabricated parts, Small parts
- Labor breaks down into: Straight time, Double time, Triple time
- Overhead breaks down into: Supervision, Indirect, Depreciation, Benefits

The nested structure enables statements like:
- "Cost to manufacture represents 50% of the total sales"
- "Material represents 55% of the total cost to manufacture"
- "Raw material represents 36% of the total material costs"

## Usage

**When to use:**
- Hierarchical budget or cost breakdowns
- Market segmentation analysis (market → segments → sub-segments)
- Any nested categorical data where proportions matter at multiple levels

**Reading the graph:**
- Each rectangular cell represents a portion of its parent
- Cell area indicates relative size within the overall whole
- Labels identify what each cell represents

**Design considerations:**
- Clear labeling essential due to visual complexity
- Color or shading can help distinguish hierarchy levels
- Deep nesting creates very small cells that are hard to label

**Limitations:**
- Complexity increases rapidly with nesting depth
- Small cells become illegible
- Comparisons across non-adjacent cells are difficult

## Notes

Harris references the Mosaic Graph entry for more detail. This visualization type is related to modern treemaps and marimekko charts. The key structural insight is that it combines horizontal and vertical 100% stacking to create a two-dimensional proportional display.

The mosaic format is most effective for 2-3 levels of hierarchy. Beyond that, alternative representations (like treemaps or sunburst diagrams) may be more readable.
