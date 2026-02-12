---
name: Histogram Smoothing Techniques
slug: histogram-smoothing-techniques
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Histogram and Frequency Polygon, p. 193"

intent: Reduce the stepped appearance of histograms to better reveal underlying distribution patterns
direction: construction

components:
  - element: smoothed-curve
    encodes: Estimated continuous distribution underlying the discrete histogram
    required: true
  - element: original-histogram
    encodes: Reference for the smoothing (sometimes displayed alongside)
    required: false

parameters:
  smoothing_method: "density trace | hand-fitted curve | normal curve overlay"
  show_original: "yes | no"

related: []  # TBD: histogram, frequency-polygon, density-trace

warnings:
  - "Density trace results in multiple counting of values; vertical scale values are inflated"
  - "Normal curve overlay can be misleading if actual distribution is significantly non-normal"
  - "Hand-fitted curves are subjective and least accurate"

extensions:
  harris_entry: "Histogram and Frequency Polygon"
  typical_use: "revealing continuous distribution patterns, reducing sensitivity to bin width selection"
---

## Description

Harris describes three techniques for smoothing histograms beyond simple frequency polygons. These methods address limitations of standard histograms: the arbitrary effect of bin width selection, sharp discontinuities between intervals, and the false impression that data is uniformly distributed within each interval.

## Examples

**Density trace curves** (p. 193):

> "In a standard histogram, class intervals do not overlap. In a density trace, the number and width of the intervals is purposefully chosen to assure that every interval overlaps two or more other intervals."

Harris explains the method: intervals might be two units wide but centered only half a unit apart, creating substantial overlap. Only the values at centerlines are plotted and connected by a smooth line.

> "The overlapping results in multiple counting of most values; consequently the values on the vertical scale are larger than on the standard histogram. Since the shape of the curve and the location of the modes is generally of more interest than the actual values, the difference in counts generally causes no difficulty. In fact, to avoid confusion, the vertical scale is sometimes omitted."

**Hand-fitted curve** (p. 193):

> "The simplest, although least accurate, smoothing technique involves hand-fitting a curve to a histogram. When this is done, an effort is made to have the area under the fitted curve the same as the area of the histogram. When curves are hand-fitted, the histogram is frequently displayed along with the curve."

**Normal curve overlay** (p. 193):

> "In some situations a normal distribution curve is superimposed over a histogram. The normal curve is frequently based on the average and standard deviation of the data series plus the assumption that the distribution of the data set is normal. This can be misleading if the actual distribution is significantly different from normal."

## Usage

Smoothing techniques are useful when:
- The underlying distribution is known or assumed to be continuous
- Comparing observed data to theoretical distributions
- Reducing artifacts from arbitrary bin width selection
- Communicating the general shape rather than precise interval values

Choose the method based on purpose:
- **Density trace**: Best for revealing modes and shape without theoretical assumptions
- **Normal curve**: Appropriate when testing or illustrating normality
- **Hand-fitted**: Quick visual approximation when precision is not critical

## Notes

Harris notes that varying the width and number of intervals in density traces changes the curve shape and can slightly shift the apparent mode location. This sensitivity to parameters is a trade-off for the smoother appearance.
