---
name: Casement Display
slug: casement-display
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple cross sections of three-dimensional graph, p. 173"

intent: Display cross-sectional slices of three-dimensional data as a series of two-dimensional graphs for easier interpretation
direction: both

components:
  - element: slice-graphs
    encodes: Two-dimensional views of data at specific positions along third dimension
  - element: slice-labels
    encodes: Values or ranges along the slicing dimension
  - element: consistent-scales
    encodes: Common scales across all slices for comparison
  - element: ordered-arrangement
    encodes: Slices arranged in sequence of the slicing variable

parameters:
  slicing_dimension: "x | y | z axis"
  slice_count: "typically 3-6"
  slice_spacing: "equal intervals | data-driven"

related: []  # TBD: slice-graph, three-dimensional-scatter, draftsmans-display

warnings:
  - "Works best with moderate number of slices (too many creates clutter)"
  - "Slicing dimension choice affects what patterns are visible"
  - "Consistent scales are essential for cross-slice comparison"

extensions:
  harris_entry: "Graph"
  alternate_names: ["slice display", "cross-section series", "conditional plots"]
  typical_use: "understanding distribution patterns in three-dimensional scatter data"
---

## Description

The data points in three-dimensional scatter graphs are sometimes grouped into a series of planes or cross-sections so the viewer can get a better idea as to how the data is distributed and the patterns it forms. These two-dimensional cross-sections are then sometimes rotated into the plane of the paper for easier viewing. A group of such graphs is sometimes called a casement plot.

This technique addresses the fundamental difficulty of perceiving depth and pattern in three-dimensional data displays by converting the 3D problem into a series of 2D problems.

## Examples

Harris illustrates the casement display process (p. 173):

The example shows a three-dimensional scatter graph with data points grouped into three planes along one axis (Age: "13 & below", "14 to 19", "20 & above"):

> "Three-dimensional scatter graph in which the data points are grouped or condensed into three planes along one axis"

These planes are then displayed as a side-by-side series:

> "Casement plot in which the three slices in the graph at the left have been turned parallel to the plane of the paper and placed side-by-side"

Each slice becomes a two-dimensional scatter plot (Variable 1 vs. Variable 2) for a specific age range, making patterns within each group visible and enabling comparison across groups.

## Usage

Most effective when:
- Three-dimensional scatter data is difficult to interpret
- Data naturally segments along one dimension (age groups, time periods)
- Patterns may differ across slices
- Viewers need to compare distributions across conditions

Slicing strategies:
- **Natural categories**: Use existing groupings (age ranges, regions)
- **Equal intervals**: Divide continuous dimension into equal parts
- **Data-driven**: Place slices where data density is interesting

Design considerations:
- Choose slicing dimension to reveal meaningful patterns
- Use enough slices to show variation but not so many as to overwhelm
- Maintain consistent scales across all slices
- Label each slice clearly with its position on the slicing dimension

Less effective when:
- Data is truly continuous with no natural segmentation
- Patterns don't vary along any dimension
- Few data points would leave some slices empty

## Notes

The casement display transforms a difficult 3D perception task into a series of familiar 2D interpretations. It trades spatial integration for clarity, accepting that viewers will mentally reconstruct the 3D pattern from the 2D slices rather than attempting to perceive it directly.
