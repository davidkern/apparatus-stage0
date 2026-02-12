---
name: Moving Average
slug: moving-average
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Moving Average, pp. 243-244"

intent: Smooth short-term fluctuations in time series data to reveal underlying trends
direction: both

components:
  - element: actual-data-curve
    encodes: The original time series values showing all fluctuations
    required: false
  - element: moving-average-curve
    encodes: Smoothed values calculated from rolling averages of consecutive periods
    required: true
  - element: time-axis
    encodes: Sequential time periods
    required: true
  - element: value-axis
    encodes: Scale for the measured values
    required: true

parameters:
  averaging_type: "simple | weighted | exponential"
  period_count: "3 to 200 periods typical"
  centering: "trailing | centered"

related: []

warnings:
  - "Moving average curves tend to have a delayed reaction to changes"
  - "Fewer periods make the curve follow actual data more closely; more periods create smoother curves"
  - "Weighted and exponential curves respond faster to changes than simple averages"

extensions:
  harris_entry: "Moving Average"
  alternate_names: ["rolling average", "trend line"]
  typical_use: "identifying trends in noisy sequential data"
---

## Description

A moving average is a method used to smooth the curve of a data series and make general trends more visible. The method involves generating a second curve with short-term peaks and valleys smoothed out.

Each point on a moving average curve is typically calculated by averaging the value for the current period plus a fixed number of prior periods. Each time a new period value is added, the oldest period in the previous calculation is dropped. The curves are generally superimposed over a graph of the actual data and in time phase with the actual data.

## Examples

Harris explains the calculation:

> "Each point on a moving average curve is generally calculated by averaging the value for the current period plus a fixed number of prior periods. Each time the value for a new period is added, the value for the oldest period in the previous calculation is dropped. For example, if monthly sales data were being tracked, a three-month period might be used for the average. Thus, in March, the values for January, February, and March would be averaged and that point plotted. In April, the values for February, March, and April would be averaged and that point plotted." (p. 243)

On the effect of period count:

> "As a general rule, the fewer the time intervals used in the averaging process, the more closely the moving average curve resembles the curve of the actual data. Conversely, the greater the number of intervals, the smoother the moving average curve." (p. 243)

Harris illustrates this with three examples showing the same data with 3-month, 6-month, and 9-month moving averages, demonstrating progressively smoother curves.

**Three major types of moving averages**:

> "**Simple average** - Values plotted are based on averaging the actual values for a uniform number of periods.
> **Weighted average** - Values are calculated the same as for the simple average except each period used in the average is given a different weighting with the most recent value receiving the highest weighting.
> **Exponential average** - Similar to the weighted average variation, except that the weighting values decrease exponentially as the age of the data increases." (p. 243)

> "Weighted and exponential curves generally are more responsive to short time fluctuations than simple moving averages because of the greater emphasis placed on the most current values." (p. 243)

## Usage

Moving averages are appropriate when:
- Short-term noise obscures underlying trends
- You need to identify directional momentum in sequential data
- Comparing the smoothed trend against actual values reveals significant deviations

Choosing the period count:
- **Shorter periods (3-5)**: Follow actual data more closely, less smoothing
- **Medium periods (10-20)**: Balance between responsiveness and smoothing
- **Longer periods (50-200)**: Maximum smoothing, significant lag

Choosing the averaging type:
- **Simple**: Equal weight to all periods, most lag
- **Weighted**: More responsive to recent changes
- **Exponential**: Most responsive to recent changes, mathematically convenient

The centered moving average alternative bases calculations on periods on either side of the current point (e.g., three before and three after), which eliminates lag but requires future data.

## Notes

Technical stock analysts use moving averages in specialized ways including multiple curves with different periods (crossover signals), envelope bands (boundary signals), and shifted curves (displaced averages). These applications have specialized terminology: fast moving averages (few periods), slow moving averages (many periods), and front loaded (weighted/exponential).
