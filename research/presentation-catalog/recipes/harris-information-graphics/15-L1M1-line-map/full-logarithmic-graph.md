---
name: Full Logarithmic Graph
slug: full-logarithmic-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Logarithmic Graph, Full Log or Log Log, pp. 221-223"

intent: Display relationships where both variables change at percentage rates by using logarithmic scales on both axes
direction: both

components:
  - element: logarithmic-vertical-scale
    encodes: Y-variable with equal distances representing equal percentage changes
    required: true
  - element: logarithmic-horizontal-scale
    encodes: X-variable with equal distances representing equal percentage changes
    required: true
  - element: data-curve
    encodes: Relationship between the two variables
    required: true

parameters:
  base: "typically 10, but can vary"

related: []  # TBD: see also semilogarithmic-graph

warnings:
  - "Neither axis can include zero"
  - "Negative numbers cannot be plotted"
  - "A straight line indicates both variables are changing at constant percentage rates"

extensions:
  harris_entry: "Logarithmic Graph"
  alternate_names: ["log-log graph", "full log", "double logarithmic"]
  typical_use: "power law relationships, scientific data where both variables span large ranges"
---

## Description

A full logarithmic (log-log) graph uses logarithmic scales on both the vertical and horizontal axes. This is particularly useful when both variables being compared change at percentage rates rather than absolute amounts.

When data forms a straight line on a full logarithmic grid, both variables are increasing at constant percentage rates. This makes log-log graphs especially useful for identifying power law relationships, where one variable is proportional to a power of another.

## Examples

**Grid comparison** (p. 221):
Harris shows the same data plotted on three grid types:
- Linear grid (two linear scales)
- Semilogarithmic grid (one logarithmic and one linear scale)
- Full logarithmic grid (two logarithmic scales)

The matrix demonstrates how data that appears curved on linear and semilog grids may appear as a straight line on a log-log grid when both variables change at constant percentage rates.

**Straight line interpretation** (p. 221):
> "A straight line on a full logarithmic grid means the data along both axes are increasing at constant percentage rates."

The example shows:
- Data increasing linearly along both axes: curved on log-log
- Data increasing at constant 15% rate vertically, linearly horizontally: curved on log-log  
- Data increasing at constant 20% horizontally and 15% vertically: straight line on log-log

## Usage

Use full logarithmic graphs when:
- Both variables span multiple orders of magnitude
- You expect or want to reveal power law relationships
- Both variables change at percentage rates rather than absolute amounts
- Scientific or engineering data involves multiplicative relationships

The key insight is pattern recognition: relationships that would appear as complex curves on linear or semilog graphs may resolve to simple straight lines on log-log graphs, revealing underlying mathematical relationships.

## Notes

Like semilog graphs, log-log graphs work best with scatter and line chart types. Column, bar, and area representations mislead viewers because the visual size of elements does not correspond to the represented values in an intuitive way.
