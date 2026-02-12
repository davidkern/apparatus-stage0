---
name: Map Overview
slug: map-overview
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, pp. 226"

intent: Display information in relationship to its physical (spatial) location, revealing geographic patterns not visible in tables or graphs
direction: both

components:
  - element: base-map
    encodes: Geographic reference frame (coastlines, boundaries, features)
    required: true
  - element: attribute-data
    encodes: The information being displayed geographically
    required: true
  - element: legend
    encodes: Key for interpreting symbols, colors, and patterns
    required: true

parameters:
  map_family: "statistical | descriptive | flow | topographic | weather | special purpose"

related: []  # TBD: see also statistical-map, flow-map, topographic-map

warnings:
  - "Tables provide better precision for quick reference"
  - "Graphs provide better quantitative comparison"
  - "Maps uniquely show geographic distribution"

extensions:
  harris_entry: "Map"
  alternate_names: []
  typical_use: "displaying spatial patterns, geographic distribution of data"
  note: "This entry continues through chunks 16 and 17"
---

## Description

Maps provide the unique ability to display information visually in relationship to its physical (spatial) location. While tables excel at quick reference and precision, and graphs excel at rapid quantitative comparisons, maps alone can show how data is distributed geographically.

Harris categorizes maps used as charts into six major families:
1. **Statistical maps**: Display quantitative data geographically (with or without class intervals)
2. **Descriptive maps**: Show geographic areas, paths, and facilities
3. **Flow maps**: Show movement or connections (proportional arrows, generalized flows)
4. **Topographic maps**: Display terrain (detailed, isolines/fishnet, contour lines)
5. **Weather maps**: Temperature and pressure patterns
6. **Special purpose maps**: Including profile, thematic, strip, diagrammatic, buffer, cartogram, logarithmic, and pin maps

## Examples

**Comparison of data presentation methods** (p. 226):
The same sales data for 22 territories is shown in three formats:
- **Table**: Lists territories 1-22 with sales values ($965 to $19,387). Best for precise values.
- **Graph**: Bar chart showing territories sorted by sales with average line. Best for quantitative comparison.
- **Map**: Territories shown in geographic position with shading indicating sales ranges. Best for seeing geographic patterns.

> "Illustration of how a map yields information not readily available from a table or graph"

The map reveals spatial clustering of high and low sales territories that is invisible in the table or graph formats.

**Six map families illustrated** (p. 226):
- Statistical maps: Choropleth with class intervals, proportional symbols, smooth 3D surface
- Descriptive maps: Geographic areas, paths, facilities
- Flow maps: Proportional arrows, generalized trade flows
- Topographic maps: Detailed, isolines, contour lines
- Weather maps: Temperature zones, pressure systems
- Special purpose: Thematic, strip, diagrammatic, buffer, cartogram, logarithmic, pin

## Usage

Choose maps when:
- Geographic distribution is meaningful for understanding the data
- Spatial patterns or clusters are important to reveal
- Viewers need to understand how location relates to values
- The question involves "where" rather than just "how much"

Choose tables when precision and lookup are primary needs.
Choose graphs when quantitative comparison is primary.

Multiple map types are frequently combined in practice, such as overlaying statistical data on topographic features.

## Notes

This is a major multi-page entry that continues through chunks 16 and 17. This chunk covers the overview, classification of map types, grid lines (parallels and meridians), scales, symbols, projections, and base maps. Subsequent chunks cover additional map types and techniques in detail.
