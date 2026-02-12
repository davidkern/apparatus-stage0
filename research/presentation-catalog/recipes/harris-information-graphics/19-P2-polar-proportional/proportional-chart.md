---
name: Proportional Chart
slug: proportional-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Proportional Chart, pp. 312-314"

intent: Graphically communicate differences in size, number, or value without scales by using data graphics whose sizes are proportional to the values they represent
direction: both

components:
  - element: data-graphics
    encodes: Visual elements (shapes, symbols, or pictures) sized proportionally to values
    required: true
  - element: numeric-labels
    encodes: Actual values displayed with or near data graphics for precise reading
    required: false
  - element: descriptive-labels
    encodes: Category or item names identifying what each data graphic represents
    required: true

parameters:
  proportion_basis: length | area | volume
  shape_type: geometric | pictorial | irregular
  arrangement: side-by-side | overlapped | grouped | stacked | staggered

related:
  - slug: proportional-area-chart
    relationship: contains
  - slug: proportional-volume-chart
    relationship: contains
  - slug: pie-chart
    relationship: variant-of
  - slug: bar-graph
    relationship: contrasts

warnings:
  - "Proportional charts are used for communication, not analysis; they do not convey exact data"
  - "Viewers estimate linear differences more accurately than area or volume differences"
  - "Complex shapes are harder for viewers to decode than simple geometric shapes"
  - "Data graphics varying in only one dimension are easiest to interpret accurately"

extensions:
  harris_entry: "Proportional Chart"
  includes:
    - "Pictorial Proportional Chart"
    - "Proportional Area Chart"
    - "Proportional Line Chart"
    - "Proportional Volume Chart"
  typical_use: "Comparing multiple items at a point in time, or one item at various times, for communication and presentation purposes"
  design_principle: "If item A is twice as big as item B, the data graphic for A should be twice as big (in the relevant dimension) as that for B"
---

## Description

Proportional charts are visual devices for graphically communicating differences in size, number, or value without the use of scales. This is accomplished by means of a set of data graphics that are in the same proportion to one another as the things they represent. For example, if item A is twice as big as item B and both are represented by squares, the square for item A would be twice as big as the square that represents item B.

Proportional charts are used almost exclusively for communication purposes. They are seldom used for analytical purposes. The sizes of the data graphics are not meant to convey exact data but to simply give the viewer some visual indication of the relative size of the items they represent.

The relative size of data graphics can be based on:
- **Length/height:** Easiest to decode accurately
- **Area:** Widely used; circles and squares common
- **Volume:** Most difficult to interpret; used mainly for aesthetic purposes

## Examples

Harris provides key observations about proportional charts (p. 312):

> "Proportional charts are used to compare multiple things at a point in time, or one or more things at various times or under various conditions."

> "For conveying percent-of-the-whole information, a single circular chart is most rapidly understood because the circle tends to more clearly imply 100%."

> "Data graphics with simple geometric shapes are easier for the viewer to decode than those with complex shapes."

> "Data graphics in which the size varies in only one direction are the easiest to accurately decode (e.g., varying the length of a bar versus varying the length and width)."

**Labeling examples (p. 312):**
Harris shows various methods for displaying numeric information:
- Values inside the data graphic
- Values adjacent to the data graphic
- Values with descriptive labels below
- Values in a legend

**Arrangement variations (p. 312):**
> "Most of the variations in data graphic arrangements available with graphs are also available with proportional charts. For example they can be placed side-by-side, overlapped, grouped, stacked, and in some cases arranged in patterns not normally available with graphs."

## Usage

**When to use:**
- Communication and presentation contexts
- When visual impact is more important than precise data
- Comparing relative sizes at a glance
- When audience is general (non-technical)

**When NOT to use:**
- Analytical purposes requiring precise comparisons
- When exact values matter more than relative impressions
- Technical or scientific contexts requiring accuracy

**Design principles:**
- Include numeric values since it is difficult to estimate differences accurately from graphics alone
- Use simple geometric shapes for easier decoding
- Prefer single-dimension variation (length) over multi-dimension (area, volume)
- Pie charts work well for percent-of-whole information

**Scales and grid lines:**
> "Scales, tick marks, and grid lines are almost never used on proportional charts. If a scale is used, the chart would generally be classified as a graph."

## Notes

Proportional charts include several subtypes:
- **Proportional line chart:** Length of lines encodes values; straight lines are easiest
- **Proportional area chart:** Area of shapes (squares, circles, triangles) encodes values
- **Proportional volume chart:** Volume of 3D shapes encodes values; difficult to interpret

The pie chart is one of the most popular types of proportional charts, where the area of each slice is proportional to its value as a fraction of the whole.
