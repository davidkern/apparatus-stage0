---
name: Nonquantitative Map
slug: nonquantitative-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Nonquantitative Map, p. 249"

intent: Show where things are located, how areas are organized, and where routes exist without encoding numerical data
direction: both

components:
  - element: base-geography
    encodes: Land boundaries, water features, reference points
    required: true
  - element: feature-symbols
    encodes: Locations of facilities, resources, or points of interest
    required: false
  - element: route-lines
    encodes: Roads, paths, transit lines, or other connections
    required: false
  - element: boundary-lines
    encodes: Political, administrative, or categorical divisions
    required: false
  - element: labels
    encodes: Names of places, features, and regions
    required: true

parameters:
  feature_types: "facilities | routes | boundaries | resources"
  symbol_style: "iconic | abstract | pictorial"

related: []

warnings:
  - "Distinct from statistical/thematic maps that encode quantitative data"
  - "Symbols show presence and location only, not magnitude"

extensions:
  harris_entry: "Nonquantitative Map"
  alternate_names: ["explanatory map", "descriptive map", "qualitative map"]
  typical_use: "showing locations, infrastructure, and territorial organization"
---

## Description

A nonquantitative map is generally used to show nonquantitative information such as where things are located, how areas are organized or subdivided, and where routes are located that connect places. Unlike statistical or thematic maps, nonquantitative maps do not encode numerical data through visual variables like color intensity or symbol size.

These maps answer questions of "where" and "what" rather than "how much."

## Examples

Harris describes the content range:

> "This type of map is generally used to show nonquantitative information such as where things are located, how areas are organized or subdivided, and where the routes are located that get people and things from one place to another." (p. 249)

> "Nonquantitative maps may include grain fields, buildings, rivers, cities, roads, land masses, power lines, sewer lines, sales areas, public facilities, voting precincts, schools, political divisions, resorts, pet stores, sales areas, etc." (p. 249)

The illustrations show two example categories:
1. **Route, road, street, etc.**: A map of the United States showing cities (Seattle, Minneapolis, Denver, New York, Los Angeles, St. Louis, Dallas, Tampa) connected by route lines
2. **Facilities**: A small map showing symbols for different types of facilities or points of interest

## Usage

Nonquantitative maps are appropriate when:
- Showing locations of facilities, resources, or points of interest
- Displaying route networks or transportation connections
- Illustrating how territories are divided (political, administrative, sales)
- Providing geographic reference or orientation

Common applications:
- Facility location maps (stores, offices, service centers)
- Infrastructure maps (roads, utilities, transit)
- Administrative boundary maps (sales territories, voting districts)
- Reference maps (city locations, geographic features)

Design considerations:
- Symbols should be distinguishable and consistent
- Labels should be readable without cluttering
- Feature density should allow individual items to be identified
- Color and pattern can categorize feature types

## Notes

The distinction between nonquantitative and quantitative (statistical/thematic) maps is fundamental in cartography. Nonquantitative maps show what exists and where; quantitative maps show how much or what value is associated with locations. The same base map might serve either purpose depending on how features are symbolized.
