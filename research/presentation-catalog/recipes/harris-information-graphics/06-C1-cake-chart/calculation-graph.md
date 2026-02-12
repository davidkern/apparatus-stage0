---
name: Calculation Graph
slug: calculation-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Calculation Graph, p. 64"

intent: Solve equations involving three or more variables graphically using aligned scales
direction: both

components:
  - element: parallel-scales
    encodes: Three or more variable scales arranged so a straight line intersects values satisfying an equation
    required: true
  - element: alignment-line
    encodes: Straight line crossing all scales at valid solution values
    required: true
  - element: scale-labels
    encodes: Variable names (A, B, C) identifying each scale
    required: true

parameters:
  number_of_scales: three | four | more
  scale_arrangement: parallel | Z-chart | other

related: []

warnings:
  - "Accuracy depends on precision of scale markings and alignment"
  - "Limited to equations that can be expressed in the appropriate form"

extensions:
  harris_entry: "Calculation Graph"
  alternate_names: ["nomograph", "nomogram", "alignment graph"]
  typical_use: "solving equations without calculation, engineering reference charts"
---

## Description

A calculation graph is designed to solve an equation involving three or more variables. The graphs consist of three or more scales arranged so that a straight line crossing all the scales intersects the scales at values that satisfy an equation.

This technique allows users to find solutions to equations by visual alignment rather than mathematical computation.

## Examples

Harris provides a simple example satisfying the equation A + B = C (p. 64):

> "The graph at the right satisfies the equation A + B = C (e.g., 8 on scale A plus 5 on scale B equals 13 on scale C)."

The example shows three parallel vertical scales labeled A, B, and C. Scale A ranges from 0-10, Scale C (in the middle) from 0-20, and Scale B from 0-10. A dashed line drawn from 8 on scale A through 13 on scale C intersects scale B at 5, confirming that 8 + 5 = 13.

## Usage

Calculation graphs are valuable when:
- Users need to solve the same equation repeatedly with different values
- Quick approximate solutions are acceptable
- Mathematical computation is impractical in the field
- Training users who may not be comfortable with equations

The user places a straightedge on known values on two scales, and reads the unknown value where the line crosses the third scale.

## Notes

Harris cross-references the more detailed Nomograph entry for additional information on construction and variations of calculation graphs.
