---
name: Jump Line Graph
slug: jump-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Jump line graph, p. 202, 212"

intent: Show discrete value changes by eliminating the vertical portions of a stepped line, leaving only horizontal segments that jump from level to level
direction: both

components:
  - element: horizontal-segments
    encodes: Value levels before and after changes
    required: true
  - element: gaps
    encodes: The discontinuity where values jump between levels
    required: true
  - element: endpoint-symbols
    encodes: Markers at segment ends showing exact change points (optional)
    required: false

parameters:
  symbol_position: "left | center | right | both ends"

related: []  # TBD: see also stepped-line-graph

warnings:
  - "The visual discontinuity may be mistaken for missing data"
  - "Use symbols to clarify where values change"

extensions:
  harris_entry: "Line Graph, Jump Line Graph"
  typical_use: "price changes, rates that do not transition continuously"
  variations: ["jump graph", "center jump graph", "left jump graph", "right jump graph"]
---

## Description

A jump line graph is a variation of the stepped line graph in which the vertical portions are eliminated, leaving only the horizontal segments. This type of curve sometimes more correctly reflects what actually occurs when values change discretely - they do not pass through intermediate values but simply jump from one level to another.

For example, when a price changes, it does not transition through all values between the old and new price; it jumps instantly from one to the other.

## Examples

Harris introduces the jump line graph:

> "A variation of a stepped line graph in which the vertical portions of the stepped line are eliminated, leaving only the horizontal portions. Symbols may or may not be used to designate the location of data points." (p. 202)

Harris elaborates in the Line Graph entry:

> "A variation of the stepped line graph called a jump curve eliminates the vertical portions of a stepped line, leaving only the horizontal portions. This type of curve sometimes more correctly reflects what actually occurs. For example, when a price is changed, it does not pass through all the values between the old and new price, but instead, simply jumps from one level to another." (p. 212)

Harris shows four variations:
- **Jump graph**: Basic horizontal segments with gaps
- **Center jump graph**: Symbols at the center of each horizontal segment
- **Left jump graph**: Symbols at the left end of each segment
- **Right jump graph**: Symbols at the right end of each segment

## Usage

Jump line graphs are appropriate when:
- Values change instantaneously between levels
- The transition itself is not meaningful (no intermediate states exist)
- Emphasizing the discrete nature of changes
- Prices, rates, or other stepped quantities are being displayed

The choice of symbol position affects interpretation:
- Left symbols emphasize when the new value took effect
- Right symbols emphasize how long the old value persisted
- Center symbols neutrally mark the segment

## Notes

The jump line graph makes an implicit argument about the nature of the data - that intermediate values do not exist or are not meaningful. The visual gap between segments reinforces this discontinuity. Compare with the stepped line, which maintains visual continuity via vertical segments even though those verticals do not represent actual data.
