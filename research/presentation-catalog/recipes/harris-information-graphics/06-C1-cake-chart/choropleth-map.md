---
name: Choropleth Map
slug: choropleth-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Choropleth Map, p. 72"

intent: Display area-based statistical data using shading, color, or patterns within geographic boundaries
direction: both

components:
  - element: areal-units
    encodes: Geographic regions (countries, states, counties, zip codes, trading areas)
    required: true
  - element: fill-encoding
    encodes: Shading, color, or pattern indicating data values
    required: true
  - element: class-intervals
    encodes: Legend showing which fill corresponds to which value range
    required: true
  - element: boundaries
    encodes: Lines separating the geographic regions
    required: true

parameters:
  data_type: ratio | percent | rate
  fill_method: shading | color | pattern | crosshatch
  class_interval_method: equal | quantile | natural_breaks | custom

related: []

warnings:
  - "Data should be ratios, percents, or rates rather than absolute values"
  - "Larger areas may dominate visual attention even if they contain less data"

extensions:
  harris_entry: "Choropleth Map"
  alternate_names: ["shaded map", "crosshatched map", "textured map"]
  typical_use: "displaying rates, percentages, or per-capita values across geographic regions"
  see_also: ["Statistical Map"]
---

## Description

A choropleth map is a variation of a statistical map that displays area data by means of shading, color, or patterns. The areas (sometimes called areal units) might be countries, states, territories, counties, zip codes, trading areas, etc.

The data is generally in terms of ratios, percents, or rates as opposed to absolute units. For example, incomes would typically be given in terms of dollars per capita or dollars per household as opposed to total dollars for the area.

Data is often organized into class intervals.

## Examples

Harris provides a regional example (p. 72):

> The map shows a region divided into multiple geographic units, each filled with different shading densities. The legend shows class intervals:
> - 350 to 400 (darkest)
> - 300 to 349
> - 250 to 299
> - 200 to 249
> - 150 to 199
> - 100 to 149
> - 50 to 99
> - 0 to 49 (lightest/white)

The shading progresses from dark (high values) to light (low values), allowing viewers to quickly see geographic patterns in the data.

## Usage

Choropleth maps are appropriate when:
- Data is associated with defined geographic regions
- Values are rates, percentages, or per-capita measures
- The goal is to show geographic patterns in data distribution

The technique is less appropriate for:
- Absolute values (which correlate with area size)
- Point-located data
- Continuous phenomena that don't respect boundaries

## Notes

The choice of class intervals significantly affects map interpretation. Equal intervals, quantile-based intervals, and natural breaks methods each reveal different aspects of the data distribution.

Harris cross-references Statistical Map for additional detail on class interval determination and other statistical mapping techniques.
