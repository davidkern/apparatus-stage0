---
name: Map Scale
slug: map-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Scales for maps, p. 338"

intent: Indicate the relationship between distances on a map and actual distances on the ground
direction: both

components:
  - element: scale-representation
    encodes: The relationship between map distance and ground distance
    required: true
  - element: scale-format
    encodes: How the scale is expressed (fraction, verbal, graphic)
    required: true
  - element: units
    encodes: Units of measure (miles, kilometers, feet, etc.)
    required: true

parameters:
  scale_type: "representative-fraction | verbal | graphic-bar | distorted"
  ratio: "map-to-ground ratio (e.g., 1:1,000,000)"
  units: "miles | kilometers | feet | meters"

related: []  # TBD: elevation-scale, map

warnings:
  - "Map projections can cause distance distortion varying by location"
  - "Distorted distance scales may be needed for maps where scale varies"

extensions:
  harris_entry: "Scale"
  typical_use: "geographic maps for determining distances and locations"
  cross_reference: "See Map"
---

## Description

Map scales are used primarily for determining the size or relative location of places and things, for example, to determine the width of Kansas or the distance from Paris to Rome. There are several formats for expressing map scales:

1. **Simple fraction or ratio (Representative Fraction/RF)**: Relates a unit distance on the map to the actual ground distance. For example, 1/1,000,000 or 1:1,000,000 means 1 unit on the map represents 1,000,000 of the same units on the ground.

2. **Written statement or verbal**: A notation such as "one inch equals one mile" means one inch on the map equals one mile on the ground.

3. **Graphic representation (bar scale)**: A visual bar showing distances, frequently used for measuring.

4. **Distorted distance scale**: Used when map projections cause distance distortion. These scales show how the actual distance represented by a unit length varies by location on the map.

## Examples

> "Simple fraction or ratio - Sometimes referred to as representative fraction or RF. This type of scale relates a unit distance on a map to the distance it actually represents on the ground or earth. For example, the fraction or ratio of 1/1,000,000 or 1:1,000,000 means that 1 unit on the map represents 1,000,000 of the same units on the ground." (p. 338)

> "Written statement or verbal - A notation on a map such as 'one inch equals one mile' means that one inch on the map is the equivalent of one mile on the ground." (p. 338)

The PDF illustrates:
- A representative fraction diagram showing 1:1,000,000
- A dual bar scale showing miles (0-10-20-30) and kilometers (0-10-20-30-40)
- A distorted distance scale showing how miles vary with degrees of latitude (0, 20, 40, 60, 80 degrees)

## Usage

Bar scales are commonly used because:
- They work even when the map is enlarged or reduced (unlike verbal or RF scales)
- Viewers can measure directly with a ruler or by eye
- Multiple units can be shown (miles and kilometers)

Distorted distance scales are needed when:
- Map projection causes scale to vary by location
- The further from a reference point (e.g., equator), the more distorted distances become

## Notes

Additionally, maps use:
- **Elevation scales**: When color or shading indicates elevation, a legend shows the color-to-elevation mapping
- **Latitude and longitude**: For determining absolute location on Earth's surface

Maps may also include a supplementary scale showing derived values (such as profit dollars at various percent of sales) that are calculated from the mapped data.
