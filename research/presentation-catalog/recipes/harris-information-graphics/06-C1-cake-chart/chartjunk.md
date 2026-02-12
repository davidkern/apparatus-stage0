---
name: Chartjunk
slug: chartjunk
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Chartjunk, p. 72"

intent: Identify and eliminate non-essential elements in charts that may detract from understanding the main purpose
direction: recognition

components:
  - element: unnecessary-grid-lines
    encodes: Grid lines beyond what's needed to read values
    required: false
  - element: excessive-tick-marks
    encodes: More tick marks than necessary for scale reading
    required: false
  - element: redundant-data
    encodes: Same information shown multiple ways
    required: false
  - element: cosmetic-additions
    encodes: Decorative elements added for appearance rather than communication
    required: false
  - element: duplicate-values
    encodes: Same numbers shown in multiple places
    required: false
  - element: duplicate-labels
    encodes: Labels repeated unnecessarily
    required: false

parameters:
  judgment: objective | subjective

related: []

warnings:
  - "What qualifies as chartjunk is sometimes quite subjective"
  - "Some 'junk' may serve legitimate purposes for certain audiences"

extensions:
  harris_entry: "Chartjunk"
  alternate_names: ["clutter"]
  typical_use: "chart critique, design improvement, clarity enhancement"
---

## Description

Chartjunk consists of the things included in charts and graphs that are not essential to understanding the main purpose of the chart. What qualifies as chartjunk is sometimes quite subjective.

## Examples

Harris illustrates with a before/after comparison (p. 72):

**With chartjunk** (elements that might be eliminated):
- Duplicate values (numbers shown both in cells and on axis)
- Duplicate labels (same label appearing multiple times)
- Part of frame (decorative border elements)
- Background (shaded or colored backgrounds)
- Grid lines (more than needed)
- Image (decorative pictures)
- Ticks (excessive tick marks)

The example shows a 5x5 grid with values, heavy grid lines, background shading, and multiple instances of the same information.

**Without chartjunk**:
The same data displayed with only essential elements: clean axes, minimal grid lines, values shown once in appropriate location, no decorative elements.

Both charts show "Cartons of milk" on the x-axis (0-6) and schools A-E on the y-axis, with values displayed in the cells. The cleaner version is easier to read and the data patterns are more apparent.

## Usage

When reviewing a chart, consider whether each element:
- Helps the viewer understand the data
- Aids in reading specific values
- Provides necessary context or reference
- Serves the main communication purpose

Elements that fail these tests are candidates for removal.

Common types of chartjunk:
- Unnecessary grid lines
- Excessive tick marks
- Redundant data presentation
- Material added purely for cosmetic purposes
- 3D effects that don't encode data
- Decorative images unrelated to content

## Notes

The concept of chartjunk originates from Edward Tufte's work on data visualization. Harris acknowledges the subjectivity involved - what one person considers clutter, another might consider helpful context or visual interest. The key is ensuring that non-essential elements don't interfere with understanding the essential message.
