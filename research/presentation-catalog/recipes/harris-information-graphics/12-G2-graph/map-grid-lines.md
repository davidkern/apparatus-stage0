---
name: Map Grid Lines
slug: map-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Grid lines on maps, p. 184"

intent: Use coordinate grids on maps for precise location and distance measurement
direction: both

components:
  - element: meridians
    encodes: North-south lines (longitudinal) measuring east-west position
  - element: parallels
    encodes: East-west lines (latitudinal) measuring north-south position
  - element: reference-grid
    encodes: Simple row-column grid for localized map references
  - element: distance-circles
    encodes: Supplementary concentric circles from a point for distance measurement

parameters:
  grid_type: "geographic (lat/long) | reference (A1, B2, etc.) | distance"
  coordinate_system: "latitude-longitude | UTM | local"

related: []  # TBD: graticule, map-projections

warnings:
  - "Map projections distort grid lines in different ways"
  - "Reference grids have no relation to actual geographic coordinates"
  - "Distance circles are only accurate on certain projections"

extensions:
  harris_entry: "Grid and Grid Line"
  alternate_names: ["graticule", "geographic grid", "coordinate grid"]
---

## Description

One of the primary functions of grid lines on maps is to locate entities. When precise locations are required, a coordinate system of latitudes and longitudes (geographic grid or graticule) is used. For general reference, simpler row-column grids may suffice. Supplementary grids like distance circles can be added for specific measurement purposes.

## Examples

Harris describes three types of map grid systems (p. 184):

**Geographic grid (graticule):**
> "When precise locations are required, a coordinate system of latitudes and longitudes (sometimes referred to as a geographic grid or graticule) is frequently used."

> "The grid lines that run north and south are called meridians or longitudinal lines. They are used to measure distances east and west from a line called the prime meridian, which passes through Greenwich, England. The grid lines that run east and west are called parallels or latitudinal lines and are used to measure distances north and south of the equator."

**Reference grid:**
> "With many maps, latitude and longitude are not important. Of greater importance are things like the relative location of a place or thing with respect to other places or things, distances between various locations in units such as miles or kilometers, statistics with regards to various areas, etc."

> "In other cases, a map is divided into rows and columns by means of horizontal and vertical grid lines... that are unrelated to lines of latitude and longitude. Each vertical column is designated by a number or letter, and each horizontal row by a letter or number, respectively."

**Distance circles:**
> "Supplementary grid lines, such as a series of circles, may be added to bracket a specific point and indicate distances from that point to various locations."

## Usage

**Geographic grid (lat/long):**
- For precise location on Earth's surface
- Major grid lines at uniform intervals (e.g., every 10 degrees)
- Minor grid lines for finer precision
- Essential for navigation and scientific mapping

**Reference grid (A1, B2, etc.):**
- For localized maps (city maps, atlases, trail maps)
- Simpler than geographic coordinates
- Index table cross-references locations to grid squares
- No precise mileage between lines required

**Distance circles:**
- Show distances from a specific point (city center, event location)
- Useful for planning, logistics, coverage analysis
- Accuracy depends on map projection

**Design considerations:**
- Grid lines should not overwhelm map content
- Label grid lines at edges or intervals
- Consider whether precise coordinates or general location matters more

## Notes

Harris emphasizes that the type of grid depends on the map's purpose. Scientific maps need geographic precision; tourist maps may need only reference squares. The choice of grid system shapes how viewers interact with the map.
