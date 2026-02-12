---
name: Perspective Projection (View)
slug: perspective-projection-view
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Perspective Projection (View), pp. 273-274"

intent: Create a three-dimensional appearance that simulates how the human eye perceives depth, with distant objects appearing smaller and parallel lines converging toward vanishing points
direction: construction

components:
  - element: vanishing-points
    encodes: Points where parallel lines appear to converge in the distance
    required: true
  - element: converging-lines
    encodes: Lines drawn as though they meet at vanishing points
    required: true
  - element: object-surfaces
    encodes: Faces of objects, possibly distorted by perspective
    required: true

parameters:
  perspective_type: single-point | two-point | three-point
  vanishing_point_location: variable (angle and distance from object)

related:
  - slug: oblique-projection-view
    relationship: contrasts
  - slug: axonometric-projection-view
    relationship: contrasts

warnings:
  - "Perspective views can distort graphs enough to mislead viewers"
  - "A column for a larger value may appear smaller than one for a smaller value due to perspective"
  - "Perspective is used primarily for appearance, but can reduce data legibility"

extensions:
  harris_entry: "Perspective Projection (View)"
  typical_use: "improving appearance of charts or simulating natural depth perception"
  perspective_types:
    single_point: "one set of parallel lines converges; others remain parallel"
    two_point: "two sets of parallel lines converge at two different points"
    three_point: "all three sets of parallel lines converge at three different points; greatest distortion"
  concerns:
    distortion: "can make larger values appear smaller than smaller values"
    misleading: "viewers may draw incorrect conclusions without careful attention to grid lines"
---

## Description

When an object is drawn in perspective it tends to simulate one aspect of how the human eye sees objects. That is, the further things are from the viewer, the smaller they appear and the more lines seem to converge into a single point (called vanishing point).

The technique is used with some objects to improve the viewer's understanding. In many cases, particularly with graphs, perspective is used primarily to improve appearance.

Perspective can be used with two- or three-dimensional objects. With charts and graphs it is most frequently used with three-dimensional objects. Which view to use in a particular situation is mostly a matter of personal preference.

## Examples

Harris illustrates three perspective types (p. 273):

**Single-point perspective:**
- One set of normally parallel lines on an object is drawn as though they converge at some point in the distance
- All other sets of parallel lines remain parallel
- Shown with oblique view of 2D object, oblique view of 3D object, and axonometric view of 3D object

**Two-point perspective:**
- Two sets of normally parallel lines on an object are drawn as though they converge at two different points in the distance
- Other sets of parallel lines remain parallel
- All surfaces are somewhat distorted
- Shown with axonometric views of 2D and 3D objects

**Three-point perspective:**
- All three sets of normally parallel lines on an object are drawn as though they converge at three different points in the distance
- All surfaces are somewhat distorted
- This view causes the greatest amount of distortion in the surfaces of objects

**Vanishing point location (p. 274):**
Five variations of the same object shown with vanishing points at various angles and distances. In each example, the front surface is identical in size and shape, but the overall appearance differs dramatically.

**Concerns with perspective projections (p. 274):**
> "The use of perspective views with graphs has been widely discussed and in many cases criticized. The major reason for the criticism is the distortion that perspective views introduce, particularly to graphs."

Example showing potential for misinterpretation:
- Expenses from 1985 to 1992 increased from $57 to $73 (28% increase)
- Because graph is drawn in perspective, the column for 1992 is actually smaller than the column for 1985
- Viewers might erroneously conclude expenses went down when they actually went up

## Usage

**When to use:**
- When aesthetic appeal is important and data precision is secondary
- When the three-dimensional effect aids understanding of spatial relationships

**When to avoid:**
- When accurate data reading is critical
- When subtle differences in values matter
- When there is risk of misinterpretation

**Perspective type selection:**
- Single-point: Least distortion, front surfaces unchanged
- Two-point: Moderate distortion, all surfaces somewhat affected
- Three-point: Maximum distortion, most dramatic visual effect

## Notes

The criticism of perspective in data graphics centers on the distortion it introduces. While perspective may improve appearance, it can seriously compromise the viewer's ability to accurately read values from the graph. Harris's example of expenses (p. 274) demonstrates how perspective can make an increase appear to be a decrease.
