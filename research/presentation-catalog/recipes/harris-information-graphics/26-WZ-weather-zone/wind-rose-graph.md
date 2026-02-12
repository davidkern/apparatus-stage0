---
name: Wind Rose Graph
slug: wind-rose-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Wind Rose Graph, p. 440"

intent: Summarize wind direction and speed information over a time period using a radial display showing frequency and intensity from each compass direction
direction: both

components:
  - element: directional-spokes
    encodes: Wind direction (8 to 16 compass directions)
    required: true
  - element: spoke-length
    encodes: Percent of time wind came from that direction
    required: true
  - element: spoke-segments
    encodes: Proportion of winds at various speed ranges (using widths, colors, or patterns)
    required: false
  - element: center-point
    encodes: Observation location
    required: true
  - element: legend
    encodes: Speed range definitions
    required: true

parameters:
  directions: "8 | 16"
  display_style: separate-bars | connected-polygon
  time_period: day | week | month | year

related: []  # TBD: polar-graph, radar-chart

warnings:
  - "Direction indicates where wind was FROM, not where it was going"
  - "Polygon form may imply continuous variation between measured directions"

extensions:
  harris_entry: "Wind Rose Graph"
  alternate_names: ["wind rose", "wind frequency diagram"]
  typical_use: "analyzing prevailing wind patterns, site planning, aviation, environmental studies"
---

## Description

A wind rose graph summarizes wind information over a period of time such as a day, week, month, or year. The radial design shows actual wind values for eight to sixteen different directions equally spaced around 360 degrees.

The angle denoted by each spoke or data point designates the direction FROM which the wind was blowing. The total length indicates the percent of time the wind came from that direction. Different widths, colors, or patterns can show what proportion of winds from that direction were of various speeds.

## Examples

Harris illustrates two display variations showing identical data (p. 440):

1. **Separate bars**: Each direction shown as individual segmented bars radiating from center
2. **Connected polygon**: Data points connected by lines to form a polygon or series of polygons, which may be filled or unfilled

### Reading the Graph
> "For example, the graphs below indicate the wind was from the east 6% of the time. There were no winds from that direction above 38 miles per hour. One third of the time the winds were in the range of 16 to 38 mph. Another third of the time the winds were between 9 and 15 mph and the rest of the time they were less than 9 mph." (p. 440)

### Multiple Uses
> "A series of roses are frequently used to compare wind patterns in multiple locations or in the same location over different time periods. Wind rose graphs can be used as stand alone graphs or as symbols on maps." (p. 440)

## Usage

Wind rose graphs are appropriate for:
- Analyzing prevailing wind directions at a location
- Comparing wind patterns across multiple sites
- Seasonal wind pattern analysis
- Aviation and airport planning
- Building and site orientation decisions
- Air quality and pollution dispersion studies
- Wind energy potential assessment

### Design Choices

**Number of directions**: Most commonly 8 or 16 compass directions

**Display style**:
- Separate bars maintain clarity about discrete measurements
- Connected polygons create a more unified visual but may suggest continuous variation

**Speed encoding**: Segments within each directional spoke can show speed distribution using:
- Different widths
- Different colors
- Different fill patterns

**Comparative displays**: Multiple wind roses can be arranged to show:
- Different locations (placed on a map)
- Different time periods (arranged chronologically)

## Notes

Wind roses are particularly valuable because they compress a large amount of data (direction frequency and speed distribution for each direction) into a compact radial format that reveals patterns at a glance. The shape of the rose immediately shows prevailing wind directions and their relative dominance.
