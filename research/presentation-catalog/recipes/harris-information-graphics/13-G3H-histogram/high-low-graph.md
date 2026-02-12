---
name: High-Low Graph
slug: high-low-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "High-Low Graph, p. 186"

intent: Display the range between maximum and minimum values for each data point, with optional intermediate values like average or median
direction: both

components:
  - element: range-symbols
    encodes: Extent from lowest to highest value in each data set
    required: true
  - element: vertical-axis
    encodes: Value scale
    required: true
  - element: horizontal-axis
    encodes: Categories or time periods
    required: true
  - element: midvalue-markers
    encodes: Average, median, or other intermediate values (optional)
    required: false

parameters:
  symbol_type: "line | bar with range ends"
  midvalues: "none | average | median | open | close | multiple"
  orientation: "vertical | horizontal"

related: []  # TBD: range-graph, box-graph, stock-chart

warnings:
  - "Ensure legend clarifies what top and bottom of symbols represent"

extensions:
  harris_entry: "High-Low Graph"
  alternate_names: ["high-low-close graph", "HLC graph", "high-low-close-open graph", "HLCO graph"]
  typical_use: "stock prices, temperature ranges, measurement variability"
---

## Description

A high-low graph is a variation of a range graph in which symbols represent data sets, with one end indicating the highest or maximum value and the other end indicating the lowest or minimum value. One or more midvalues (such as average, median, opening price, or closing price) are frequently included.

This format is particularly common in financial applications for displaying stock price movements.

## Examples

Harris describes the technique (p. 186):

> "A variation of a range graph in which symbols represent sets of data, with one end indicating the value of the largest or highest data element in the set of data and the other end the smallest or lowest."

On symbol orientation:
> "With vertical symbols, the top represents the largest value. With horizontal symbols the right end designates the largest value."

On midvalue markers:
> "One or more midvalues are frequently included, such as average, median, first, etc."

Harris illustrates two variations: symbols displayed independently (just the range lines) and symbols used in conjunction with standard bars or columns.

On stock market usage:
> "A similar type of graph is frequently used for recording the price of stocks. When used for this purpose, although the symbols run vertically, it is generally referred to as a bar chart and sometimes as a high-low-close (HLC) graph or high-low-close-open (HLCO) graph."

## Usage

High-low graphs are appropriate for:
- Stock price visualization (daily high, low, open, close)
- Temperature ranges (daily high and low)
- Measurement variability across categories
- Any data with meaningful maximum and minimum bounds

The choice between independent range symbols and range symbols on bars/columns depends on whether the base value is meaningful or whether only the range itself matters.

## Notes

In financial contexts, open and close values are typically shown as small horizontal tick marks on the left (open) and right (close) of the vertical range line. This convention allows four values to be displayed for each time period.
