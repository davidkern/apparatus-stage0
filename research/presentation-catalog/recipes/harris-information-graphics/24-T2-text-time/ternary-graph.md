---
name: Ternary Graph
slug: ternary-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Ternary Graph, p. 397"

intent: Plot information with three variables whose sum always equals the same amount (typically 100% or 1) using an equilateral triangle format
direction: both

components:
  - element: equilateral-triangle
    encodes: Three-variable plotting space where each vertex represents 100% of one variable
    required: true
  - element: three-axes
    encodes: Lines from vertices to bases representing each variable's scale
    required: true
  - element: scales
    encodes: Percentages (0-100%) or decimal equivalents (0-1) on each axis
    required: true
  - element: data-points
    encodes: Compositions showing proportion of each variable
    required: true

parameters:
  scale_format: "percentage (0-100%) | decimal (0-1)"
  scale_direction: "clockwise | counterclockwise"
  scale_position: "on-axes | projected-to-sides"

related: []

warnings:
  - "Variables must sum to a constant amount (typically 100% or 1)"
  - "Scales may be projected onto triangle sides to prevent interference with data points and other labels"

extensions:
  harris_entry: "Ternary Graph"
  alternate_names:
    - "triangle graph"
    - "triangular graph"
    - "trilinear graph"
  typical_use: "plotting compositional data where three components sum to whole"
  constraint: "sum of three variables always equals same amount"
---

## Description

The ternary graph is the only triangular-shaped graph in popular use today. It plots information with three variables whose sum always equals the same constant amount. While that amount can be any value, it is typically 1 or 100% since the data is generally plotted in terms of percent of the whole or its decimal equivalent (0 to 1).

The ternary graph consists of an equilateral triangle with lines from the vertices to the bases representing each of the three axes. Scales are placed on the axes with zero at the base and 100% at the vertex.

## Examples

### Basic Structure (p. 397)

Harris shows a ternary graph with:
- Three variables (A, B, C) at each vertex
- Scales from 0% at base to 100% at vertex
- Grid lines parallel to each side
- Data points plotted within the triangle

> "To prevent scale labels from interfering with the data points and with one another, the scales are frequently projected onto the sides of the triangle." (p. 397)

### Reading a Data Point

Each point in the triangle represents a unique combination of the three variables:
- Distance from Variable A's base indicates percentage of A
- Distance from Variable B's base indicates percentage of B  
- Distance from Variable C's base indicates percentage of C
- The three percentages always sum to 100%

### Scale Projection

When scales are projected onto the sides of the triangle rather than placed along the internal axes, it prevents visual clutter in the data area while maintaining readability.

## Usage

### When to use ternary graphs

**Compositional data**: When analyzing mixtures or proportions that must sum to 100%:
- Chemical compositions (three-element alloys)
- Soil classifications (sand, silt, clay)
- Market share among three competitors
- Budget allocations across three categories
- Voting patterns among three candidates

### Reading and plotting

**To plot a point**:
1. Determine the percentage of each variable
2. Verify the three percentages sum to 100%
3. For each variable, measure from its base the appropriate percentage toward its vertex
4. The intersection of the three measurements defines the point

**To read a point**:
1. Draw or imagine lines parallel to each base through the point
2. Read the percentage where each line intersects that variable's scale
3. Verify the sum equals 100%

### Scale direction considerations

Scales can progress either clockwise or counterclockwise around the triangle. Consistency within a document or organization is important to prevent reading errors.

### Limitations

- Only works with exactly three variables
- Variables must have constant sum constraint
- Not suitable for independent variables
- Can be difficult to interpret without practice

## Notes

Harris references the Trilinear Graph entry for additional details. The ternary graph fills a specific niche: visualizing three-part compositions where the constraint that parts sum to a whole is fundamental to the data's nature. This makes it valuable in geology, chemistry, and other fields where compositional analysis is common.

The triangular format elegantly encodes the constant-sum constraint: any point within the triangle automatically satisfies the requirement that the three components sum to 100%.
