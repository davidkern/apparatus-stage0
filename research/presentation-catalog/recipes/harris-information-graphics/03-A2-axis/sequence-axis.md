---
name: Sequence Axis
slug: sequence-axis
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Scale or label axes, p. 23"

intent: Configure an axis to display ordered items such as time periods or ranked positions
direction: both

components:
  - element: scale-line
    encodes: The physical line along which sequence progresses
    required: true
  - element: sequence-labels
    encodes: Identifiers for each position in the ordered series
    required: true
  - element: tick-marks
    encodes: Marks indicating sequence intervals
    required: true
  - element: axis-title
    encodes: Description of the sequence dimension
    required: false

parameters:
  sequence_type: time | ordinal | ranked
  interval: years | months | weeks | days | custom
  orientation: vertical | horizontal

related: []  # TBD: see also quantitative-axis, category-axis

extensions:
  harris_entry: "Axis, Graph"
  typical_use: "displaying data over time or in ranked/ordered sequence"
  scale_examples:
    - "1991, 1992, 1993, 1994 (years)"
    - "1, 2, 3, 4, 5, 6, 7 (order in which samples were collected)"
---

## Description

A sequence axis displays items that have an inherent order but are not strictly quantitative. The most common form is a time axis showing years, months, or days, but sequence axes can also show ranked positions, stages in a process, or any ordered series where the sequence matters but the intervals may not be mathematically meaningful.

Harris distinguishes sequence axes from both quantitative axes (which show measurable numeric values) and category axes (which show unordered discrete items). Sequence axes share characteristics with both: like category axes, they show discrete items; like quantitative axes, the order and sometimes the spacing carries meaning.

## Examples

> "Axes with scales such as these might be referred to as sequence axes." (p. 23)

Harris illustrates two types of sequence axes:
- Time sequence: 1991, 1992, 1993, 1994 (Year)
- Ordinal sequence: 1, 2, 3, 4, 5, 6, 7 (Order in which samples were collected)

## Usage

Sequence axes are appropriate when:
- Data is collected or organized over time
- The order of items is meaningful
- Progression or trend across the sequence is important

Common applications:
- Line graphs showing values over years or months
- Time series analysis
- Process stages or experimental trials

The horizontal axis of stock price charts (bar charts) always has time scales, with intervals ranging from minutes to years depending on the purpose of the chart.

## Notes

For time sequences, the horizontal axes of bar charts use specific conventions. Daily intervals are often grouped by week, with vertical grid lines placed between every fifth interval (weekends omitted). Weekly intervals are typically grouped by month, with vertical grid lines designating approximately one-month intervals.
