---
name: Volume Chart
slug: volume-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Volume Chart, p. 437"

intent: Use three-dimensional volume of data graphics to convey relative sizes of data elements
direction: both

components:
  - element: volume-graphics
    encodes: Data values through 3D volume (proportional sizing)
    required: true
  - element: labels
    encodes: Data element identifiers and values
    required: true

parameters:
  arrangement: side-by-side | stacked | nested
  shape: cubes | spheres | other-3d-shapes

related: []  # TBD: area-proportional-chart, proportional-symbol

warnings:
  - "Volume charts are difficult to interpret"
  - "Generally used only for aesthetic purposes or to give a general impression"
  - "Adding depth for cosmetic purposes does not create a volume chart"

extensions:
  harris_entry: "Volume Chart"
  alternate_names: ["proportional volume chart", "3D proportional chart"]
  typical_use: "giving general impressions when values vary significantly, aesthetic emphasis"
---

## Description

A variation of proportional charts, volume charts use the volume of data graphics to convey information about the relative sizes of the data elements they represent. If data element B is twice as big as data element A, the volume of the data graphic representing element B will be twice as large as the volume of the data graphic for A.

Harris notes that volume charts are difficult to interpret and therefore are generally used only for aesthetic purposes or to give a general impression when values vary significantly.

## Examples

### Arrangement Options
> "The data graphics can be displayed several different ways, including side-by-side, stacked, and nested." (p. 437)

Harris illustrates side-by-side cubes showing values like $342, $150, $58, $15, and nested cubes showing the same data arranged concentrically.

### Single vs. Multi-Variable
> "Even though each data graphic on a proportional volume chart appears three-dimensional, it typically represents a single value. On rare occasions an effort is made to quantify variables on all three sides of the data graphics." (p. 437)

Harris shows a rare multi-variable example where each dimension of a 3D block encodes a different variable (Variable #1, #2, #3, #4 on different faces).

### Distinguishing from Cosmetic Depth
> "When 'depth' is added to the data graphics on an area proportional chart for aesthetic purposes, it does not reclassify it as a proportional volume chart since the depth is typically uniform on all data graphics and included for cosmetic purposes only." (p. 437)

## Usage

Volume charts are appropriate when:
- Values vary dramatically in magnitude
- A general impression matters more than precise comparison
- Aesthetic impact is a primary goal
- The audience will not need to make precise comparisons

Volume charts should be avoided when:
- Precise value comparison is needed
- Audiences need to extract specific values
- Small differences matter
- Analytical accuracy is required

### Arrangement Choices

**Side-by-side**: Each volume graphic placed next to others, allowing direct comparison but requiring more space

**Stacked**: Volume graphics placed on top of each other, showing cumulative effect but obscuring individual sizes

**Nested**: Smaller volumes placed inside larger ones, showing containment relationships and saving space but making comparison difficult

## Notes

The difficulty in interpreting volume charts stems from human perception: we are poor at accurately comparing volumes. While area charts already suffer from perceptual challenges (comparing areas is harder than comparing lengths), volume comparison is even more difficult. This is why Harris recommends limiting their use to situations where precision is not required.
