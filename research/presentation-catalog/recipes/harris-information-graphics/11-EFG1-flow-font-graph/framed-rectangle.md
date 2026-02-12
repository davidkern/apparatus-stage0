---
name: Framed Rectangle Symbol
slug: framed-rectangle
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Framed Rectangle, p. 160"

intent: Encode quantitative values on maps using a rectangular symbol with proportional fill level
direction: both

components:
  - element: rectangle-outline
    encodes: Container for the value encoding (taller than wide)
    required: true
  - element: fill-level
    encodes: Value as proportion of rectangle height filled
    required: true
  - element: tick-marks
    encodes: Reference point at midway height on both sides
    required: true
  - element: legend
    encodes: Upper and lower value bounds for interpretation
    required: true

parameters:
  fill_color: "black/white | any color combination"
  tick_mark_count: "1 (standard) | multiple (for finer reading)"
  width_encoding: "uniform | variable (for additional variable)"

related: []

warnings:
  - "Typically all rectangles on the same map are the same size, except when width encodes an additional variable"
  - "Any combination of colors and/or fills works equally well as black and white"

extensions:
  harris_entry: "Framed Rectangle"
  typical_use: "encoding quantitative information onto maps"
  symbol_type: "statistical map symbol"
---

## Description

A framed rectangle is a symbol used primarily to designate values of a single variable. It is particularly useful for encoding quantitative information onto maps. The symbol consists of a rectangle that is taller than it is wide. There are tick marks on both sides that designate a distance halfway up the rectangle.

The symbol can be any size. Typically all rectangles on the same chart or map are the same size, except when the width of the rectangle is used to encode an additional variable.

## Value Encoding

The fill level of the rectangle indicates the value:
- **Empty (all white)**: Lower value
- **Half full (lower half black)**: Value midway between lower and upper values
- **Full (all black)**: Upper value
- **Any fractional fill**: Proportional value between bounds

The upper and lower values are indicated in a legend. Black and white are commonly used, but any combination of colors and/or fills works equally well.

## Examples

Harris illustrates (p. 160):
- A map using framed rectangles to encode statistical information, showing several regions with rectangles filled to different levels
- A legend showing lower value (100) and upper value (500)
- Examples of specific values (100, 200, 300, 400, 500) shown as progressively more filled rectangles

> "Although the standard framed rectangle has only one set of tick marks and an upper and lower value, other numbers of tick marks and values can be used if it makes it easier for the viewer to decode the data." (p. 160)

Harris shows variations with multiple tick marks showing intermediate values (100, 300, 500 or 100, 200, 300, 400, 500) on each side of the rectangle.

## Usage

Framed rectangles are appropriate when:
- Showing statistical values for geographic regions on a map
- A continuous quantitative variable needs visual encoding
- Space is limited and numeric labels would clutter the map
- Viewers need to make approximate value comparisons across regions

The tick marks at the midpoint help viewers quickly assess whether a value is above or below the middle of the range, enabling faster visual comparison across multiple symbols.

## Notes

This symbol type is part of the broader family of statistical map symbols that encode quantitative data onto geographic displays. The vertical orientation and fill-level encoding allow for intuitive reading (more fill = higher value) while the tick marks provide reference points for more precise estimation.
