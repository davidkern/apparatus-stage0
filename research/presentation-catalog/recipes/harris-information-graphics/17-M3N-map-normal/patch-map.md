---
name: Patch Map
slug: patch-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Patch Map, p. 269"

intent: Identify geographic features such as natural resources, soil types, agricultural usage, or wetlands using filled areas that approximate the entities they represent
direction: both

components:
  - element: base-map
    encodes: Geographic outline and reference features
    required: true
  - element: filled-patches
    encodes: Areas filled with colors or patterns to designate features
    required: true
  - element: legend
    encodes: Explanation of what each fill pattern represents
    required: true

parameters:
  fill_type: color | pattern | shade
  boundary_style: approximate | precise

related:
  - slug: descriptive-map
    relationship: variant-of
  - slug: choropleth-map
    relationship: contrasts

extensions:
  harris_entry: "Patch Map"
  alternate_names:
    - "blot map"
  typical_use: "showing distribution of natural resources, soil types, land use"
---

## Description

Patch maps are a variation of descriptive maps on which such things as natural resources, types of soil, agricultural usage, wetlands, etc., are identified by means of filled areas. The size and shape of the filled areas generally approximate the entities they represent. The meaning of the fills is normally explained in a legend.

## Examples

Harris illustrates (p. 269) a patch map showing:
- Geographic outline of a region
- Three resources (A, B, C) shown as patches with different fill patterns
- Patches distributed across the map showing resource locations
- Legend identifying what each pattern represents

## Usage

**When to use:**
- To show geographic distribution of natural features
- To indicate areas of different soil types or land use
- To map resource locations
- When boundaries are approximate rather than precise

**Design considerations:**
- Fill patterns should be distinguishable
- Legend is essential for interpretation
- Patch shapes approximate but don't precisely match actual boundaries

## Notes

Patch maps differ from choropleth maps in that the filled areas approximate natural boundaries of features rather than following political or administrative boundaries.
