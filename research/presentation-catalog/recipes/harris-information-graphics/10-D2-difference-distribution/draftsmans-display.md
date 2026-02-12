---
name: Draftsmans Display
slug: draftsmans-display
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Draftsmans Display, p. 143"

intent: Present three-dimensional data through multiple two-dimensional projections (views from different angles), following engineering drawing conventions
direction: both

components:
  - element: primary-3d-graph
    encodes: The three-dimensional visualization being analyzed
    required: false
  - element: xy-plane-view
    encodes: Top view looking down at X-Y plane
  - element: xz-plane-view
    encodes: Side view looking at X-Z plane
  - element: yz-plane-view
    encodes: Side view looking at Y-Z plane
  - element: additional-views
    encodes: Bottom, other sides, or cross-sections
    required: false

parameters:
  views_included: three-standard | expanded-set
  with_3d_reference: yes | no

related: []

warnings:
  - "Viewers unfamiliar with engineering drawing conventions may need guidance"
  - "Mental reconstruction of 3D from 2D views requires practice"

extensions:
  harris_entry: "Draftsmans Display"
  alternate_names: []
  typical_use: "analyzing three-dimensional data, understanding complex surfaces, scientific visualization"
---

## Description

A draftsmans display applies engineering drawing conventions to data visualization. Just as a draftsperson draws orthogonal views (front, side, top) to fully describe a three-dimensional object, this technique presents multiple two-dimensional graphs that together describe a three-dimensional data relationship.

The standard configuration shows views looking at each of the three principal planes (X-Y, X-Z, Y-Z). Together, these projections help viewers understand the full three-dimensional structure that may be obscured or distorted in a single 3D rendering.

## Examples

Harris illustrates with a three-dimensional contour graph (p. 143):

> "When a draftsperson makes an engineering drawing of an object, a standard procedure is to draw views of two sides that are at right angles to one another, plus a view of the top. With these three views a person looking at the drawing can generally get a reasonable understanding of the appearance and features of the object. When that same procedure is applied to a three-dimensional graph, the result is three separate two-dimensional graphs called a draftsmans display."

The figure shows:
- A 3D contour surface graph with labeled viewing angles
- Top view (looking at X-Y plane)
- Side view at X-Z plane
- Side view at Y-Z plane

Harris notes the technique extends:

> "The same basic procedure can be expanded to include views of the other two sides, the bottom, and sections through the three-dimensional data graphic."

## Usage

Draftsmans displays are valuable when:
- 3D graphs obscure important features due to viewing angle
- Precise relationships along each axis pair need examination
- Data has complex surface structure
- Viewers need to understand the 3D shape without distortion

The technique works with almost any type of three-dimensional graph, including surface graphs, contour graphs, and scatter plots.

> "By using the two- and three-dimensional graphs in conjunction with one another, as shown here, additional insight can sometimes be obtained regarding the data from which the graphs were generated."

## Notes

The term draftsmans display is sometimes also applied to matrix displays that show multiple pairwise scatterplots. These share the concept of showing all two-variable combinations from a multivariable dataset.

This technique bridges the gap between the intuitive appeal of 3D visualization and the precision of 2D projections. It trades compactness for clarity, using multiple panels to avoid the ambiguities inherent in representing three dimensions on a two-dimensional surface.
