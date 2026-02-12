---
name: Contour Graph
slug: contour-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Contour Graph, pp. 102-103"

intent: Display three variables by drawing lines connecting points of equal value on the Z-axis, functioning like a contour map for quantitative data
direction: both

components:
  - element: x-axis
    encodes: First independent variable (quantitative, categorical, or sequential)
    required: true
  - element: y-axis
    encodes: Second independent variable (quantitative, categorical, or sequential)
    required: true
  - element: contour-lines
    encodes: Lines connecting points of equal Z-axis value (isolines)
    required: true
  - element: z-axis-values
    encodes: Labels on contour lines indicating the value they represent
    required: false
  - element: legend
    encodes: Key relating fills to Z-axis values (for filled contour graphs)
    required: false

parameters:
  dimensionality: two-dimensional | three-dimensional
  fill_type: none | solid-color | gradient | pattern
  axis_types:
    x: quantitative | categorical | sequential
    y: quantitative | categorical | sequential
  value_labeling: on-lines | legend | z-axis-scale

related: []

warnings:
  - "Two-dimensional contour graphs can be harder to interpret without explicit value labels"
  - "Z-axis scale is always quantitative even if X and Y axes are categorical"
  - "When many contour lines exist, highlight every fifth line to assist viewers"

extensions:
  harris_entry: "Contour Graph"
  alternate_names:
    - contour line graph
    - isoline graph
  typical_use: "Displaying three-variable relationships, showing patterns in continuous data"
  related_forms:
    - surface graph
    - contour map
---

## Description

A contour graph is a form of isoline graph that functions like a contour map. It plots three variables by drawing lines (contour lines or isolines) that connect points of equal value on the Z or vertical axis. Both two-dimensional and three-dimensional versions exist.

In two-dimensional contour graphs, the Z-axis is perpendicular to the plane of the paper, so all contour lines appear in the same plane. A two-dimensional contour graph is equivalent to looking directly down on a three-dimensional contour graph.

The three-dimensional version is a variation of a surface graph that shows the contour lines on the surface itself, making the relationship between the three variables more visually apparent.

## Examples

Harris illustrates several variations on pages 102-103:

> Two- and three-dimensional contour graphs of the same data, with the two-dimensional version formed by projecting the contour lines of the three-dimensional graph onto its ceiling.

> Two-dimensional contour graphs with categories on the X and Y axes versus values on the X and Y axes, demonstrating that the technique works with different scale types.

> All points on a contour line have the same value on an imaginary Z-axis perpendicular to the paper. For example, all points on one contour line have a value of 400, while all points on an adjacent line have a value of 420.

**Filled contour graph:**
> An alternative solution for identifying values on the Z-axis is to fill the areas between the contour lines, thus forming what is called a filled contour graph. A legend is provided to relate the fill colors, shades, or patterns to Z-axis values.

## Usage

**Designating values:**
- When displaying general patterns, Z-axis values may be omitted
- For analysis of specific values, include a Z-axis scale (3D) or label contour lines directly
- Values for Z-axis contour lines are generally selected with equal intervals (2, 5, 10, etc.)
- When there are many contour lines, highlight every fifth line to assist viewers

**Filled contour graphs** offer advantages:
- Ease of identifying areas of equal Z-axis values
- Uncluttered appearance (Z-axis values shown in legend, not plot area)
- Boundaries between fills represent lines of equal value

**Scale considerations:**
- Z-axis scale is always quantitative
- X and Y axes may be quantitative, categorical, or sequential
- The combination of axis types affects how the contour pattern should be interpreted

Two- and three-dimensional filled contour graphs are sometimes used together, with a side view to illustrate how boundaries between fills form lines of equal value on the Z-axis.

## Notes

Contour graphs are closely related to surface graphs and contour maps. The key distinction is that contour graphs display abstract data relationships, while contour maps specifically show terrain elevation or geographic features.
