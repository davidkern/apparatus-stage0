---
name: Leading and Lagging Indicators
slug: leading-lagging-indicators
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Lagging Indicator, p. 202; Leading Indicator, p. 203"

intent: Show temporal relationships between correlated data series where one consistently precedes or follows the other
direction: both

components:
  - element: reference-series
    encodes: The data series used as the temporal anchor
    required: true
  - element: indicator-series
    encodes: The correlated series that leads or lags the reference
    required: true
  - element: time-scale
    encodes: Horizontal axis showing time progression
    required: true
  - element: lag-annotation
    encodes: Visual or textual indication of the time offset
    required: false

parameters:
  indicator_type: "leading | lagging"
  time_offset: "fixed period (e.g., 2 months)"

related: []  # TBD: see also time-series-graph

warnings:
  - "Correlation does not imply causation - leading indicators may be coincidental"
  - "The lag period may not be constant across all conditions"

extensions:
  harris_entry: "Lagging Indicator, Leading Indicator"
  typical_use: "economic analysis, forecasting, understanding causal or predictive relationships"
---

## Description

When one data series consistently occurs a fixed period of time before or after another correlated series, the temporal relationship is described using leading and lagging indicators:

- **Leading indicator**: A data series that consistently occurs before another. On a graph with a time scale, the leading series is shifted to the left relative to what it predicts or correlates with.
- **Lagging indicator**: A data series that consistently occurs after another. On a graph with a time scale, the lagging series is shifted to the right.

These relationships are reciprocal: if series A leads series B, then series B lags series A.

## Examples

Harris illustrates with wholesale and retail prices:

> "When something consistently occurs a given period of time before something else, it is sometimes called a leading indicator. The term is frequently applied to a curve of something that is correlated with the curve of something else, except it occurs a fixed period of time before (i.e., is shifted to the left on a graph with a time scale). For example, wholesale prices often are leading indicators of retail prices. Conversely, retail prices are often lagging indicators of wholesale prices." (p. 203)

The accompanying graph shows two data series over a year (J-F-M-A-M-J-J-A-S-O-N-D-J-F), with Data series #1 consistently preceding Data series #2 by approximately two months. An annotation indicates "Amount that data series #1 leads data series #2."

## Usage

Leading/lagging indicator graphs are appropriate when:
- Showing predictive relationships between economic or business metrics
- Analyzing cause-and-effect timing in correlated phenomena
- Forecasting future values based on current leading indicators
- Understanding supply chain or market dynamics

Construction considerations:
- Use a consistent time scale that makes the lag period visible
- Consider aligning the series temporally to show the correlation directly
- Annotate the lag period for clarity
- Plot both series on the same graph to enable visual comparison

## Notes

The concept is widely used in economics (e.g., housing starts as a leading indicator of construction employment) and business analysis. The visual representation on a line graph makes the temporal offset immediately apparent when both series are shown together.
