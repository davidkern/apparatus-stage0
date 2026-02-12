---
name: Angular Scale
slug: angular-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Angular (polar) scale, p. 336"

intent: Configure a circular scale measuring angles around the circumference of a polar or circular graph
direction: both

components:
  - element: circumferential-labels
    encodes: Angle values in degrees or radians
    required: true
  - element: tick-marks
    encodes: Angular divisions around the circumference
    required: true
  - element: radial-reference-lines
    encodes: Lines from center to labeled angles (optional)
    required: false

parameters:
  starting_angle: "angle where 0 or starting value is placed (typically top or right)"
  direction: "clockwise | counterclockwise"
  units: "degrees | radians"
  interval: "angular increment between labels (e.g., 15, 30, 45, 90 degrees)"

related: []  # TBD: radial-scale, polar-graph

warnings:
  - "Labels should designate even fractions of 360 degrees for readability"
  - "Ensure consistent direction (clockwise or counterclockwise) throughout"

extensions:
  harris_entry: "Scale"
  typical_use: "circular and polar graphs"
  scale_property: "equal angular distances around circumference"
  common_intervals: ["15 degrees (1/24)", "30 degrees (1/12)", "60 degrees (1/6)", "90 degrees (1/4)"]
---

## Description

Angular scales are used with circular graphs to measure angles around the circumference. They are typically arranged so labels are uniformly distributed around the circle, with values designating even fractions of 360 degrees.

Common angular intervals include 1/24 (15 degrees), 1/12 (30 degrees), 1/6 (60 degrees), and 1/4 (90 degrees). Labels might be shown as degrees or radians, where 1 degree equals approximately 0.0175 radian. Portions of degrees might be expressed in minutes and seconds or as decimals.

## Examples

> "Angular scales are sometimes used with circular graphs. They typically are arranged so the labels are uniformly distributed around the circumference of the graph. The labels generally designate even fractions of 360 degrees such as 1/24 (15 degrees), 1/12 (30 degrees), 1/6 (60 degrees), 1/4 (90 degrees), etc." (p. 336)

The PDF illustrates an angular scale showing both degree and radian notations at regular intervals around a circle: 0 degrees/0 radians at top, proceeding through 30 degrees, 60 degrees, 90 degrees (pi/2 radians), continuing around to 330 degrees.

## Usage

Angular scales are appropriate when:
- Creating polar graphs or radar charts
- Displaying directional data (wind direction, compass headings)
- Showing periodic phenomena over a 360-degree cycle
- Time-based circular displays (24-hour clocks, annual cycles)

The starting position (0 degrees) and direction of progression (clockwise or counterclockwise) should match the convention appropriate to the data being displayed.

## Notes

Angular scales differ from linear scales in that they are inherently circular and wrap around after 360 degrees. When combined with radial scales extending from the center, they form the coordinate system for polar graphs. The placement of the angular scale is almost always just outside the largest diameter of the circular graph.
