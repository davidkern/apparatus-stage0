---
name: Normal Distribution Curve
slug: normal-distribution-curve
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Normal Distribution Curve, pp. 249-250"

intent: Display the characteristic bell-shaped frequency distribution showing how data elements cluster around the mean with predictable proportions in each standard deviation
direction: both

components:
  - element: bell-curve
    encodes: Frequency distribution with characteristic symmetric shape
    required: true
  - element: center-line
    encodes: Mean/median/mode value (all identical in normal distribution)
    required: true
  - element: standard-deviation-markers
    encodes: Boundaries at 1, 2, and 3 standard deviations from mean
    required: false
  - element: frequency-axis
    encodes: Relative frequency or probability density
    required: true
  - element: value-axis
    encodes: Data element values
    required: true

parameters:
  display_type: "curve | histogram-with-curve"
  annotation_level: "none | standard-deviations | percentages"

related: []

warnings:
  - "Not all data sets have normal distributions - verify before assuming"
  - "The exact shape varies between data sets based on how spread out the elements are"

extensions:
  harris_entry: "Normal Distribution Curve"
  alternate_names: ["normal frequency curve", "bell curve", "Gaussian distribution"]
  typical_use: "statistical analysis, quality control, understanding data spread"
---

## Description

A normal distribution curve is a frequency polygon for a set of data that has a normal distribution. While the exact shape differs from data set to data set, all normal distribution curves have a similar bell-shaped appearance. The normal distribution is one of the most common types of distributions, occurring frequently in nature.

All data sets with normal distributions share distinguishing characteristics: the average, median, and mode are identical and located at the center; the curve is symmetrical about the average value; and data elements follow well-defined patterns within standard deviations.

## Examples

Harris describes the key characteristics:

> "All data sets with normal distributions have certain distinguishing characteristics including:
> - The average, median, and mode are all the same and are located at the center of a curve of the distribution;
> - The curve is symmetrical about the average value; and
> - The distribution of data elements follow well-defined patterns." (p. 249)

On the standard deviation structure:

> "Normal distribution curves are broken into the following eight segments along the horizontal axis:
> - Three equal segments to the left of the average, called standard deviations, plus one segment that includes all values below the three standard deviations.
> - Three equal segments to the right of the average, called standard deviations, plus one segment that includes all values above the three standard deviations." (p. 249)

The distribution of data elements:
- About 68% fall within +/- 1 standard deviation
- About 95% fall within +/- 2 standard deviations
- About 99% fall within +/- 3 standard deviations
- About 34% in each of the two segments immediately adjacent to the mean
- About 13.5% in each of the next segments
- About 2% in each of the outer segments
- About 0.5% beyond three standard deviations on each side

Harris also describes alternative display formats:

> "When the cumulative percent frequency data for a data set with a normal distribution is plotted on a linear grid, the curve resembles an elongated S. This type of graph is sometimes called a cumulative frequency or ogive graph." (p. 250)

> "When the cumulative percent frequency data for a data set with a normal distribution is plotted on a normal probability grid, the curve approximates a straight line. This type of graph can be used to determine if a data set has a normal distribution." (p. 250)

## Usage

Normal distribution curves are useful for:
- Understanding how data spreads around a central value
- Predicting what proportion of data falls within given ranges
- Quality control applications (process capability, tolerance analysis)
- Statistical inference and hypothesis testing
- Communicating statistical concepts to audiences

Display considerations:
- Annotating standard deviation boundaries helps viewers understand the structure
- Showing the percentage in each region aids interpretation
- The exact curve shape depends on the data's spread (standard deviation)
- Steeper/narrower curves indicate less variability; flatter/wider curves indicate more

Testing for normality:
- Plot cumulative frequency on a normal probability grid
- If the data is normally distributed, points cluster around a straight line
- Significant deviations from a straight line indicate non-normal distribution

## Notes

The normal distribution's mathematical properties make it fundamental to statistical analysis. Understanding that approximately 95% of data falls within two standard deviations provides an intuitive basis for confidence intervals and statistical significance testing.
