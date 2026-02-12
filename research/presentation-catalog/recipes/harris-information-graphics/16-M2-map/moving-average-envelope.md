---
name: Moving Average Envelope
slug: moving-average-envelope
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Moving Average, Band or envelope formed by moving averages, p. 244"

intent: Create boundary bands around a moving average to identify when data deviates significantly from the trend
direction: both

components:
  - element: center-moving-average
    encodes: The base trend line
    required: true
  - element: upper-boundary
    encodes: Moving average plus a fixed percentage
    required: true
  - element: lower-boundary
    encodes: Moving average minus a fixed percentage
    required: true
  - element: actual-data
    encodes: The original time series values
    required: true
  - element: crossover-points
    encodes: Locations where data crosses the envelope boundaries
    required: false

parameters:
  band_width: "percentage of moving average (varies by analyst)"
  averaging_periods: "number of periods in the base moving average"

related:
  - slug: moving-average
    relationship: variant-of

warnings:
  - "Band width percentage varies significantly by analyst and application"
  - "False signals occur when data briefly crosses boundaries without sustained movement"

extensions:
  harris_entry: "Moving Average"
  alternate_names: ["moving average band", "envelope band"]
  typical_use: "technical stock analysis, identifying overbought/oversold conditions"
---

## Description

A moving average envelope or band is formed by generating two additional curves at a prescribed amount, normally a percent of the moving average, above and below a standard moving average curve. This creates a channel or band around the trend line.

When actual values cross the envelope boundaries, it may signal that the data has deviated significantly from normal variation. Technical analysts often interpret boundary crossings as indicators for action.

## Examples

Harris describes the technique:

> "Sometimes a moving average envelope or band is formed by generating two additional curves at a prescribed amount, normally a percent of the moving average, above and below a standard moving average curve. The percent varies depending on the analyst. Some analysts feel that when the stock price crosses one of the boundaries of the envelope, an appropriate action should be initiated." (p. 244)

The illustration shows:
- Actual price data as an irregular curve
- A 5-day moving average as the center line
- A "Moving average envelope/band" formed by upper and lower boundaries
- "Crossover points" marked where the actual data penetrates the band boundaries

## Usage

Moving average envelopes are useful when:
- You need to identify when data has moved unusually far from trend
- Establishing normal variation bands for monitoring purposes
- Creating visual signals for action thresholds

Design considerations:
- **Band width**: Must be calibrated to the typical volatility of the data; too narrow creates frequent false signals, too wide rarely triggers
- **Base average periods**: Shorter periods create more responsive but noisier envelopes
- **Percentage calculation**: Typically symmetric (same percent above and below)

In technical stock analysis, boundary crossings are interpreted as potential signals:
- Price crossing above upper boundary: Potentially overbought, may signal selling opportunity
- Price crossing below lower boundary: Potentially oversold, may signal buying opportunity

## Notes

The envelope technique extends beyond financial applications to any domain where identifying significant deviations from trend is valuable, including quality control, performance monitoring, and anomaly detection. The key challenge is calibrating the band width appropriately for the specific application's volatility characteristics.
