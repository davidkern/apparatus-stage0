---
name: High-Low Graph
slug: high-low-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Range Symbols and Graphs, p. 324"

intent: Display the range between high and low values for each time period or category, with optional open, close, or central values
direction: both

components:
  - element: high-value-marker
    encodes: Upper boundary (maximum, high price, upper limit)
    required: true
  - element: low-value-marker
    encodes: Lower boundary (minimum, low price, lower limit)
    required: true
  - element: connecting-line
    encodes: Vertical line spanning from low to high value
    required: true
  - element: central-value
    encodes: Mean, median, or reference value marked along the range line
    required: false
  - element: open-close-markers
    encodes: Opening and closing values shown as horizontal ticks (for financial applications)
    required: false

parameters:
  value_encoding: "simple | OHLC"
  marker_style: "tick | dot | none"
  central_indicator: "none | mean | median | close"

related:
  - slug: range-symbols-and-graphs
    relationship: contained-by

warnings:
  - "High-low graphs show only extreme values; distribution of data between extremes is not visible"

extensions:
  harris_entry: "Range Symbols and Graphs"
  alternate_names: ["high-low-close chart", "OHLC chart", "range chart"]
  typical_use: "tracking stock prices, showing temperature ranges, displaying value spreads over time"
---

## Description

A high-low graph displays the range between maximum and minimum values using vertical lines connecting the two extremes. Each line represents one time period or category, showing the full spread of values during that interval.

**Simple high-low graph**: Shows upper value, lower value, and optionally a central value such as the average.

**Specialized high-low graph (OHLC)**: One of the most widely used applications tracks stock prices, showing:
- High: top of vertical line
- Low: bottom of vertical line
- Open: horizontal tick on left side of line
- Close: horizontal tick on right side of line

This specialized form allows traders to see not only the range of prices but also where the price started and ended during each trading period.

## Examples

> "Standard and specialized high-low graphs. One of the most widely used applications for this type of graph is in the tracking of stock prices." (p. 324)

Harris shows:
- Simple high-low graph with upper value, central value, and lower value marked for categories A through E
- Specialized high-low graph showing daily stock prices with High, Open, Close, and Low for Monday through Friday

## Usage

High-low graphs are effective for:
- **Financial data**: Stock prices, commodity prices, exchange rates
- **Weather data**: Daily temperature ranges (high and low)
- **Performance ranges**: Best and worst outcomes per period
- **Quality control**: Range of measurements across production runs

The format emphasizes the spread or volatility of data rather than central tendency. Adding a central value marker provides context for where typical values fall within the range.

## Notes

For three-dimensional range graphs, inner values are seldom used. These are sometimes referred to as floating block or flying box graphs. The high-low format translates to horizontal orientation as well, where it may show ranges across categories rather than time periods.
