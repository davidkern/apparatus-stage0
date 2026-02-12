---
name: Map Orientation
slug: map-orientation
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Orientation, p. 235"

intent: Establish directional reference on maps so viewers can correctly interpret geographic relationships
direction: both

components:
  - element: north-indicator
    encodes: Direction of true north relative to the map display
    required: false
  - element: latitude-longitude-lines
    encodes: Grid lines that implicitly indicate orientation
    required: false
  - element: directional-arrow
    encodes: Symbol showing north direction when lat/long lines are absent
    required: false

parameters:
  orientation_type: "north-up | rotated | variable"
  indicator_style: "arrow | compass rose | graticule lines"

related: []

warnings:
  - "When maps are rotated from standard north-up orientation, clear directional indicators become essential"
  - "On large maps, north-south meridians change angle as longitude varies, so multiple directional arrows may be needed"

extensions:
  harris_entry: "Map"
  typical_use: "ensuring viewers can correctly interpret directional relationships"
  convention: "Maps are normally oriented with their tops in a northerly direction"
---

## Description

Map orientation refers to how a map is aligned relative to true compass directions. The standard convention is to orient maps with north at the top. When maps deviate from this convention, or when the orientation might be unclear to viewers, directional indicators help establish the proper frame of reference.

If lines of latitude and longitude are present on a map, they implicitly indicate orientation and separate directional arrows may not be needed. However, on maps without such grid lines, an arrow or compass symbol showing north is often included.

## Examples

Harris notes the standard convention and variations:

> "Maps are normally oriented with their tops in a northerly direction. If a different orientation is used, an arrow or symbol is sometimes included to orient the viewer. If lines of latitude and longitude are present on the map, arrows may not be included." (p. 235)

For large maps spanning significant longitude:

> "On large maps, multiple directional arrows are sometimes used since the angles of the north-south meridians, as drawn on a two-dimensional map, change as the longitude (horizontal distance) varies." (p. 235)

Harris illustrates this with a diagram showing how meridians at 120 degrees, 100 degrees, and 80 degrees longitude all point to different angles on a flat map projection.

When displaying a portion of a larger map:

> "When a small portion of a large map is shown by itself, it sometimes is reoriented into a true north-south position. In other cases, it is left in the same orientation as in the larger map since that might be the more familiar orientation." (p. 235)

The example shows Nevada displayed both in its familiar tilted orientation (as it appears in US maps) and rotated to true north-south alignment.

## Usage

Include explicit orientation indicators when:
- The map is not oriented with north at top
- The map lacks latitude/longitude grid lines
- The map covers a large geographic area where meridian angles vary
- Viewers may be unfamiliar with the area's standard orientation

For portions extracted from larger maps, consider whether viewers would recognize the familiar orientation or benefit from true north-south alignment.

## Notes

The choice between maintaining familiar orientation versus true north-south alignment depends on the audience and purpose. For areas like Nevada that have a distinctive tilted shape, viewers may find the familiar orientation more recognizable even if it's not perfectly north-aligned.
