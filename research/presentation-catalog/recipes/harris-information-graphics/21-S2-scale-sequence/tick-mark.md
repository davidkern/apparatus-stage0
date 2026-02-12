---
name: Tick Mark
slug: tick-mark
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Tick marks, labels, and intervals, p. 339; Scale Point, p. 343"

intent: Mark scale divisions on an axis to enable encoding and decoding of data values
direction: both

components:
  - element: major-tick-marks
    encodes: Primary scale divisions, typically with labels
    required: true
  - element: intermediate-tick-marks
    encodes: Secondary divisions between major marks, sometimes labeled
    required: false
  - element: minor-tick-marks
    encodes: Smallest subdivisions, typically unlabeled
    required: false
  - element: labels
    encodes: Numbers or words at major (and sometimes intermediate) tick marks
    required: true

parameters:
  major_interval: "numerical size of major divisions (e.g., 10, 100)"
  minor_divisions_per_major: "number of minor intervals within each major interval"
  tick_length: "relative lengths: major > intermediate > minor"
  label_frequency: "which tick marks receive labels"

related: []  # TBD: linear-scale, logarithmic-scale, axis

warnings:
  - "Use easy-to-read intervals like 1, 2, 5, 10; avoid unusual intervals like 3, 7, 9"
  - "Minor intervals should be logical divisions of major intervals"

extensions:
  harris_entry: "Scale"
  alternate_names: ["scale point", "tick", "tic", "stub mark", "stub"]
  typical_use: "all graph scales requiring precise value reading"
---

## Description

Tick marks (sometimes called scale points, ticks, tics, stub marks, or stubs) are short lines that intersect or abut the axes or scale line to mark off intervals for encoding and decoding information and to serve as markers for labels. There are three sizes of tick marks:

1. **Major tick marks**: The largest, frequently with labels associated. Mark primary scale divisions.
2. **Intermediate tick marks**: Medium size, sometimes with labels. Mark secondary divisions.
3. **Minor tick marks**: The smallest, often without labels. Mark the finest subdivisions.

The distances between major tick marks are called major intervals; the distances between minor tick marks are called minor intervals.

## Examples

> "Scales are a series of lines (generally tick marks in conjunction with a label axis) and labels (generally numbers or words) that are used systematically to encode and decode information onto charts, graphs, maps, and diagrams." (p. 339)

The PDF illustrates a scale from 0 to 30 showing:
- Major tick marks at 0, 10, 20, 30 with labels
- An intermediate tick mark at 15 (between 10 and 20)
- Minor tick marks at 1, 2, 3... etc.

The terminology diagram shows: "Major tick marks" at large divisions, "Minor tick marks" at small divisions, "Intermediate tick mark" at medium division, "Major scale interval" as the distance between major ticks, "Minor scale interval" as the distance between minor ticks, and "Labels of major values" at the numbers.

## Usage

Interval selection guidelines:
- Use easy-to-read sizes: 1, 2, 5, 10, 20, 50, 100, etc.
- Avoid unusual intervals: 3, 7, 9, etc. (harder to interpolate)
- Minor intervals should logically subdivide major intervals:
  - Weeks into 7 days
  - Feet into 12 inches
  - Years into 4 quarters
  - Standard measures into 5, 10, 20, or 100 subdivisions

Tick marks serve two functions:
1. **Encoding**: Helping the graph creator place data accurately
2. **Decoding**: Helping the viewer read values from the graph

## Notes

> "Intervals are generally of a numerical size that will make the chart easy to read such as 1, 2, 5, 10, etc. Unusual intervals such as 3, 7, 9, etc., are normally avoided. Minor intervals are generally a logical division of the major intervals." (p. 339)

The choice of intervals affects both construction accuracy and reading precision. Too few tick marks make interpolation difficult; too many create visual clutter.
