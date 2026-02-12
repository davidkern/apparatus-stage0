---
name: Proportional Volume Chart
slug: proportional-volume-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Proportional Chart, Proportional volume chart, p. 314"

intent: Compare values using three-dimensional data graphics whose volumes are proportional to the values they represent, providing visual impressions of relative magnitude
direction: both

components:
  - element: volume-scaled-shapes
    encodes: Three-dimensional shapes (cubes, spheres, cylinders) with volumes proportional to values
    required: true
  - element: numeric-labels
    encodes: Actual values (essential since volume differences are very hard to estimate)
    required: true
  - element: descriptive-labels
    encodes: Names or categories for each data graphic
    required: true

parameters:
  shape: cube | sphere | cylinder | irregular-3d
  arrangement: side-by-side | stacked | nested
  perspective: oblique | axonometric | perspective

related:
  - slug: proportional-chart
    relationship: contained-by
  - slug: proportional-area-chart
    relationship: contrasts

warnings:
  - "Proportional volume charts are difficult to interpret and generally used only for aesthetic purposes"
  - "Viewers significantly underestimate volume differences; numeric labels are essential"
  - "Even with labels, viewers may misinterpret the visual comparison"
  - "Reserve for situations where values vary dramatically and general impression suffices"

extensions:
  harris_entry: "Proportional Chart"
  typical_use: "Aesthetic purposes, dramatic visual comparisons when values differ greatly, giving general impressions rather than precise comparisons"
  readability_note: "Viewers estimate linear differences better than area or volume; volume encoding is hardest to decode"
  rare_variant: "Occasionally three dimensions of a data graphic each represent a different variable, but this is seldom used"
---

## Description

Proportional volume charts use the volume of data graphics to convey information about the relative sizes of the data elements they represent. For example, if data element B is twice as big as data element A, the volume of the data graphic representing element B will be twice as large as the volume of the data graphic for A.

Proportional volume charts are difficult to interpret and therefore are generally used only for aesthetic purposes or to give a general impression when values vary significantly. They represent the most challenging type of proportional encoding for viewers to decode accurately.

## Examples

Harris illustrates volume chart arrangements (p. 314):

**Side-by-side arrangement:**
> Three 3D rectangular blocks of different sizes displayed next to each other, labeled with values $342, $150, $58, $15.

**Nested arrangement:**
> Three 3D rectangular blocks nested inside each other (like Russian dolls), with the largest containing the medium, which contains the smallest.

**Rare multi-variable variant:**
> "On rare occasions an effort is made to quantify variables on all three sides of the data graphics." Harris shows an example where Variable #1, Variable #2, Variable #3, and Variable #4 are each mapped to different dimensions of the 3D shape.

This multi-variable approach is "seldom-used" because it is extremely difficult to interpret.

**Effect on readability (p. 314):**
Harris demonstrates that when one 3D column has twice the volume of another, viewers find it much harder to perceive the 2:1 ratio compared to:
- Two-dimensional columns where only height varies (easiest)
- Squares where area doubles (moderate difficulty)
- Circles where area doubles (moderate difficulty)
- Three-dimensional columns where volume doubles (hardest)

## Usage

**When to use:**
- When values vary dramatically (orders of magnitude)
- Aesthetic or attention-grabbing presentations
- When precise comparison is not the goal
- Infographics where visual impact trumps accuracy

**When NOT to use:**
- Analytical purposes
- When accurate comparison matters
- Technical or scientific presentations
- When values are relatively close in magnitude

**Design requirements:**
- Always include numeric values
- Use simple 3D shapes (cubes, rectangular blocks)
- Ensure values are clearly associated with their shapes
- Consider whether 2D area or 1D length encoding would serve better

**Arrangement options:**
- **Side-by-side:** Standard comparison layout
- **Stacked:** Shapes stacked vertically
- **Nested:** Smaller shapes inside larger ones

## Notes

Harris emphasizes the difficulty of volume perception (p. 314):
> "Since viewers tend to estimate linear differences (changes) in lengths better than differences in areas or volumes or nonlinear changes in any dimension, varying the size of data graphic linearly in only one direction can be helpful to the viewer in decoding a proportional chart."

The three-dimensional column comparison shows that volume encoding produces the largest perceptual errors. This is why proportional volume charts are relegated to aesthetic and communication contexts where the general impression ("this is much bigger than that") matters more than precise ratio estimation.

When "depth" is added to a proportional area chart purely for aesthetic purposes (with uniform depth across all data graphics), the chart remains an area chart, not a volume chart, since only the front face area encodes data values.
