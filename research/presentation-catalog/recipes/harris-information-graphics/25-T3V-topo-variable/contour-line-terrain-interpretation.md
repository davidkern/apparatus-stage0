---
name: Contour Line Terrain Interpretation
slug: contour-line-terrain-interpretation
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Topographic Map, p. 420"

intent: Decode terrain features from the spacing and shape of contour lines on a topographic map
direction: recognition

components:
  - element: line-spacing
    encodes: Slope steepness (close together = steep, far apart = gentle)
    required: true
  - element: closed-contours
    encodes: Hills (values increasing inward) or depressions (values decreasing inward)
    required: false
  - element: u-shaped-contours
    encodes: Ridges (U points to lower elevation) or valleys (U points to higher elevation)
    required: false
  - element: depression-marks
    encodes: Short tick marks on inside of contour lines pointing to depression center
    required: false

parameters:
  terrain_feature: "slope or hill or depression or ridge or valley or cliff"

related: []

warnings:
  - "Depressions and hills both show as closed contours; look for tick marks or elevation values to distinguish"
  - "Very close lines may indicate a cliff, which may be impassable"
---

## Description

Contour lines communicate terrain information not just through their elevation labels but through their spacing and shape. This recognition technique allows readers to quickly assess terrain features by examining the graphic patterns of contour lines without reading every elevation value.

Harris identifies several key patterns for terrain interpretation:

1. **Slope steepness from spacing**: Lines closer together indicate steeper slopes. Lines further apart indicate gentler slopes. Lines very close together may indicate a cliff.

2. **Hills and depressions from closed contours**: Closed contour lines (forming complete loops) represent either hills or depressions. The lengths of closed contour lines become progressively shorter as they approach the top of a hill or the bottom of a depression.

3. **Ridges and valleys from U-shaped contours**: U-shaped contour lines pointing toward lower elevations represent ridges. U-shaped contour lines pointing toward higher elevations represent valleys.

4. **Depression indicators**: Depressions or holes are sometimes differentiated from hills by the addition of short lines (tick marks) on the inside of the contour lines pointing toward the center of the depression.

## Examples

Harris provides annotated diagrams showing how contour patterns indicate terrain features (p. 420):

> "Lines further apart indicate gentler slopes." (p. 420)

> "Closed contour lines represent hills or depressions. The lengths of the closed contour lines become progressively shorter the closer they get to the top of the hill or the bottom of the depression." (p. 420)

> "U shaped contour lines pointing to lower elevations represent ridges" (p. 420)

> "U shaped contour lines pointing to higher elevations represent valleys" (p. 420)

> "Lines closer together indicate a steeper slope or, if very close together, a cliff." (p. 420)

> "Depressions or holes are sometimes differentiated from hills by the addition of short lines on the inside of the contour lines pointing to the center of the depression." (p. 420)

## Usage

This recognition technique is used when:
- Reading topographic maps for navigation or planning
- Quickly assessing terrain without reading individual elevation values
- Identifying obstacles (cliffs, depressions) or routes (valleys, ridges)
- Understanding drainage patterns and water flow

Recognition process:
1. **Assess overall spacing**: Identify areas of steep terrain (closely spaced lines) versus gentle terrain (widely spaced lines)
2. **Find closed contours**: Locate complete loops and determine if they represent hills (values increase inward) or depressions (values decrease inward, often marked with tick marks)
3. **Trace U-shaped patterns**: Follow contour bends to identify ridges (U points downhill) and valleys (U points uphill)
4. **Note extremes**: Very close lines indicate cliffs or steep terrain that may be impassable

## Notes

This is fundamentally a recognition technique. While the same principles apply to constructing accurate contour maps from survey data, the primary value is in reading existing maps.

The ability to quickly decode terrain from contour patterns is essential for anyone using topographic maps for navigation, land use planning, or outdoor activities. The patterns become intuitive with practice.
