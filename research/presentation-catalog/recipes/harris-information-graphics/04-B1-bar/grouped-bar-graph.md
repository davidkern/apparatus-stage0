---
name: Grouped Bar Graph
slug: grouped-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Grouped bar graph, pp. 38-39"

intent: Compare multiple data series across categories by placing bars for each series side-by-side within category groups
direction: both

components:
  - element: bar-groups
    encodes: One group per category; contains bars from all data series
    required: true
  - element: bars-per-group
    encodes: One bar per data series within each group; differentiated by fill
    required: true
  - element: legend
    encodes: Maps fill patterns/colors/shades to data series names
    required: true
  - element: quantitative-scale
    encodes: Value axis (horizontal); always quantitative
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true
  - element: inter-group-space
    encodes: Visual separation between category groups
    required: true
  - element: inter-bar-space
    encodes: Space between bars within a group; typically zero or small
    required: false
  - element: bar-margin
    encodes: Space between outermost groups and frame
    required: false

parameters:
  data_series_count: 2 | 3 | 4+ (practically limited to 3-4 before confusion)
  overlap_percent: 0% | 25% | 50% | 75% | 100%
  value_direction: positive-only | positive-and-negative
  dimensionality: 2D | 3D-oblique | 3D-three-axis

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: stacked-bar-graph
    relationship: contrasts
  - slug: overlapped-grouped-bar-graph
    relationship: contains

warnings:
  - "If the number of data series goes above three or four, the graph becomes confusing"
  - "Three-axis variation is sometimes difficult to construct and interpret"
  - "100% overlap can easily be mistaken for a stacked bar graph"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "clustered bar graph"
    - "side-by-side bar graph"
    - "multiple bar graph"
  typical_use: "comparing multiple data series across the same categories"
  design_notes:
    group_width: "all groups/clusters are the same width even if values are zero"
    bar_width: "bars are generally all the same width on a given graph"
    inter_group_space: "can be any width; generally uniform throughout"
    inter_bar_space: "typically no space between bars in a group; if present, small"
---

## Description

A grouped bar graph plots two or more data series side-by-side on the same graph. Each data element of each data series is represented by a separate bar. The data series are differentiated by filling the bars with different colors, shades, or patterns, explained in a legend.

Within each category, bars from all data series are placed side-by-side to form a group or cluster centered in the space allocated to that category. This arrangement enables direct comparison of values across data series for each category.

## Examples

Harris illustrates with manufacturing costs (p. 38):
- Three plants (A, B, C) shown as three data series
- Categories: Material, Labor, Overhead
- Each category group contains three bars (one per plant)
- Legend identifies which shade represents which plant
- Horizontal scale shows "% of manufacturing costs"

Design features diagram (p. 38) shows:
- Category scale on vertical axis
- Tick marks optional on vertical axis
- Space (bar margin) between bars and frame
- No space between bars within a group (or small inter-bar space)
- Uniform group widths even when values are zero
- Quantitative scale always on horizontal axis

## Usage

**When to use:**
- Comparing values of multiple data series across the same categories
- When direct comparison between series within each category is important
- When actual values (not proportions) matter

**Design considerations:**
- Position bars from the same data series in consistent locations within groups
- Use distinguishable fills (color, shade, pattern) for each series
- Keep data series count to 3-4 maximum for clarity

**Overlapped variation:**
To improve readability, bars can be overlapped (shifted vertically so successive series partially hide behind others):
- Overlap ranges from barely to 100%
- 100% overlap risks confusion with stacked bar graphs
- Position shortest bars in front to avoid hiding longer bars
- Bar width can increase as overlap increases (when graph width stays constant)

Harris shows examples of 25%, 50%, 75%, and 100% overlap (p. 39).

**Three-dimensional variations:**
- Oblique view of two-axis graph: aesthetic value, some loss in decoding accuracy
- Three-axis grouped bar graph: difficult to construct and interpret; three-axis grouped column graph often used instead

## Notes

Grouped bar graphs can accommodate both positive and negative values on the horizontal axis. Harris shows an example with values ranging from -75 to +100 (p. 38).

Negative inter-bar spacing (overlapping) is possible and creates the overlapped grouped bar graph variation.
