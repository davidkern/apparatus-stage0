---
name: Voronoi Diagram
slug: voronoi-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Voronoi Diagram, p. 438"

intent: Partition a space into cells around reference points such that any point within a cell is closer to its reference point than to any other reference point
direction: both

components:
  - element: reference-points
    encodes: Locations of interest (stores, stations, facilities, etc.)
    required: true
  - element: cell-boundaries
    encodes: Mathematically generated lines forming polygons around each reference point
    required: true
  - element: cells
    encodes: Regions where all points are closest to the cell's reference point
    required: true
  - element: axes
    encodes: Scale references (may be geographic coordinates, distance, or arbitrary)
    required: false

parameters:
  scale_type: latitude-longitude | distance-from-reference | arbitrary

related: []  # TBD: proximity-map, thiessen-polygon

warnings:
  - "Cells are generated mathematically; boundaries may not reflect real-world obstacles"
  - "Useful for proximity analysis but does not account for travel time or accessibility"

extensions:
  harris_entry: "Voronoi Diagram"
  alternate_names: ["Thiessen polygon", "proximity diagram"]
  typical_use: "locating nearest service points, territory assignment, proximity analysis"
---

## Description

A Voronoi diagram consists of a series of reference points and a web of lines that form cells or polygons around each reference point. The defining characteristic is that any point within a given cell is closer to the reference point in that cell than to any other reference point on the graph.

The lines forming the cell boundaries are generated mathematically to ensure this proximity property holds for every location within each cell.

## Examples

> "In the example at the right, every point in the cell shaded gray is closer to reference point D than to any other reference point on the graph (reference points are the black dots with letters alongside). If this were a map instead of a graph and every reference point represented a restaurant, the people whose homes were in the gray area would be closest to the restaurant designated by the letter D." (p. 438)

### Practical Application
> "Some companies use this technique to locate their nearest outlet for potential customers who phone in. In such an application, the scales on the graph might be latitude and longitude, miles from a known reference point, or some arbitrary scale that can be referenced back to a map." (p. 438)

## Usage

Voronoi diagrams are appropriate for:
- Determining service territories for retail locations
- Assigning customers to nearest facilities
- Planning delivery routes or coverage areas
- Analyzing spatial distribution of service points
- Identifying underserved areas (large cells indicate sparse coverage)

The reference points might represent:
- Stores or retail outlets
- Restaurants
- Fire stations
- Distribution centers
- Service facilities
- Any point-based resource

### Scale Options
The axes can use various scales:
- Latitude and longitude (for geographic applications)
- Miles or kilometers from a known reference point
- Arbitrary coordinate systems that map to real locations

## Notes

The diagram illustrates pure geometric proximity. In real-world applications, factors like roads, travel time, and physical barriers may make the mathematically nearest point not the most accessible. Voronoi diagrams provide a starting point for territory analysis that may need adjustment based on practical considerations.
