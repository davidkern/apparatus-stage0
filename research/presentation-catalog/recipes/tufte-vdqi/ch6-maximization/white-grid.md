---
name: White Grid
slug: white-grid
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, pp. 127-129"

intent: Show coordinate reference lines by erasing gaps in data elements rather than drawing additional grid lines
direction: construction

components:
  - element: data-bars
    encodes: Primary data values
    required: true
  - element: white-gaps
    encodes: Coordinate line positions through absence of ink
    required: true
  - element: axis-labels
    encodes: Scale values aligned directly to white gaps
    required: true

parameters:
  graphic_type: bar-chart | histogram | box-plot
  gap_positions: regular-intervals | labeled-values-only

warnings:
  - "Requires sufficient bar width to make gaps visible"
  - "Works best when coordinate values are few and important"
  - "May create optical illusion of gray dots at intersections with baseline"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "erasing"
  figure_reference: "pp. 127-128"
  original_form: "bar chart with tick marks and grid lines"
---

## Description

The white grid technique replaces traditional tick marks and grid lines with gaps (white space) cut through the data elements themselves. Rather than adding non-data-ink to show coordinate positions, the white grid erases small portions of the data-ink at regular intervals. The result shows coordinate lines more precisely than external ticks while simultaneously increasing the data-ink ratio.

The technique works because the gaps in the bars naturally align with the axis labels, creating an implicit grid through absence rather than presence. The eye reads the white space as reference lines without requiring additional ink.

## Examples

Tufte demonstrates the progression from standard bar chart to white grid:

> "Even part of the data measures can be erased, making a white grid, which shows the coordinate lines more precisely than ticks alone." (p. 127)

The visual sequence shows:
1. Standard bar chart with frame, axis, and ticks
2. Frame erased, leaving only ticks on vertical axis
3. White gaps cut through bars at tick positions, ticks removed
4. Axis labels aligned directly to the white gaps

> "The white grid eliminates the tick marks, since the numerical labels on the vertical are tied directly to the white lines." (p. 128)

## Usage

The white grid is appropriate when:
- Bar or histogram displays need coordinate reference
- Reducing visual clutter is a priority
- The graphic will be printed at sufficient resolution for gaps to be visible

The technique extends beyond bar charts:

> "The techniques—no frame, no vertical axis, no ticks, and the white grid—apply to other designs." (p. 129)

Tufte shows the white grid applied to a variable-width notched box plot, demonstrating its generalizability.

Construction steps:
1. Start with a standard bar chart or histogram
2. Erase the frame (bounding box)
3. Erase the vertical axis line, keeping only ticks
4. Cut horizontal white gaps through all bars at each tick position
5. Remove the ticks, letting the gaps serve as coordinate markers
6. Align axis labels directly with the white gaps

## Notes

The white grid represents a shift from additive to subtractive design: rather than adding elements to show structure, structure emerges from strategic removal. This aligns with Tufte's broader principle that graphics improve through erasing non-data-ink.

Tufte notes an optical effect: "the intersection of the thicker bar with the thinner baseline creates an attractive visual effect (but also the optical illusion of gray dots at the intersections)" (p. 128). This is the Hermann grid illusion, which designers should be aware of when using this technique.
