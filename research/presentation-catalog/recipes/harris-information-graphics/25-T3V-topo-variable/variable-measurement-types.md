---
name: Variable Measurement Types
slug: variable-measurement-types
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Variable, p. 430"

intent: Classify variables by the type of data or measurement they contain to determine valid operations and display methods
direction: recognition

components:
  - element: interval-data
    encodes: Distinct quantitative values like temperatures, currency, weights
    required: false
  - element: ratio-data
    encodes: Mathematical comparisons between entities (A is twice as big as B)
    required: false
  - element: ordinal-data
    encodes: Rankings without quantitative magnitude (most/average/least, first/second/third)
    required: false
  - element: nominal-data
    encodes: Names or descriptions of entities that can be sorted but not ranked
    required: false

parameters:
  measurement_type: "interval or ratio or ordinal or nominal"

related: []

warnings:
  - "Numbers assigned to nominal data as identifiers do not change the data's classification"
  - "Ordinal data indicates relative ranking but not magnitude of differences"
  - "Interval data can be compared and manipulated mathematically"

extensions:
  harris_entry: "Variable"
  typical_use: "determining what mathematical and visual operations are valid for a given dataset"
---

## Description

Variables can be classified by the type of data or measurement they contain. This classification determines what operations are valid on the data and influences how the data should be displayed. Harris describes four measurement types forming a hierarchy from most to least informative.

**Interval** (sometimes called quantitative or value): Each entity has a distinct quantitative value, such as temperatures in degrees, currency in dollars, weight in kilograms. Interval data typically consists of numbers that can be ranked, compared, and mathematically manipulated.

**Ratio** (sometimes considered a subcategory of interval): Entities are mathematically compared to one another or some reference value. The data might indicate that A is twice as big as B, or B is 3.7 times as big as C. Ratio data is typically expressed as numbers.

**Ordinal** (sometimes considered sequential): Allows ranking of entities in terms of some nonquantitative criteria such as which entity has more or less of a particular quality. Things might be ranked as most/average/least; first/second/third; upper/middle/lower; or best/average/worst. The viewer can tell if one thing is bigger, better, or faster than another, but not by how much.

**Nominal** (sometimes called categorical or qualitative): Made up of words constituting names or descriptions of people, places, things, or events. Nominal data can be sorted alphabetically but cannot be ranked or mathematically manipulated. Numbers assigned as identifiers or labels do not change the nature of the data.

## Examples

Harris provides a table showing all four measurement types for the same dataset (p. 430):

Field A: Tons of crop = 24, Compared to last years average = 0.9, Ecological ranking = 2, Type soil = Acidic
Field B: Tons of crop = 42, Compared to last years average = 1.5, Ecological ranking = 4, Type soil = Sandy
Field C: Tons of crop = 31, Compared to last years average = 1.1, Ecological ranking = 3, Type soil = Neutral
Field D: Tons of crop = 35, Compared to last years average = 1.3, Ecological ranking = 1, Type soil = Marshy

> "Nominal values are typically made up of words constituting the names or descriptions of people, places, things, or events. Nominal data can be sorted alphabetically but cannot be ranked or mathematically manipulated. Sometimes numbers are assigned to nominal data as identifiers or labels, but the numbers do not change the nature or classification of the data. It still remains nominal data." (p. 430)

## Usage

Understanding measurement type determines valid operations:

**Interval data**:
- Can calculate means, standard deviations, differences
- Can plot on quantitative scales
- Line graphs, histograms, scatter plots are appropriate
- Interpolation between values is meaningful

**Ratio data**:
- All interval operations are valid
- Additionally, ratios and proportions are meaningful
- Percent changes and multipliers can be calculated
- Zero has absolute meaning

**Ordinal data**:
- Can determine relative position (higher/lower, better/worse)
- Cannot calculate meaningful averages
- Median is more appropriate than mean
- Bar charts with ordered categories are appropriate
- Spacing between ranks is not meaningful

**Nominal data**:
- Can count frequencies within categories
- Can sort alphabetically or by other non-ranked criteria
- Cannot rank or perform mathematical operations
- Pie charts, bar charts with unordered categories are appropriate

## Notes

The measurement type hierarchy (nominal < ordinal < interval/ratio) indicates increasing information content. A variable with interval-level measurement contains more usable information than one with only ordinal-level measurement.

When in doubt about measurement type, treat data at the lower level to avoid invalid operations. For example, if unsure whether rankings represent true interval differences, treat as ordinal.

This classification system overlaps with but differs from the quantitative/category/sequence system. Interval and ratio are subtypes of quantitative. Ordinal relates to sequence. Nominal corresponds to category.
