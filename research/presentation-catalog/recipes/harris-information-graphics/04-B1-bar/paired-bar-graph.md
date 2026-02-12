---
name: Paired Bar Graph
slug: paired-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Paired bar graph, p. 41"

intent: Compare two data series by plotting them in opposite directions from a central axis, emphasizing correlations and contrasts
direction: both

components:
  - element: left-extending-bars
    encodes: Values for first data series; measured leftward from center
    required: true
  - element: right-extending-bars
    encodes: Values for second data series; measured rightward from center
    required: true
  - element: central-category-axis
    encodes: Category labels between the two bar sets
    required: true
  - element: left-scale
    encodes: Quantitative scale for left-extending bars
    required: true
  - element: right-scale
    encodes: Quantitative scale for right-extending bars
    required: true
  - element: differential-fill
    encodes: Different colors/shades distinguish the two data series
    required: false

parameters:
  scale_units: same-units | different-units
  scale_intervals: same-intervals | different-intervals
  bar_spacing: spaced | joined
  grouping: simple | grouped | stacked | 100-percent

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: deviation-bar-graph
    relationship: contrasts
  - slug: population-pyramid
    relationship: variant-of

warnings:
  - "Units and scale intervals may differ between left and right scales, which can mislead if not clearly labeled"
  - "When bars touch (joined/no spaces), may be called a pyramid graph or two-way histogram"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "sliding bar graph"
    - "opposed bar graph"
    - "two-way bar graph"
    - "bilateral bar graph"
    - "pyramid graph"
    - "two-way histogram"
  typical_use: "comparing two data series with attention to correlations or meaningful relationships"
  variations:
    - "simple paired"
    - "grouped paired"
    - "stacked paired"
    - "100% paired"
    - "paired without spaces (pyramid)"
---

## Description

A paired bar graph plots two data series on the horizontal axis with values measured in opposite directions. Values for one data series extend to the right, values for the second extend to the left. This arrangement emphasizes comparison and correlation between the two series.

The units of measure and scale intervals for left and right scales may or may not be the same. For example, comparing male and female counts would use the same units (people) on both scales. Comparing employee count versus expenses would use different units (people vs. dollars).

## Examples

Harris illustrates five major types (p. 41):

**Simple paired bar graph:**
- Professions A-E on center axis
- Female count extends left, Male count extends right
- Same scale (4-3-2-1-0-1-2-3-4) on both sides

**Grouped paired bar graph:**
- Same structure but with two time periods (1980, 1990) per category
- Four bars per category (two left, two right)

**100% paired bar graph:**
- Years 1975-1995 on center axis
- "With degree" extends left, "Without degree" extends right
- Each row totals 100%
- Horizontal scales: 100% 50% 0% 0% 50% 100%

**Stacked paired bar graph:**
- Professions A-E on center axis
- Male/Female stacked segments on each side

**Paired without spaces (pyramid graph):**
- Age groups (0-10, 11-20, etc.) on center axis
- Male extends left, Female extends right
- No spaces between bars
- Classic population pyramid format

## Usage

**When to use:**
- Comparing two naturally opposed or complementary series (male/female, before/after, positive/negative sentiment)
- When correlation or contrast between two series is the message
- Population demographics by gender (population pyramid)

**Scale considerations:**
- Linear quantitative scales on both sides
- Generally all positive or all negative values
- Scales may have same or different units/intervals depending on purpose

**Design options:**
- Bars can be filled with different colors, shading, or patterns
- Grid lines can be used but often are not
- Central axis typically contains category labels

## Notes

The 100% paired variation is distinctive: the percents on the two sides always add up to 100% for a given category. This shows how a binary characteristic splits across categories.

When there are no spaces between bars, the paired bar graph is sometimes called a pyramid graph or two-way histogram. This format is standard for demographic age-sex pyramids.
