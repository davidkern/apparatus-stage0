---
name: Radar Graph
slug: radar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Polar Graph, Polygon, Polygon Icon, pp. 300, 309"

intent: Compare multiple variables for one or more entities by plotting values on radial axes emanating from a center point and connecting them to form a polygon shape
direction: both

components:
  - element: radial-axes
    encodes: Multiple axes (typically 3 or more) radiating from center, each representing a different variable
    required: true
  - element: value-scales
    encodes: Scale on each radial axis; typically uniform across all axes but can vary
    required: true
  - element: polygon-outline
    encodes: Lines connecting adjacent data points to form a closed shape; shape profile indicates relative strengths
    required: true
  - element: center-point
    encodes: Common origin for all axes; typically represents zero or minimum value
    required: true
  - element: circular-or-polygonal-grid
    encodes: Reference lines at regular intervals along radial axes; may be circular or connect across axes
    required: false
  - element: axis-labels
    encodes: Names of variables represented by each radial axis
    required: true

parameters:
  number_of_axes: "3 or more (equal angular spacing typical)"
  axis_arrangement: "equally spaced | custom spacing"
  scale_type: "uniform across axes | variable by axis"
  fill: "outline only | filled polygon | partially filled"
  multiple_series: "overlaid | separated"

related:
  - slug: polar-graph
    relationship: variant-of
  - slug: profile-icon
    relationship: variant-of
  - slug: parallel-coordinate-graph
    relationship: contrasts

warnings:
  - "The order of axes affects the polygon shape; reordering variables changes visual appearance without changing data"
  - "Comparing areas between polygons can be misleading as area depends on axis order"
  - "Too many axes (more than 10-12) make the graph difficult to read"
  - "Different scales on different axes make comparisons across variables problematic"

extensions:
  harris_entry: "Polar Graph, Polygon"
  alternate_names:
    - "spider graph"
    - "spider chart"
    - "star graph"
    - "star chart"
    - "web chart"
    - "kiviat diagram"
    - "polygon graph"
  typical_use: "Comparing multiple performance metrics, multivariate profiles, skill assessments, product comparisons across multiple attributes"
  icon_variant:
    name: "polygon icon"
    alternate_names: ["snowflake icon", "star icon", "profile icon"]
    description: "Miniature radar graph without titles, labels, tick marks, or grid lines used as a symbol to compare entities"
---

## Description

A radar graph (also called spider, star, or web chart) is a variation of the polar graph where multiple axes radiate from a center point, each representing a different variable. Data values for each variable are plotted along their respective axes, and adjacent points are connected with lines to form a closed polygon.

The shape of the resulting polygon provides a visual profile of the entity being measured. When connected data points form a closed curve, the figure is sometimes called a polygon. This polygon shape allows quick visual comparison of strengths and weaknesses across multiple dimensions.

Multiple entities can be compared by plotting their polygons on the same graph using different colors or line styles.

## Examples

Harris shows a radar graph with nutritional content (p. 300):
> A radar graph displaying percentages for Protein (25%), Vitamin A (45%), Niacin (50%), Thiamin (35%), and Vitamin C (25%). The connected data points form a closed polygon that visually summarizes the nutritional profile.

**Polygon icon variant (pp. 300, 309):**
> Miniature graphs, frequently without titles, labels, tick marks, or grid lines, are sometimes called icons. The polygon icon has several names including snowflake, polygon, star, and profile. It is sometimes generated using a radar graph.

Harris notes the purpose of such icons:
> "The purpose of icons is not to convey specific quantitative information. Instead, they are used as symbols to compare multiple entities with regards to three or more variables."

## Usage

**When to use:**
- Comparing multiple variables for one or more entities
- Creating visual profiles of performance, skills, or characteristics
- When the overall "shape" of the data is informative
- Displaying multivariate data in an intuitive format

**When NOT to use:**
- When precise comparisons are needed (bar graphs are more accurate)
- When variables have vastly different scales that cannot be normalized
- When there are too many variables (more than 10-12 becomes cluttered)
- When axis order might mislead (area comparisons are sensitive to order)

**Design considerations:**
- Arrange axes with related variables adjacent to each other
- Use consistent scales across axes when possible
- For multiple series, use distinct colors or patterns
- Consider whether to fill the polygon or use outline only

**As icons:**
Profile icons (miniature radar graphs) are useful for:
- Comparing many entities at a glance
- Embedding in maps or tables
- Quick visual pattern recognition

## Notes

The polygon formed by a radar graph is sometimes confused with other uses of "polygon" in graphics:
- Map polygons: Closed outlines around areas on maps (countries, states)
- Frequency polygon: Line connecting tops of histogram columns

When used as a small icon without labels, the radar graph becomes a profile icon that represents a data pattern as a distinctive shape, useful for comparing many entities quickly.
