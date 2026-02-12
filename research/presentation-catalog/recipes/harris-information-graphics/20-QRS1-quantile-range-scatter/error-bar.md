---
name: Error Bar
slug: error-bar
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Range Symbols and Graphs, p. 325"

intent: Indicate statistical characteristics of data points such as standard deviations, standard errors, or confidence intervals through extending lines from data markers
direction: both

components:
  - element: data-point
    encodes: Central value (mean, observed value) at the symbol center
    required: true
  - element: error-bar-line
    encodes: Vertical (Y) or horizontal (X) line extending from data point showing range of uncertainty
    required: true
  - element: cap-or-serif
    encodes: Short perpendicular line or symbol at bar ends marking the extent
    required: false

parameters:
  orientation: "vertical (Y) | horizontal (X) | both"
  symmetry: "symmetric | asymmetric"
  cap_style: "serif | dash | circle | dot | none"
  extent: "one-sided | two-sided"

related:
  - slug: range-symbols-and-graphs
    relationship: contained-by

warnings:
  - "Error bars can have many different meanings (standard deviation, standard error, confidence interval); always include legend clarification"
  - "Cap size sometimes encodes additional information; note if this convention is used"
  - "Asymmetric error bars may be needed for skewed data"

extensions:
  harris_entry: "Range Symbols and Graphs"
  alternate_names: ["uncertainty bars", "confidence bars"]
  typical_use: "showing measurement uncertainty, statistical variability, confidence intervals on point and line graphs"
  common_statistics: ["standard deviation", "standard error", "confidence interval"]
---

## Description

Error bars are range indicators frequently used to show statistical characteristics of data points or data sets. They extend from a data point to indicate values such as standard deviations, standard errors, or confidence intervals.

**Orientation**: Horizontal error bars are called X error bars; vertical error bars are called Y error bars. Both can be used on the same data point when data varies in both directions.

**Caps**: Error bars generally have a symbol (dash, circle, dot) at their ends, sometimes called a cap or serif. The cap itself is sometimes referred to as the error bar. Occasionally, cap size encodes additional information.

**Variations**:
- Bars can be equal or different lengths on either side of the data point (for skewed data)
- Can appear on one or both sides of the data point
- When both X and Y error bars are used, an oval is sometimes drawn around them
- Sometimes only the cap is shown, or both bar and cap are eliminated and just the value displayed

Error bar lengths equal the statistical values they represent and are drawn to the same scale as the corresponding data series.

## Examples

Harris illustrates error bar variations (p. 325):
- Y error bar (vertical only)
- X and Y error bars combined
- Caps only, no vertical lines
- Values shown where caps would be
- X and Y error bars with oval
- Oval only
- Different lengths on either side
- One side only (one way)

> "Error bars are frequently used to indicate some statistical characteristic of a data set or of a specific data point. For example, they might be used to indicate standard deviations, standard errors, confidence intervals, etc." (p. 325)

## Usage

Error bars appear on point graphs, line graphs, and column graphs. They communicate:

- **Precision**: Smaller error bars indicate more precise measurements or less variable data
- **Significance**: Non-overlapping error bars often (but not always) indicate statistically significant differences
- **Uncertainty**: Range of plausible values given measurement or sampling error

Common statistical interpretations:
- Plus/minus 1, 2, or 3 standard deviations
- Plus/minus 1 or 2 standard errors
- 90%, 95%, or 99% confidence intervals

## Notes

Since the same error bar appearance can represent different statistics, legends must clearly specify what the error bars represent. This is one of the most important documentation requirements for graphs using error bars.
