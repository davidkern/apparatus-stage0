---
name: Progressive Column Graph
slug: progressive-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Progressive column graph, p. 92"

intent: Show how components add up to a total by displacing stacked segments sideways for visibility
direction: both

components:
  - element: displaced-segments
    encodes: Individual component values, each offset from the previous
    required: true
  - element: cumulative-scale
    encodes: Running total on one axis (often percentage on right)
    required: false
  - element: value-scale
    encodes: Individual and cumulative values on left axis
    required: true
  - element: segment-labels
    encodes: Component names and optionally their percentages
    required: true
  - element: total-column
    encodes: Optional column showing sum of all segments
    required: false

parameters:
  displacement_amount: "slightly more than column width (typical)"
  displacement_direction: "generally right from bottom"
  include_total_column: "yes | no"

related:
  - slug: stacked-column-graph
    relationship: variant-of

warnings:
  - "Segments must still conceptually add up to the whole"
  - "Displacement obscures the stacked relationship somewhat"
  - "Requires more horizontal space than standard stacked column"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["stepped column graph", "step-by-step column graph", "staggered column graph", "waterfall chart"]
  typical_use: "showing expense breakdowns, cumulative contributions, decomposition of totals"
---

## Description

A progressive column graph is equivalent to a stacked column graph with only one column, but with individual segments displaced sideways. Starting at the bottom, each successive segment is generally displaced to the right. The segments can be displaced by any amount but are generally shifted slightly more than the width of the column.

Displacing the segments adds visibility and emphasis to individual segments while maintaining the concept that segments all add up to the whole.

## Examples

> "A progressive column graph is the equivalent of a stacked column graph with only one column and with the individual segments of that column each displaced sideways. Starting at the bottom, each successive segment is generally displaced to the right." (p. 92)

Harris illustrates with an overhead expenses example:
- Personnel at bottom (9%)
- Engineering (16%)
- R&D (40%)
- Selling (10%)
- Administrative at top (25%)

Features of the example:
- Left-hand scale shows expense dollars (individual and cumulative)
- Right-hand scale shows cumulative percentages (0% to 100%)
- Each segment labeled with expense category and percentage
- Optional: additional column showing total expenses

> "In the lower example, an additional column is included to represent the total of all of the individual segments." (p. 92)

## Usage

Design specifications:
- Each segment is displaced rightward (typically) from the one below
- Displacement is usually slightly more than column width
- Left scale enables reading both individual and cumulative values
- Right scale can show cumulative percentages
- Segment labels typically include name and percentage

When to use:
- When individual component visibility matters more than compact presentation
- When showing step-by-step accumulation
- When emphasizing how pieces build to a total
- Expense breakdowns, budget build-ups, contribution analysis

Variations:
- With or without total column at the end
- With or without cumulative percentage scale
- Various displacement amounts for different visual effects

## Notes

This format is related to what is commonly called a "waterfall chart" in modern usage. The progressive displacement makes each component clearly visible while preserving the additive relationship to the total.
