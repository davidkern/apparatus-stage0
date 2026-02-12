---
name: Error Bar
slug: error-bar
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Error Bar, p. 148"

intent: Convey statistical information about data uncertainty by adding short lines showing ranges such as confidence intervals, standard deviations, or percentiles
direction: both

components:
  - element: data-point
    encodes: Central value (mean, median, or measured value)
  - element: error-bar-line
    encodes: Range of statistical uncertainty
  - element: terminus-symbols
    encodes: Endpoints of the range (perpendicular lines or symbols)

parameters:
  statistic_type: confidence-interval | standard-deviation | standard-error | percentile-range
  multiplier: 1 | 2 | 3 (for standard deviations)
  orientation: vertical | horizontal | both

related: []

warnings:
  - "Always specify what the error bars represent (SD, SE, CI, etc.)"
  - "Different statistics have different interpretations; viewers often confuse them"

extensions:
  harris_entry: "Error Bar"
  alternate_names: []
  typical_use: "scientific data presentation, showing measurement uncertainty, comparing group means with variability"
---

## Description

Error bars are short lines used to convey statistical information about the data displayed on graphs. When a data point represents a summary statistic like a mean, the error bar adds information about the underlying distribution or uncertainty: confidence intervals, standard deviations, standard errors, or percentile ranges.

The bars run parallel to quantitative scales, extending above and below (or on both sides of) the central value. Symbols or perpendicular lines at the endpoints mark the range limits.

## Examples

Harris provides annotated illustrations (p. 148):

> "Error bars are short lines used to convey statistical information about the data displayed on graphs. For example, if a data point represents the average of a set of numbers, the error bar might denote additional information about the same set of numbers, such as confidence interval, plus and minus 1, 2, or 3 standard deviations, standard errors, or the 10th and 90th percentiles."

The diagrams show:
- Central data point (average value)
- Upper value extending to error bar end (e.g., plus 3 standard deviations, 90th percentile)
- Lower value extending to error bar end (e.g., minus 3 standard deviations, 10th percentile)
- Symbols or perpendicular lines at endpoints

On orientation:
> "Error bars run parallel to quantitative scales and therefore can run either vertical or horizontal."

On multiple axes:
> "When there are two quantitative scales, two sets of error bars are sometimes used."

Harris notes the family relationship:
> "Error bars are members of a family of range symbols."

## Usage

Error bars are essential when:
- Data points represent averages or estimates with uncertainty
- Statistical comparisons between groups require uncertainty display
- Scientific or technical standards require uncertainty quantification
- Viewers need to judge whether differences are meaningful

Critical guidance:
- Always label or explain what statistic the error bars represent
- Standard deviation shows data spread; standard error shows precision of the mean
- Confidence intervals allow inference about population parameters
- Percentiles describe the actual distribution of observations

## Notes

The interpretation of error bars varies dramatically based on what statistic they represent. Two means with overlapping error bars might or might not be statistically different, depending on whether the bars show standard deviations, standard errors, or confidence intervals. Clear labeling is not optional.

When scatter plots have two quantitative axes, error bars can extend in both directions from each point, showing uncertainty in both the X and Y measurements.
