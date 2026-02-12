---
name: Line Graph Icon
slug: line-graph-icon
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Line graph icons, p. 215"

intent: Display trends, patterns, or multivariate comparisons using miniature line graphs as symbolic elements
direction: both

components:
  - element: miniature-line-graph
    encodes: Trend, pattern, or multivariate profile
    required: true
  - element: template-legend
    encodes: Scale and axis meanings for interpreting icons
    required: true
  - element: host-context
    encodes: The graph, map, or comparison display where icons appear
    required: true

parameters:
  size: "typically 1 inch square or less"
  curve_style: "segmented | stepped | smooth"
  application: "symbols on graphs | multivariate comparison | symbols on maps"

related: []  # TBD: see also icon-comparison-display

warnings:
  - "Icons do not convey specific quantitative information; they show relative values and patterns"
  - "A legend/template is always required when icons are used"
  - "When used for multivariate comparison, a common scale of 0 to 1.0 is generally used for all characteristics"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["icons", "symbols", "line graph symbols"]
  typical_use: "showing trends at data points, comparing multiple entities on multiple variables, geographic pattern display"
---

## Description

Line graph icons are miniature line graphs (typically 1 inch square or less) used as symbolic elements rather than standalone charts. They frequently omit titles, labels, tick marks, and grid lines. Unlike full-size line graphs that convey specific quantitative information, icons show relative sizes, values, ratings, trends, or unusual patterns.

Icons can use segmented, stepped, or smooth curves as the data graphic. Their power lies in enabling rapid visual comparison of patterns across many items simultaneously.

## Examples

**As symbols on graphs** (p. 215):
> "Icons can be used on graphs to give detailed information about specific data points. For instance... the dashed line connects data points that represent five-year average values. The icons show trends in the data from which the averages were calculated."

The example shows a seasonal sales curve with icons at data points revealing that "even though October has a higher average value than May, for the last four years sales in October have gone down while in May they have gone up."

**For multivariate comparison** (p. 215):
> "To simultaneously compare a sizable number of entities with regards to three or more variables (sometimes called multivariate), a display of line icons is sometimes used."

An example compares ten desktop computers across eight characteristics (hard disk capacity, installed RAM, expandable RAM, speed, monitor resolution, monitor size, accessories, price). A template/legend ensures the same characteristic is always in the same location on every icon.

**As symbols on maps** (p. 215):
> "Line graph icons are used on maps to convey two major types of information. One usage is to show how things change over time... The other major usage is for comparing multiple variables or characteristics between areas on the map."

Examples include showing exports by state to different countries, production of different crops, or population by ethnic background.

## Usage

Use line graph icons when:
- You need to show detailed trend information at specific data points on a larger graph
- Comparing many entities across multiple variables simultaneously
- Displaying multivariate geographic patterns on maps

The technique requires:
1. A template/legend showing what each position on the horizontal axis represents
2. Consistent scaling across all icons (typically 0 to 1.0 for multivariate comparisons)
3. The same characteristic must appear in the same location on every icon

There is no practical limit to the number of variables per icon or the number of icons in a display, constrained only by legibility.

## Notes

Harris cross-references this technique with Icon and Icon Comparison Display entries. The multivariate comparison application is particularly powerful for pattern recognition across many entities, as the human eye can quickly identify similar shapes and outliers.
