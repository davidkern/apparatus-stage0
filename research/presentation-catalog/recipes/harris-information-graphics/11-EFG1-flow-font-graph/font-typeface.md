---
name: Font and Typeface Selection
slug: font-typeface
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Font, p. 159"

intent: Select appropriate typography for chart labels, titles, and annotations based on readability and purpose
direction: construction

components:
  - element: typeface-family
    encodes: Overall design style (serif, sans serif, decorative)
    required: true
  - element: point-size
    encodes: Physical size of text for readability
    required: true
  - element: weight
    encodes: Thickness of strokes (light, regular, bold)
    required: false
  - element: style
    encodes: Variation such as italic or oblique
    required: false

parameters:
  typeface_category: "serif | sans serif | decorative"
  application: "body text | headings | special effects"

related: []

warnings:
  - "Decorative typefaces may reduce readability; use sparingly for headings or special effects"
  - "Font selection affects chart appearance and legibility at different sizes"

extensions:
  harris_entry: "Font"
  alternate_names: ["Typeface"]
  component_entry: true
  example_typefaces:
    serif: "Times"
    sans_serif: "Helvetica"
    decorative: "Zapf Chancery"
---

## Description

When a set of printed letters, numbers, and characters have the same design features, the style or design of the type is identified as the font or typeface. There are hundreds of styles to choose from, with names such as Helvetica, Times, Geneva, etc.

Three major categories of typefaces are:
- **Serif**: Letters have small lines projecting from the ends of their main lines or strokes
- **Sans serif**: Letters do not have the small projecting lines (sans = without)
- **Decorative**: Stylized typefaces often used for headings, special effects, and to improve chart appearance

## Examples

Harris provides examples at nine-point size (p. 159):

> "This is an example of a serif typeface called Times. Serif letters have small lines projecting from the ends of each of their main lines or strokes."

> "This is an example of a sans serif typeface called Helvetica. Sans (without) serif letters do not have the small lines projecting as the serif typefaces do."

> "This is an example of a decorative typeface named Zapf Chancery. Decorative typefaces are many times used for headings, special effects, and/or to improve the appearance of charts."

## Usage

Font selection in charts should consider:
- **Readability**: Serif fonts are traditionally considered easier to read in body text; sans serif fonts are often clearer at small sizes and on screens
- **Purpose**: Decorative fonts work for titles and emphasis but impair readability for data labels
- **Consistency**: Use consistent typeface families throughout a chart for visual coherence
- **Size**: Ensure text remains legible at the chart's final display size

## Notes

This is a component entry that applies to all chart types where text labels, titles, and annotations appear. Font choice is one aspect of overall chart design that affects both aesthetics and data communication effectiveness.
