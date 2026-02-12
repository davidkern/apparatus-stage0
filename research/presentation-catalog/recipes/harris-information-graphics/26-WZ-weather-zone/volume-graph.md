---
name: Volume Graph
slug: volume-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Volume Graph, p. 437"

intent: Record trading volume (shares sold, contracts executed) over time intervals, typically paired with price charts for financial analysis
direction: both

components:
  - element: vertical-axis
    encodes: Volume figures (shares, contracts)
    required: true
  - element: horizontal-axis
    encodes: Time periods (days, weeks, months)
    required: true
  - element: volume-bars-or-lines
    encodes: Volume per time period
    required: true
  - element: price-chart
    encodes: Associated price data (often shown above volume)
    required: false

parameters:
  graph_type: vertical-line | segmented-line
  data_type: shares-sold | contracts-executed | contracts-open | price-reversals

related: []  # TBD: price-chart, bar-chart-financial, time-series-graph

warnings:
  - "Price-volume relationships may be as important as volume alone"

extensions:
  harris_entry: "Volume Graph"
  alternate_names: ["trading volume chart"]
  typical_use: "financial analysis, tracking market activity, securities trading"
---

## Description

Volume graphs record the number of shares of a stock sold (or similar trading metrics) in given time intervals such as days, weeks, or months. The volume tracked might be for an individual security or commodity, a family of securities, an exchange, or an entire market.

Besides share volume, these charts can also record:
- Number of contracts executed
- Number of contracts open at the end of trading
- Number of price reversals

## Examples

### Graph Types
> "Volume figures are recorded on the vertical axis and time on the horizontal axis. Vertical line graphs are generally used. Segmented line graphs are sometimes used." (p. 437)

Harris illustrates both forms showing volume (0-300,000) over time, with the vertical line graph showing discrete bars and the segmented line graph showing a connected line.

### Price-Volume Combination
> "Volume charts recording shares sold are generally used in conjunction with price charts, since the price-volume relationships are sometimes considered as important as the volume chart alone. This combination is sometimes referred to as a price-volume chart." (p. 437)

Harris shows a combined chart with price (30-36) on top and volume (in thousands, 0-6) below, sharing a common time axis.

## Usage

Volume graphs are appropriate for:
- Tracking trading activity over time
- Identifying unusual volume spikes
- Analyzing market participation levels
- Correlating volume with price movements

### Integration with Price Data

Volume charts are most commonly displayed beneath price charts, sharing the same time scale. This arrangement allows traders and analysts to:
- Spot volume confirmations of price trends
- Identify divergences between price and volume
- Assess the strength of price movements
- Recognize accumulation or distribution patterns

### Time Intervals

Common time periods include:
- Daily (most common for active trading analysis)
- Weekly (for intermediate-term analysis)
- Monthly (for long-term trends)

## Notes

The convention of displaying volume below price charts has become standard in financial charting software and publications. The shared time axis makes correlation between price action and volume immediately visible, which is essential for technical analysis methodologies that use volume as a confirming indicator.
