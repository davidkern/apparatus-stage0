---
name: Pictorial Proportional Chart
slug: pictorial-proportional-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pictorial Charts and Graphs, Pictorial proportional chart, p. 278"

intent: Communicate differences in size, number, or value by making the sizes of pictorial data graphics proportional to the items they represent
direction: both

components:
  - element: pictorial-data-graphics
    encodes: Items being compared through relative symbol sizes
    required: true
  - element: numeric-values
    encodes: Actual values shown alongside graphics
    required: true
  - element: category-labels
    encodes: What each graphic represents
    required: true

parameters:
  size_basis: "height | area | volume"
  graphic_type: "pictures | sketches | icons"

related:
  - slug: pictorial-unit-chart
    relationship: contrasts

warnings:
  - "Most people's ability to accurately estimate sizes of irregular objects is poor"
  - "Viewer must decide whether height, area, or volume was used for proportions"
  - "If basis is unclear, relative sizes can be significantly misinterpreted"
  - "Graphics are used primarily to orient; actual numbers provide exact values"

extensions:
  harris_entry: "Pictorial Charts and Graphs"
  alternate_names: []
  typical_use: "comparing sizes or values of multiple entities over time or conditions"
  key_distinction: "sizes proportional (vs. unit charts where counts proportional)"
---

## Description

Proportional charts are visual devices for graphically communicating differences in size, number, or value of multiple items by means of differences in the sizes of data graphics. The sizes of the data graphics are in the same proportion as the items they represent.

For example, if television A is twice as big as television B and both are represented by a symbol of a television, the symbol for television A will be twice as big as the symbol for B.

Pictorial proportional charts with pictures, sketches, icons, etc., are sometimes more difficult to interpret than those with simple geometric shapes and are used less frequently.

## Examples

Harris illustrates the interpretation challenge (p. 278):
> "The two charts at the right are examples of pictorial proportional charts, except in actual charts the numeric values are typically shown."

The examples show trees at different sizes (1970, 1980, 1990) and circles at different sizes (A, B, C).

> "The examples illustrate a complication of pictorial proportional charts in that the viewer must decide whether the originator designed the charts with the heights, areas, or volumes proportional to the values they represent. Depending on which one was used, the relative sizes of the data graphics are significantly different."

## Usage

**Key elements:**
- Relative sizes of pictures, sketches, icons, etc., are in the same proportion as the things they represent
- Normally do not have scales, tick marks, or grid lines
- Used to compare multiple entities or same entity at different times/conditions
- Relative sizes can be based on length/height, area, or volume (area typically used)

**Critical design requirement:**
- Always include actual numeric values alongside graphics
- Graphics orient the reader; numbers provide exact values
- Make clear whether sizing is based on height, area, or volume

**Why accuracy is limited:**
- Irregular shapes are hard to estimate
- Viewers may assume wrong basis (height vs. area vs. volume)
- Proportional perception varies by individual

**Comparison to unit charts:**
- Proportional: Single graphic varies in SIZE
- Unit: Multiple graphics vary in COUNT
- Unit charts often clearer because counting is easier than size estimation

## Notes

The pictorial proportional chart faces a fundamental perceptual challenge: people are poor at estimating areas and volumes of irregular shapes. This limitation means the pictorial elements serve primarily as visual interest and orientation rather than as precise data encoding.

The height/area/volume ambiguity is significant. If value B is twice value A:
- Height-proportional: B is 2x as tall, but appears 4x larger (height squared for area)
- Area-proportional: B has 2x the area, looks about 1.4x as tall
- Volume-proportional: B has 2x the volume, looks about 1.26x as tall/wide

Without explicit indication of which basis was used, viewers will likely misinterpret the data. This is why numeric labels are essential rather than optional.
