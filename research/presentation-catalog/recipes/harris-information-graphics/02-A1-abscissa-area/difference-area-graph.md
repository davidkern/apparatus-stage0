---
name: Difference Area Graph
slug: difference-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Graph, Difference and deviation area graph, p. 16"

intent: Display positive and negative deviations from a reference point using contrasting colors or patterns to distinguish direction
direction: both

components:
  - element: positive-deviation-area
    encodes: Shaded region for values above the reference (one color/pattern)
    required: true
  - element: negative-deviation-area
    encodes: Shaded region for values below the reference (contrasting color/pattern)
    required: true
  - element: reference-line
    encodes: Zero axis or baseline from which deviations are measured
    required: true
  - element: data-curve
    encodes: Line showing the actual values that deviate from reference
    required: true

parameters:
  deviation_type: gross | net | "gross and net" | "cumulative net"
  positive_indicator: color | pattern
  negative_indicator: color | pattern

related: []  # TBD: see also simple-area-graph, range-area-graph

extensions:
  harris_entry: "Area Graph"
  alternate_names: ["deviation graph", "gross deviation graph", "net deviation graph", "cumulative deviation graph"]
  typical_use: "showing deviations from a target, budget, or expected value"
---

## Description

Area graphs are occasionally used to show differences or deviations. The technique uses contrasting colors or patterns to distinguish positive values or deviations from negative ones, making it immediately clear where performance exceeded or fell short of a reference point.

## Four Major Variations

Harris identifies four major variations for displaying differences or deviations:

### 1. Gross Deviation Graph

One color or pattern indicates positive values or deviations, and another color indicates negative values or deviations. Each positive and negative deviation is shown separately at its actual magnitude.

### 2. Net Deviation Graph

Plots the difference between positive and negative values. Rather than showing gross amounts, this shows only the net effect at each point.

### 3. Gross and Net Deviation Graph

Combines both approaches on the same graph, showing gross positive and negative deviations along with the net deviation line. This provides the most complete picture but is also the most complex.

### 4. Cumulative Net Deviation Graph

Plots a continuous sum of the net deviations. This shows how deviations accumulate over time, revealing whether the system is trending toward surplus or deficit overall.

## Examples

> "In a gross deviation graph, one color or pattern indicates positive values or deviations, and another color indicates negative values or deviations. A net deviation graph plots the difference between the two. A third type plots both gross and net deviations on the same graph. The cumulative net variation graph plots a continuous sum of the net deviations." (p. 16)

The PDF (p. 16) shows four graphs illustrating each variation:
- **Gross deviation graph**: Shows "Total positive" above zero and "Total negative" below zero, each in distinct areas
- **Net deviation graph**: Shows only "Net of positive & negative" as a single area crossing zero
- **Gross and net deviation graph**: Combines "Total positive," "Total negative," and "Net" on one graph
- **Cumulative net deviation graph**: Shows "Cumulative net" as a running total that accumulates over time

## Usage

Difference area graphs are appropriate when:
- Comparing actual performance to a budget, target, or expectation
- Showing positive and negative variances clearly
- Tracking whether a system is gaining or losing over time
- Making the direction of deviation immediately visually apparent

**Choosing between variations:**
- **Gross**: When the magnitude of both positive and negative deviations matters independently
- **Net**: When only the net effect at each point matters
- **Gross and Net**: When viewers need to see both the components and the result
- **Cumulative Net**: When the running total or accumulated effect is the key insight

## Notes

The use of contrasting colors or patterns is essential to this technique. The visual distinction between positive and negative regions should be immediately apparent to viewers without requiring them to consult a legend.
