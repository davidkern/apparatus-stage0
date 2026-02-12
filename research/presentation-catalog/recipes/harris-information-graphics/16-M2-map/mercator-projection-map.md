---
name: Mercator Projection Map
slug: mercator-projection-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Mercator Projection Map, p. 240"

intent: Display world geography with accurate directional relationships for navigation, accepting significant size distortion away from the equator
direction: recognition

components:
  - element: base-map
    encodes: World geography using Mercator cylindrical projection
    required: true
  - element: latitude-lines
    encodes: East-west parallels showing increasing spacing toward poles
    required: false
  - element: longitude-lines
    encodes: North-south meridians appearing as vertical parallels
    required: false

parameters:
  coverage: "world | regional"

related: []

warnings:
  - "Distances and areas are somewhat accurate near the equator but get progressively more distorted further from it"
  - "Distortion is extreme in polar areas - Greenland appears as large as Africa despite being 1/14 the size"
  - "Not suitable for comparing land mass sizes across different latitudes"

extensions:
  harris_entry: "Mercator Projection Map"
  typical_use: "navigation, showing directional routes"
  projection_properties:
    preserves: "direction between nearby points, shape (locally)"
    distorts: "area (severely at high latitudes), distance (at high latitudes)"
---

## Description

The Mercator projection is a well-known and widely distributed world map projection. Its key feature is that directions are correct between any two points within a reasonable distance of each other, making it particularly valuable to navigators. Shapes of land masses are fairly representative at all points on the map.

The trade-off for preserving direction and local shape is significant distortion of distances and areas, particularly away from the equator. This distortion becomes extreme in polar regions.

## Examples

Harris describes the projection's characteristics:

> "A well known and widely distributed world map. One of its key features is that directions are correct between any two points within a reasonable distance of each other. This feature makes the Mercator map particularly valuable to navigators. Shapes of land masses are fairly representative at all points on the map. Distances and areas are somewhat accurate near the equator but get progressively more distorted the further they are from the equator. The distortion is extreme in the polar areas." (p. 240)

The accompanying illustration shows a typical Mercator world map with the characteristic appearance: rectangular format, vertical meridians, parallel latitude lines that spread apart toward the poles, and visibly enlarged high-latitude land masses (Greenland, northern Canada, Scandinavia, and Antarctica appearing disproportionately large).

## Usage

The Mercator projection is appropriate when:
- Directional accuracy matters more than area accuracy
- Navigational routes need to be plotted or displayed
- The focus is on equatorial or mid-latitude regions
- A familiar world map format is needed for general orientation

The Mercator projection is inappropriate when:
- Comparing the sizes of regions at different latitudes
- Displaying statistical data where area represents magnitude
- Polar regions are the focus of interest
- Accurate representation of landmass proportions matters

## Notes

Despite its distortions, the Mercator projection remains one of the most recognizable world map formats. Its familiarity can be an advantage for general orientation, but users should be aware that it systematically exaggerates the apparent importance of high-latitude regions (primarily in the Northern Hemisphere where most land mass exists at those latitudes).

For thematic maps showing statistical data, equal-area projections are generally preferable because they don't create visual bias based on latitude.
