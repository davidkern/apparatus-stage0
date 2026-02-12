---
name: Map Projection
slug: map-projection
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Map projections, p. 232"

intent: Transform spherical earth geography onto flat surfaces while managing inevitable distortions
direction: both

components:
  - element: projection-surface
    encodes: The geometric shape onto which the globe is projected
    required: true
  - element: distortion-pattern
    encodes: Where and how the map is distorted
    required: true
  - element: preserved-property
    encodes: Which geographic property is kept accurate (area, shape, distance, or direction)
    required: true

parameters:
  projection_method: "cylindrical | conic | planar (azimuthal)"
  preserved_property: "true areas | true shapes | true distances | true directions"

related: []  # TBD

warnings:
  - "All map projections produce distortion"
  - "Reasonable accuracy can be achieved in one or more measures, but never in all four (area, shape, distance, direction)"
  - "World maps often have significant distortion, particularly at upper and lower latitudes"
  - "Local maps covering small areas have negligible distortion"

extensions:
  harris_entry: "Map"
  alternate_names: []
  typical_use: "creating flat representations of earth's surface"
---

## Description

Map projection is the process of transferring geographical information from a spherical surface (earth/globe) to a flat surface (map). This is done mathematically but can be visualized as projecting each point on a globe onto a simple geometric shape that is then unfolded flat.

All projections produce distortion. The key is choosing which properties to preserve based on the map's purpose.

## Examples

**Three major projection methods** (p. 232):

1. **Cylindrical projection**: Globe projected onto a cylinder wrapped around it
   - Minimum distortion near the equator (where cylinder touches)
   - Increasing distortion toward poles

2. **Conic projection**: Globe projected onto a cone
   - Minimum distortion along the standard parallel(s) where cone intersects
   - Good for mid-latitude regions

3. **Planar (azimuthal) projection**: Globe projected onto a flat plane
   - Minimum distortion at the point of tangency
   - Good for polar regions or small areas

> "The gray areas on the maps indicate the shape of the area on the map where the minimum distortion tends to occur."

**Distortion trade-offs** (p. 232):
> "Before maps of large areas are generated, it is decided which is the most important, true areas, true shapes, true distances, and/or true directions. Reasonable accuracy can be achieved in one or more of these measures, but never in all four."

**Distortion demonstration** (p. 232):
Three maps of Greenland relative to the continental US show dramatically different:
- Shapes of Greenland
- Sizes relative to the US
- Orientations to New England

> "The apparent differences do not mean that one map is right and another wrong; rather, it is a matter of one type of projection being better than another for a given task."

**Detecting distortion** (p. 232):
> "When looking at a map it is generally difficult to know what type of projection was used and, more importantly, where and how much distortion exists. In some cases the type of projection is noted on the map. In other cases, observing the parallels and meridians can help in estimating the areas of greatest distortion."

## Usage

Choose projection based on what matters most:
- **Equal-area (equivalent)**: When comparing sizes of regions
- **Conformal**: When accurate shapes are important (navigation)
- **Equidistant**: When measuring distances from a point
- **Azimuthal**: When directions from a central point matter

For small areas (city, county), projection choice matters little as distortion is minimal.

For large areas (country, continent, world), projection choice significantly affects interpretation.

## Notes

This is a complex topic with many named projections (Mercator, Robinson, Mollweide, etc.) that Harris does not detail exhaustively. The key insight is that projection choice involves trade-offs, and understanding where distortion occurs is essential for proper map interpretation.
