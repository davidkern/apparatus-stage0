---
name: Three-Dimensional Graph
slug: three-dimensional-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Three-Dimensional (3-D) Graph, pp. 401-406"

intent: Display data using three axes or depth effects to reveal overall patterns, relationships, and the general nature of data that may not be visible in two-dimensional formats
direction: both

components:
  - element: three-axes
    encodes: X, Y, and Z variables positioned in 3D space
    required: true
  - element: projection-type
    encodes: Visual rendering method (oblique, axonometric, or perspective)
    required: true
  - element: data-graphic
    encodes: Visual representation of data (points, columns, lines, areas, surfaces)
    required: true
  - element: frame-elements
    encodes: Floor, walls, ceiling that provide spatial reference
    required: false
  - element: drop-lines
    encodes: Lines from data points to reference surfaces for value estimation
    required: false

parameters:
  projection: "oblique | axonometric | perspective"
  graph_type: "point-scatter | column | line | area | wireframe | surface"
  surface_pattern: "contour-lines | isolines | random-mesh"
  opacity: "transparent | opaque"
  rotation_degrees: "0-360"
  tilt_degrees: "0-90"

related: []

warnings:
  - "Three-dimensional graphs are seldom used for monitoring or controlling"
  - "Almost never used where estimating exact values is required since it is difficult or impossible to determine exact values"
  - "If exact values are needed, note them on the graph or provide a reference table"
  - "Too many surface lines result in solid silhouette; too few cause distortion"
  - "Plotting too few surface lines results in distortion of the data graphic"

extensions:
  harris_entry: "Three-Dimensional (3-D) Graph"
  alternate_names:
    - "stereogram"
    - "3-D graph"
  primary_use: "analytical purposes, looking at general shape or nature of data"
---

## Description

The phrase "three-dimensional graph" is used in two significantly different ways: (1) a graph with the appearance of depth for cosmetic purposes, and (2) a graph with three axes that displays data in ways that simplify overall analysis or provide insights not possible in other formats. Harris's treatment focuses primarily on the three-axis variety.

Three-dimensional graphs are rarely used for precise value determination. Their strength lies in revealing patterns, distributions, relationships, and the overall nature of complex data sets.

## Examples

### Projection Types (p. 401)

Harris identifies three projection/view methods:

1. **Oblique projection**: Generally used with one- and two-axis graphs. Data graphics appear to recede at an angle.

2. **Axonometric projection**: Generally used with three-axis graphs. All axes visible, consistent angle throughout.

3. **Perspective projection**: Generally used for aesthetic purposes. Objects appear smaller as they recede, mimicking natural vision.

### Six Basic Graph Types (p. 402)

Harris shows the same fifteen data points (three data series) displayed using six different three-dimensional graph types:

1. **Point/scatter graph**: Individual data points floating in 3D space
2. **Column graph**: Vertical columns rising from floor
3. **Line graph**: Connected lines (sometimes ribbons) in 3D space
4. **Area graph**: Filled areas showing data series
5. **Wireframe graph**: Surface defined by intersecting lines only
6. **Surface graph**: Solid or shaded surface representation

### Drop Lines (p. 402)

> "When specific data points are plotted, drop lines are sometimes used to help more accurately determine the location and/or value of the points. In other cases drop lines might be used to call the viewer's attention to specific data points or values."

Drop line variations:
- Drop lines to floor
- Drop lines to wall
- Drop lines with line (ribbon) graphs
- Drop lines with circular graphs
- Drop lines with surface graphs
- Multiple drop lines per data point (extending to two or more surfaces)

### Surface Line Patterns (p. 402)

For continuous data on all three axes:

1. **Contour lines**: Connect points with equal values on the vertical (Z) axis
2. **Isolines (X and Y)**: Connect points of equal X and Y values (fishnet pattern)
3. **Random lines**: Optional combination of isolines, contour lines, and diagonal lines (mesh graph)

