---
name: Scale Bar
slug: scale-bar
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Scale bars, p. 340; Scale Bars, p. 343"

intent: Provide a visual reference showing the same unit of measure across graphs with different scales
direction: construction

components:
  - element: reference-bar
    encodes: A fixed-length graphic representing a standard unit of measure
    required: true
  - element: unit-label
    encodes: The value the bar represents (e.g., "= 1 vertical unit")
    required: true
  - element: bar-position
    encodes: Location inside or adjacent to graph frame
    required: true

parameters:
  unit_value: "the numerical value represented by the bar"
  orientation: "vertical | horizontal"
  position: "inside frame | adjacent to frame"
  symbol_type: "bar | line | arrow | other symbol"

related: []  # TBD: expanded-scale, dual-scale

warnings:
  - "Scale bars are only useful when comparing multiple graphs"
  - "Without reading numbers, viewers can visually compare scales across graphs"

extensions:
  harris_entry: "Scale"
  typical_use: "visually relating data plotted on different scales across multiple graphs"
---

## Description

When the same data is plotted on two or more graphs with different scales, it can be difficult to rapidly relate the scales without carefully comparing the numerical labels. Scale bars help overcome this problem by giving a graphical representation of the same unit of measure on each of the graphs.

A scale bar is a small graphic (typically a vertical or horizontal bar) placed on each graph, where the bar represents the same numerical unit across all graphs. This allows viewers to instantly compare scale magnification without reading numbers.

## Examples

> "Sometimes when studying one or more data series, a graph of the data using a zero axis is used to get an overview of the information. For more detailed analyses, the same data is plotted on graphs with expanded scales. When this is done it is sometimes difficult to rapidly relate the scales on the various graphs without carefully comparing the labels." (p. 340)

The PDF illustrates three graphs showing the same data at different scales:
1. Overview graph (scale 0-25) with a short scale bar labeled "= 1 vertical unit"
2. Intermediate graph (scale 18-23) with a longer scale bar labeled "= 1 vertical unit"
3. Detail graph (scale 21.0-22.0) with an even longer scale bar labeled "= 1 vertical unit"

> "Thus, without reading any numbers, one can observe that about one vertical inch on the graph on the right is equivalent to about one-sixteenth of a vertical inch of the graph on the left." (p. 340)

## Usage

Scale bars are appropriate when:
- Presenting multiple views of the same data at different magnifications
- Comparing related graphs with different scale ranges
- The audience needs to quickly understand relative scale expansions
- Both overview and detail views are presented together

Scale bars can be applied to:
- Horizontal as well as vertical scales
- Related or unrelated data being compared
- Any graph type where scale comparison matters

Alternative symbols:
- Lines, arrows, or other symbols can substitute for bars
- The bars can be displayed inside the frame or adjacent to the graph

## Notes

Scale bars are primarily a comparative tool. They have limited value on a single graph but become powerful when the same unit is represented across multiple graphs with different scales. The technique works equally well whether comparing related or unrelated data.
