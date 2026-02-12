---
name: Point and Figure Chart
slug: point-and-figure-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Point and Figure Chart, pp. 288-289"

intent: Record price changes so that direction reversals stand out clearly, disregarding time and focusing purely on price movements
direction: both

components:
  - element: vertical-price-axis
    encodes: Price levels using linear scale
    required: true
  - element: x-symbols
    encodes: Price increases by specified increment (box size)
    required: true
  - element: o-symbols
    encodes: Price decreases by specified increment
    required: true
  - element: columns
    encodes: Continuous price movement in one direction
    required: true
  - element: time-markers
    encodes: Optional indication of uniform periods (months, etc.)
    required: false

parameters:
  box_size: "fixed-amount | percent | trading-increment-multiple"
  minimum_price_reversal: "1-box | 2-box | 3-box"
  time_marking: "none | period-start-highlighted"

related: []  # TBD: see candlestick-chart, OHLC-chart

warnings:
  - "No time scale - cannot determine when activities occurred or reversal frequency"
  - "Smaller box size and reversal values create wider charts"
  - "May give false impressions of trends (e.g., uninterrupted plunge vs. reversal attempts)"

extensions:
  harris_entry: "Point and Figure Chart"
  alternate_names: ["P&F chart"]
  typical_use: "analyzing price changes in stocks, bonds, commodities; technical analysis"
  focus: "price changes and direction changes, independent of time"
---

## Description

A point and figure chart records prices of stocks, bonds, commodities, exchanges, markets, etc., in such a way that changes in price and the direction of such price changes stand out clearly. The chart disregards time completely and focuses on price changes. If there are no changes in the price of the entity being tracked, there are no additional entries on the chart, regardless of how long the period of time or how many sales might be made.

## Examples

Harris illustrates the basic structure (p. 288):
> "The price of the thing being tracked is indicated on the vertical axis using a linear scale. Actual prices are recorded by means of two different symbols."

The process:
- When price increases by box size (e.g., 5 cents), an X is placed in the current column
- Xs stack vertically as price continues rising
- When price falls by box size, start new column with Os
- Os stack downward as price continues falling
- When price reverses again, start new column with Xs

**Box size effect (p. 289):**
Three charts show same data with different minimum price reversals:
- 3-box minimum: narrowest chart, fewest columns
- 2-box minimum: medium width
- 1-box minimum: widest chart, most detail

> "The chart on the left might give the impression of an uninterrupted plunge on the right side of the chart, while the expanded chart (right) indicates that several unsuccessful attempts were made to reverse the downward trend."

**Time period marking:**
> "Some analysts solve this problem by highlighting the first price in each new period and identifying the periods in the lower margin."

Methods include substituting symbols, bolding, or using letters (e.g., first letter of month).

## Usage

**Box size selection:**
- Depends on price of item tracked (1/8 may suit $5 stock but not $200 stock)
- Depends on volatility
- Depends on short-term vs. long-term interest
- Smaller box = more symbols and columns for given period

**Minimum price reversal:**
- Minimum change needed to start new column
- Typically 1, 2, or 3 box sizes
- Larger reversal filters out minor fluctuations
- When reversal > box size, called "reversal chart"

**Variations:**
- Without grid lines but with reference lines at period starts
- Stepped line (swing chart)
- Segmented line
- Actual values instead of symbols

## Notes

The point and figure chart is unusual among financial charts in completely ignoring time. This makes it useful for focusing purely on price behavior patterns. The trade-off is losing temporal context - viewers cannot tell how long moves took or when reversals occurred.

The box size and reversal value choices significantly affect what patterns are visible. Analysts may use multiple P&F charts of the same data with different parameters to see both fine detail and broader trends.