### Number of Surface Lines (p. 403)

> "The only limitations are that at one extreme, if too many lines are shown, the resulting data graphic is a solid silhouette, while at the other extreme, if too few lines are shown, the data graphic becomes distorted."

Harris illustrates the spectrum from "solid silhouette" (too many) through acceptable ranges to "distorted" (too few).

### Opaque vs. Transparent (p. 403)

> "Sometimes they are left transparent so the viewer can see the nature of the data behind the front surfaces. In other cases the graph becomes too confusing with all of the lines exposed and the areas are made opaque so the front surfaces stand out clearly."

### Color and Shading Uses (p. 403)

Four major reasons for color/shading:
1. Identify and group data graphics belonging to common data series
2. Designate areas with equal values (between isolines or contour lines)
3. Make data graphics more understandable (different colors for top vs. bottom)
4. Improve appearance

### Cross Sections (p. 404)

Three techniques for examining hidden data:

1. **Section removed**: Cut away portion of data graphic to expose inside/underside
2. **Data condensed into planes**: For scatter graphs, condense points along one axis into selected planes (slice graph)
3. **Profiles at selected intervals**: Show volume data as series of area graph cross-sections

### Projections onto Surfaces (p. 404)

> "Projecting the details of a data graphic onto the walls, ceiling, or floor of the graph can provide assistance in its interpretation."

Examples:
- Shadows projected onto walls
- Surfaces projected onto floor
- Contour lines projected onto ceiling
- Projections to identify hidden columns

### Tilt and Rotation (p. 405)

> "The amount and direction of tilt and rotation of a three-dimensional graph displayed in an axonometric view can sometimes improve the viewer's ability to discern key features of the data graphics."

Harris demonstrates five combinations:
- Rotated 70 degrees, Tilted 10 degrees
- Rotated 10 degrees, Tilted 10 degrees
- Rotated 45 degrees, Tilted 25 degrees
- Rotated 70 degrees, Tilted 60 degrees
- Rotated 10 degrees, Tilted 60 degrees

### Width and Depth of Data Graphics (p. 406)

In oblique views, width and depth variations have little effect on readability. In axonometric views, they become more significant - wrong combinations can hide columns entirely.

### Spin or Continuous Rotation (p. 406)

> "This is a technique available only on computer screens. With the spin method, the entire graph can be rotated so the viewer can look at it from almost any angle."

Enables viewing from any of 360 degrees around any of three axes to observe patterns, trends, relationships, distributions, outliers, and anomalies.

## Usage

### When to use three-dimensional graphs
- Exploring overall patterns in complex data
- Showing relationships across three variables
- Analytical purposes where exact values are secondary
- Revealing distributions, peaks, valleys, and clusters

### When NOT to use
- Monitoring or controlling applications
- When exact value estimation is required
- When simpler 2D views would communicate equally well

### Selecting projection type
- **Oblique**: Best for cosmetic depth on 1-2 axis graphs
- **Axonometric**: Best for true 3-axis analytical graphs
- **Perspective**: Best for aesthetic/presentation purposes

### Optimizing tilt and rotation
- Avoid angles close to 0 or 90 degrees (loses 3D benefit)
- Middle ranges (25-45 degree tilt, 30-60 degree rotation) often work well
- Adjust to avoid obscuring important data features
- Consider which peaks or features need to be most visible

### Combining with 2D views (p. 405)

> "Two-dimensional graphs are good at conveying specific values. Three-dimensional graphs are good for depicting the general nature of the data. Using the two in conjunction with one another provides the advantages of both."

## Notes

Harris emphasizes that three-dimensional graphs excel at showing overall data character rather than precise values. The recommendation to combine 3D overview with 2D detail views recognizes that different visual approaches serve different analytical needs. Computer-based spin/rotation capabilities have expanded the analytical value of 3D graphs by allowing interactive exploration from multiple viewpoints.
