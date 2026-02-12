---
name: Category Axis
slug: category-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Scale or label axes, p. 23"

intent: Configure an axis to display discrete named categories or groups
direction: both

components:
  - element: scale-line
    encodes: The physical line along which categories are arranged
    required: true
  - element: category-labels
    encodes: Names identifying each discrete category
    required: true
  - element: tick-marks
    encodes: Marks separating or centering categories
    required: false
  - element: axis-title
    encodes: Description of category grouping
    required: false

parameters:
  label_type: names | codes | abbreviations
  orientation: vertical | horizontal

related: []  # TBD: see also quantitative-axis, sequence-axis

extensions:
  harris_entry: "Axis, Graph"
  typical_use: "comparing values across named groups, products, regions, or other discrete items"
  scale_examples:
    - "Brown, Eaton, Smith, Jones (salesperson names)"
    - "Unit A, Unit B, Unit C, Unit D (business units)"
---

## Description

A category axis displays discrete named items rather than continuous numeric values. Each position on the axis represents a distinct entity such as a person, product, region, or department. Unlike quantitative axes where position encodes magnitude, category axis positions simply separate and identify different groups.

Harris distinguishes category axes from both quantitative axes (which show measurable numeric values) and sequence axes (which show ordered items). Category axes present unordered discrete items where the arrangement has no inherent meaning.

## Examples

> "Axes with scales such as these might be referred to as category axes." (p. 23)

Harris shows two category axis examples:
- Salesperson names: Brown, Eaton, Smith, Jones
- Business units: Unit A, Unit B, Unit C, Unit D

The category axis runs perpendicular to the quantitative axis in most chart types.

## Usage

Category axes are appropriate when:
- Comparing values across distinct named entities
- Data falls into discrete groups that cannot be interpolated
- The items being compared are not naturally ordered

Common applications:
- Bar graphs comparing sales by salesperson
- Column graphs comparing revenue by product line
- Grouped charts comparing multiple metrics across departments

## Notes

Category axes typically appear on the horizontal axis of column graphs and the vertical axis of bar graphs. The spacing between categories is uniform, though the categories themselves have no inherent numeric relationship.
