---
name: Fill
slug: fill
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Fill, p. 150-151"

intent: Apply opaque material to areas and lines for identification, differentiation, encoding values, emphasis, or improving appearance
direction: construction

components:
  - element: color
    encodes: Hue selection (any color or combination)
  - element: tone
    encodes: Value/shade from light to dark (0% to 100% black)
  - element: pattern
    encodes: Shape, orientation, texture, size, and spacing of elements
  - element: graduation
    encodes: Smooth transitions (gradients, blends) across the fill

parameters:
  fill_type: solid | pattern | gradient
  pattern_shape: lines | dots | squares | rectangles | tiles | arrows | custom
  pattern_orientation: horizontal | vertical | diagonal | curved | random
  graduation_direction: linear | radial | corner

related: []

warnings:
  - "Small differences in tones are hard to discriminate for quantitative encoding"
  - "Copiers may cause faint patterns to disappear and dense patterns to become solid black"
  - "Coarse patterns and bold lines sometimes give a harsh appearance"

extensions:
  harris_entry: "Fill"
  alternate_names: ["shade", "hatching", "crosshatching"]
  typical_use: "differentiating data series, encoding categorical variables, emphasizing areas, improving chart aesthetics"
---

## Description

Fill is the opaque material applied to areas and lines in information graphics. It serves multiple purposes: identification of different data series, differentiation between categories, encoding of quantitative or categorical values, emphasis of important elements, and general aesthetic improvement.

Fill has four distinguishing characteristics: color, tone (value/shade), pattern, and graduation. Each characteristic offers many variations that can be combined.

## Examples

Harris provides comprehensive fill taxonomy (p. 150-151):

**Tone (percent value):**
> "When variations in black and white tones are achieved by patterns of black lines and/or dots on a white background, the proportion of space occupied by black as a percent of the total area is considered as the percent value for the tone."

Shows progression from 10% to 90% black.

**Pattern elements:**
- Shape: solid, straight lines, wavy lines, dots, squares, rectangles, ribbons, tiles, arrows
- Orientation: horizontal, diagonal, vertical, side-by-side, superimposed, curved, slanted, cyclical, random
- Texture (coarseness): fine to coarse for lines, dots, and symbols
- Size: increasing thickness of lines, increasing dot size
- Spacing: varying distance between elements

**Graduation (gradients):**
> "Sometimes referred to as gradients, graduated fills, or blends"

Directions include: bottom to top, top to bottom, bottom and top to center, side to side, diagonally, focal point to edges, radial, radial with center offset, corner focal point.

**Fill in lines:**
> "In addition to their use with areas, fills may also be used with lines, borders, and frames. When used with lines, the exact patterns are sometimes not distinguishable because only a portion of the design appears, depending on the width of the line."

**Guidelines:**
- Solids reserved for small areas
- Lighter colors and finer patterns for large areas
- Coarse patterns and bold lines can appear harsh
- Small tone differences poor for quantitative encoding

## Usage

Fill selection depends on purpose:
- **Identification**: Distinct patterns/colors distinguish data series
- **Quantitative encoding**: Graduated tones can show magnitude (with caveats)
- **Categorical encoding**: Different patterns mark different categories
- **Emphasis**: Bolder fills draw attention to key elements
- **Aesthetics**: Appropriate fills improve overall appearance

Hatching (parallel lines) and crosshatching (intersecting parallel lines) are traditional pattern types that reproduce well in black and white.

## Notes

Fill choices must consider reproduction context. What appears as distinct fills on screen may merge when photocopied, faxed, or printed in low resolution. Testing in the final output medium is advisable for important graphics.

The interaction between fill and area size matters: patterns that work well in large areas may become muddy or indistinct in small areas, and vice versa.
