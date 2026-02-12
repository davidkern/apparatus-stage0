---
name: Vertical Line Chart
slug: vertical-line-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Vertical Line Chart, p. 437"

intent: Record and track multiple price values (high, low, open, close) for securities over time using vertical line markers
direction: both

components:
  - element: vertical-line
    encodes: Price range from high to low for each time period
    required: true
  - element: horizontal-tick-marks
    encodes: Opening and/or closing prices
    required: false
  - element: horizontal-axis
    encodes: Time periods
    required: true
  - element: vertical-axis
    encodes: Price values
    required: true

parameters:
  data_points: high-low | high-low-close | high-low-close-open
  time_interval: daily | weekly | monthly

related: []  # TBD: bar-chart-financial, candlestick-chart

warnings:
  - "Multiple naming conventions exist for this chart type"

extensions:
  harris_entry: "Vertical Line Chart"
  alternate_names: ["open-high-low-close (OHLC) graph", "high-low-close-open (HLCO) graph", "high-low-close (HLC) graph", "high-low graph", "bar chart", "price chart"]
  typical_use: "recording and tracking selling prices of securities, commodities, markets"
---

## Description

This type of chart is used extensively to record and track the selling prices of securities, commodities, markets, and similar financial instruments. Several prices are typically recorded for each time period, with highest, lowest, close, and open being the most common values.

Each time period is represented by a vertical line spanning from the high to the low price, with optional horizontal tick marks indicating opening and closing prices.

## Examples

> "Sometimes referred to as an open-high-low-close (OHLC) graph, high-low-close-open (HLCO) graph, high-low-close (HLC) graph, high-low graph, bar chart, or price chart. This type of chart is used extensively to record and track the selling prices of securities, commodities, markets, etc. Several prices are typically recorded for each time period with highest, lowest, close, and open being the most common." (p. 437)

Harris illustrates a vertical line chart showing price values ranging from approximately 28-36, with vertical bars spanning the high-low range for each time period.

## Usage

Vertical line charts are appropriate for:
- Daily stock price tracking
- Commodity price analysis
- Market index monitoring
- Any financial instrument with multiple values per period

### Data Encoding

Each vertical line shows:
- **Top of line**: Highest price during the period
- **Bottom of line**: Lowest price during the period
- **Left tick mark** (if present): Opening price
- **Right tick mark** (if present): Closing price

### Common Time Intervals
- Daily (most common for active trading)
- Weekly (for intermediate analysis)
- Monthly (for long-term trends)

## Notes

This chart type goes by many names in financial literature, which can cause confusion. The core concept remains the same: using vertical lines to show price ranges with optional markers for open and close positions. See also Bar Chart for additional financial charting conventions.
