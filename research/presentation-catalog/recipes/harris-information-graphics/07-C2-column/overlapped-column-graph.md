---
name: Overlapped Column Graph
slug: overlapped-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Overlapped and three-dimensional grouped column graph, p. 82"

intent: Display multiple data series with partial overlap to improve readability and space efficiency
direction: both

components:
  - element: overlapping-columns
    encodes: Multiple data series with columns shifted sideways to partially overlap
    required: true
  - element: differentiated-fills
    encodes: Each data series via distinct color, shade, or pattern
    required: true
  - element: legend
    encodes: Mapping of colors/patterns to data series
    required: true
  - element: quantitative-scale
    encodes: Numeric values on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true

parameters:
  overlap_amount: "0% to 100%"
  shift_direction: "left | right"
  front_series: "typically shortest columns to avoid hiding taller ones"

related:
  - slug: grouped-column-graph
    relationship: variant-of
  - slug: stacked-column-graph
    relationship: contrasts

warnings:
  - "At 100% overlap, the graph resembles a stacked column graph and can cause confusion"
  - "When columns are 100% overlapped, special notation is generally needed to alert the viewer"
  - "The data series with shortest columns should be positioned in front to avoid hiding taller columns"

extensions:
  harris_entry: "Column Graph"
  alternate_names: []
  typical_use: "making grouped column graphs easier to read, saving horizontal space, adding visual interest"
---

## Description

An overlapped column graph is a variation of the grouped column graph where columns are shifted sideways such that columns of each successive data series partially hide those behind them. This technique was developed to make grouped column graphs easier to read, enable them to convey additional information, and make them more attractive.

The columns can be shifted to the right or left by any amount ranging from barely overlapped to completely overlapped (100%). As the amount of overlap increases, the width of individual columns generally increases if the graph remains the same overall width.

## Examples

> "One technique that is widely used is to overlap the columns. In this method the columns representing complete data series are shifted sideways such that the columns of each successive data series are partially hidden by the columns of the data series in front of them." (p. 82)

Harris shows examples of 50% and 100% overlap configurations. At 50% overlap, each column overlaps the column immediately behind it by half its width. At 100% overlap, all columns are the same width but completely stacked in the same horizontal position.

> "When the columns are 100% overlapped, the graph resembles a stacked column graph. A special notation is generally included to alert the viewer, or additional graphical changes are made to assure no misunderstanding." (p. 82)

## Usage

Key design decisions:
- **Overlap percentage**: Can range from barely overlapped to 100%
- **Front placement**: Position the data series with shortest columns in front so taller columns are not hidden
- **Width adjustment**: As overlap increases, column widths generally increase to maintain graph width
- **Disambiguation**: At high overlap percentages, include notation to distinguish from stacked graphs

Special handling at 100% overlap:
- The graph closely resembles a stacked column graph
- Include special notation to alert viewers
- Consider widening back columns for better visibility (multiwidth columns variation)

## Notes

The three-dimensional variation introduces a third axis and distributes data series uniformly along it. Using the 100% overlapped graph as a starting point, the second and third layers of columns can be widened to provide better visibility.

Three-dimensional histograms are a well-known example of three-dimensional joined column graphs using class intervals.
