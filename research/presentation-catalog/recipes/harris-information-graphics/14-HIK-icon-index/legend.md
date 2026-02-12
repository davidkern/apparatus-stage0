---
name: Legend
slug: legend
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Legend, p. 204"

intent: Provide the key for decoding data graphics by identifying what visual elements represent and enabling value estimation
direction: both

components:
  - element: visual-sample
    encodes: Example of the line, symbol, color, or pattern used in the chart
    required: true
  - element: label
    encodes: Text identifying what the visual element represents
    required: true

parameters:
  encoding_type: "identification | quantitative"
  visual_element: "letters/numbers | line type | shading/color/pattern | symbols"
  location: "inside plot | outside plot | adjacent to data"

related: []  # TBD: see also key

warnings:
  - "Legends should be as close as possible to the information they explain"
  - "Distance between legend and data increases chance of decoding errors"
  - "Information in legend should appear in same order as it appears on chart"

extensions:
  harris_entry: "Legend"
  alternate_names: ["key"]
  typical_use: "all chart types requiring decoding of visual encoding"
---

## Description

Legends are often critical to understanding a chart because they contain information necessary for decoding the data graphics. Harris identifies three major functions of legends:

1. **Identify what data graphics represent** - connecting visual elements to the entities, data series, or conditions they stand for
2. **Indicate characteristics** - showing attributes of the things represented through visual encoding
3. **Enable quantitative decoding** - when quantitative information is encoded in symbol size, line width, or fill amount, allowing viewers to estimate values

## Examples

Harris provides extensive examples of legend types (p. 204):

**Identification legends** using different visual encodings:
- Letters or numbers (A = Headquarters, B = Production facilities, C = Sales facilities)
- Line types (solid, dashed, dotted for different organizations or time periods)
- Shading, color, or pattern (different fills for Group A, Group B, Group C)
- Symbols (tent symbol for Camp, cross for Hospital, flag for Golf course)

**Quantitative decoding legends**:
- Circular symbols at different sizes (100, 250, 500, 1000, 2000) with linear or logarithmic scales
- Nested circles showing size-to-value relationship
- Line widths corresponding to value ranges (350-400, 300-349, etc.)
- Symbol fill amounts (25%, 50%, 75%, 100%)
- Distance/length scales (0-20-40-60 miles)

**Legend location**: Harris shows legends positioned inside the plot area, outside at various positions (top, bottom, left, right), and directly adjacent to data elements.

## Usage

Legend design guidelines:
- Position legends as close as possible to the data they explain
- Closer legends reduce viewer effort and decrease decoding errors
- Match the order of items in the legend to their order in the chart
- Include both the visual sample and a clear text label

Quantitative legends require additional care:
- Show the scale clearly (linear vs. logarithmic)
- Include enough reference points for interpolation
- Consider nested or ramped examples for proportional symbols

## Notes

Harris notes that the term "key" is sometimes used synonymously with "legend." The choice between these terms varies by field and software, but the function is identical: providing the decoder ring that transforms visual marks into meaningful information.
