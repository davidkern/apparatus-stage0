---
name: Plotting Symbol
slug: plotting-symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, Plotting symbols, pp. 383-384"

intent: Designate the location of data points on graphs while differentiating between multiple data series
direction: both

components:
  - element: symbol-shape
    encodes: Data series membership (different shapes for different series)
    required: true
  - element: symbol-fill
    encodes: Additional differentiation (filled vs. unfilled)
    required: false
  - element: symbol-size
    encodes: Consistency across series or third variable
    required: false
  - element: legend
    encodes: Mapping between symbols and data series names
    required: true

parameters:
  shape_type: geometric | letter | specialized
  fill_style: filled | unfilled | mixed
  series_count: single | multiple

related: []  # TBD: see symbol, overlapping-symbol-techniques

warnings:
  - "Difficulty spotting patterns, relationships, and trends when multiple data series use similar symbols"
  - "Overlapping data points can make it difficult or impossible to know how many data elements are present at a location"
  - "Trial and error may be required to determine the combination of symbols that best satisfies graph objectives"

extensions:
  harris_entry: "Symbol"
  alternate_names: ["plot symbols", "markers", "data point symbols"]
  common_shapes: ["circle", "square", "triangle", "diamond", "cross", "asterisk"]
---

## Description

Plotting symbols (sometimes called plot symbols or markers) are the symbols used to designate the location of data points on graphs. They generally are simple geometric shapes; however, they can be any shape, size, configuration, or color.

Harris identifies two problems that are occasionally encountered when using plotting symbols:
1. The difficulty of spotting patterns, relationships, and trends when multiple data series are plotted on the same graph
2. The problem of data points overlapping one another, making it difficult or impossible for the viewer to know how many data elements are present at a particular location (p. 383)

## Examples

**Multiple data series on one graph** (p. 383):

When multiple data series are plotted on the same graph, a different type of symbol is used for each series. Harris shows four variations using the same dataset:

> "In one graph, a particular combination of symbols might make each of the data series perfectly visible. In another graph, due to the number and location of the data points, a different set of symbols might make it easier to analyze the data." (p. 383)

The illustrated examples show:
- Filled and unfilled geometric shapes (squares, circles, triangles)
- Unfilled geometric shapes only
- Filled geometric shapes only
- First letter of names as symbols (W for Wisconsin, M for Missouri, C for California)

**Comparison observations** (p. 383):
> "These examples illustrate how one combination of symbols might make the symbols stand out somewhat better, another might make the overlapping data points most visible, and still another may make it easiest to identify the data series without repeatedly referring to a legend."

## Usage

**Symbol selection considerations:**
- Different symbols for each data series to enable identification
- Consider which combination makes symbols most visible
- Consider which combination makes overlapping points most apparent
- Consider which symbols are most self-explanatory (reducing legend dependence)

**Common dingbat symbols** (p. 382):
Harris shows conventional dingbats frequently available on computers:
- X, asterisks in various sizes
- Filled and unfilled squares, diamonds, circles
- Triangles pointing up, down, left, right
- Crosses, plus signs

**Less conventional dingbats** include:
- Symbols incorporating two geometric shapes (e.g., circle in square, X in square)
- Combinations of filled and unfilled versions
- These "enable one to convey two or more bits of information with a single symbol" (p. 382)

## Notes

The choice of plotting symbols significantly affects graph readability. When the same data is plotted with different symbol combinations, the ease of analysis varies considerably. Harris recommends experimentation: "Sometimes trial and error is required to determine the combination of symbols that best satisfies the objectives of the graph" (p. 383).

Letters as symbols (using the first letter of data series names) can reduce dependence on legends but may create visual clutter with many data points.
