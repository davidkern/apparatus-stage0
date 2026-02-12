---
name: Map Grid Lines
slug: map-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Grid lines, meridians, and parallels, pp. 227-228"

intent: Locate places precisely and orient viewers using coordinate reference systems on maps
direction: both

components:
  - element: parallels
    encodes: Lines of latitude running east-west
    required: false
  - element: meridians
    encodes: Lines of longitude running north-south
    required: false
  - element: reference-grid
    encodes: Arbitrary grid for locating items (letters and numbers)
    required: false

parameters:
  grid_type: "geographic (lat/long) | reference (arbitrary) | supplementary (distance circles)"
  grid_position: "in front of land | behind land | none"
  label_position: "inside neat line | outside neat line | on grid lines"

related: []  # TBD: see also map-scales

warnings:
  - "Many statistical and descriptive maps do not require precise lat/long coordinates"
  - "Grid lines in front of land masses are more accurate but may obscure detail"

extensions:
  harris_entry: "Map"
  alternate_names: ["graticule", "geographic grid"]
  typical_use: "precise location, orientation, reference lookup"
---

## Description

Grid lines on maps serve two primary functions: locating places/things and orienting the viewer. When precise locations are required (absolute location), a coordinate system of latitudes and longitudes is used. For many maps, however, an arbitrary reference grid is sufficient.

## Examples

**Parallels and meridians** (p. 227):
> "The grid lines running north and south are called meridians or longitudinal lines. The grid lines running east and west are called parallels or latitudinal lines."

Harris illustrates how these appear differently based on area size and viewing angle:
- Small areas: parallels appear nearly horizontal, meridians nearly vertical
- Larger areas: both appear as gently curving lines
- Large area viewed perpendicular to N-S axis: parallels straight horizontal, meridians curved
- Viewed along N-S axis: parallels appear as circles, meridians as radiating straight lines

**Latitude and longitude measurement** (p. 227):
> "Parallels are used to measure distances north and south of the equator. They start with zero degrees at the equator and increase to 90° at either pole."
> "Meridians are used to measure distances east and west from... the prime meridian, which passes through Greenwich, England."

**Reference grids** (p. 228):
> "Many maps do not show parallels and meridians and in fact, may have no grid lines at all. Those that do, often use them to assist in finding specific entities on the map."

For reference purposes, maps are divided into rows and columns with letters/numbers. "Such grid lines frequently have no particular mileage distance between them."

**Grid line position** (p. 228):
> "Grid lines may be drawn in front of or behind the land masses on maps."

Three variations illustrated: no grid lines, grid behind land, grid in front of land.

**Supplementary grids** (p. 228):
> "In some instances supplementary grid lines are added, such as a series of circles or lines bracketing a specific point to indicate distances from that point."

## Usage

Choose grid type based on map purpose:
- **Geographic coordinates**: When precise earth-surface location matters
- **Reference grid**: When finding named items on the map is the goal
- **Supplementary grid**: When distances from a specific point matter

Grid line placement considerations:
- In front of land: more accurate reading, may obscure features
- Behind land: cleaner appearance, less precise
- No grid: simplest, used when location precision is unimportant

## Notes

The term "quadrangle" (or quad) refers to the area bounded by two lines of latitude and two lines of longitude. U.S. Geological Survey maps are often designated by their quadrangle size (e.g., 7.5-minute quadrangle).
