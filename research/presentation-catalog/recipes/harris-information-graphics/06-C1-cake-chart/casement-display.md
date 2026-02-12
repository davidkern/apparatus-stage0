---
name: Casement Display
slug: casement-display
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Casement Display, p. 68"

intent: Show the distribution of data points on multiple planes or slices passed through a three-dimensional scatter graph
direction: both

components:
  - element: multiple-panels
    encodes: Two or more two-dimensional graphs shown side-by-side
    required: true
  - element: slice-boundaries
    encodes: How data is segmented along one variable/axis
    required: true
  - element: consistent-axes
    encodes: Same scales on corresponding axes across all panels
    required: true
  - element: panel-labels
    encodes: Range or value of the slicing variable for each panel
    required: true

parameters:
  number_of_slices: two | three | more
  slicing_variable: age | time | category | other_continuous

related: []

warnings:
  - "Choice of slice boundaries affects interpretation - unequal intervals may be needed for meaningful groupings"
  - "Loss of continuous information along the slicing dimension"

extensions:
  harris_entry: "Casement Display"
  alternate_names: []
  typical_use: "analyzing three-variable data by summarizing incrementally along one variable"
  see_also: ["Slice Graph"]
---

## Description

A casement display is a group of two or more two-dimensional graphs, typically shown side-by-side, that show the distribution of data points on multiple planes or slices passed through a three-dimensional scatter graph.

The purpose of casement displays is to assist in the analysis of data with three variables by summarizing the data incrementally along one of the variables/axes.

## Examples

Harris illustrates with age-segmented data (p. 68):

> A three-dimensional scatter graph shows Variable 1 on one axis, Variable 2 on another, and Age on the third, with data points scattered throughout the volume. The same data is then condensed into three planes along the age axis: Ages 13 & below, Ages 14 to 19, and Ages 20 & above.

> The casement display shows three side-by-side two-dimensional graphs, each plotting Variable 1 vs Variable 2. The leftmost panel shows only data points from subjects aged 13 and below, the middle panel shows ages 14-19, and the rightmost shows ages 20 and above.

> "In practice, the two preliminary graphical steps are not used. Instead, the information for plotting the casement display is determined mathematically and the casement display plotted directly." (p. 68)

## Usage

Casement displays are effective when:
- Analyzing relationships between two variables across levels of a third variable
- The third variable can be meaningfully segmented into categories or ranges
- Direct visualization of a 3D scatter plot is difficult to interpret
- Comparing patterns at different levels of the segmenting variable

The technique reveals how the relationship between two variables may differ depending on the value of a third variable.

## Notes

Harris cross-references Slice Graph for related techniques. The conceptual approach - imagining planes cutting through a 3D data cloud - helps explain what the casement display represents, even though the actual construction is mathematical rather than graphical.
