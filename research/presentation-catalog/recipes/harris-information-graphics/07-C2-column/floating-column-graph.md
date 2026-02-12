---
name: Floating Column Graph
slug: floating-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Floating column graph, p. 84"

intent: Compare two data series by measuring positive values both upward and downward from a central zero axis
direction: both

components:
  - element: upward-columns
    encodes: First data series values extending above zero axis
    required: true
  - element: downward-columns
    encodes: Second data series values extending below zero axis
    required: true
  - element: central-zero-axis
    encodes: Reference point separating the two data series
    required: true
  - element: differentiated-fills
    encodes: Each data series via distinct color, shade, or pattern
    required: true
  - element: dual-quantitative-scales
    encodes: Positive values on both up and down scales (may have different units)
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true

parameters:
  scale_units: "same for both | different units (e.g., people vs. dollars)"
  scale_intervals: "same for both | different intervals"
  sub_variations: "simple | stacked | grouped | 100%"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: deviation-column-graph
    relationship: contrasts

warnings:
  - "The units of measure and scale intervals for up and down scales may or may not be the same"
  - "Generally only positive values are plotted; the downward direction does not imply negative values"
  - "Clear labeling is essential to prevent confusion about what direction represents"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["two-way column graph", "bilateral column graph"]
  typical_use: "comparing males and females, comparing income and expenses, comparing complementary categories"
  scale_types:
    vertical: "dual quantitative (linear, starting at zero)"
    horizontal: "category or sequence"
---

## Description

A floating column graph is a variation in which positive values are measured both up and down from a zero on the vertical axis. The major purpose is to compare multiple data series, with particular attention to correlations and relationships.

The units of measure and scale intervals for the up and down scales may or may not be the same. For example, males and females in different professions might use the same units (number of people) on both scales. Alternatively, headcount might be compared with expenses, using different units (people vs. dollars).

## Examples

> "A floating column graph is a variation of column graph in which positive values are measured both up and down from a zero on the vertical axis. The major purpose is to compare multiple data series, with particular attention to correlations and relationships." (p. 84)

Harris presents four major types:

**Simple floating**: Compares two things in different situations at a given point in time (e.g., males and females in several professions) or the same situation over time (e.g., males and females in one profession over five years).

**Stacked floating**: Functions like simple floating, except one or both data series are broken into subcomponents (e.g., males and females further divided by education level).

**Grouped floating**: Incorporates an additional variable by adding columns to each group (e.g., males and females in various professions at multiple time periods).

**100% floating**: Compares two data series whose total at each interval equals a fixed value (typically 100%). One series above zero, one below. Shows percentages like applicants with vs. without high school diplomas over time.

## Usage

Design requirements:
- Linear quantitative scales starting at zero on vertical axis
- Generally only positive values plotted (downward does not mean negative)
- Category or sequence scale on horizontal axis
- Grid lines optional
- Different colors/shading/patterns to clearly differentiate the two primary data series

Applications:
- Comparing complementary categories (male/female, domestic/international)
- Showing resource allocation (income vs. expenses)
- Demographic breakdowns

## Notes

The key distinction from deviation graphs: in floating column graphs, both directions represent positive values of different data series. In deviation graphs, direction indicates positive or negative deviation from a reference. Clear axis labeling is essential to prevent misinterpretation.
