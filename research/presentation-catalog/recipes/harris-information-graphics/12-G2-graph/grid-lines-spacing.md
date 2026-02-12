---
name: Grid Line Spacing
slug: grid-lines-spacing
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Spacing, p. 181"

intent: Configure grid line spacing to match scale characteristics and support accurate value reading
direction: construction

components:
  - element: equal-spacing
    encodes: Uniform distance between grid lines (linear scales)
  - element: logarithmic-spacing
    encodes: Consistent but unequal spacing (log scales)
  - element: data-driven-spacing
    encodes: Grid lines only where data points exist
  - element: perspective-spacing
    encodes: Converging spacing for 3D perspective effects

parameters:
  scale_type: "linear | logarithmic | irregular"
  dimension: "2D | 3D perspective"

related: []  # TBD: logarithmic-scale, perspective-graphs, supplementary-scale

warnings:
  - "Spacing must match the underlying scale type"
  - "Irregular spacing without explanation confuses viewers"
  - "Perspective grids can distort value perception"

extensions:
  harris_entry: "Grid and Grid Line"
---

## Description

There are four major variations of spacings used with grid lines on graphs. The appropriate spacing depends on the scale type and the dimensional representation of the graph.

## Examples

Harris describes four spacing variations (p. 181):

**1. Equal spacing (most common):**
> "On most graphs the grid lines are equally spaced. Major grid lines are normally aligned with tick marks and/or scale labels and since most scales are linear, the spacings between most labels, tick marks, and grid lines are equal."

**2. Logarithmic spacing:**
> "When nonlinear scales are used, the spacings between grid lines are uniform but generally not equal (e.g., logarithmic)."

The illustrated example shows a log scale from 1 to 1000, with grid lines at 1, 10, 100, 1000 - consistent pattern but varying distances.

**3. Data-driven spacing:**
> "In some cases grid lines are shown only where data points exist; therefore, the spacing of the grid lines is dependent on the spacing of the data points."

The example shows grid lines only at specific data values (1.25, 1.85, 2.45, 3.35, 4.80) rather than at regular intervals.

**4. Non-uniform spacing:**
> "In the majority of cases, the space between any two parallel grid lines is the same for the full length of the grid lines. Exceptions are grid lines on graphs drawn in perspective, grid lines for certain supplementary scales, and the radial grid lines of circular graphs."

## Usage

**Linear scales:**
- Use equal spacing throughout
- Space matches scale intervals
- Most common and expected by viewers

**Logarithmic scales:**
- Spacing follows log pattern (e.g., 1, 10, 100)
- Appears unequal but is mathematically consistent
- Must be clearly labeled as log scale

**Data-driven spacing:**
- Grid lines only at actual data values
- Useful when data falls at irregular points
- Reduces clutter but may make interpolation difficult

**Perspective/3D graphs:**
- Grid lines converge toward vanishing point
- Creates depth illusion
- Sacrifices precise value reading for spatial effect

**Supplementary scales:**
- Secondary scale may have different spacing
- Common when combining two measurement types
- Must be clearly differentiated from primary scale

## Notes

Harris emphasizes that equal spacing is the default expectation. Any departure from equal spacing should be deliberate and clearly communicated to viewers, as unexpected spacing patterns can mislead interpretation.
