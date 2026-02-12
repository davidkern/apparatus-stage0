---
name: Category Scale
slug: category-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Category Scale, p. 68"

intent: Display a series of named items that identify or describe people, places, things, or events without quantitative ordering
direction: both

components:
  - element: category-labels
    encodes: Words and/or numbers that name, identify, or describe distinct categories
    required: true
  - element: category-positions
    encodes: Locations along the axis for each category (order not inherently meaningful)
    required: true

parameters:
  content_type: words | numbers | mixed
  ordering: arbitrary | alphabetical | custom

related: []

warnings:
  - "Numbers on category scales are for identification only, not quantitative comparison"
  - "Category order can influence interpretation even though it is not inherently meaningful"

extensions:
  harris_entry: "Category Scale"
  alternate_names: ["qualitative scale", "nominal scale"]
  typical_use: "labeling chart categories, organizing non-numeric data"
  scale_types:
    category: "qualitative"
---

## Description

A category scale consists of a series of words and/or numbers that name, identify, or describe people, places, things, or events. The items on the scale do not have to be in any particular order.

When numbers are used on a category scale, they are for identification purposes only, since category scales are not quantitative. Each word or number defines a distinct category which contains one or more entities. In other words, a category might refer to one man or to many men.

## Examples

Harris provides a simple example (p. 68):

> A category scale showing: Corn | Beets | Peas | Rice | Beans

Each label identifies a distinct category. The order (Corn first, Beans last) is arbitrary and does not imply that Corn is greater than or prior to Beans in any meaningful sense.

## Usage

Category scales are used when:
- Data items are distinguished by name rather than by numeric value
- The axis represents discrete, non-ordered categories
- Comparison is between named groups rather than along a continuum

Category scales contrast with:
- Quantitative scales: where position indicates numeric value
- Sequence scales: where order is meaningful (time series, ordinal)

## Notes

Harris distinguishes three scale types in his framework: category (qualitative/nominal), quantitative (numeric values), and sequence (ordered items including time series). Understanding which scale type applies to each axis is fundamental to selecting appropriate chart types.

An axis with a category scale is sometimes called a category axis. A graph with one or more category scales is sometimes called a category graph.
