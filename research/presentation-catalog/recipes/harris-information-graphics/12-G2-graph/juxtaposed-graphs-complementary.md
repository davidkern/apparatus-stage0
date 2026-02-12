---
name: Juxtaposed Graphs with Complementary Data
slug: juxtaposed-graphs-complementary
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs juxtaposed (complementary data), pp. 171-172"

intent: Place multiple graphs adjacent to each other where each provides different but related information that together creates broader understanding
direction: both

components:
  - element: primary-graph
    encodes: Main data visualization
  - element: complementary-graphs
    encodes: Adjacent graphs providing related context
  - element: shared-axis
    encodes: Common dimension linking the graphs (often time)
  - element: aligned-layout
    encodes: Vertical or horizontal arrangement maintaining visual alignment

parameters:
  arrangement: "above-below | side-by-side"
  data_relationship: "marginal distribution | correlated measures | component-whole"

related: []  # TBD: marginal-frequency-distribution, control-charts, price-volume-chart

warnings:
  - "Graphs must share a meaningful common dimension for complementary effect"
  - "Alignment between graphs is critical for visual correlation"
  - "Scale differences between complementary graphs can mislead"

extensions:
  harris_entry: "Graph"
  alternate_names: ["panel graphs", "linked graphs"]
  typical_use: "showing related but different aspects of the same phenomenon"
---

## Description

When two or more graphs are placed immediately adjacent to one another, they are referred to as juxtaposed. With complementary data, the graphs assist one another to present broader, more meaningful information to the viewer. Each graph shows different but related information, and together they provide richer understanding than any single graph alone.

This technique differs from juxtaposing graphs with comparative data (where the goal is direct comparison). Here, each graph contributes unique information that complements the others.

## Examples

Harris provides three well-known examples of complementary juxtaposed graphs (pp. 171-172):

**Marginal Frequency Distribution Graph:**
> "One-axis graphs are added to the side and/or top of scatter graphs to show how data is distributed along an individual axis."

A scatter plot shows the relationship between two variables, while one-axis stripe or point graphs along the margins show the distribution of each variable independently.

**Price-Volume Chart:**
> "A price-volume chart is used extensively in the field of investment. The upper graph plots the key stock prices for a given period (normally a day). The lower graph plots the number of shares of the stock sold during the same period."

**X-Bar/R Control Chart:**
> "An X-Bar/R chart is widely used in the field of quality control. The upper graph displays sample averages and the bottom graph the spread of sample values."

## Usage

Most effective when:
- Different measures of the same phenomenon need simultaneous display
- Understanding requires seeing both primary data and its distribution
- Domain conventions expect linked displays (finance, quality control)
- Each graph answers a different question about shared data

Less effective when:
- Graphs share no common dimension
- The relationship between graphs is not intuitive
- Space constraints make alignment difficult

The technique works because human visual processing can correlate aligned elements across adjacent graphs, creating understanding neither graph provides alone.

## Notes

The three examples Harris provides represent established domain-specific patterns: marginal distributions for statistical analysis, price-volume for investment analysis, and X-Bar/R for quality control. These patterns have become conventions in their respective fields because the complementary information is consistently valuable.
