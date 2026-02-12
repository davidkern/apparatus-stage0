---
name: Cartogram
slug: cartogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cartogram, p. 67"

intent: Present specific information through a simplified, diagrammatic map that distorts geography to emphasize the key message
direction: both

components:
  - element: simplified-geography
    encodes: Abstracted representation of spatial relationships
    required: true
  - element: key-information
    encodes: The specific data or relationships the map is designed to communicate
    required: true
  - element: labels
    encodes: Names, numbers, or descriptions of locations/features
    required: true

parameters:
  distortion_type: distance | size | shape | topology
  map_style: diagrammatic | strip | distorted

related: []

warnings:
  - "Intentional distortion of distances, sizes, or shapes may confuse viewers expecting geographic accuracy"
  - "Best suited for single-purpose communication; may mislead if used for general reference"

extensions:
  harris_entry: "Cartogram"
  alternate_names: ["distorted map", "strip map", "diagrammatic map"]
  typical_use: "subway maps, schematic route maps, statistical comparison maps"
---

## Description

In the broadest sense, cartogram refers to any map containing statistical data. In practice it usually refers to an abstract map, generally with a single purpose or theme. Such maps are normally simplified and shown in diagrammatic form to present a specific type of information.

The key principle is intentional simplification: if the key purpose of a subway map is to match terminal numbers with the towns in which they are located, unnecessary information such as miles between stations or the exact direction the train travels from point to point is not shown.

Distances, sizes, or shapes are frequently distorted to make the key message easier to understand.

## Examples

Harris provides a subway system cartogram (p. 67):

> The example shows a simplified diagram matching city names with terminal numbers and showing general locations for a subway system. Terminal 1 is at City G, Terminal 2 at City F, Terminal 3 at City E, etc., with a Transportation Hub (City X) shown at the center where routes connect.

The map shows topological relationships (which stations connect) without attempting geographic accuracy for distances or directions.

## Usage

Cartograms are most effective when:
- The purpose is to show relationships or connections rather than precise geography
- Simplification aids understanding of the key message
- Geographic accuracy would add clutter without adding value
- The audience needs to match names/numbers or follow routes

Distorted maps, strip maps, and diagrammatic maps are all classified as cartograms.

## Notes

The London Underground map is a famous example of this technique - it sacrifices geographic accuracy for clarity of the network topology, making it easy to see which lines connect at which stations without showing actual distances or directions.
