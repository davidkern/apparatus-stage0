---
name: Three-Dimensional Polar Graph
slug: three-dimensional-polar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Polar Coordinate and Polar Graph, Three-dimensional polar graphs, pp. 299-300"

intent: Display data varying by angle and a third dimension (height or second angle) using cylindrical or spherical coordinate systems
direction: both

components:
  - element: z-axis
    encodes: Third dimension perpendicular to the polar plane (cylindrical) or vertical reference (spherical)
    required: true
  - element: radial-coordinate
    encodes: Distance from the origin or Z-axis
    required: true
  - element: angular-coordinate
    encodes: Angle with respect to a reference axis (one for cylindrical, two for spherical)
    required: true
  - element: drop-lines
    encodes: Vertical lines from data points to a reference surface to aid depth perception
    required: false
  - element: origin
    encodes: Center point where all coordinate axes meet
    required: true

parameters:
  coordinate_system: cylindrical | spherical
  drop_lines: present | absent
  projection_type: oblique | axonometric | perspective

related:
  - slug: polar-graph
    relationship: variant-of
  - slug: three-dimensional-scatter-graph
    relationship: combines-with

warnings:
  - "Three-dimensional polar graphs are difficult to read and interpret"
  - "Drop lines are often necessary to help viewers judge data point positions"
  - "Limited to technical applications where 3D polar representation is natural"

extensions:
  harris_entry: "Polar Coordinate and Polar Graph and Polar Scale"
  coordinate_systems:
    cylindrical:
      description: "Two coordinates plotted as in 2D polar graph, third dimension along Z-axis"
      coordinates: ["radial distance (r)", "polar angle (theta)", "height (z)"]
    spherical:
      description: "Distance from origin plus two angular coordinates"
      coordinates: ["radial distance (r)", "angle from Z-axis (phi)", "angle from reference axis (theta)"]
  typical_use: "Measuring directional phenomena at multiple heights or depths, such as light intensity at various angles around and above/below a source"
---

## Description

Three-dimensional polar graphs extend the two-dimensional polar graph by adding a third coordinate dimension. They are occasionally used in technical applications where data varies both by angle and by a third dimension such as height or a second angular coordinate.

There are two types of three-dimensional polar graphs:

**Cylindrical:** Two of the coordinates are plotted just as in a two-dimensional polar graph (radial distance and angle in the horizontal plane). The third dimension is plotted along the Z-axis (vertical). This is useful for data that varies by horizontal direction and height.

**Spherical:** One coordinate is the straight-line distance from the origin to the data point. The second coordinate is an angle with respect to the vertical Z-axis. The third coordinate is an angle with respect to a zero reference axis perpendicular to the Z-axis. This is useful for data that varies in all directions in three-dimensional space.

## Examples

Harris describes a practical application (p. 299):
> For example, in addition to measuring the light intensity from a lamp at each of the 360 degrees around it, the intensity of light given off by the lamp might also be measured at different heights.

Harris illustrates both coordinate systems (p. 300):
- **Cylindrical polar graph:** Shows coordinate system with radial distance and angle in the horizontal plane, plus vertical Z-axis. Data points are located by (r, theta, z).
- **Spherical polar graph:** Shows coordinate system where data points are located by distance from origin (r) plus two angles (phi for angle from Z-axis, theta for angle in horizontal plane).

**Drop lines for readability (p. 300):**
> Because of the difficulty of reading three-dimensional polar graphs, drop lines are sometimes used to assist the viewer.

Harris shows an example of a three-dimensional polar graph with drop lines, where vertical lines connect data points to a reference surface, making it easier to judge the position of each point.

## Usage

**When to use:**
- Data that varies by direction and height/depth
- Radiation patterns in 3D space
- Technical measurements with natural spherical or cylindrical symmetry
- Scientific visualizations of directional phenomena

**When NOT to use:**
- When 2D polar graphs would suffice
- For general business or presentation purposes
- When precise value reading is required
- When audience is unfamiliar with 3D polar coordinates

**Design considerations:**
- Always include drop lines to aid interpretation
- Choose cylindrical vs. spherical based on the natural coordinate system of the data
- Consider whether multiple 2D polar graphs at different heights might be clearer
- Use appropriate projection (oblique, axonometric, or perspective) for clarity

## Notes

Three-dimensional polar graphs are considerably more difficult to interpret than two-dimensional polar graphs. They are primarily used in technical and scientific contexts where the data naturally exists in three-dimensional polar coordinates, such as antenna radiation patterns, acoustic measurements, or physical field distributions.

For most applications where data varies in two dimensions plus a third factor, alternative representations such as multiple 2D polar graphs (one per level) or color-coded 2D polar graphs may be more effective.
