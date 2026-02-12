---
name: Column Graph Icons
slug: column-graph-icons
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Column graph icons, p. 91"

intent: Use miniature column graphs as symbols to convey patterns, trends, or multivariate comparisons
direction: both

components:
  - element: miniature-column-graphs
    encodes: Pattern or trend information in condensed form
    required: true
  - element: template-or-legend
    encodes: How to interpret the icon structure
    required: true
  - element: host-visualization
    encodes: Graph, map, or comparison display where icons are placed
    required: true

parameters:
  icon_size: "typically 1 inch square or less"
  icon_detail: "no titles, labels, tick marks, or grid lines"
  application: "symbols on graphs | symbols on maps | multivariate comparison"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: icon-comparison-display
    relationship: combines-with

warnings:
  - "Purpose is to show relative sizes and patterns, not convey specific values"
  - "A legend or template is always required"
  - "Common scale (0 to 1.0) generally used for multivariate comparisons"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["column icons", "column symbols"]
  typical_use: "showing trends on maps, multivariate product comparisons, condensed pattern displays"
---

## Description

Miniature column graphs (typically 1 inch square or less), frequently without titles, labels, tick marks, or grid lines, are sometimes called icons or symbols. The purpose of icons is not to convey specific quantitative information, but to show relative sizes, values, ratings, overall comparisons, relative trends, and unusual patterns.

## Examples

### As Symbols on Graphs

> "Icon symbols can be used to communicate information single data points can not." (p. 91)

Harris shows a line graph where data points represent five-year sales averages. At each point, an icon showing the actual sales for each of the five years reveals trends invisible in the average. For example, October shows higher average than May, but the icons reveal October sales have declined for four years while May sales have risen.

### As Symbols on Maps

Column icons on maps convey two major types of information:
1. How things change over time (time scale on horizontal axis)
2. Comparing multiple variables between areas (category scale on horizontal axis)

Examples: exports by state to different countries, production of different crops by state, population by ethnic background.

> "A legend is always required when icons are used." (p. 91)

### For Multivariate Comparison

> "To compare a sizable number of entities simultaneously with regards to three or more variables (called multivariate), a display of column icons is sometimes used." (p. 91)

Harris shows an example comparing ten desktop computers on eight characteristics. A template ensures:
- Same characteristic always in same position on each icon
- Same value scale used across all icons
- Common scale of 0 to 1.0 for normalizing different units

The highest value or rating in each characteristic is assigned 1.0; lowest assigned some value less than 1.0 (usually zero). This normalizes different measurement types into comparable visual form.

## Usage

Icon characteristics:
- Small size (1 inch square or less)
- Minimal or no labels, titles, tick marks, grid lines
- Focus on pattern recognition, not precise values
- Columns may be filled or unfilled, joined or not joined

Template/legend requirements:
- For map applications: time or category scale explanation
- For multivariate comparisons: characteristic positions and common scale

Applications:
- Revealing underlying trends behind summary statistics
- Geographic distribution of temporal patterns
- Product/entity comparisons on multiple dimensions
- Pattern recognition across many entities

## Notes

Icons used for multivariate comparison are sometimes called icon comparison displays. There is no limit to the number of variables per icon or icons per display, other than legibility constraints.
