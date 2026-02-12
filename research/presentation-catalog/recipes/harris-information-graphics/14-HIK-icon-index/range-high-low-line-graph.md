---
name: Range and High-Low Line Graph
slug: range-high-low-line-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Range and high-low line graphs, p. 210"

intent: Show ranges of values (maximums/minimums, confidence intervals, standard deviations) at each data point, optionally with midvalues
direction: both

components:
  - element: upper-values
    encodes: Maximum, upper confidence limit, or upper bound of range
    required: true
  - element: lower-values
    encodes: Minimum, lower confidence limit, or lower bound of range
    required: true
  - element: midvalues
    encodes: Average, median, or central tendency (optional)
    required: false
  - element: range-symbols
    encodes: Vertical lines or bars connecting upper and lower values
    required: true
  - element: horizontal-axis
    encodes: Categories, sequence, or quantitative scale
    required: true

parameters:
  range_type: "max-min | confidence limits | standard deviation | standard error"
  midvalue_shown: "yes | no"
  lines_connecting_similar_values: "uppers | lowers | midvalues | none | all"

related: []  # TBD: see also error-bars, candlestick-chart

warnings:
  - "Clearly indicate what the upper and lower values represent"
  - "When midvalues are included, ensure they are labeled appropriately"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["high-low graph (when midvalues included)", "error bar graph"]
  typical_use: "showing variability, uncertainty, or ranges at each point"
  specialized_variations: ["open-high-low-close (OHLC)", "high-low-close (HLC)"]
---

## Description

Range and high-low line graphs designate ranges of values at each data point. The ranges shown might represent:
- Maximums and minimums
- Plus and minus three standard deviations
- Upper and lower confidence limits
- Upper and lower standard errors

When only upper and lower values are shown, the graph is typically called a range graph. When a series of midvalues (such as average or median) is also included, the graph is frequently referred to as a high-low graph.

## Examples

Harris shows four primary variations (p. 210):

1. **Upper and lower values only (range graph)**: Vertical lines or symbols connect upper and lower bounds at each point
2. **Upper, lower, and midvalues (high-low graph)**: Range indicators plus a distinct symbol for the middle value
3. **Upper, lower, and midvalues connected**: Horizontal lines connect similar values (all uppers, all lowers, all midvalues)
4. **Connected with range symbols removed**: Only the connecting lines remain, showing upper, lower, and midvalue trends

> "When the data is continuous, the common data points such as all of the uppers, all of the lowers, and/or all of the midvalues are sometimes connected by lines running from left to right. When this is done, the vertical lines or symbols designating the ranges are sometimes eliminated." (p. 210)

Harris also notes specialized financial variations:
> "A series of specialized high-low line graphs are referred to in some literature and software manuals as open-high-low-close (OHLC), high-low-close (HLC), etc. In investment literature and software, the same graphs are referred to as bar, price, or vertical line charts." (p. 210)

## Usage

Range and high-low graphs are appropriate when:
- Showing variability or uncertainty in data
- Comparing ranges across categories or time
- Displaying statistical bounds (confidence intervals, standard errors)
- Tracking price movements with high/low/open/close values

Construction considerations:
- Range symbols can be added to segmented, stepped, or smooth curve lines
- The particular symbols used for upper/lower/mid should be clearly differentiated
- A legend or annotation should explain what the range represents

## Notes

The standard error bar symbol (vertical line with horizontal caps at ends) is frequently used to mark upper and lower values. The flexibility to connect similar values (uppers to uppers, etc.) allows the graph to show both individual point variability and trends in the bounds themselves.
