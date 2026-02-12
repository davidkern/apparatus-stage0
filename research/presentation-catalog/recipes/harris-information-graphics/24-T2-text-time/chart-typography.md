---
name: Chart Typography
slug: chart-typography
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Text, pp. 398-399"

intent: Configure text elements in charts and graphs for clarity and visual appeal through proper selection of typeface, size, leading, tracking, kerning, style, and alignment
direction: construction

components:
  - element: typeface
    encodes: Visual character and readability of text (serif, sans serif, or decorative)
    required: true
  - element: type-size
    encodes: Physical height of characters measured in points (72 points per inch)
    required: true
  - element: leading
    encodes: Vertical spacing between lines of text (baseline to baseline)
    required: false
  - element: tracking
    encodes: Horizontal spacing between letters and words
    required: false
  - element: kerning
    encodes: Adjusted spacing between specific letter pairs
    required: false
  - element: type-style
    encodes: Visual emphasis through bold, italic, underline, or other treatments
    required: false
  - element: alignment
    encodes: Horizontal positioning of text (left, right, centered, justified, decimal)
    required: true

parameters:
  typeface_category: "serif | sans-serif | decorative"
  type_size: "points (4-72+ typical range)"
  leading_ratio: "type size to leading ratio (e.g., 9/11 means 9pt type with 11pt leading)"
  tracking_density: "loose | typical | tight"
  alignment_type: "left | right | centered | justified | decimal"

related: []

warnings:
  - "Decorative typefaces should be limited to headings and special effects, not body text"
  - "Too tight tracking reduces legibility"
  - "Too loose leading wastes space and can disconnect related lines"
  - "Justified text requires varying word and letter spacing plus frequent hyphenation"
  - "Kerning primarily improves appearance with capital letters"

extensions:
  harris_entry: "Text"
  typeface_examples:
    serif: "Times"
    sans_serif: "Helvetica"
    decorative: "Zapf Chancery"
  type_styles:
    - "bold"
    - "italics"
    - "underlined"
    - "shaded or colored"
    - "full size capitals"
    - "small capitals"
    - "reverse type"
    - "outlined"
    - "superscript"
    - "subscript"
---

## Description

Typography in charts and graphs significantly impacts both appearance and clarity. Harris defines the major terms and provides guidance on configuring text elements for optimal communication. The key typographic decisions involve selecting appropriate typefaces, sizes, spacing, styles, and alignment for different chart elements including titles, axis labels, data labels, legends, and annotations.

## Examples

### Typeface Categories

Harris identifies three major typeface categories (p. 398):

> "Serif typeface: This is an example of a serif typeface named Times. Serif letters have small lines projecting from the ends of each of their main lines or strokes."

> "Sans serif typeface: This is an example of a sans serif typeface named Helvetica. Sans serif letters do not have the small lines projecting as the serif typefaces do."

> "Decorative typeface: This is an example of a decorative typeface named Zapf Chancery. Decorative typefaces are many times used for headings, special effects, and/or to improve the appearance of charts."

### Type Size

Type size is measured in points based on 72 points to the inch (p. 398):
- 12-point type is 12/72 or 1/6 inch tall
- 36-point type is 36/72 or 1/2 inch tall
- Height is measured from highest ascender to lowest descender

### Leading

Leading (pronounced "ledding") is vertical distance between baselines (p. 398):
- 9/9 designation means 9-point type with 9-point leading
- 9/11 means 9-point type with 11-point leading (more open)
- 9/13 means 9-point type with 13-point leading (most open)

### Tracking and Kerning

> "Tracking changes the horizontal spacing between letters and words" (p. 398)

> "Kerning changes the horizontal spacing between pairs of letters, one of which is generally a capital. Its major function is to improve appearance in those cases where the normal spacing between letters would seem too large." (p. 399)

### Alignment Types (p. 399)

1. **Aligned flush left / ragged right**: Left edges even, right edges vary
2. **Aligned flush right / ragged left**: Right edges even, left edges vary
3. **Centered / ragged right and left**: Uniform spacing, excess distributed at ends
4. **Justified / flush right and left**: Both edges aligned through variable spacing
5. **Aligned on decimal points**: Numbers align on decimal for easy comparison

## Usage

### When to use each typeface category
- **Serif**: Traditional appearance, good for extended reading
- **Sans serif**: Modern appearance, clean lines, good for labels and headers
- **Decorative**: Limited to headings and special emphasis

### Alignment selection
- **Left-aligned**: Standard for most chart text, natural reading flow
- **Right-aligned**: Numeric columns when not using decimals, right axis labels
- **Centered**: Titles, single words or short phrases
- **Justified**: Rarely used in charts due to uneven spacing
- **Decimal-aligned**: Numeric columns with varying decimal places

### Type style applications
- **Bold**: Totals, emphasis, headers
- **Italics**: Book titles, foreign terms, secondary emphasis
- **Superscript/subscript**: Mathematical notation, footnote references

## Notes

Harris demonstrates that alignment applies differently to standalone text, tables, columns of numbers, and graphs. For tables and numeric columns, decimal alignment is particularly valuable for comparing values of different magnitudes. The justified alignment option is marked "Not applicable" for tables, columns of numbers, and graphs in Harris's examples, indicating its limited utility in data visualization contexts.
