---
name: Three-Dimensional Map
slug: three-dimensional-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Terminology and locations of key elements, p. 234"

intent: Add depth dimension to maps for displaying elevation data or creating visual emphasis
direction: both

components:
  - element: base-map
    encodes: Geographic reference (x-y plane)
    required: true
  - element: z-axis
    encodes: Elevation or quantitative values (functional 3D) or depth effect (cosmetic 3D)
    required: true
  - element: vertical-scale
    encodes: Value scale for the third dimension (functional 3D only)
    required: false

parameters:
  type: "functional (with z-axis values) | cosmetic (for visual effect only)"

related: []  # TBD: see also statistical-map

warnings:
  - "Cosmetic 3D adds no information and may obscure data"
  - "3D views can make precise value reading difficult"
  - "Viewing angle affects perception of values"

extensions:
  harris_entry: "Map"
  alternate_names: []
  typical_use: "displaying elevation, statistical surfaces, dramatic presentation"
---

## Description

Three-dimensional maps fall into two major categories:

1. **Functional 3D**: Has a third axis along which elevations or quantitative Z-axis values can be plotted. The third dimension encodes actual data values.

2. **Cosmetic 3D**: A two-axis map that has been tilted and/or rotated with depth added for aesthetic purposes. The third dimension adds visual interest but no additional information.

## Examples

**Functional three-dimensional map** (p. 234):
The illustration shows a map with a vertical scale (0-75) displaying statistical data as a surface rising above the geographic base. Values at each location are encoded by the height of the surface at that point.

**Cosmetic three-dimensional map** (p. 234):
> "Three-dimensional map without a third axis. The depth is added for cosmetic purposes only."

The illustration shows what appears to be a relief map, but the depth is merely for visual effect, not encoding additional data.

## Usage

Use functional 3D when:
- Elevation or another continuous variable needs to be shown across the entire map surface
- Statistical density surfaces are being displayed
- The z-values are the primary information being communicated

Use cosmetic 3D when:
- Visual drama or engagement is prioritized
- The third dimension helps with orientation
- The map is for presentation rather than analysis

Avoid 3D when:
- Precise value reading is important
- The 3D effect would obscure important features
- Simpler 2D encoding (color, symbols) would work better

## Notes

Harris also describes "exploded maps" where portions of the map are graphically separated along boundaries (countries, states, territories, counties) to emphasize certain areas or clarify boundary locations. Both 2D and 3D maps can be exploded.
