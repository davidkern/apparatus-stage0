---
name: Stepped Line Graph
slug: stepped-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Stepped line graph, p. 212"

intent: Display data that changes abruptly and then remains constant, using horizontal and vertical line segments to show discrete level changes
direction: both

components:
  - element: horizontal-segments
    encodes: Periods during which values remain constant
    required: true
  - element: vertical-segments
    encodes: Abrupt changes between levels
    required: true
  - element: data-points
    encodes: Values at change points (optional symbols)
    required: false

parameters:
  symbol_position: "left | center | right | none"
  horizontal_scale: "category | quantitative | sequence"

related: []  # TBD: see also jump-line-graph, simple-line-graph

warnings:
  - "Grid lines can interfere with stepped line visibility"
  - "Intersecting stepped lines from multiple series can cause confusion"
  - "With category scales, symbol position affects interpretation"

extensions:
  harris_entry: "Line Graph"
  typical_use: "prices, interest rates, plant capacity - things that change discretely then hold steady"
  variations: ["left stepped", "right stepped", "center stepped"]
---

## Description

Stepped line graphs use horizontal and vertical line segments to create a staircase pattern. They are used to differentiate data series more clearly, highlight discrete differences rather than continuous trends, and emphasize the nature of data that changes abruptly and then remains constant until the next change.

This format is especially suitable for things like prices, interest rates, or capacity levels that jump to a new value and hold there rather than changing continuously.

## Examples

Harris demonstrates with interest rate data:

> "The example at the right gives the viewer a clear understanding of when the percents changed, by how much, and how long each percent was in effect before the next change occurred." (p. 212)

The example shows interest rates from '90 to '92, with distinct horizontal plateaus at 2%, 4%, and 8% levels, connected by vertical jumps.

Harris describes symbol positioning variations:

> "If only the symbols on the left ends are displayed, the graph is sometimes referred to as left stepped graph. If the symbols are shown on the right ends it is called a right stepped graph, and in the center, a center stepped graph." (p. 212)

Harris also notes limitations:

> "Stepped line graphs have limitations that segmented and smooth curve line graphs do not. For example, when grid lines are used or when multiple stepped curves intersect one another, the legibility of the data can sometimes be seriously degraded." (p. 212)

## Usage

Stepped line graphs are appropriate when:
- Data changes discretely rather than continuously
- Values hold constant between change points
- Timing of changes matters as much as the values themselves
- You want to emphasize plateaus and jumps rather than trends

Construction considerations:
- With category scales, horizontal segments span the category width
- With quantitative scales, horizontal segments extend point-to-point
- Grid lines may interfere with legibility - use sparingly
- Multiple intersecting stepped lines create visual complexity

## Notes

The stepped line communicates something different from the segmented line. A segmented line connecting the same points would suggest continuous change between measurements. The stepped line correctly represents the reality that certain values (prices, rates, capacity) jump instantly to new levels and hold there, rather than transitioning gradually.
