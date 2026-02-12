---
name: Time Series Scale
slug: time-series-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Time series scale, p. 337"

intent: Configure an axis displaying chronological time with equal intervals representing equal time increments
direction: both

components:
  - element: major-tick-marks
    encodes: Primary time divisions (e.g., years, months)
    required: true
  - element: minor-tick-marks
    encodes: Subdivisions of major intervals (e.g., months within years, days within weeks)
    required: false
  - element: time-labels
    encodes: Dates, times, or time period identifiers
    required: true
  - element: axis-line
    encodes: Reference line representing the progression of time
    required: true

parameters:
  time_unit: "years | quarters | months | weeks | days | hours | minutes | seconds"
  label_format: "dates | specific times | successive increments"
  starting_time: "beginning of time range"
  ending_time: "end of time range"

related: []  # TBD: order-of-occurrence-scale, ordinal-scale, sequence-graph

warnings:
  - "Equal physical distances must represent equal time increments"
  - "Scale breaks in time scales can distort trend perception"
  - "If data is missing, leave interval space blank rather than compressing"

extensions:
  harris_entry: "Scale"
  alternate_names: ["chronological scale"]
  typical_use: "time series graphs, trend analysis"
  scale_property: "equal distances represent equal times"
  cross_reference: "See Time Series Graph"
---

## Description

A time series scale, sometimes called a chronological scale, has intervals that are of equal physical size and represent equal increments of time. The time might be shown in terms of dates (e.g., June 23, June 24, June 25), specific times (e.g., 9:18, 9:19, 9:20), or successive increments of time (e.g., 42nd week, 43rd week, 44th week).

Unlike some other sequence scales, time scales often have minor intervals as well as major intervals. For example, years can be broken into months, weeks into days, minutes into seconds, etc. This hierarchical subdivision is a distinctive feature of time series scales.

## Examples

> "A time series scale has intervals that are of equal physical size and represent equal increments of time. The time might be shown in terms of dates, specific times, or successive increments of time." (p. 337)

The PDF illustrates a time series scale spanning 1990-1992, with major divisions at each year and minor divisions showing months (J F M A M J J A S O N D). The notation "Equal distances & equal times" appears along the scale.

## Usage

Time series scales are appropriate when:
- Displaying data that changes over time
- Analyzing trends, seasonal patterns, or cyclical behavior
- The timing of events or measurements is significant
- Comparing values at specific time points

Time series scales require careful handling of:
- Missing data: Leave blank intervals rather than compressing
- Scale breaks: Use sparingly and with clear visual indication
- Unit changes: When changing from years to quarters, use clear demarcation

## Notes

Time series scales are the most common type of sequence scale. They are essential for trend analysis because the equal spacing ensures that the visual slope of a line accurately represents the rate of change over time. Compressing or expanding time intervals would distort the perceived rate of change.
