---
name: Candlestick Chart
slug: candlestick-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Candlestick Chart, pp. 65-67"

intent: Record and analyze selling prices of stocks, bonds, or commodities with particular attention to price reversals
direction: both

components:
  - element: real-body
    encodes: Range between opening and closing price; filled (black) when close < open, unfilled (white) when close > open
    required: true
  - element: upper-shadow
    encodes: Price range from top of body to highest price (also called wick)
    required: false
  - element: lower-shadow
    encodes: Price range from bottom of body to lowest price (also called wick)
    required: false
  - element: vertical-axis
    encodes: Price scale (linear or logarithmic)
    required: true
  - element: horizontal-axis
    encodes: Time intervals (minutes to years; days, weeks, months most common)
    required: true
  - element: grid-lines
    encodes: Reference lines for reading values (both vertical and horizontal frequently used)
    required: false

parameters:
  time_interval: minutes | days | weeks | months | years
  body_colors: black_white | two_colors
  scale_type: linear | logarithmic
  scale_position: left | right | both

related: []

warnings:
  - "Symbol interpretation depends on context - same symbol can have different names based on position in trend"
  - "Patterns require surrounding data context to determine significance"

extensions:
  harris_entry: "Candlestick Chart"
  alternate_names: ["Japanese candlestick chart"]
  typical_use: "stock price analysis, identifying price reversals, technical analysis"
---

## Description

Candlestick charts are used to record and analyze the selling prices of stocks, bonds, commodities, etc., with particular attention to indications of price reversals. They are similar to bar charts used in investment but make the relationships between opening and closing prices stand out more clearly.

Each candlestick symbol represents a time interval and consistently displays four values: opening price, closing price, highest price, and lowest price for that period.

The basic candlestick symbol consists of a rectangle (the "real body") with a straight line extending from the top and bottom (the "shadows" or "wicks"):
- If the closing price is lower than the opening price, the rectangle is filled (black)
- If the closing price is higher than the opening price, the rectangle is unfilled (white)
- The top of the filled rectangle shows opening price; bottom shows closing price
- The top of the unfilled rectangle shows closing price; bottom shows opening price
- Upper shadow extends to the high; lower shadow extends to the low

## Examples

Harris illustrates multiple named candlestick patterns (p. 66):

> Single-symbol patterns include: "Spinning top" (small body), "Shaved head" (no upper shadow), "Shaved bottom" (no lower shadow), "Grave stone" (no lower shadow, very small body at bottom), "Doji" (opening equals closing), "Close cut" (body at top or bottom of range)

> Multi-symbol patterns include: "Hanging man" (at top of uptrend), "Hammer" (same symbol at bottom of downtrend), "Shooting star", "Abandoned baby", "Inverted hammer", "Bearish harami", "Bullish harami", "Upside gap two crows", "Dark cloud cover", "Tweezers bottoms", "Three mountain tops", "Three Buddha top" (equivalent to head-and-shoulders in bar charts)

> "A particular symbol might be called a hanging man symbol if located at the top of an uptrend, or a hammer if the same symbol is located at the bottom of a downtrend." (p. 66)

## Usage

Candlestick charts tend to focus on:
- Relationships between opening and closing prices
- Individual or groups of symbols
- Pattern recognition for predicting price reversals

Bar charts tend to focus on:
- Highs and lows
- Changes in closing prices over time

Graphical methods used with bar charts also work with candlestick charts:
- Regression lines
- Moving averages
- Trend lines
- Resistance lines
- Channels
- Volume charts (typically shown below the price chart)

## Notes

Because of chart width, large amounts of data, and the fact that greatest interest is typically in recent data on the right side, candlestick charts commonly show vertical scales on the right side or on both sides.

Patterns are used more frequently with candlestick charts than bar charts and are sometimes considered leading indicators of future price trends, particularly price reversals. Some patterns share names with bar chart patterns (e.g., head-and-shoulders is called three-Buddha-top on candlestick charts).
