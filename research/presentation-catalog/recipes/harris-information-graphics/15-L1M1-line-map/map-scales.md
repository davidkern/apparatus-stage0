---
name: Map Scales
slug: map-scales
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Scales, pp. 229-230"

intent: Indicate distances and locations on maps using angular coordinates, ratios, verbal statements, or graphic representations
direction: both

components:
  - element: latitude-longitude-scale
    encodes: Absolute positions using angular measurements
    required: false
  - element: distance-scale
    encodes: Relationship between map distance and ground distance
    required: false
  - element: elevation-scale
    encodes: Height/depth indicated by colors or contours
    required: false

parameters:
  location_scale_type: "degrees-minutes-seconds | decimal degrees"
  distance_scale_type: "representative fraction | verbal statement | graphic bar"
  map_scale_category: "large scale (detailed) | intermediate | small scale (overview)"

related: []  # TBD: see also map-grid-lines

warnings:
  - "Fraction/ratio and verbal scales become incorrect if the map is photocopied at different sizes"
  - "Graphic scales are unaffected by enlargement or reduction"
  - "At high latitudes, distances may be distorted; special scales can compensate"

extensions:
  harris_entry: "Map"
  alternate_names: ["representative fraction", "RF"]
  typical_use: "determining distances, locating positions, understanding map detail level"
---

## Description

Map scales serve different purposes: locating absolute positions (latitude/longitude), determining distances, and indicating elevation. Harris covers three major categories.

## Examples

**Latitude and longitude scales** (p. 229):
> "Degrees of longitude start at what is called the prime meridian and increase in both the easterly and westerly directions, meeting at 180° on the opposite side of the earth."
> "Degrees of latitude start at the equator and increase in both the northerly and southerly directions to 90° at the two poles."

Angles can be stated as degrees-minutes-seconds (35° 47' 12"), tenths of minutes (35° 47.2'), or hundredths of degrees (35.79°).

Scale labels can appear inside or outside the map frame, or directly on grid lines when the frame would be confusing.

**Surface distance scales** (p. 230):

1. **Simple fraction or ratio** (Representative Fraction):
> "The fraction or ratio of 1/1,000,000 or 1:1,000,000 means that 1 unit on the map represents 1,000,000 of the same units on the ground."
This will be incorrect if the map is resized.

2. **Written statement or verbal**:
> "One inch equals one mile" or "One centimeter equals one kilometer"
Also incorrect if resized.

3. **Graphic representation** (Bar scales):
> "Graphic scales are unaffected by enlargements or reductions of the map by photocopying processes."

Harris shows multiple bar scale designs and notes that special scales can compensate for distortion at different latitudes.

**Elevation scales** (p. 230):
> "Elevations might be noted directly on a map or, as is often done, various colors or shading are used to indicate ranges of elevations."

Color/shading legends show ranges (e.g., 0-500 ft, 500-1000 ft, 1000-1500 ft) for both land and underwater features.

**Scale categories** (p. 230):
| Category | Description | Scale |
|----------|-------------|-------|
| Large scale | Small area, great detail (city map) | 1/24,000 and larger |
| Intermediate | Between large and small | 1/25,000 to 1/29,000,000 |
| Small scale | Large area, little detail (world map) | 1/30,000,000 and smaller |

## Usage

Include appropriate scales based on map purpose:
- For navigation or measurement: distance scales essential
- For location lookup: lat/long scales or reference grid
- For terrain understanding: elevation scales
- For any map that might be copied: use graphic scales

Consider including multiple scale types when viewers have different needs.

## Notes

The terminology can be counterintuitive: "large scale" means showing a small area in great detail (the fraction is larger, e.g., 1/10,000), while "small scale" means showing a large area with less detail (the fraction is smaller, e.g., 1/50,000,000).
