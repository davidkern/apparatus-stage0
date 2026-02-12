---
name: Map Entity Contrast
slug: map-entity-contrast
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Contrast between adjacent entities, p. 235"

intent: Differentiate adjacent geographic features through visual encoding to prevent viewer confusion
direction: construction

components:
  - element: fill-pattern
    encodes: Visual differentiation between adjacent areas (land vs water, different regions)
    required: true
  - element: boundary-line
    encodes: Edge definition between entities
    required: false
  - element: labels
    encodes: Text identification of features
    required: false

parameters:
  contrast_method: "color | shading | pattern | labeling"
  entity_types: "land-water | region-region | feature-background"

related: []

warnings:
  - "Without visual differentiation, viewers may not be able to distinguish which area is water and which is land"
  - "Unfamiliar coastlines are particularly prone to confusion without adequate contrast"

extensions:
  harris_entry: "Map"
  typical_use: "ensuring geographic features are distinguishable"
---

## Description

When adjacent geographic entities on a map are unfamiliar to viewers and lack visual differentiation, it can be difficult or impossible to tell them apart. This is particularly problematic with coastlines, where viewers may not know which side is land and which is water.

Colors, shading, patterns, and sufficient labeling normally overcome such identification problems. The technique applies to any situation where adjacent map areas might be confused.

## Examples

Harris illustrates with a coastline example:

> "Sometimes it is difficult for viewers to differentiate adjacent entities that are unfamiliar and have no colors or shading. An example is coast lines where it is not clear which is water and which is land as illustrated at the right. Colors, shading, and sufficient labeling normally overcome such problems." (p. 235)

The accompanying illustration shows two versions of the same coastal area with cities "Cove City," "Elmwood," and "Lakeside" marked:
- Left version: No differentiation between land and water - the coastline is ambiguous
- Right version: Water area is darkened to clearly differentiate it from land

## Usage

Apply visual contrast when:
- Showing coastlines or water boundaries that may be unfamiliar
- Displaying regions that share boundaries without natural visual distinction
- The map audience may not have prior knowledge of the area's geography

Common contrast methods include:
- Darkening water areas (traditional cartographic convention)
- Using distinct colors for different regions
- Applying patterns or textures
- Adding clear labels to identify features

## Notes

This principle extends beyond land-water boundaries to any adjacent map entities that lack inherent visual distinction. Political boundaries, sales territories, or categorical regions all benefit from consistent visual differentiation.
