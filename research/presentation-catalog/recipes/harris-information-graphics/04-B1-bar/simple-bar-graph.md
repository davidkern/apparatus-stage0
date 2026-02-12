---
name: Simple Bar Graph
slug: simple-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Simple bar graph, p. 37"

intent: Display and compare quantitative values across categories using horizontal rectangles where bar length encodes value
direction: both

components:
  - element: horizontal-bars
    encodes: Quantitative values for each category; bar length proportional to value
    required: true
  - element: quantitative-scale
    encodes: Value axis (horizontal); typically linear starting at zero
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis (names, events, products, etc.)
    required: true
  - element: bar-width
    encodes: No data meaning; uniform throughout graph for visual consistency
    required: false
  - element: inter-bar-space
    encodes: Visual separation between categories; uniform throughout
    required: false
  - element: bar-margin
    encodes: Space between outermost bars and frame
    required: false

parameters:
  orientation: horizontal (bars extend left-to-right)
  scale_type: linear | logarithmic (almost always linear)
  value_direction: positive-only | positive-and-negative
  bar_spacing: spaced | joined

related:
  - slug: grouped-bar-graph
    relationship: variant-of
  - slug: stacked-bar-graph
    relationship: variant-of
  - slug: deviation-bar-graph
    relationship: variant-of
  - slug: column-graph
    relationship: contrasts

warnings:
  - "Bar graphs are for comparing values at a point in time; use column graphs for time series"
  - "Dual quantitative scales are seldom used on bar graphs"
  - "When bars become so wide there are no spaces between them, the graph may be called a joined bar graph, connected bar graph, stepped bar graph, or histogram"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "horizontal bar"
    - "horizontal column"
    - "rotated column graph"
  typical_use: "comparing values of multiple entities at a given point in time"
  scale_types:
    horizontal: "quantitative (always)"
    vertical: "category (typically)"
  design_notes:
    bar_width: "can be any width; uniform throughout a given graph"
    bar_spacing: "spaces between bars are uniform throughout"
    scale_start: "typically starts at zero"
---

## Description

A simple bar graph displays a single data series using horizontal rectangular bars. Each bar represents one data element, and the complete set of bars represents the data series. The end of each bar is located at the value it represents on the quantitative horizontal scale.

Bar graphs are most frequently used to show and compare values of multiple entities at a given point in time—for instance, year-to-date sales for each salesperson, or the population of the five largest cities as of a specific date.

The pronounced bar ends make this graph type effective for showing specific values. The stand-alone nature of the bars makes it well suited for representing discrete data.

## Examples

Harris illustrates a typical bar graph showing city populations (p. 37):
- City A through City E on the vertical (category) axis
- "Millions of people" scale from 0 to 6 on horizontal axis
- Each bar represents one city's population
- Components labeled: bar margin, bar width, inter-bar space, bar length

When both positive and negative values are plotted, the graph is sometimes called a deviation graph. Harris shows an example with "Change in class size" ranging from -6 to +8 (p. 37).

## Usage

**When to use:**
- Comparing values across categories at a single point in time
- Displaying discrete, non-continuous data
- When precise value reading is important (bar ends are easy to decode)

**When NOT to use:**
- For time series data (use column graph instead)
- When a sequential scale is needed on the category axis
- When showing continuous data relationships

**Joined bar graph variation:**
When bars become so wide there are no spaces between them, the graph may be called:
- Joined bar graph
- Connected bar graph
- Stepped bar graph
- Histogram

When quantitative scales are applied to both axes of a joined bar graph, it may be called a frequency bar graph, histogram, or area bar graph.

## Notes

Harris distinguishes bar graphs (horizontal rectangles) from column graphs (vertical rectangles). In this book, "bar graph" specifically means horizontal orientation.

The horizontal scale is always quantitative. The vertical scale is typically categorical but can be sequential (though column graphs are preferred for sequential/time applications).
