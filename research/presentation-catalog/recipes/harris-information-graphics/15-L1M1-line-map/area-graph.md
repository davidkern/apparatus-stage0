---
name: Area Graph
slug: area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Line Graph, Other names of line graphs when areas are filled, p. 216"

intent: Emphasize magnitude or cumulative values by filling the area under or between curves on a line graph
direction: both

components:
  - element: boundary-curve
    encodes: Upper limit of values at each point
    required: true
  - element: filled-area
    encodes: Visual mass representing cumulative or total value
    required: true
  - element: baseline
    encodes: Lower boundary (often zero axis or another curve)
    required: true

parameters:
  fill_type: "single area below curve | range between two curves | stacked areas"
  naming_convention: "area graph | filled line graph | surface graph | range graph | band graph"

related: []  # TBD: see also stacked-area-graph, range-graph

warnings:
  - "Name conventions vary by circumstance and custom; there are no strict guidelines"
  - "Filled areas can make it harder to read precise values compared to unfilled line graphs"

extensions:
  harris_entry: "Line Graph"
  alternate_names: ["filled line graph", "surface graph", "range graph", "band graph"]
  typical_use: "emphasizing volume or magnitude, showing ranges, cumulative totals"
---

## Description

When the areas under or between curves on a line graph are filled, the graph takes on additional visual properties and often assumes different names. The filling emphasizes the magnitude of values and creates a stronger visual impression of volume or accumulation.

Harris notes there are no strict guidelines for naming these variations; the choice depends on individual circumstances and customs.

## Examples

**Four variations shown** (p. 216):

1. **Area graph**: Single data series with the area below the curve filled, showing values over time (1991-1995). Generally referred to as an area graph.

2. **Range or band graph**: Two curves (upper values and lower values) with the area between them filled, showing a range for categories A through E. Sometimes referred to as range or band graph.

3. **Surface graph**: Multiple stacked filled areas creating a cumulative display, showing how components add up over time (1992-1998). Generally referred to as a surface graph.

4. **Filled line graph**: Simple single-series line with area below filled, displayed on a standard coordinate system. Sometimes referred to as area or filled line graph.

## Usage

Choose area filling when:
- You want to emphasize magnitude or volume rather than just the line shape
- Showing ranges between upper and lower bounds
- Displaying how multiple components stack to form a total (surface graph)
- Creating stronger visual impact for presentations

The unfilled line graph remains better when:
- Precise value reading is paramount
- Multiple overlapping data series need to be compared
- The focus is on rate of change rather than accumulated totals

## Notes

The terminology varies significantly in practice. Harris presents the range of names to help readers recognize these variations regardless of what they are called in different contexts. The key distinguishing feature is the filled area rather than the specific name used.
