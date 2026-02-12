---
name: Quantile-Quantile Graph
slug: quantile-quantile-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Quantile Graph, p. 318"

intent: Compare the distributions of two data sets by plotting values at common quantile positions against each other
direction: both

components:
  - element: x-axis-values
    encodes: Values from data set A at each quantile position
    required: true
  - element: y-axis-values
    encodes: Values from data set B at the same quantile positions
    required: true
  - element: data-points
    encodes: Points plotted using common quantile values as coordinates
    required: true
  - element: diagonal-reference
    encodes: Line showing where points would fall if distributions were identical
    required: false

parameters:
  axis_scale_matching: "same | independent"

related:
  - slug: quantile-graph
    relationship: variant-of

warnings:
  - "If X and Y scales are different, visual interpretation of distribution similarity is compromised"
  - "Both data sets must have values calculated at the same quantile positions for valid comparison"

extensions:
  harris_entry: "Quantile Graph"
  alternate_names: ["Q-Q plot", "Q-Q graph"]
  typical_use: "comparing distributions of two data sets, assessing whether two samples come from the same distribution"
---

## Description

A quantile-quantile graph (Q-Q plot) provides an alternative method for comparing the distributions of two data sets. Instead of plotting both data series on separate quantile graphs, this technique creates a combined graph where values from one data set serve as X coordinates and values from the other serve as Y coordinates, using common quantile positions to pair the values.

The procedure works by: (1) calculating quantile values for both data sets, (2) finding the values in each data set that correspond to the same quantile positions (e.g., 0.1, 0.3, 0.5, 0.7, 0.9), and (3) plotting these paired values with one set on the X-axis and the other on the Y-axis.

If the distributions of data elements in both sets are basically the same and the X and Y scales are identical, the data points will cluster around the diagonal line running from lower-left to upper-right.

## Examples

> "The upper right graph is an example of what is sometimes called a quantile-quantile graph. It is an alternate way of comparing the distributions of two data sets." (p. 318)

> "If the distribution of data elements in the two data sets are basically the same and the X and Y scales are the same, the data points in the quantile-quantile graph will cluster around the diagonal." (p. 318)

Harris provides a detailed graphical illustration showing how the values on the quantile-quantile graph are determined from the individual quantile plots of each data series.

## Usage

Quantile-quantile graphs are particularly useful when:
- Comparing whether two samples come from the same distribution
- Assessing goodness of fit between observed data and a theoretical distribution
- Identifying systematic differences between distributions (shifts, scale differences)

**Interpretation**:
- Points along the diagonal: distributions are similar
- Points above the diagonal: Data set B has larger values than Data set A at those quantiles
- Curved patterns: distributions differ in shape (e.g., one is more skewed)

## Notes

A straightforward alternative method for comparing multiple data sets is simply to plot them on the same quantile graph. Harris notes this is "a straightforward method for comparing multiple data sets" (p. 318). The Q-Q plot offers advantages when the comparison needs to be more direct or when testing specific distributional hypotheses.
