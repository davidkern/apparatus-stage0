---
name: Back-to-Back Graphs
slug: back-to-back-graphs
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs plotted back to back, p. 172"

intent: Construct two bar or column graphs sharing a common zero axis to enable direct visual comparison of two related data series
direction: both

components:
  - element: shared-zero-axis
    encodes: Common baseline for both graphs
  - element: left-or-upper-graph
    encodes: First data series extending in one direction
  - element: right-or-lower-graph
    encodes: Second data series extending in opposite direction
  - element: category-axis
    encodes: Shared categories for both series

parameters:
  orientation: "horizontal (back-to-back bars) | vertical (back-to-back columns)"
  data_comparison: "male vs female | before vs after | positive vs negative"

related: []  # TBD: paired-bar-graph, population-pyramid

warnings:
  - "Only works with two data series"
  - "Both series must share the same categories"
  - "Scale must be symmetric or clearly labeled if asymmetric"

extensions:
  harris_entry: "Graph"
  alternate_names: ["population pyramid", "butterfly chart", "tornado chart"]
  typical_use: "comparing two complementary or opposing categories across the same items"
---

## Description

In order to make comparisons clearer, two bar graphs or two column graphs may be constructed using the same zero axis. The graphs extend in opposite directions from this shared baseline, creating a symmetric or mirror-image structure that facilitates direct visual comparison.

This technique is particularly effective when comparing two complementary or opposing groups (such as male vs. female, imports vs. exports, or gains vs. losses) across the same set of categories.

## Examples

Harris shows both orientations (p. 172):

**Back-to-back column graph:**
A vertical arrangement where columns extend upward and downward from a shared horizontal zero axis, with time periods on the horizontal axis. The example shows data from 1975-1995.

**Back-to-back bar graph:**
A horizontal arrangement where bars extend leftward and rightward from a shared vertical zero axis, with categories (Females, Males) on the vertical axis. The example compares age distributions with values ranging from 0-10 on each side.

> "In order to make comparisons clearer, two bar graphs or two column graphs may be constructed using the same zero axis."

## Usage

Most effective when:
- Comparing exactly two related data series
- Series represent complementary or opposing concepts
- Categories are shared between both series
- Direct visual comparison of magnitudes is the goal

Classic applications:
- **Population pyramids**: Age distribution by gender
- **Trade balance**: Imports vs. exports by category
- **Survey results**: Agreement vs. disagreement
- **Before/after**: Changes from baseline

Less effective when:
- More than two series need comparison
- Series don't share meaningful categories
- Absolute values matter more than comparison

## Notes

The back-to-back arrangement works because it leverages the human visual system's ability to perceive symmetry and deviation from symmetry. When the two sides are equal, the viewer immediately sees balance; when unequal, the direction and magnitude of difference are apparent at a glance.
