---
name: Shaded Relief Map
slug: shaded-relief-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Topographic Map, p. 419"

intent: Create the appearance of three-dimensional terrain by applying shading that simulates shadows cast by an imaginary light source
direction: construction

components:
  - element: base-map
    encodes: The underlying geographic area being depicted
    required: true
  - element: shading-gradient
    encodes: Shadows cast by terrain features based on imaginary light source position
    required: true
  - element: imaginary-light-source
    encodes: Assumed direction from which light illuminates the terrain (typically northwest)
    required: true

parameters:
  light_direction: "northwest | other direction"
  shading_intensity: "subtle | moderate | dramatic"

related: []  # TBD: see topographic-map-contour-lines, hypsometric-tint-map

warnings:
  - "Does not provide precise elevation values without additional contour lines or labels"
  - "Light source direction should be consistent across the entire map"

extensions:
  harris_entry: "Topographic Map"
  typical_use: "giving maps the appearance of being three-dimensional for visual impact"
---

## Description

Shaded relief is a technique for enhancing topographic maps by applying shading to represent shadows cast by an imaginary light source. The shading gives the map the appearance of being three-dimensional, making terrain features immediately visible to viewers without requiring them to interpret contour lines.

The technique simulates how terrain would look if illuminated from a consistent direction (typically from the northwest). Slopes facing away from the light source appear darker, while slopes facing the light source appear lighter. This creates a visual impression of hills, valleys, and ridges that most viewers intuitively understand.

## Examples

Harris shows a shaded relief map example (p. 419) that demonstrates how the technique creates a three-dimensional appearance:

> "The shading gives the map the appearance of being three-dimensional as shown at the left." (p. 419)

The shaded relief map is presented as one of several enhancement techniques that can be applied to topographic maps, alongside hypsometric tints (color fills between contour lines).

## Usage

Shaded relief is appropriate when:
- Visual impact and intuitive terrain perception are priorities
- The audience includes non-technical viewers who may not read contour lines
- The map is for presentation, publication, or general reference
- Terrain shape is more important than precise elevation values

Construction approach:
1. Establish the imaginary light source position (conventionally from the northwest)
2. Apply darker shading to slopes facing away from the light source
3. Apply lighter shading or leave unshaded slopes facing the light source
4. Maintain consistent light direction across the entire map
5. Optionally combine with contour lines for quantitative precision

Shaded relief can be combined with:
- Contour lines for elevation precision
- Hypsometric tints (color fills) for additional visual encoding of elevation bands
- Standard map features (roads, boundaries, water bodies)

## Notes

Shaded relief is often used in conjunction with contour lines rather than as a replacement. The combination provides both intuitive visual perception of terrain shape and the ability to read specific elevation values.

Modern digital mapping tools can generate shaded relief automatically from elevation data, but the technique was originally developed for hand-drawn cartography.
