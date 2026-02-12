---
name: Three-Dimensional Topographic Map
slug: topographic-map-three-dimensional
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Topographic Map, p. 420"

intent: Visualize terrain in three dimensions to help viewers more easily perceive overall landscape shape
direction: both

components:
  - element: three-dimensional-surface
    encodes: The terrain rendered with height as the vertical dimension
    required: true
  - element: contour-lines
    encodes: Lines of equal elevation shown on the 3D surface (optional variation)
    required: false
  - element: fishnet-grid
    encodes: Isolines along X and Y axes creating a mesh surface
    required: false
  - element: elevation-scale
    encodes: Vertical axis showing height values
    required: false

parameters:
  rendering_style: "contour | fishnet | hand-drawn"
  fill_treatment: "none | colors | tints | shading"
  viewing_angle: "oblique perspective view"

related: []  # TBD: see topographic-map-contour-lines, block-diagram-map

warnings:
  - "Quantitative information is difficult to determine from fishnet or hand-drawn variations"
  - "The isoline and hand-drawn variations make it easier to visualize overall terrain but sacrifice precision"

extensions:
  harris_entry: "Topographic Map"
  alternate_names: ["block diagram map", "3D terrain map"]
  typical_use: "helping viewers visualize overall terrain shape when precise elevation reading is less important"
---

## Description

Three-dimensional topographic maps render terrain with elevation shown as actual vertical height, creating a surface that viewers can perceive as a landscape. While two-dimensional contour maps are more widely used, three-dimensional variations are becoming increasingly popular because they make it easier for viewers to visualize the overall terrain.

Harris describes several variations of three-dimensional topographic maps:

1. **Contour line version**: Uses contour lines on a three-dimensional surface. Areas between contour lines may be filled with different colors, tints, and/or shading.

2. **Fishnet version**: Draws isolines along the X and Y axes, creating a mesh or net-like appearance over the terrain surface.

3. **Hand-drawn version**: Appears as though drawn by hand, with artistic rendering of the terrain. Geological information can be shown on the sides of the block.

All three types are occasionally referred to as block diagram maps.

## Examples

Harris illustrates the relationship between two- and three-dimensional topographic maps using the same data (p. 420):

> "Two-dimensional topographic map using contour lines. This particular map is the equivalent of looking directly at the top of the three-dimensional topographic map below." (p. 420)

> "Elevation using only contour lines. This is the equivalent of looking directly at the side of the three-dimensional topographic map at the left." (p. 420)

The comparison shows how the same terrain appears as:
- A plan view (2D contour map, looking from above)
- An oblique view (3D contour map)
- A profile view (elevation cross-section, looking from the side)

Harris also shows:
- A fishnet-style map generated with the same data as the 3D contour map
- A hand-drawn topographic map with geological information on block sides

## Usage

Three-dimensional topographic maps are appropriate when:
- The goal is to help viewers quickly grasp overall terrain shape
- Precise elevation readings are not the primary requirement
- The audience may struggle to interpret two-dimensional contour maps
- An engaging, visually appealing presentation is desired

Construction considerations:
- The contour line version preserves the most quantitative precision
- Fishnet versions work well for showing smooth terrain surfaces
- Hand-drawn versions can incorporate geological cross-section data on block sides
- Colors, tints, or shading between contour lines can enhance depth perception

Not appropriate when:
- Viewers need to read precise elevation values
- The map will be used for measurement or technical analysis
- Reproduction must be in black and white with high fidelity

## Notes

The trade-off between two-dimensional and three-dimensional topographic maps is clarity vs. intuition. Two-dimensional contour maps allow precise elevation reading but require training to interpret. Three-dimensional versions are immediately intuitive but sacrifice quantitative precision.

Harris notes that the fishnet and hand-drawn variations make it particularly difficult to determine quantitative information, though both frequently make it easier for viewers to visualize the overall terrain than contour lines alone.
