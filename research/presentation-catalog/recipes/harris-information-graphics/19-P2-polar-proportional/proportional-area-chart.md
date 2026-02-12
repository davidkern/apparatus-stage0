---
name: Proportional Area Chart
slug: proportional-area-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Proportional Chart, Proportional area chart, pp. 312-314"

intent: Compare values using data graphics whose areas are proportional to the values they represent, enabling rapid visual assessment of relative sizes
direction: both

components:
  - element: area-scaled-shapes
    encodes: Geometric or irregular shapes with areas proportional to values
    required: true
  - element: numeric-labels
    encodes: Actual values since area differences are hard to estimate precisely
    required: false
  - element: descriptive-labels
    encodes: Names or categories for each data graphic
    required: true

parameters:
  shape: column | bar | square | circle | triangle | irregular
  arrangement: simple | overlapped | stacked | centered | percent-of-whole
  fill: solid | patterned | colored
  depth_effect: none | oblique-3d

related:
  - slug: proportional-chart
    relationship: contained-by
  - slug: proportional-volume-chart
    relationship: contrasts
  - slug: pie-chart
    relationship: variant-of
  - slug: bubble-graph
    relationship: variant-of

warnings:
  - "Viewers underestimate differences in area compared to length; large values may appear less dominant than they are"
  - "Circles and squares are harder to compare accurately than bars of varying length"
  - "When depth is added for aesthetics (oblique view), ensure it does not mislead viewers about actual values"
  - "Include numeric values since area estimation is imprecise"

extensions:
  harris_entry: "Proportional Chart"
  shape_examples:
    column: "Vertical rectangles, simple or overlapped or stacked"
    bar: "Horizontal rectangles, simple or overlapped"
    square: "Squares of varying size, simple or overlapped or centered"
    circle: "Circles of varying size, simple or overlapped; pie chart for percent-of-whole"
    triangle: "Triangles of varying size, simple or overlapped or centered"
    irregular: "Pictures, icons, or map shapes with proportional areas"
  typical_use: "Comparing relative sizes, market shares, population differences, budget allocations"
  oblique_note: "Adding depth for 3D appearance does not change classification to volume chart if depth is uniform and cosmetic only"
---

## Description

A proportional area chart uses the area of data graphics to convey information about the relative sizes of the data elements they represent. If data element B is twice as big as data element A, the area of the data graphic representing B will be twice the area of that representing A.

Proportional area charts are among the most widely used forms of proportional charts, with circles (including pie charts) and squares being particularly common. They provide strong visual impact for communication purposes while requiring numeric labels for precise interpretation.

## Examples

Harris presents an extensive table of geometric shapes and configurations (p. 313):

**Column shapes:**
- Simple: Three columns of different heights side-by-side (values 35, 28, 10)
- Overlapped: Same columns overlapping each other
- Percent of whole (stacked): Segments showing 14%, 38%, 48%
- Stacked and linked: Connected segments showing percentages (41%, 20%, 50%, 39%, 29%, 21%)

**Bar shapes:**
- Simple: Three horizontal bars of different lengths
- Overlapped: Bars overlapping
- Percent of whole (stacked): Horizontal segments showing 14%, 48%, 38%
- Stacked and linked: Connected bar segments

**Square shapes:**
- Simple: Three squares of different sizes side-by-side
- Overlapped: Squares overlapping
- Percent of whole (divided rectangle): Rectangle divided showing 14%, 38%, 48%
- Centered: Nested squares centered on each other
- Stacked: Squares stacked vertically

**Circle shapes:**
- Simple: Three circles of different sizes
- Overlapped: Circles overlapping
- Percent of whole (pie chart): Traditional pie chart with 14%, 38%, 48%
- Percent of whole (donut): Ring chart with center removed
- Centered: Nested circles

**Triangle shapes:**
- Simple, overlapped, percent of whole, centered variations

**Irregular shapes:**
- Pictorial representations (maps, icons) with proportional areas

## Usage

**When to use:**
- Comparing relative sizes across a small number of items
- Presentation contexts where visual impact matters
- Showing parts of a whole (circles/pie charts work well)
- Geographic comparisons using map shapes

**When NOT to use:**
- When precise comparisons are critical
- Large numbers of items (becomes cluttered)
- Analytical work requiring accurate decoding

**Shape selection:**
- **Circles:** Most common; good for percent-of-whole; hard to compare precisely
- **Squares:** Easy to construct; compare more easily than circles
- **Rectangles/bars:** When only height varies, easiest to decode
- **Irregular shapes:** For visual interest; hardest to decode accurately

**Oblique (3D) views (p. 314):**
> "To improve the appearance of a proportional chart it is often shown in an oblique view, which makes it look three-dimensional. Oblique views of area charts do not reclassify them as proportional volume charts."

Harris illustrates that adding uniform depth for aesthetic purposes maintains the chart as an area chart since only the front face areas encode data.

## Notes

**Effect of shape on readability (p. 314):**
> "Since viewers tend to estimate linear differences (changes) in lengths better than differences in areas or volumes or nonlinear changes in any dimension, varying the size of data graphic linearly in only one direction can be helpful to the viewer in decoding a proportional chart."

Harris shows that when comparing shapes where one has twice the area of another:
- Two-dimensional columns (height varies, width constant): Easiest to judge ratio
- Squares (both dimensions vary): Harder to judge
- Circles (diameter varies): Similar difficulty to squares
- Three-dimensional columns (volume doubles): Most difficult

This supports preferring bar/column charts when accurate decoding matters, reserving circles and other area-based shapes for contexts where visual impression is paramount.
