---
name: Oblique Projection (View)
slug: oblique-projection-view
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Oblique Projection (View), p. 255"

intent: Create a three-dimensional appearance for charts by shifting back surfaces relative to front surfaces while preserving the shapes and dimensions of front-facing surfaces
direction: construction

components:
  - element: front-surface
    encodes: Primary data-bearing surface; remains unchanged in size, shape, and angles
    required: true
  - element: back-surface
    encodes: Hidden or partially visible surface shifted relative to front; same size and shape as front
    required: true
  - element: artificial-depth
    encodes: Added visual depth connecting front and back surfaces; cosmetic, no data significance
    required: true
  - element: shift-direction
    encodes: Direction back surface is displaced (up, down, left, right)
    required: true

parameters:
  shift_amount: minimal | moderate | significant
  shift_direction: up | down | left | right
  application: graphs | flow-charts | organization-charts | maps | diagrams

related:
  - slug: axonometric-projection-view
    relationship: contrasts
  - slug: perspective-projection-view
    relationship: contrasts

warnings:
  - "The direction of shift affects where scales, grid lines, and tick marks should be positioned"
  - "Some viewers have difficulty determining which plane of the data graphic to read values from"
  - "When shift is to the right, left scale applies to front surfaces; when shift is to the left, right scale applies to front surfaces"
  - "Added depth has no data significance—purely cosmetic"

extensions:
  harris_entry: "Oblique Projection (View)"
  alternate_names:
    - "oblique view"
  typical_use: "improving appearance of charts or displaying a third variable"
  design_notes:
    front_surface: "sizes, shapes, and angles remain unchanged"
    back_surface: "hidden surface shifted with regards to front; same size and shape"
    depth: "optional amount; has no data significance"
  advantages_over_axonometric:
    - "front surfaces retain true shapes"
    - "text or graphics on front surfaces are not distorted"
---

## Description

Oblique projection is a technique for giving charts a three-dimensional appearance. In the oblique view, surfaces parallel to the plane of the paper are shifted slightly with respect to one another, while the shapes and dimensions of these surfaces do not change.

Since a true two-dimensional object (such as a column on a graph) has only one surface, artificial depth must be added to give the appearance of shifting the back portions. This added depth generally has no significance other than cosmetic. The shifting can occur in any direction and, within reason, can be any amount without affecting the readability of the chart, since the front surfaces remain unchanged.

The process is the equivalent of exposing or adding a top or bottom plus a side to the object.

## Examples

Harris illustrates (p. 255):

> "The sizes, shapes, and angles of the front surfaces (in black) are unchanged in oblique views."

Comparison diagrams show:
- Standard two-dimensional graph for reference
- Two oblique views with different amounts of shift between front and back
- Back planes shifted up vs. down with respect to front planes

Effect on scale positioning:
- When back planes/surfaces are shifted to the right with respect to front planes/surfaces, the scales on the left of the graphs apply to the front surfaces
- When back planes/surfaces are shifted to the left with respect to front planes/surfaces, the scales on the right of the graphs apply to the front surfaces

Additional applications shown:
- Organization chart using oblique views of enclosures
- Graph with data on all three axes (though axonometric view is more common for this)

## Usage

**When to use:**
- To improve appearance of charts
- To display a third variable that cannot be readily shown in two dimensions
- When preserving front surface shapes is important (advantage over axonometric)

**Reading accuracy:**
To improve the accuracy of reading a graph with an oblique view, Harris recommends:
- Use grid lines
- Use two vertical scales
- Be aware that viewers may have difficulty determining which plane to read from

**Beyond graphs:**
Oblique views are also used with:
- Flow charts
- Diagrams
- Maps
- How-to charts
- Organization charts

For these applications, the primary reason is aesthetic value. Oblique views have the advantage that front surfaces retain their true shapes, so text or graphics on the surfaces are not distorted.

## Notes

See Axonometric Projection for comparison of the two major projection techniques. Axonometric projection is more often used with three-axis graphs, while oblique projection preserves front surface shapes better for objects with text or graphics.
