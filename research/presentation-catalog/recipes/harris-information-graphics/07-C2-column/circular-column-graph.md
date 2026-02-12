---
name: Circular Column Graph
slug: circular-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Circular column graph, p. 92"

intent: Display column data in a radial arrangement for aesthetic purposes or to show cyclical patterns
direction: both

components:
  - element: radial-columns
    encodes: Values measured from center toward circumference
    required: true
  - element: radial-axis
    encodes: Quantitative scale on radii (linear, progressing outward)
    required: true
  - element: circular-axis
    encodes: Category or sequence scale around circumference
    required: true
  - element: radial-grid-lines
    encodes: Reference lines for circular axis values
    required: false
  - element: circular-grid-lines
    encodes: Reference lines for radial axis values
    required: false

parameters:
  start_position: "any point on circumference"
  direction: "clockwise | counterclockwise"
  column_spacing: "typically equally spaced around circumference"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: radar-chart
    relationship: combines-with

warnings:
  - "Generally used for aesthetic purposes rather than precise comparison"
  - "Comparison between columns is harder than in rectangular format"
  - "Typically limited to simple column types; grouped and stacked variations are rare"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["star graph", "radial line graph", "radial column graph"]
  typical_use: "displaying cyclical or repetitive information, aesthetic presentations, showing seasonal patterns"
  scale_types:
    radial: "quantitative (linear, from center outward)"
    circular: "category or sequence"
---

## Description

A circular column graph arranges columns radially around a center point. It has a quantitative scale on the radii (generally linear, progressing from center outward) and a category or sequence scale on the circumference. The circular scale can start at any point and progress in either direction.

This format is generally used for aesthetic purposes, though it can be effective for displaying repetitive or cyclical information where the circular arrangement reinforces the cyclical nature of the data.

## Examples

> "A circular column graph is generally used for aesthetic purposes. It has a quantitative scale on the radii which is generally linear and almost always progresses from the center out. It has a category or sequence scale on the circumference (circular axis) which can start at any point and progress in either direction." (p. 92)

Harris illustrates a circular column graph with:
- Labels A through F around the circumference (category scale)
- Numeric scale from 0-8 on the radial axis
- Columns extending outward from center to their respective values
- Optional radial grid lines for the circular axis
- Optional circular grid lines for the radial axis

## Usage

Design specifications:
- Values are defined by the ends of columns (measured from center)
- Columns are typically equally spaced around the circumference
- Radial and/or circular grid lines may or may not be used
- Value axis labels appear along the radial axis

Appropriate uses:
- Displaying monthly data (12-point cycle)
- Showing hourly patterns (24-point or 12-point cycle)
- Weekly patterns (7-point cycle)
- Any naturally cyclical data

Limitations:
- The circular technique is normally limited to simple column types
- While grouped, stacked, and range variations can be generated, they are uncommon
- Precise value comparison is more difficult than rectangular formats

## Notes

Circular column graphs are sometimes used to display repetitive information where the circular format reinforces the cyclical nature of the data. However, for precise analytical purposes, rectangular column graphs are generally preferred due to easier value comparison.
