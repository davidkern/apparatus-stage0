---
name: Difference Column Graph
slug: difference-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Difference column graph, pp. 87-88"

intent: Visualize differences between two values or between actual values and a reference
direction: both

components:
  - element: difference-columns
    encodes: Gap between two values or between value and reference
    required: true
  - element: endpoint-markers
    encodes: The two values being compared (in simple difference variant)
    required: false
  - element: quantitative-scale
    encodes: Numeric values on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true
  - element: direction-coding
    encodes: Whether difference is positive/negative or favorable/unfavorable
    required: false

parameters:
  variant: "simple difference | change | deviation"
  direction_indicator: "none | color/shading | arrows | labels"
  favorability_indicator: "none | additional coding"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: deviation-column-graph
    relationship: contains

warnings:
  - "In simple difference graphs, absence of direction coding may confuse which series is larger"
  - "Change graphs must clearly indicate prior vs. subsequent values"
  - "Deviation graphs hide actual values, showing only differences from reference"

extensions:
  harris_entry: "Column Graph"
  alternate_names: []
  typical_use: "comparing test scores before/after, rainfall differences between locations, forecast changes"
  scale_types:
    vertical: "quantitative"
    horizontal: "category or sequence"
---

## Description

There are three major types of difference column graphs: simple difference, change, and deviation. All use a quantitative scale on the vertical axis and a category or sequence scale on the horizontal axis.

## Examples

### Simple Difference Column Graph

> "A simple difference graph compares two data series by plotting the actual values of the two data series and connecting the two values with a column." (p. 87)

Typical information for simple difference graphs:
- Average scores at the beginning and end of a semester
- Median incomes with and without a degree for various occupations
- Frequency of various diseases for two different countries
- Yearly rainfall in two countries for the past ten years

Three variations exist:
1. No indication of which series has the largest value (columns all same color)
2. Data series with largest/smallest values identified by abbreviations at column ends
3. Data graphics coded to indicate which series is largest for each interval

### Change Column Graph

> "A change graph compares multiple factors at two points in time or under two different sets of conditions. Actual values are plotted." (p. 87)

Direction of change is considered important, so coding systems indicate direction:
- Arrows with bases at prior values and tips at subsequent values
- Color/shading to indicate increase vs. decrease
- Additional coding for favorable vs. unfavorable

Typical data for change graphs:
- Changes in sales forecast from one month to the next
- Changes in unemployment from one period to the next
- Changes in key business indicators between periods

### Deviation Column Graph

> "One type of deviation graph focuses on the differences between a data series and a reference. Frequently the actual values of the data series are not plotted. Instead, the difference or deviation values are plotted against a zero axis." (p. 88)

For example, if comparing profit to budget: only the differences are shown. Profit exceeding budget shows as positive; below budget shows as negative; matching budget shows as zero.

## Usage

**Simple difference**: Use when comparing paired values across categories without emphasis on direction.

**Change**: Use when direction and magnitude of change between two conditions or times matters. Consider adding favorability coding when up/down does not inherently mean good/bad.

**Deviation**: Use when the relationship to a reference matters more than actual values. Can be extended to:
- Cumulative deviation (year-to-date)
- Gross deviation (showing both data series with columns extending up and down)
- Net deviation (only the differences plotted)
- Combined gross and net on one graph

## Notes

When deviations are plotted along a sequence scale (time series), a cumulative deviation graph is sometimes also plotted. The cumulative data might be superimposed over period data or on a separate graph. This shows whether performance over the full period meets targets even if individual periods vary.
