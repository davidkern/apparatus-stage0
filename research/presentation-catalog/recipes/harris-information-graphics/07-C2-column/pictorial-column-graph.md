---
name: Pictorial Column Graph
slug: pictorial-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Pictorial column graph, p. 90"

intent: Improve visual appeal and communication by replacing or filling rectangles with pictures, sketches, or icons
direction: both

components:
  - element: pictorial-data-graphics
    encodes: Values via pictures, sketches, or icons instead of plain rectangles
    required: true
  - element: quantitative-scale
    encodes: Numeric values (may be implicit)
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true
  - element: symbol-legend
    encodes: What each symbol represents and its value (for unit-based variations)
    required: false

parameters:
  symbol_method: "cropped stack | stretched single | decorative fill"
  symbol_proportionality: "proportional to value | not proportional (decorative only)"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: pictorial-bar-graph
    relationship: variant-of

warnings:
  - "Stretched symbols can distort perception of values"
  - "Decorative-only symbols may mislead viewers into thinking size is meaningful"
  - "Three-dimensional column graphs are typically not done in pictorial format"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["pictograph", "picture graph", "icon graph"]
  typical_use: "presentations, publications, making data more memorable and engaging"
---

## Description

A pictorial column graph uses pictures, sketches, or icons to fill or replace vertical rectangles. The two major reasons for using pictorial graphs are to improve the appearance of the graph and to facilitate better communications. Three-dimensional column graphs are typically not done in pictorial format.

## Examples

> "A pictorial column graph is a graph in which pictures, sketches, or icons are used to fill or replace the vertical rectangles. They are sometimes referred to as pictographs." (p. 90)

Harris illustrates three widely used variations:

### 1. Cropped Stack Method
Each symbol represents a certain number of units. Symbols are stacked, and the top symbol is cropped such that its top edge aligns with the value the column represents. This maintains proportionality while using meaningful imagery.

### 2. Stretched Symbol Method
A single symbol is stretched such that the top of the symbol aligns with the value on the scale. This approach can distort the image and may create perceptual issues with value comparison.

### 3. Decorative Fill Method
The size and/or number of symbols bears no relationship to the value the column represents. Symbols are simply used as fill for visual interest. This approach risks misleading viewers who assume size is meaningful.

## Usage

When to use pictorial column graphs:
- Presentations where engagement matters
- Publications targeting general audiences
- Making data more memorable
- When the subject matter has natural visual representations

Design considerations:
- The cropped stack method is most accurate for data representation
- Clearly indicate if symbols are decorative only
- Include scales and labels as with standard column graphs
- Avoid stretching symbols when accurate comparison is important

Avoid pictorial treatment when:
- Precise value comparison is critical
- Creating three-dimensional column graphs
- Symbols would distort value perception

## Notes

Harris references the broader topic of Pictorial Charts and Graphs for additional variations and guidance. The choice of pictorial method significantly affects both appeal and accuracy of interpretation.
