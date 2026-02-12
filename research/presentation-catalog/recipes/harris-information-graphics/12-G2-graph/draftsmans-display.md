---
name: Draftsman's Display
slug: draftsmans-display
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs representing different views of three-dimensional graph, p. 173"

intent: Show multiple orthogonal views of a three-dimensional graph (top, side, front) to aid in understanding spatial relationships
direction: both

components:
  - element: three-dimensional-view
    encodes: The primary 3D perspective view (optional)
  - element: top-view
    encodes: View looking down the Z-axis (X-Y plane)
  - element: front-view
    encodes: View looking along Y-axis (X-Z plane)
  - element: side-view
    encodes: View looking along X-axis (Y-Z plane)
  - element: axis-labels
    encodes: Clear identification of axes in each view

parameters:
  views_included: "top | front | side | combination"
  three_dimensional_included: "yes | no"

related: []  # TBD: three-dimensional-graph, casement-display, projection-graph

warnings:
  - "Viewers must mentally integrate multiple views"
  - "Each view shows only two dimensions; third is collapsed"
  - "Axis labeling must be clear to avoid confusion"

extensions:
  harris_entry: "Graph"
  alternate_names: ["orthographic views", "multi-view projection", "engineering drawing views"]
  typical_use: "understanding complex three-dimensional data distributions"
---

## Description

An additional method to help viewers understand the data in a three-dimensional graph is to show multiple views of the data graphic. With a computer, this can be done by rotating the three-dimensional graph. When hard copy is used, this is sometimes done by showing the three-dimensional view plus selected side and top views.

The draftsman's display borrows from engineering drawing conventions, where objects are shown from multiple orthogonal angles to fully specify their three-dimensional form.

## Examples

Harris illustrates the draftsman's display technique (p. 173):

> "The example shown here includes views of the top, side, and front. These three views are sometimes called a draftsman's display."

The illustration shows:
1. A three-dimensional contour graph in perspective view
2. **Top view**: "Top-view looking at the X-Y plane" 
3. **Side view (X-Z)**: "Side view looking at the X-Z plane"
4. **Side view (Y-Z)**: "Side view looking at the Y-Z plane"

Each projection collapses one dimension, showing how the data appears when viewed from that direction.

## Usage

Most effective when:
- Three-dimensional data has complex structure
- Relationships along specific pairs of axes are important
- Interactive rotation is not available
- Technical or engineering audience is familiar with orthographic views

View selection:
- **Top view (X-Y plane)**: Shows horizontal distribution
- **Front view (X-Z plane)**: Shows one vertical relationship
- **Side view (Y-Z plane)**: Shows other vertical relationship

Design considerations:
- Label axes clearly on each view
- Consider including the 3D view for overall orientation
- Align views consistently (axes should match across views)
- Use consistent scales

Less effective when:
- Audience is unfamiliar with reading orthographic projections
- The 3D structure doesn't benefit from orthogonal decomposition
- Single view is sufficient for the analysis

## Notes

The draftsman's display adapts conventions from mechanical engineering, where orthographic projection has long been used to communicate three-dimensional form on two-dimensional paper. For data visualization, it provides a systematic way to examine all pairwise relationships in three-dimensional data.
