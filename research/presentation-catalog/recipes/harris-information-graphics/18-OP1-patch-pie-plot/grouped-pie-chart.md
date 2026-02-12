---
name: Grouped Pie Chart
slug: grouped-pie-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pie Chart, Groupings of segments on pie charts, p. 284"

intent: Indicate relationships or groupings among pie chart segments while showing subtotals for those groupings
direction: both

components:
  - element: circle
    encodes: The whole (100%)
    required: true
  - element: segments
    encodes: Individual parts
    required: true
  - element: grouping-indicators
    encodes: Visual markers showing which segments belong together
    required: true
  - element: subtotal-labels
    encodes: Sum of grouped segments
    required: false

parameters:
  grouping_method: "arcs-outside | superimposed-pie | color-coding"
  subtotal_display: "shown | hidden"

related:
  - slug: pie-chart
    relationship: variant-of

warnings:
  - "Additional visual elements add complexity"
  - "Superimposed pie method may obscure segment boundaries"

extensions:
  harris_entry: "Pie Chart"
  alternate_names: []
  typical_use: "showing both detailed breakdown and category groupings simultaneously"
---

## Description

Sometimes it is advantageous to group multiple segments of a pie chart to indicate that they have something in common or are related in some way. For example, one group might represent items purchased from domestic sources, another from foreign sources, and a third from inter-company purchases.

Subtotals may or may not be assigned to the subgroupings. Harris describes two primary methods for indicating segment groupings:
1. Arcs drawn around the outside of the pie chart
2. One pie chart superimposed over another

## Examples

Harris illustrates both grouping methods (p. 284):

**Arc method:**
> "Arcs around the outside to indicate groupings"

The example shows segments A(13%), B(18%), C(22%), D(21%), E(9%), F(10%), G(7%) with curved arcs outside the pie indicating:
- Group #1 (30%): D, E
- Group #2 (30%): F, G, A
- Group #3 (40%): B, C

**Superimposed pie method:**
> "One pie chart superimposed over another to indicate groupings"

The same data is shown with a second, slightly smaller pie overlaid, where the outer ring shows the detailed segments and color bands indicate the three groupings.

## Usage

**When to use:**
- Segments have meaningful higher-level categories
- Both detail and summary views are important
- Data has hierarchical structure (components within categories)

**Method selection:**

*Arcs outside:*
- Keeps all segment details fully visible
- Adds visual elements but maintains clarity
- Works well with many groups

*Superimposed pie:*
- More visually integrated
- May be harder to read with many segments
- Creates a "belt" effect showing hierarchy

**Design considerations:**
- Ensure grouping indicators don't obscure segment labels
- Consider whether subtotals add value
- Maintain consistent visual treatment for all groups

## Notes

The grouped pie chart addresses a limitation of standard pie charts: they show one level of categorization at a time. By adding grouping indicators, viewers can understand both the detailed breakdown and how those details roll up into larger categories.

This is conceptually similar to a grouped bar chart, where individual bars are clustered by category. The circular format presents unique challenges since segments don't have natural left-to-right or top-to-bottom ordering, so visual grouping indicators must be explicit.
