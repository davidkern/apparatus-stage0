---
name: Stacked Column Graph
slug: stacked-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Stacked column graph, pp. 83-84"

intent: Show how a larger entity is divided into components and how both components and totals change over time
direction: both

components:
  - element: stacked-segments
    encodes: Component values positioned on top of one another
    required: true
  - element: column-tops
    encodes: Total of all components for each interval
    required: true
  - element: differentiated-fills
    encodes: Each component/data series via distinct color, shade, or pattern
    required: true
  - element: legend
    encodes: Mapping of colors/patterns to components
    required: true
  - element: quantitative-scale
    encodes: Numeric values on vertical axis (must start at zero, linear, no breaks)
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true

parameters:
  component_order: "largest on bottom | most important on bottom | least variable on bottom"
  linking_lines: "none | connecting lines between segments | filled connecting areas"

related:
  - slug: stacked-bar-graph
    relationship: variant-of
  - slug: 100-percent-stacked-column-graph
    relationship: variant-of
  - slug: grouped-column-graph
    relationship: contrasts

warnings:
  - "Scale on vertical axis must always be quantitative, linear, start at zero, and have no breaks"
  - "Only the bottom segment can be accurately compared across columns; middle segments are harder to compare"
  - "Component ordering significantly affects readability"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["segmented column graph", "extended column graph", "divided column graph", "composite column graph", "subdivided column graph"]
  typical_use: "showing part-to-whole relationships over time, tracking component contributions to totals"
  scale_types:
    vertical: "quantitative (linear, starting at zero)"
    horizontal: "category or sequence"
---

## Description

A stacked column graph has multiple data series stacked on top of one another instead of being placed side-by-side as in a grouped column graph. This means the tops of the columns represent the totals of all components (data series) for each interval along the horizontal axis.

Stacked column graphs are generally used to show:
- How a larger entity is divided into its various components
- The relative effect that each component has on the total entity
- How the sizes of the components and the total change over time

## Examples

> "A stacked column graph has multiple data series stacked on top of one another instead of being placed side-by-side as in a grouped column graph. This means that the tops of the columns represent the totals of all the components (data series) for each interval along the horizontal axis." (p. 83)

Harris illustrates with a sales example: if components represent sales for three product lines, then the tops of the columns represent total company sales.

> "Depending on the nature of the data and individual preferences, the largest, most important, or least variable component might be placed on the bottom of the stack." (p. 83)

## Usage

Scale requirements are strict:
- Vertical axis must be quantitative and linear
- Must start at zero
- Must have no breaks
- Category or sequence scales on horizontal axis

**Linked/connected variation**: Lines connecting boundaries between data series make trends easier to see. The areas between columns and connecting lines can be filled with the same shade/color/pattern used in the columns.

**Joined variation**: Eliminating space between columns can make the graph easier to read when changes from column to column are small. Less effective when changes are significant.

**Three-dimensional variation**: Both two-axis and three-axis versions exist. Two-axis is primarily aesthetic. Three-axis versions risk hiding segments of columns in the back.

## Notes

The segment ordering decision is important: place the largest, most important, or least variable component on the bottom to make it easiest to read. Only the bottom segment can be accurately compared across columns since it shares a common baseline. Middle segments float and are harder to compare.
