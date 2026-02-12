---
name: Supplementary Scale
slug: supplementary-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Supplementary scale, p. 338"

intent: Add a secondary scale with curved grid lines that encode derived or calculated values based on primary data
direction: construction

components:
  - element: supplementary-scale-labels
    encodes: Derived values (typically ratios or percentages)
    required: true
  - element: curved-grid-lines
    encodes: Lines showing where derived values intersect with primary data
    required: true
  - element: primary-scales
    encodes: Standard value scales for the base data
    required: true

parameters:
  derived_measure: "ratio | percent | calculated value"
  grid_line_type: "curved lines extending as data becomes available"
  relationship: "formula relating derived values to primary data"

related: []  # TBD: dual-scale, linear-scale

warnings:
  - "Grid line values cannot be calculated until primary data is available"
  - "More complex to read than conventional dual scales"

extensions:
  harris_entry: "Scale"
  alternate_names: ["supplementary amount scale"]
  typical_use: "showing derived ratios or percentages alongside primary values"
---

## Description

A supplementary scale (sometimes called a supplementary amount scale) provides calculated or derived values that depend on the primary data. Unlike conventional scales where grid lines are straight and values are predetermined, supplementary scale grid lines are often curves that are extended as data becomes available.

The supplementary scale provides much of the same basic information as a second value scale but additionally lets the viewer analyze the data in ways not possible with conventional scales. Supplementary scales are typically ratio or percent scales.

## Examples

> "The grid lines for a supplementary scale are sometimes a series of curves that are extended as data becomes available. For instance, in the example at the right, the supplementary grid lines represent the profit dollar values associated with various percents of sales." (p. 338)

The PDF shows a graph with:
- Primary vertical scale: Profit dollars in millions (0-12)
- Primary horizontal scale: Years (93-99)
- Supplementary scale: Profit as a percent of sales (10%-18%)
- Curved grid lines showing constant-percentage contours

The example demonstrates: "In the example above it can be seen that the profit was 17% in 1993. By means of the supplementary scale, one can see that if the 1993 profit level of 17% had been maintained instead of dropping to 12.5%, the company would have made about two million dollars more profit in 1998." (p. 338)

## Usage

Supplementary scales are appropriate when:
- Showing both absolute values and their ratios to another measure
- The derived relationship changes over time (curves move)
- "What if" analysis benefits from visual representation
- Viewers need to see both actual and relative performance

The supplementary grid lines cannot be calculated until the underlying data (e.g., both sales and profit figures) is available, making this a data-dependent visualization technique.

## Notes

The key advantage of a supplementary scale over two conventional scales is the ability to answer questions like "What would the profit have been if the profit percentage had remained constant?" The curved grid lines make these counterfactual comparisons visually accessible.
