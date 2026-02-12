---
name: Tick Marks
slug: tick-marks
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Tick Mark, pp. 409-411"

intent: Mark uniform increments along axes and scale lines to help viewers decode information rapidly and accurately
direction: construction

components:
  - element: major-tick-marks
    encodes: Primary scale divisions, typically accompanied by axis labels
    required: true
  - element: minor-tick-marks
    encodes: Subdivisions between major marks for finer resolution
    required: false
  - element: intermediate-tick-marks
    encodes: Mid-level subdivisions between major and minor marks
    required: false

parameters:
  tick_type: "major | minor | intermediate | combination"
  orientation: "external | internal | across-axis | combination"
  length: "short | medium | long (specified in points, inches, or mm)"
  axis_placement: "single-axis | dual-axis | reference-axis | all-axes"
  data_type_alignment: "quantitative | sequential | category"

related: []

warnings:
  - "Internal tick marks may interfere with plotted data"
  - "Tick marks that are too long can detract from the chart's focus"
  - "Minor tick marks should create logical intervals (1, 2, 5 units), not awkward values like 1.67 or 3.33"
  - "Tick marks and grid lines serve similar functions; using both may be redundant"

extensions:
  harris_entry: "Tick Mark"
  alternate_names:
    - "stub"
    - "stub mark"
    - "scale point"
    - "tic"
---

## Description

Tick marks are short lines generally drawn perpendicular to a larger line (typically an axis or scale line) to mark off uniform increments. They help viewers decode information in charts rapidly and accurately. The uniform increments might represent intervals of values on a quantitative scale, intervals of time on a sequence scale, distance on a map scale, or segments on a category or ordinal scale.

Harris provides comprehensive guidance on tick mark types, orientation, length, placement, and their relationship to grid lines and different data types.

## Examples

### Types of Tick Marks (p. 409)

Harris identifies three types distinguished by length:
- **Major tick marks**: The longest, normally accompanied by axis labels
- **Minor tick marks**: The shortest, for fine subdivisions
- **Intermediate tick marks**: Between major and minor in length

> "Unless it is a very large graph, axis labels many times do not accompany minor or intermediated tick marks." (p. 409)

### Orientation Options (p. 409)

Tick marks can be positioned:
1. **External**: Outside the graph body
2. **Internal**: Inside the graph body
3. **Across the axis**: Portions both internal and external
4. **Combination**: Mixed approaches on different axes

> "One potential hazard with using internal tick marks is their possible interference with the data being plotted." (p. 409)

### Positioning by Data Type (p. 411)

**Quantitative data**: Major tick marks aligned with labels when plotting specific values; at interval boundaries when using class intervals.

**Sequential (time) data**: Tick marks may or may not align with labels:
- Tick marks between labels make it easier to partition time into subgroups (months, years)
- Period data (e.g., monthly averages) often use tick marks between labels
- Point data (e.g., value on specific date) often align tick marks with labels

**Category data**: 
> "Tick marks are frequently not used with category type data. When they are used, they generally are located between the labels and serve as sort of dividers separating one category from another." (p. 411)

### Tick Marks and Grid Lines (p. 410)

> "To a large extent, tick marks and grid lines serve the same function: helping the viewer decode information in a chart, rapidly and accurately. Thus, many times, if grid lines are used, tick marks are not." (p. 410)

Harris shows combinations ranging from:
- Tick marks only, no grid lines
- Tick marks with major grid lines
- Tick marks with major and minor grid lines
- Grid lines only, no tick marks

## Usage

### Selecting tick mark types
- **Major only**: Simple graphs, few data points, clear scale
- **Major and minor**: When viewers need to estimate intermediate values
- **All three levels**: Large graphs requiring precise value estimation

### Choosing orientation
- **External**: Cleanest appearance, no interference with data
- **Internal**: Compact design, but may overlap with data points
- **Across axis**: Emphasizes scale positions, traditional technical drawing style

### Positioning considerations
- Align tick marks with grid lines when both are used
- Use tick marks on all axes with labels for symmetry
- Consider adding tick marks on opposite axes for easier reading of large graphs
- For category data, place between labels as dividers rather than aligned

### Special graph types (p. 410)

**Three-dimensional graphs**: Tick marks on outside edges can be parallel or perpendicular to their respective planes. Internal tick marks risk interfering with 3D data graphics.

**Circular graphs**: Major and minor tick marks typically external on circle graphs; radar and polar graphs may have tick marks on multiple axes.

**Trilinear graphs**: Tick marks serve the additional function of orienting viewers to which grid line a label refers; they typically appear as continuations of grid lines.

## Notes

Harris emphasizes that tick mark decisions depend on the chart's purpose, the data's nature, whether grid lines are used, and the desired accuracy in decoding. The relationship between tick marks and grid lines is complementary - they serve overlapping functions, so using both extensively may create visual clutter without adding interpretive value.

The guidance on minor tick mark intervals is particularly practical: they should divide major intervals into logical subdivisions (e.g., units of 1, 2, or 5) that viewers can easily interpret, avoiding awkward values that require calculation.
