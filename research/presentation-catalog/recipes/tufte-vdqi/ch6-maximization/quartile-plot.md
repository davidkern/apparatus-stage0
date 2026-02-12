---
name: Quartile Plot
slug: quartile-plot
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, p. 132"

intent: Extend the range-frame to show five-number summary (min, Q1, median, Q3, max) for both variables in a scatterplot
direction: construction

components:
  - element: x-axis-segment
    encodes: Full range (min to max) of X variable
    required: true
  - element: y-axis-segment
    encodes: Full range (min to max) of Y variable
    required: true
  - element: x-quartile-marks
    encodes: First quartile, median, third quartile positions on X axis
    required: true
  - element: y-quartile-marks
    encodes: First quartile, median, third quartile positions on Y axis
    required: true
  - element: data-points
    encodes: Individual bivariate observations
    required: true

parameters:
  mark_style: tick | gap | weight-change
  include_median: true | false

related: []  # TBD: see also range-frame

warnings:
  - "Requires sufficient axis length for quartile marks to be distinguishable"
  - "With few data points, quartile positions may be unstable"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "restructuring"
  figure_reference: "p. 132"
  original_form: "standard scatterplot"
  statistics_shown: 10  # min, Q1, median, Q3, max for both X and Y
---

## Description

The quartile plot extends the range-frame concept by marking the quartiles and median of each variable directly on the axis segments. Where a range-frame shows only the minimum and maximum (4 values for a bivariate plot), the quartile plot shows the complete five-number summary for both variables (10 values total).

This is achieved through "a small shift in the remaining ink" that adds tick marks or visual breaks at the quartile and median positions along each axis. The scatterplot now communicates not just the joint distribution of the two variables but also summary statistics of their marginal distributions.

## Examples

Tufte describes the extension from range-frame:

> "A small shift in the remaining ink turns each range-frame into a quartile plot." (p. 132)

The visual shows a scatterplot where the X and Y axis segments each have small marks or breaks at the 25th percentile, median, and 75th percentile positions, in addition to terminating at the data extremes.

On the information gain:

> "Erasing and editing has led to the display of ten extra numbers (the minimum, maximum, two quartiles, and the median for both variables). The design is useful for analytical and exploratory data analysis, as well as for published graphics where summary characterizations of the marginal distributions have interest." (p. 132)

## Usage

The quartile plot is appropriate when:
- Marginal distribution summaries are relevant to the analysis
- The viewer needs quick assessment of central tendency and spread
- Formal summary statistics should accompany the scatter pattern

Tufte's assessment is direct:

> "The design is nearly always better than the conventionally framed scatterplot." (p. 132)

Construction steps:
1. Create a range-frame (axes extending only to data min/max)
2. Calculate quartiles (Q1, median, Q3) for each variable
3. Mark these positions on the corresponding axis segment
4. Marks can be small ticks, gaps, or changes in line weight

The quartile plot represents a middle ground between:
- Range-frame: shows only extremes (4 numbers)
- Dot-dash-plot: shows complete marginal distributions
- Box plot: shows five-number summary but for single variable only

## Notes

The quartile plot demonstrates how incremental modifications to a base design can progressively increase information density. Starting from a conventional scatterplot, the sequence is:

1. Erase frame portions beyond data range -> range-frame (4 numbers added)
2. Mark quartiles on remaining frame -> quartile plot (6 more numbers added)
3. Replace frame with marginal distributions -> dot-dash-plot (all individual values shown)

Each step increases the data-ink ratio while maintaining the core function of showing the bivariate relationship.
