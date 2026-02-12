---
name: Trilinear Scale
slug: trilinear-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Number and location of scales, Trilinear, p. 342"

intent: Configure scales on the three sides of a triangular graph where each axis represents a component percentage summing to 100%
direction: both

components:
  - element: three-axes
    encodes: Three sides of an equilateral triangle, each representing one component
    required: true
  - element: scale-labels
    encodes: Percentage values from 0% to 100% on each axis
    required: true
  - element: grid-lines
    encodes: Lines parallel to each side showing percentage intervals
    required: false
  - element: baseline-reference
    encodes: Zero point for each scale at the opposite baseline
    required: true

parameters:
  label_position: "inside plot area | outside triangle"
  scale_direction: "increasing toward apex | varies by convention"
  grid_visibility: "with grid lines | without"

related: []  # TBD: trilinear-graph, ternary-diagram

warnings:
  - "Scales always have zero at the baseline and 100% as upper value"
  - "Labels inside the triangle may interfere with plotted data"
  - "Scales outside the triangle are harder to interpret but keep plot area clear"

extensions:
  harris_entry: "Scale"
  typical_use: "trilinear (ternary) graphs showing three-component compositions"
  cross_reference: "See Trilinear Graph"
---

## Description

Trilinear graphs use a special scale configuration where three scales are arranged on the sides of an equilateral triangle. Each scale represents the percentage of one component in a three-component mixture, and the three percentages must always sum to 100%.

Scales on trilinear graphs always have their zero at the baseline (the side opposite the apex for that component) and most commonly have 100% as their upper values at the apex. The scales are always linear.

## Examples

> "The examples shown here illustrate the two different ways scales are generally applied to trilinear graphs. The example at the left is the easiest to understand, but many times the labels tend to interfere with the plotted data. Scales on the outside of the triangle, as shown at the right, clear up the plot area but are more difficult to interpret." (p. 342)

The PDF shows two trilinear graph configurations:

**Scales inside the plot area**: Labels (0%, 20%, 40%, 60%, 80%, 100%) appear within the triangle along grid lines parallel to each side. Easier to understand but labels may overlap with data points.

**Scales outside the plot area**: Labels appear outside the triangle edges, with scale markings along each side. Keeps the plot area clean but requires more effort to read coordinates.

## Usage

Trilinear scales are used when:
- Displaying compositions of three-component systems
- Data represents parts of a whole that must sum to 100%
- Comparing mixtures (e.g., soil composition, alloy compositions, market share of three competitors)

Reading trilinear coordinates:
- Each point in the triangle represents a unique combination of three percentages
- Lines parallel to each side represent constant percentage for one component
- The corners represent 100% of one component and 0% of the other two

## Notes

> "Scales on trilinear graphs always have their zero at the baseline, are linear, and most times have 100% as their upper values." (p. 342)

The trilinear scale system enforces the constraint that all three components sum to 100%, which is why any point within the triangle automatically satisfies this requirement. The geometry of the equilateral triangle encodes this mathematical constraint visually.
