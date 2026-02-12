---
name: Topographic Map with Contour Lines
slug: topographic-map-contour-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Topographic Map, pp. 419-420"

intent: Portray the shape and elevation of terrain using contour lines that connect points of equal elevation
direction: both

components:
  - element: contour-lines
    encodes: Lines connecting all points at the same elevation above a datum plane
    required: true
  - element: index-contours
    encodes: Bold lines marking every fifth contour for easier reading
    required: false
  - element: intermediate-contours
    encodes: Regular contour lines between index contours
    required: true
  - element: auxiliary-contours
    encodes: Dashed lines at half-intervals where elevation changes gradually
    required: false
  - element: elevation-labels
    encodes: Numeric values placed on contour lines indicating feet or meters above datum
    required: true
  - element: datum-plane
    encodes: Reference elevation (typically sea level) from which heights are measured
    required: true
  - element: contour-interval
    encodes: Consistent vertical distance between adjacent contour lines
    required: true

parameters:
  contour_interval: "feet | meters (depends on map scale and terrain)"
  terrain_type: "mountainous | plains | mixed"
  water_features: "with-bathymetric | land-only"

related: []  # TBD: see shaded-relief-map, hypsometric-tint-map

warnings:
  - "Contour interval must be consistent throughout a given map"
  - "When changes in elevation are gradual, auxiliary contour lines at half-intervals must be added to maintain useful detail"
  - "Contour labels should be placed directly on lines to avoid misunderstanding about which line a value refers to"

extensions:
  harris_entry: "Topographic Map"
  alternate_names: ["topo map", "contour map"]
  typical_use: "portraying terrain elevation and shape for navigation, planning, and analysis"
  historical_note: "Replaced hachures which were short lines indicating elevation changes before contour lines became standard"
---

## Description

Topographic maps portray the shape and elevation of sections of the earth's surface using contour lines. Contours are shown as solid lines on maps and represent imaginary lines on the terrain along which all points have the same elevation. For example, a contour labeled 50 feet represents every point on the land surface that is 50 feet above a reference plane (the datum plane, frequently sea level).

The technique works because contour lines reveal terrain characteristics through their spacing and shape:
- Lines close together indicate steep slopes; if very close together, a cliff
- Lines further apart indicate gentler slopes
- Closed contour lines represent hills or depressions
- U-shaped contour lines pointing to lower elevations represent ridges
- U-shaped contour lines pointing to higher elevations represent valleys

## Examples

> "Contours are shown as solid lines on maps and represent imaginary lines on the terrain along which all points have the same elevation. For example, a contour labeled 50 feet represents every point on the land surface that is 50 feet above a reference plane (referred to as a datum plane)." (p. 419)

Harris provides an annotated topographic map example (p. 419) showing:
- Index contours (bold lines every fifth contour)
- Intermediate contours between index lines
- Auxiliary contours (dashed) where elevation changes gradually
- Elevation labels placed directly on contour lines
- A lake with bathymetric contour lines below water level
- A cross-section elevation profile corresponding to a plane through the map

> "The change in elevation represented from one contour line to another (called contour interval) depends on the scale of the map and the elevations in the area being plotted (i.e., mountains have larger intervals than plains)." (p. 419)

## Usage

Topographic contour maps are appropriate when:
- Precise elevation data must be communicated
- Users need to assess slope steepness and terrain shape
- The map will serve as a base for overlaying other data (buildings, facilities, statistical data)
- Cross-section profiles need to be derived from the map

Construction guidelines:
1. Select a contour interval appropriate to the terrain (larger for mountains, smaller for plains)
2. Use the interval consistently throughout the map
3. Draw index contours (every fifth line) in bold
4. Add auxiliary contours (dashed, at half-intervals) where terrain is very gradual
5. Place elevation labels directly on contour lines, repeating if lines are long
6. Distinguish hypsometric (above water) from bathymetric (below water) contours

Reading guidelines:
1. Note the contour interval from the map legend
2. Find index contours to establish baseline elevations
3. Assess slope from line spacing (close = steep, far = gentle)
4. Identify terrain features from contour shapes (closed = hills/depressions, U-shaped = ridges/valleys)
5. For depressions, look for short tick marks pointing inward on the contour lines

## Notes

Before contour lines became widely used, short lines called hachures were used to indicate changes in elevation. Today, contour lines are used almost exclusively on two-dimensional topographic maps.

Contour lines above water are sometimes called hypsometric contour lines. Contour lines below water are often called bathymetric contour lines. Even though contour lines under water are below the datum plane, they are frequently stated as positive values (e.g., "20 feet below the surface of the lake").
