---
name: Three-Dimensional Scatter Graph
slug: three-dimensional-scatter-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Point Graph and Scatter Graph, Three-dimensional scatter graph, p. 291"

intent: Explore relationships among three quantitative variables by plotting data points in a three-axis coordinate system
direction: both

components:
  - element: x-axis
    encodes: First quantitative variable
    required: true
  - element: y-axis
    encodes: Second quantitative variable
    required: true
  - element: z-axis
    encodes: Third quantitative variable
    required: true
  - element: data-points
    encodes: Individual observations positioned in 3D space
    required: true
  - element: drop-lines
    encodes: Lines from points to axes/planes aiding value reading
    required: false

parameters:
  coordinate_system: "rectangular (XYZ) | cylindrical | spherical"
  viewing_angle: "fixed | rotatable"
  analysis_planes: "none | reference-plane | slice-planes"

related:
  - slug: scatter-graph
    relationship: variant-of

warnings:
  - "Exact values are difficult to read on three-dimensional graphs"
  - "Static 3D views may hide patterns visible from other angles"
  - "Requires interactive rotation for full exploration"

extensions:
  harris_entry: "Point Graph and Scatter Graph"
  alternate_names: ["XYZ graph", "XYZ scatter graph", "3D scatterplot"]
  typical_use: "observing patterns, distribution, and outliers in three-variable data"
  enhancement_techniques:
    - "rotation/spinning"
    - "brushing (identifying specific points)"
    - "slice graphs (projecting onto planes)"
    - "drop lines"
---

## Description

Three-dimensional scatter graphs generally have quantitative scales on all three axes. They extend the two-dimensional scatter graph to explore relationships among three variables simultaneously. The data points form what is sometimes called a "cloud" in the three-dimensional space.

The rectangular variation (XYZ graph) is most common. Polar variations are referred to as cylindrical or spherical scatter graphs.

Exact values are difficult to read on three-dimensional graphs, but this is frequently not a problem since they are primarily used to observe general patterns, data distribution, and unusual data points.

## Examples

Harris illustrates several variations (p. 291):

**Standard rectangular scatter graph:**
Shows a cube-like coordinate system with X, Y, and Z axes, with data points distributed as a cloud within the space.

**Axis scatter graph:**
> "When a reference plane passes through the cluster of data points (sometimes referred to as a cloud), the figure is sometimes called an axis scatter graph."

**Cylindrical polar scatter graph:**
Shows angular position (0-360 degrees), radial distance, and vertical position as the three coordinates, with drop lines from points to the base.

**Slice graph technique:**
> "Another technique to assist in the analysis of three-dimensional scatter graphs is to pass imaginary planes through the cloud of data points and observe the patterns on the planes."

Data points are condensed onto three perpendicular planes, creating projections that show the XY, XZ, and YZ relationships.

## Usage

**Primary uses:**
- Detecting three-way relationships
- Identifying clusters in multivariate data
- Finding outliers in 3D space
- Understanding data distribution across three dimensions

**Enhancement techniques:**

*Rotation/spinning:*
Enables viewing the data cloud from multiple angles to reveal patterns hidden in any single view.

*Brushing:*
Allows identifying and highlighting specific data points or groups of points interactively.

*Slice graphs:*
Pass imaginary planes through the cloud and observe patterns on those planes. Points near the plane can be condensed onto it.

*Drop lines:*
Lines from data points to axes or planes help viewers estimate values on two axes, though the third axis remains difficult.

**Coordinate system variations:**
- Rectangular (XYZ): Most common, three perpendicular axes
- Cylindrical: Angle + radius + height
- Spherical: Two angles + radius

## Notes

Harris acknowledges the fundamental limitation: "Exact values are difficult to read on three-dimensional graphs." The value of 3D scatter graphs lies in pattern perception rather than precise data reading.

The techniques Harris describes - rotation, brushing, and slicing - are all methods to overcome the limitations of static 3D visualization. Modern interactive software makes these techniques practical, transforming 3D scatter graphs from curiosities into useful analytical tools.
