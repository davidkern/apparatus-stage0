---
name: Framed Rectangle Symbol
slug: framed-rectangle-symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, Framed rectangle symbol, p. 382"

intent: Encode quantitative information using a rectangular symbol with fill level, offering improved decoding accuracy compared to proportional circles
direction: both

components:
  - element: rectangle-frame
    encodes: Value range (bottom = lower bound, top = upper bound)
    required: true
  - element: fill-level
    encodes: Current value within the range
    required: true
  - element: tick-marks
    encodes: Reference point (typically midpoint) for value estimation
    required: true
  - element: legend
    encodes: Upper and lower bound values
    required: true

parameters:
  width_encoding: fixed | variable
  fill_direction: bottom-up
  value_type: actual | percent

related: []  # TBD: see proportional-symbol

warnings:
  - "Typically all rectangles on the same chart should be the same size unless width encodes an additional variable"
  - "Legend is required to explain upper and lower bound values"

extensions:
  harris_entry: "Symbol"
  typical_use: "Maps with regional quantitative data"
  advantage: "Improved accuracy of decoding compared to circles"
---

## Description

The framed rectangle symbol is an alternative to proportional circles for encoding quantitative information. Harris introduces it as a solution to the well-known problem that viewers tend to underestimate the relative sizes of larger circles.

The symbol uses fill level within a fixed frame to represent values, allowing viewers to estimate proportions more accurately than with area-based encoding.

## Examples

**Symbol construction** (p. 382):

Harris describes the framed rectangle with specific characteristics:
> "- The symbol consists of a rectangle that is taller than it is wide.
> - There are tick marks on both sides that generally designate a distance half way up the rectangle.
> - The symbol can be any size. Typically all rectangles on the same chart are the same size. Exceptions are when the width of the rectangle is used to encode an additional variable."

**Value encoding:**
> "- When the rectangle is empty (all white), a lower value is indicated. When the rectangle is full (all black), an upper value is indicated. When it is half full (the lower half black), a value midway between the lower and upper is indicated. The same reasoning applies to any fractional fill of the rectangle.
> - The upper and lower values can be any numbers, actual or percent. They generally are explained in a legend."

**Visual examples** (p. 382):
Harris shows a series of framed rectangles with values 100, 200, 300, 400, 500, demonstrating how fill level indicates position within the range.

A map example shows framed rectangles positioned at geographic locations, with varying fill levels representing regional values.

## Usage

**Primary application:**
> "A framed rectangle is used primarily to designate the values of a single variable. It is particularly useful for encoding quantitative information onto maps." (p. 382)

**Design guidelines:**
- Make rectangles taller than wide for clear fill-level reading
- Include tick marks at midpoint on both sides
- Keep all rectangles the same size unless width encodes a second variable
- Provide legend explaining the value range

**Advantages over circles:**
- Fill level is easier to estimate than area
- Linear encoding (fill height) versus quadratic encoding (circle area)
- Tick marks provide built-in reference for midpoint estimation
- Less prone to underestimation bias

**When to consider variable width:**
If a second variable needs encoding, the width of the rectangle can be varied. This creates a two-dimensional encoding where:
- Fill level = primary variable
- Width = secondary variable

## Notes

The framed rectangle addresses a fundamental perceptual limitation of proportional symbols. By using a linear dimension (height of fill) rather than area, viewers can more accurately estimate and compare values.

This symbol type is particularly effective for choropleth-style maps where precise regional comparisons matter. The consistent frame size across all symbols helps viewers focus on fill-level differences rather than being distracted by overall symbol size variations.
