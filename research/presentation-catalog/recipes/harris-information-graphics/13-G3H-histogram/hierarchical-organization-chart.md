---
name: Hierarchical Organization Chart
slug: hierarchical-organization-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Hierarchical Organization Chart, p. 186"

intent: Show authority, responsibility, or ranking relationships between entities arranged from highest to lowest
direction: both

components:
  - element: nodes
    encodes: People, positions, organizations, or entities
    required: true
  - element: connecting-lines
    encodes: Reporting relationships or hierarchical connections
    required: true
  - element: spatial-arrangement
    encodes: Level in hierarchy (top/center = highest authority)
    required: true

parameters:
  orientation: "vertical (top-down) | horizontal (left-right) | circular (center-out)"
  hierarchy_basis: "authority | responsibility | status | power | ability"

related: []  # TBD: organization-chart, tree-diagram

extensions:
  harris_entry: "Hierarchical Organization Chart"
  typical_use: "corporate org charts, command structures, classification systems"
---

## Description

A hierarchical organization chart categorizes entities (people, positions, organizations, ideas, facilities, or equipment) by their authority, responsibility, ability, status, power, or other ranking criteria. Entities with the most of the criterion are positioned at one end, those with the least at the other end, with intermediate entities spaced proportionately between.

The shape of the chart can be chosen to emphasize or de-emphasize the hierarchical nature of the relationships.

## Examples

Harris describes the structure (p. 186):

> "A widely used variation of organization chart in which people, positions, organizations, ideas, facilities, or equipment are categorized by their authority, responsibility, ability, status, power, etc. In a hierarchical chart the entities with the most of whatever is used as the criteria are located at one end of a diagram, and the entities with the least are located at the other end. All other entities are spaced proportionately in between."

On orientation options:
> "For example, if authority is the criteria and the organization chart is running horizontally, the person with the most authority is shown at the left and those with the least authority are shown at the right."

On the vertical convention:
> "Hierarchical organization charts can be any shape. The most typical one runs vertically with the entity highest in the hierarchy at the top."

On using shape to de-emphasize hierarchy:
> "Sometimes the shape of an organization chart is selected to deemphasize its hierarchical nature, as in the circular chart at the right."

Harris illustrates a circular variant with the highest authority at the center and subordinates radiating outward.

## Usage

Vertical top-down charts are most common and clearly communicate hierarchy. Circular or radial layouts may be chosen when:
- The hierarchical aspect should be softened
- Collaboration across levels is emphasized
- Space constraints favor a different shape

## Notes

The choice of layout shape carries implicit meaning about organizational culture. Traditional vertical charts emphasize chain of command; circular or networked layouts suggest flatter, more collaborative structures.
