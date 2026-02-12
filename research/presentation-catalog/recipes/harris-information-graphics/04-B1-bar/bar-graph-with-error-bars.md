---
name: Bar Graph with Error Bars
slug: bar-graph-with-error-bars
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Graphs with ranges designated on bars, p. 43"

intent: Show a primary value (bar end) plus the range of uncertainty or variation around that value using range symbols
direction: both

components:
  - element: primary-bars
    encodes: Central values (average, median, etc.) via bar endpoints
    required: true
  - element: range-symbols
    encodes: Upper and lower bounds of uncertainty/variation beyond bar end
    required: true
  - element: quantitative-scale
    encodes: Value axis (horizontal)
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true

parameters:
  symbol_style: solid | narrow | error-bar | gradient
  symbol_width: same-as-bar | narrow
  range_type: standard-deviation | confidence-limits | high-low | other
  gradient_style: none | shaded | striped | tapered

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: range-bar-graph
    relationship: contrasts
  - slug: grouped-bar-graph
    relationship: combines-with

warnings:
  - "Almost never used with stacked or three-dimensional bar graphs"
  - "Crisp vertical lines may imply more certainty than actually exists"
  - "Gradient symbols, while more honest about uncertainty, are harder to read precisely"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "high-low bar graph"
    - "bar graph with error bars"
  typical_use: "showing uncertainty bounds around measured or estimated values"
  range_symbol_types:
    solid: "symbol same width as bar"
    narrow_top: "narrow symbol on top of bar"
    narrow_bottom: "narrow symbol on bottom of bar"
    error_bar: "I-shaped symbol extending from bar end"
  gradient_types:
    shaded: "heavier shading indicates higher probability"
    striped: "denser stripes indicate higher probability"
    tapered: "wider taper indicates higher probability"
---

## Description

Bar ends typically correspond to values such as average or median. Range symbols can be added to the ends of bars to indicate values that bracket this central value—such as high/low values, standard deviations, or confidence limits. This combination is sometimes called a high-low bar graph or bar graph with error bars.

## Examples

Harris illustrates three solid symbol styles (p. 43):

**Symbol same width as bar:**
- Range symbol extends from bar end with same visual weight
- Creates a continuous visual from bar through range
- Lower value, midvalue (bar end), upper value all encoded

**Narrow symbols on top or bottom:**
- Range symbol narrower than bar
- Can be positioned on top or bottom edge of bar
- Less visual weight than bar itself

**Error bar symbol (I-shaped):**
- Traditional error bar appearance
- Horizontal caps at upper and lower limits
- Clear visual separation from the bar

All examples show:
- Items A-E on vertical axis
- Scale 0-8 on horizontal axis
- Bar ends at midvalue
- Range symbols extending to lower and upper values

## Gradient Range Symbols

Harris addresses a problem with crisp range indicators: viewers may assume more certainty than exists. Solution: replace crisp lines with blurred/gradient graphics (p. 43).

**Gradient techniques:**

*Shaded gradient:*
- Actual value lies somewhere in shaded area
- Heavier shading indicates higher probability
- Lighter shading indicates lower probability

*Striped gradient:*
- Denser stripes indicate higher probability
- Sparser stripes indicate lower probability
- Can show probability skewed left, right, or centered

*Tapered gradient:*
- Wider taper indicates higher probability
- Narrower taper indicates lower probability

Harris notes: "Without defining a specific number that the viewer can focus on, the blurred graphic encourages the viewer to think in terms of a range of values within which the actual value exists."

The gradient technique applied to histograms is sometimes called a "fuzzygram."

## Usage

**When to use:**
- Scientific data with measurement uncertainty
- Survey results with confidence intervals
- Any context where showing uncertainty around estimates matters

**Symbol selection:**
- Solid/wide symbols: when range is as important as central value
- Narrow/error bar symbols: when central value is primary, range is secondary
- Gradient symbols: when conveying uncertainty itself (not just bounds) matters

**Compatibility:**
- Works well with simple and grouped bar graphs
- Almost never used with stacked bar graphs
- Almost never used with three-dimensional bar graphs

## Notes

The degree of confidence (e.g., 95% CI, ±1 standard deviation) may or may not be noted on the graph. Clear labeling of what the range represents is essential for proper interpretation.
