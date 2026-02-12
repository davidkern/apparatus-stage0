---
name: 100% Stacked Bar Graph
slug: 100-percent-stacked-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, 100% stacked bar graph, p. 39"

intent: Compare the proportional composition of a whole across categories, where all bars represent 100%
direction: both

components:
  - element: stacked-segments
    encodes: Percentage each component represents of the category total
    required: true
  - element: uniform-bar-length
    encodes: All bars extend to 100%; enables direct proportion comparison
    required: true
  - element: legend
    encodes: Maps fills to component/data series names
    required: true
  - element: percent-scale
    encodes: Horizontal axis from 0% to 100%
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true

parameters:
  bar_spacing: spaced | joined
  linking: none | connected-lines

related:
  - slug: stacked-bar-graph
    relationship: variant-of
  - slug: 100-percent-paired-bar-graph
    relationship: variant-of

warnings:
  - "Actual values are not shown; only proportions"
  - "Cannot compare absolute magnitudes across categories"
  - "Segments not adjacent to the baseline are difficult to compare precisely across bars"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "percent-of-the-whole bar graph"
    - "normalized stacked bar graph"
  typical_use: "comparing proportional composition across categories when absolute values are less important than relative shares"
  design_notes:
    scale: "always 0% to 100%"
    bar_spacing: "eliminating spaces (joined) sometimes makes relationships more visible"
---

## Description

A 100% stacked bar graph plots percentages rather than actual values. Instead of showing the actual value for each data series, it shows the percent that each value represents of the total of all data series for that category. All bars extend to the same length (100%), enabling direct comparison of proportional composition across categories.

## Examples

Harris shows the same product data as the simple stacked example, but normalized (p. 39):
- Products A through E on vertical axis
- Scale: 0% 20% 40% 60% 80% 100% on horizontal axis
- Each bar shows: percent domestic sales, percent export sales, percent inter-company sales
- All bars reach 100%

Two layout variations shown:
1. **With spaces between bars** — traditional categorical appearance
2. **Without spaces between bars (joined)** — sometimes makes relationships more visible

The text explains interpretation:
> "The first component of the bar for product A shows the percent that domestic sales represent of the total sales of product A. The second component shows the percent that export sales represent of the total sales of product A."

## Usage

**When to use:**
- Comparing proportional makeup across categories
- When relative shares matter more than absolute values
- When categories have very different totals (normalizing makes comparison fair)

**When NOT to use:**
- When absolute values matter
- When comparing total magnitudes across categories
- When one segment's actual size is the key message

**Joined variation:**
Eliminating spaces between bars sometimes makes relationships more visible, particularly when tracking how proportions change across an ordered set of categories.

## Notes

This is analogous to comparing multiple pie charts, but the bar format enables more precise proportion comparison. The horizontal alignment of segment boundaries across bars (especially with linking lines) reveals patterns in how composition changes.

Can be combined with linking/connecting lines between segment boundaries to emphasize trends in proportional composition.
