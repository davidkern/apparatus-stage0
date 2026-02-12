---
name: Floating Column Graph
slug: floating-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Floating Column Graph, p. 152"

intent: Compare multiple data series with particular attention to meaningful relationships by measuring positive values both up and down from a zero axis
direction: both

components:
  - element: upward-columns
    encodes: Values for one data series (measured up from zero)
  - element: downward-columns
    encodes: Values for paired/contrasting series (measured down from zero)
  - element: zero-axis
    encodes: Shared reference line between opposing series
  - element: category-axis
    encodes: Categories or time periods (horizontal)
  - element: value-axis
    encodes: Quantitative measure (vertical, extending both directions)

parameters:
  pairing: simple | stacked | grouped | 100-percent
  data_type: positive-only | positive-and-negative

related: []

warnings:
  - "Generally only positive values are plotted, even though columns extend below zero"
  - "Viewers may confuse visual direction with positive/negative values"

extensions:
  harris_entry: "Floating Column Graph"
  alternate_names: ["two-way column graph"]
  typical_use: "comparing male/female data, showing correlations, demographic pyramids, paired comparisons"
  scale_types:
    horizontal: "category or sequence"
    vertical: "quantitative (bidirectional from zero)"
---

## Description

A floating column graph is a variation of column graph where values are measured both up and down from a central zero line. Despite the bidirectional display, both directions typically represent positive values for different data series (e.g., male/female, with degree/without degree).

The major purpose is to compare multiple data series with particular attention to meaningful relationships such as correlations or compositional differences between paired groups.

## Examples

Harris shows four major variations (p. 152):

**Simple floating column graph:**
Shows paired columns for years 1991-1994, one series extending up, one extending down from the zero line.

**Stacked floating column graph:**
Professors A through E, each with male (up) and female (down) columns, with subdivisions showing "Degree" and "No degree" within each column.

**100% floating column graph:**
Years 1975-1995 showing percentage breakdowns in both directions, with "With diploma" above and "No diploma" below zero.

**Grouped floating column graph:**
Professors A through D with male/female pairs, further subdivided by 1980 and 1990 data within each direction.

Harris notes:
> "A floating column graph is a variation of column graph in which positive values are measured both up and down from a zero on the vertical axis. Their major purpose is to compare multiple data series with particular attention to meaningful relationships such as correlations."

## Usage

Floating column graphs are appropriate when:
- Two paired or contrasting categories need comparison
- Showing compositional differences between groups
- Visualizing demographic or survey breakdowns
- Displaying data that naturally pairs (male/female, before/after)

Linear quantitative scales starting at zero are used on the vertical axis. Despite extending in both directions from zero, generally only positive values are plotted. The position (up vs. down) encodes category membership, not positive vs. negative values.

## Notes

The population pyramid is a common application of this technique, showing age distributions for males on one side and females on the other. The horizontal baseline becomes a vertical axis, but the principle is the same: paired series measured in opposite directions from a shared reference.

Viewers accustomed to traditional column graphs where "down from zero" means "negative" may need guidance that both directions represent positive values for different categories.
