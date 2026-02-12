---
name: Hypsometric Tint Map
slug: hypsometric-tint-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Topographic Map, p. 419"

intent: Encode elevation bands on a topographic map by filling areas between contour lines with different colors or shades
direction: construction

components:
  - element: contour-lines
    encodes: Boundaries of elevation bands
    required: true
  - element: color-fills
    encodes: Different colors or shades representing distinct elevation ranges
    required: true
  - element: legend
    encodes: Key relating colors/shades to elevation values
    required: true

parameters:
  color_scheme: "gradient or categorical"
  number_of_bands: "varies based on elevation range and desired precision"

related: []

warnings:
  - "Color selection must ensure adjacent bands are distinguishable"
  - "Too many color bands can overwhelm viewers"
  - "Colorblind-accessible palettes should be considered"

extensions:
  harris_entry: "Topographic Map"
  alternate_names: ["layer tinting", "elevation coloring"]
  typical_use: "making elevation differences immediately visible through color coding"
---

## Description

Hypsometric tinting is a technique for enhancing topographic maps by filling the areas between contour lines with different shades or colors. Each shade or color represents a distinct elevation band, making elevation patterns immediately visible without requiring viewers to read individual contour line values.

The technique gets its name from "hypsometry," the measurement of elevation. When applied to areas above water, the contour lines are sometimes called hypsometric contour lines. Areas below water may use a separate color scheme (bathymetric tints).

## Examples

Harris describes hypsometric tinting as one method for enhancing topographic maps:

> "Topographic maps are sometimes enhanced by filling the areas between contour lines with different shades or colors (called hypsometric tints)..." (p. 419)

The technique is mentioned alongside shaded relief as a way to make topographic information more accessible to viewers.

## Usage

Hypsometric tinting is appropriate when:
- Elevation patterns across a region need to be shown at a glance
- The audience may not be skilled at reading contour lines
- The map is for general reference or presentation purposes
- Color printing or display is available

Construction approach:
1. Establish contour lines at appropriate intervals
2. Select a color scheme (typically progressing from greens at low elevations through yellows and browns to whites at high elevations)
3. Fill each band between contour lines with its designated color
4. Create a legend showing the color-to-elevation relationship
5. Optionally combine with shaded relief for enhanced three-dimensional effect

Common color conventions:
- Green: low elevations, often associated with vegetation
- Yellow/tan: intermediate elevations
- Brown: higher elevations
- White: highest elevations (often snow-capped peaks)
- Blue: water features and bathymetric (underwater) elevations

## Notes

Hypsometric tinting can be combined with shaded relief to create maps that show both elevation bands (through color) and terrain shape (through shading). This combination provides multiple visual cues for understanding terrain.

The technique requires careful color selection to ensure that adjacent elevation bands are easily distinguishable while the overall progression from low to high elevations remains intuitive.
