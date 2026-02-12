---
name: Bathtub Curve
slug: bathtub-curve
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bathtub Curve, p. 53"

intent: Illustrate how failure rates of products change over time, showing high initial failures, stable middle period, and increasing end-of-life failures
direction: both

components:
  - element: early failure region
    encodes: Higher failure rates shortly after products enter service
    required: true
  - element: stable life region
    encodes: Low, relatively constant failure rate during normal product life
    required: true
  - element: wear-out region
    encodes: Rising failure rates as products exceed normal life expectancy
    required: true
  - element: time axis
    encodes: Product age from initial service
    required: true
  - element: failure rate axis
    encodes: Percent or rate of failures per time period
    required: true

parameters:
  time_scale_treatment: uniform | expanded-early-period
  life_expectancy_marker: shown | implied

related: []  # TBD: see also line-graph, reliability-curve

warnings:
  - "The distinctive shape applies specifically to failure rate profiles; not all products follow this pattern"
  - "The time scale in early periods is sometimes expanded to improve readability due to the short duration of early failures"

extensions:
  harris_entry: "Bathtub Curve"
  alternate_names: []
  typical_use: "reliability engineering, product lifecycle analysis, warranty planning"
  scale_types:
    horizontal: "time (from service entry)"
    vertical: "failure rate (percent per period)"
---

## Description

A bathtub curve is so named because of its distinctive shape of higher values at the beginning and end with relatively constant, low values in between. Time is typically plotted on the horizontal axis, with zero at the left and time increasing to the right. A bathtub curve is sometimes used to illustrate how the failure rates of certain products change with time.

## Examples

Harris describes the standard bathtub curve pattern (p. 53):

> "When used in this way, time zero is considered the time at which each product first goes into service. Uniform periods of time are measured along the horizontal axis and the percent of failures for each period of time are plotted on the vertical axis."

The three phases are characterized as:
1. **Early failures**: "The higher failure rates at the left of the graph occur shortly after the products are put into service."
2. **Stable period**: "After these early failures, the rate typically drops to a low level where it stays for the rest of the products' expected life."
3. **Wear-out failures**: "If the products continue to be used beyond their normal life expectancy, the failure rate begins to rise again as the products wear out."

The illustration shows:
- "Normal expected life of product" marked in the stable middle section
- "Early failures" labeled on the left decline
- "Failures beyond normal life expectancy" labeled on the right rise

### Scale Treatment

> "Because of the relatively short period of time over which the early failures occur, versus the long periods of time for the other phases, the time scale in the early periods is sometime expanded to improve the readability of the curve."

## Usage

The bathtub curve is used in:
- **Reliability engineering**: Understanding expected failure patterns for product design
- **Warranty planning**: Setting warranty periods to cover early failures without excessive cost
- **Maintenance scheduling**: Timing preventive replacement before wear-out failures increase
- **Quality analysis**: Distinguishing between manufacturing defects (early failures) and design limitations (wear-out failures)

**Reading the curve**: The horizontal position indicates product age; the vertical position indicates failure rate at that age. The distinctive "bathtub" shape indicates three distinct phases of product reliability.

## Notes

Not all products exhibit the classic bathtub shape. Some may have:
- Constant failure rates throughout life
- Steadily increasing failure rates from the start
- Multiple peaks corresponding to different failure modes

The bathtub curve represents an idealized pattern most commonly associated with mechanical and electronic products where both manufacturing defects and wear mechanisms are present.
