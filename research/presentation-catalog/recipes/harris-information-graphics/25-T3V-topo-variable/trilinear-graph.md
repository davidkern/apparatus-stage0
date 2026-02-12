---
name: Trilinear Graph
slug: trilinear-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Trilinear Graph, pp. 423-425"

intent: Plot data with three variables whose values always sum to the same total (typically 100%) using an equilateral triangle
direction: both

components:
  - element: equilateral-triangle
    encodes: The plot area with three vertices representing 100% of each variable
    required: true
  - element: altitude-scales
    encodes: Three scales from each vertex to opposite base (0% at base, 100% at vertex)
    required: true
  - element: grid-lines
    encodes: Lines parallel to each base allowing value estimation
    required: false
  - element: data-points
    encodes: Plotted positions representing the three-variable composition
    required: true

parameters:
  scale_location: "altitudes or sides"
  scale_direction: "clockwise or counterclockwise"
  total_value: "100% or 1 or other constant"

related: []

warnings:
  - "Only two of the three values are needed to plot a point; the third occurs automatically"
  - "When scales are on sides, care must be taken to relate labels to correct grid lines"
  - "When titles are at vertices, it can be difficult to determine which axis they apply to"
  - "There are no three-dimensional trilinear graphs in general use"

extensions:
  harris_entry: "Trilinear Graph"
  alternate_names: ["triangle graph", "triangular graph", "ternary graph"]
  typical_use: "showing composition of mixtures, alloys, or any three-component system summing to 100%"
---

## Description

Trilinear graphs (also called triangle, triangular, or ternary graphs) are used to plot information that has three variables whose total always equals the same amount, typically 1 or 100%. A typical example is the percent of material, labor, and overhead in the total cost of a product. Different products have different percentages of the three elements, but the percentages always add to 100%.

The graph consists of an equilateral triangle (all three sides of equal length) with each line from a vertex to the opposite base (called an altitude) representing one of the three variables. Scales are distributed along the altitudes with zero at the base and 100% at the vertex.

To prevent scales and labels from interfering with data points, the scales are sometimes projected to the sides of the triangle rather than displayed on the altitudes. This is done by drawing grid lines parallel to the base. Each altitude scale can be transferred to one of two sides, resulting in scales that increase either clockwise or counterclockwise around the triangle.

## Examples

Harris provides extensive illustration of trilinear graph construction and use (pp. 423-425):

> "Trilinear graphs are the only triangular-shaped graphs in popular use today. They are used to plot information that has three variables, the total of which always equals the same amount. That amount can be any value; however, it is generally 1 or 100%." (p. 423)

Key construction details:
- Basic layout with scales on altitudes (p. 423)
- Process for projecting scales to sides (p. 423)
- Clockwise vs. counterclockwise scale arrangements (p. 423)
- Comparison of grid lines vs. drop lines for reading values (p. 424)

> "Although each data point represents three values, only two are required to plot the data point. For example, if a data element has the values of 20%, 30%, and 50%, the 20% and 30% values will accurately locate the point and the 50% occurs automatically." (p. 425)

Multiple applications shown:
- Tracking values over time with connected points (p. 424)
- Multiple data series with different symbols (p. 424)
- Isolines showing combinations yielding equal results (p. 424)
- Quality control with specification limits (p. 425)
- Non-percentage scales (e.g., personality evaluation from 0-5) (p. 425)

## Usage

Trilinear graphs are appropriate when:
- Exactly three variables are involved
- The three variables always sum to the same total
- The composition or mixture relationship is the primary interest
- Comparing multiple samples or tracking changes over time

Construction guidelines:
1. Draw an equilateral triangle
2. Establish scales on altitudes (0% at base, 100% at vertex) or project to sides
3. If using side scales, choose clockwise or counterclockwise consistently
4. Add grid lines or be prepared to use drop lines for reading
5. Plot data points using any two of the three values (third is automatic)
6. Use different symbols for multiple data series
7. Connect points with lines to show time progression if relevant

Scale and grid considerations:
- Scales on altitudes are easier to interpret but can clutter the data area
- Scales on sides are less confusing but require care in label placement
- Drop lines (perpendicular to altitudes, parallel to bases) aid value estimation
- Tick marks, tilted labels, or labels on grid lines help associate labels with correct scales

Special applications:
- **Monitoring**: Add tolerance or specification areas; plot periodic data to check conformance
- **Isolines**: Show combinations yielding equal results (e.g., alloy compositions with same strength)
- **Time tracking**: Connect successive readings to show drift or trends

## Notes

Trilinear graphs can use any consistent scale values, not just percentages. Harris shows an example where candidates are rated 0-5 on three dimensions (people, things, ideas) with the constraint that ratings must sum to 5.

The technique of needing only two values to plot a point (with the third automatic) is a key characteristic. This is because any point in the triangle automatically satisfies the constraint that all three values sum to the total.
