---
name: Inset Map
slug: inset-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Inset, ancillary, or supplementary map, p. 235"

intent: Provide geographic context and orientation for detailed maps by showing the mapped area within a larger reference region
direction: both

components:
  - element: detailed-map
    encodes: The primary map showing the area of interest at larger scale
    required: true
  - element: inset-map
    encodes: A smaller supplementary map showing broader geographic context
    required: true
  - element: area-indicator
    encodes: Visual marking on the inset showing where the detailed map is located
    required: true

parameters:
  placement: "corner | margin | separate panel"
  scale_relationship: "inset smaller than main map"

related: []

warnings:
  - "Without the inset, viewers unfamiliar with the area may not know what state or country the detailed area is in"
  - "Inset should be large enough to show recognizable reference points"

extensions:
  harris_entry: "Map"
  alternate_names: ["ancillary map", "supplementary map", "locator map"]
  typical_use: "orienting viewers to unfamiliar geographic areas"
---

## Description

An inset, ancillary, or supplementary map helps orient viewers who may be unfamiliar with the area shown on a detailed map. When showing a detailed map of a specific region, viewers often cannot determine what state or country the area is in, whether it is in the northern, southern, eastern, or western portion, or what recognizable landmarks or cities are nearby.

The inset map solves this problem by showing a broader geographic context with the detailed map area marked within it. This allows viewers to quickly understand the location's relationship to familiar reference points.

## Examples

Harris demonstrates this with a hypothetical area in northern Georgia:

> "If a viewer is not familiar with the area shown on a detailed map, an inset or small supplementary map is often used to help with orientation. For example, the detailed map at the right shows a hypothetical area in the northern part of the state Georgia. If shown only the detailed map, most people would not know what state it was located in, whether it was in the northern, southern, eastern, or western portion of the state, and what is close to it that they might recognize." (p. 235)

The example shows a detailed map with features like "New store" and "Proposed factory" with Interstate 19, while a small inset in the upper right corner shows the entire state of Georgia with Atlanta marked and the "Area shown" highlighted, including references to Tennessee and North Carolina borders.

## Usage

Use inset maps when:
- The detailed map shows an area that may be unfamiliar to viewers
- Geographic context is important for understanding the data
- Viewers need to understand proximity to recognizable landmarks or boundaries

The inset is typically placed in a corner of the main map that contains the least important information, often upper right or lower right. The area of interest should be clearly marked in the inset, often with a box or shaded region labeled "Area shown."

## Notes

This technique is particularly valuable for business presentations showing facility locations, sales territories, or regional data where the audience may include people unfamiliar with the specific geographic area.
