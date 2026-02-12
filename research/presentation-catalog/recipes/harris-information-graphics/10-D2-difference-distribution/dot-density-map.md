---
name: Dot Density Map
slug: dot-density-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Dot Density Map, p. 142"

intent: Show both total quantity and spatial distribution of phenomena by placing dots that each represent a fixed count at their actual geographic locations
direction: both

components:
  - element: base-map
    encodes: Geographic boundaries and reference features
  - element: dots
    encodes: Fixed quantity per dot (e.g., 100 units each)
  - element: dot-placement
    encodes: Approximate location where the phenomenon occurs
  - element: legend
    encodes: What quantity each dot represents

parameters:
  dot_value: number (units per dot)
  placement_precision: approximate | exact

related: []

warnings:
  - "Dot value must balance readability with precision"
  - "Dot placement requires knowledge of actual distribution within regions"
  - "Large uniform areas may appear empty even with significant totals"

extensions:
  harris_entry: "Dot Density Map"
  alternate_names: []
  typical_use: "population distribution, resource locations, agricultural data"
---

## Description

In a dot density map, each dot represents a fixed quantity of the thing being mapped. The total count for any area is determined by multiplying the number of dots by the value per dot. Unlike choropleth maps that shade entire regions uniformly, dot density maps show where within regions the phenomena concentrate.

The technique displays two dimensions of information simultaneously: total quantity (countable from dots) and spatial distribution (visible from dot clustering).

## Examples

Harris illustrates with a neighborhood example (p. 142):

> "In a dot density map, each dot stands for a certain number of the things it represents. For example, if each dot represents 100 cats, a neighborhood with 10 dots would indicate a cat population of 1,000."

The figure shows dots clustered along highways and intersections:

> "One of the advantages of displaying statistical information in this way is that in addition to graphically showing the total number, the location of the dots also shows how the things are distributed. For instance, in the map at the right, the things represented tend to concentrate at highways and intersections."

## Usage

Dot density maps excel when:
- Both total quantity and spatial distribution matter
- Distribution is uneven within regions
- Viewers should see clustering and patterns
- Phenomena have meaningful geographic locations

The technique is less suitable when:
- Only totals matter (use choropleth)
- Distribution within regions is unknown
- Precise counts are more important than patterns

Choosing dot value requires balancing competing needs:
- Too high: not enough dots to show distribution patterns
- Too low: too many dots create visual clutter and overlap

## Notes

Dot placement requires either detailed knowledge of actual distribution or reasonable assumptions about where phenomena occur. For population, dots might concentrate near roads, water sources, or urban centers. Arbitrary or random placement within regions defeats the technique purpose.
