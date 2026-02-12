---
name: Stacked Bar Graph
slug: stacked-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Stacked bar graph, pp. 39-40"

intent: Show how a total is divided into component parts and compare component composition across categories
direction: both

components:
  - element: stacked-segments
    encodes: Component values; segments positioned end-to-end within each bar
    required: true
  - element: bar-total
    encodes: Sum of all components; shown by rightmost edge of bar
    required: true
  - element: legend
    encodes: Maps fills to component/data series names
    required: true
  - element: quantitative-scale
    encodes: Value axis (horizontal); always linear, starts at zero
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true
  - element: segment-boundaries
    encodes: Divisions between components within each bar
    required: true

parameters:
  scale_type: absolute-values | percent-of-whole
  bar_spacing: spaced | joined
  linking: none | connected-lines
  dimensionality: 2D | 3D-oblique

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: grouped-bar-graph
    relationship: contrasts
  - slug: 100-percent-stacked-bar-graph
    relationship: contains
  - slug: progressive-bar-graph
    relationship: variant-of

warnings:
  - "Data series with combinations of positive and negative values result in confusing and misleading stacked bar graphs"
  - "Three-dimensional stacked bar graphs cause some loss in accuracy of decoding"
  - "Only the leftmost segment can be accurately read from the scale; other segments require mental subtraction"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "segmented bar graph"
    - "extended bar graph"
    - "divided bar graph"
    - "composite bar graph"
    - "subdivided bar graph"
  typical_use: "showing how a larger entity is divided into components and the relative effect each has on the total"
  design_notes:
    segment_order: "largest, most important, or least variable components might be placed at bottom"
    scale_requirement: "horizontal scale always linear, starts at zero"
    negative_values: "data series with all negative values can be plotted; mixed positive/negative rarely plotted"
---

## Description

A stacked bar graph has multiple data series stacked end-to-end instead of side-by-side. The far right ends of the bars represent the totals of all components. Each data series is identified by a different shade, color, or pattern explained in a legend.

This graph type shows how a larger entity is divided into its various components and the relative effect each component has on the total. For example, showing domestic, export, and inter-company components of sales for each product line.

## Examples

Harris illustrates with product sales (p. 39):
- Products A through E on vertical axis
- Sales in $ thousands (0 to 200) on horizontal axis
- Three segments per bar: Domestic sales, Export sales, Inter-company sales
- Right edge of each bar shows total sales for that product
- Legend identifies component fills

**Linked/connected variation** (p. 40):
Lines drawn connecting boundaries between data series across bars make relationships easier to see. Can be used with simple stacked or 100% stacked formats.

**Single bar variation** (p. 40):
When interest is in just one point in time or condition, a single stacked bar functions like a circle graph. Scale can be placed directly on the bar (one-axis graph). Can show actual values, percentages, or both.

## Usage

**When to use:**
- Showing part-to-whole relationships across categories
- When total values matter as well as composition
- Comparing how composition changes across categories

**Component ordering:**
No rigid rules, but consider placing:
- Largest component at bottom (leftmost)
- Most important component at bottom
- Least variable component at bottom (for easier comparison)

**Negative values:**
- All-negative data series can be plotted
- Mixed positive and negative values create confusion—rarely plotted

**Three-dimensional:**
A third axis is seldom used. Oblique views of two-axis graphs are sometimes used for aesthetics but cause loss in decoding accuracy.

## Notes

The horizontal scale is always quantitative, linear, and starts at zero. The vertical scale is almost always categorical.

When a single bar is used without scales, it becomes a "bar chart" rather than "bar graph" by Harris's terminology.
