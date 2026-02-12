---
name: Category Scale
slug: category-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Example of category scale, p. 337"

intent: Configure an axis displaying named categories with equal physical spacing regardless of any inherent ordering
direction: both

components:
  - element: category-labels
    encodes: Names or identifiers for each category
    required: true
  - element: tick-marks
    encodes: Division points between categories (optional)
    required: false
  - element: axis-line
    encodes: Reference line along which categories are arranged
    required: true

parameters:
  category_names: "list of category labels"
  ordering: "alphabetical | custom | by value (descending or ascending)"
  spacing: "typically equal physical distance between categories"

related: []  # TBD: sequence-scale, quantitative-scale

warnings:
  - "Labels can be ordered (e.g., alphabetically) but cannot be ranked"
  - "Physical spacing between categories has no quantitative meaning"
  - "Unlike sequence scales, reordering categories does not fundamentally degrade the information"

extensions:
  harris_entry: "Scale"
  typical_use: "bar graphs, column graphs comparing named items"
  scale_property: "equal physical distances between categories"
  distinguishing_feature: "categories can be reordered without losing meaning"
---

## Description

A category scale displays labels representing discrete named items such as products, regions, departments, or any other non-numeric classification. The labels are arranged with typically equal physical distances between them. Unlike quantitative scales, the spacing carries no numerical meaning, and unlike sequence scales, the order can generally be changed without fundamentally degrading the plotted information.

The key distinction of a category scale is that labels can be ordered (for example, alphabetically) but they cannot be ranked in a meaningful progression. There is no inherent "before" and "after" relationship between categories as there is with sequence scales.

## Examples

> "Labels on category scales can be ordered (e.g., alphabetically) but they cannot be ranked." (p. 337)

The PDF shows a typical category scale with labels: Corn, Beets, Peas, Okra, Beans. The notation "Typically equal physical distances" appears below the scale. These categories could be reordered (e.g., alphabetically as Beans, Beets, Corn, Okra, Peas) without fundamentally changing the meaning of data plotted against them.

## Usage

Category scales are appropriate when:
- Comparing values across discrete named items
- The items have no inherent sequential or ranked order
- Creating bar graphs, column graphs, or grouped comparisons
- The viewer needs to look up values for specific named categories

Category scales differ from sequence scales in that reordering the labels does not degrade the information. For example, rearranging product names alphabetically versus by sales volume changes emphasis but not meaning.

## Notes

When deciding between a category scale and a sequence scale, consider whether the order of items carries meaning. If the items represent time periods, rankings, or progression, a sequence scale is appropriate. If the items are simply named entities with no inherent order, a category scale is appropriate.
