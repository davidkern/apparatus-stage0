---
name: Range Area Graph
slug: range-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Graph, Range and high-low type area graphs, p. 16"

intent: Display a range of values by filling the area between upper and lower boundary lines, showing uncertainty, variation, or bounds
direction: both

components:
  - element: upper-boundary-line
    encodes: Maximum, upper limit, or high values
    required: true
  - element: lower-boundary-line
    encodes: Minimum, lower limit, or low values
    required: true
  - element: filled-band
    encodes: Shaded area between upper and lower boundaries
    required: true
  - element: midvalue-line
    encodes: Line showing average, median, or fitted values (optional for high-low variant)
    required: false
  - element: error-bars
    encodes: Symbols indicating range at specific points (alternative representation)
    required: false

parameters:
  boundary_type: "max-min | confidence limits | standard deviations | tolerance"
  midvalue_type: "average | median | fitted curve | closing price"
  display_style: "band | high-low | envelope | error bars"

related: []  # TBD: see also simple-area-graph, difference-area-graph

extensions:
  harris_entry: "Area Graph"
  alternate_names: ["band graph", "silhouette graph", "area band graph", "high-low graph", "envelope"]
  typical_use: "showing ranges, uncertainty, confidence intervals, or price ranges"
---

## Description

When the area between the lines representing the upper and lower values on a graph is filled in, the result is called a range, silhouette, area band, or band graph. This technique is used to display ranges of values, uncertainty bounds, confidence intervals, or any situation where both upper and lower limits are meaningful.

## Variations

### Range or Band Graph

The basic form fills the area between upper and lower value lines. The filled region shows the span of possible or actual values at each point.

### High-Low Graph

When a line representing some variation of midvalues is shown in conjunction with upper and lower values, the result is sometimes called a high-low graph. The upper and lower values might represent:
- Maximum and minimum
- Plus and minus 1, 2, or 3 standard deviations
- Confidence limits

The midvalues might represent:
- Averages
- Medians
- Fitted curves

### Envelope (Stock Price Application)

A specialized variation of a high-low graph is used to record stock prices. The upper and lower ends of the symbols designate the highest and lowest prices of the stock for the period represented. The midvalues are generally the closing or average price for the period. When the area between the high and low values is filled, it is sometimes referred to as an envelope.

### Error Bars

Another way of showing a range or set of upper and lower values on an area graph is to incorporate symbols such as error bars into the area graph itself. With this technique, one can designate both an upper and lower limit, or just one or the other. For example, if the graph displays expected values and values that are not to be exceeded, only the upper half of the symbols might be displayed (half error bars).

## Examples

> "When the area between the lines representing the upper and lower values on a graph is filled in, the result is called a range, silhouette, area band, or band graph." (p. 16)

> "When a line representing some variation of midvalues is shown in conjunction with upper and lower values, the result is sometimes called a high-low graph." (p. 16)

> "A specialized variation of a high-low graph is used to record stock prices. The upper and lower ends of the symbols designate the highest and lowest prices of the stock for the period represented." (p. 16)

The PDF (p. 16) shows:
- A line graph for reference compared to a range or area band graph with the same upper and lower values
- A high-low graph example showing upper values, midvalues, and lower values
- An open-high-low graph (stock chart) with the range of prices indicated by shaded area
- Error bars added to an area graph, and half error bars showing only upper limits

## Usage

Range area graphs are appropriate when:
- Displaying uncertainty or confidence intervals
- Showing the spread between maximum and minimum values
- Presenting stock price ranges over time
- Visualizing tolerances or acceptable bounds
- Comparing expected values against actual ranges

**Scale note**: With range and difference graphs, the scale sometimes does not start at zero because the shaded or filled area does not extend to the zero axis.

## Notes

Error bars can be full (showing both upper and lower limits) or half (showing only one direction). Half error bars are sometimes used to indicate only an upper limit, tolerance, or expectation when the lower bound is not meaningful.
