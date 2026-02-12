---
name: Map Frame, Border, and Neat Line
slug: map-frame-border-neat-line
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Frame, border, and neat line, p. 235"

intent: Define the boundaries of the active map area and provide structure for marginal information
direction: both

components:
  - element: neat-line
    encodes: The line that directly abuts the active map area
    required: true
  - element: border-line
    encodes: Outer boundary line of the border area
    required: false
  - element: border-area
    encodes: Space between neat line and outer edge containing grid labels and annotations
    required: false
  - element: frame
    encodes: Outer decorative or structural line enclosing the entire map
    required: false

parameters:
  complexity: "none | neat-line-only | with-border | full-frame"

related: []

warnings:
  - "Terminology varies; some sources use frame and border interchangeably"
  - "The specific meaning of 'border' may include or exclude grid labels depending on context"

extensions:
  harris_entry: "Map"
  typical_use: "structuring map presentation and organizing marginal information"
---

## Description

Three major terms describe the lines around maps: frame, border (or border line), and neat line. While the term "neat line" is generally restricted to the line that directly abuts the active map area, the terms "frame" and "border" vary somewhat in their definitions across different sources.

The neat line forms the precise boundary of the map's geographic content. The border area may contain grid labels, scale information, and other marginal data. An outer frame may provide additional visual structure.

## Examples

Harris describes the terminology:

> "There are three major terms used to describe the lines around maps: frame, border or border line, and neat line. The term neat line is generally restricted to the line that abuts the active map area. The other terms vary somewhat in their definitions." (p. 235)

The illustrations show several variations:
1. No frame or border - just the map content
2. Neat line only - a single line defining the map boundary
3. Line sometimes called frame, border, or border line - intermediate complexity
4. Full border including neat line, border line, and everything in between including grid labels

Harris also notes on p. 247:

> "A neat line is a series of lines that form the boundary of the active portion of a map. Neat lines frequently are grid lines or graticules."

## Usage

Choose the appropriate level of framing based on:
- **No frame**: Informal or integrated presentations where the map blends with surrounding content
- **Neat line only**: Clean, minimal presentation focused on map content
- **With border**: When grid labels, coordinates, or marginal annotations are needed
- **Full frame**: Formal presentations requiring clear visual separation from surrounding material

The border area is valuable for placing:
- Latitude and longitude labels
- Grid reference numbers
- Scale bars (though these may also appear within the map)
- Map identification codes

## Notes

When communicating about map construction, be aware that your audience may interpret "border" and "frame" differently. When precision matters, describe the specific elements rather than relying on these potentially ambiguous terms.
