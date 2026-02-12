---
name: Network Diagram
slug: network-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Network, p. 247"

intent: Show how things are interconnected through a diagram of nodes and connecting links
direction: both

components:
  - element: nodes
    encodes: The entities being connected (locations, equipment, people, events)
    required: true
  - element: links
    encodes: The connections between nodes (roads, cables, relationships)
    required: true
  - element: node-labels
    encodes: Identification of each node
    required: false
  - element: link-labels
    encodes: Identification or attributes of connections
    required: false

parameters:
  layout: "geographic | schematic | hierarchical"
  directionality: "undirected | directed (arrows)"
  scale: "to-scale | not-to-scale"

related: []

warnings:
  - "Little or no attempt is often made to show elements in proper physical locations or relative sizes"
  - "Paths between nodes are often shown as straight lines regardless of actual route complexity"

extensions:
  harris_entry: "Network"
  alternate_names: ["network map"]
  typical_use: "showing infrastructure, relationships, or process flows"
---

## Description

A network diagram or map shows how things are interconnected. The diagram consists of nodes representing locations or entities and links representing the connections between them. The definition extends from physical networks (roads, cables, pipelines) to abstract relationships (organizational hierarchies, event sequences, responsibility flows).

Network diagrams often sacrifice geographic accuracy for clarity, showing connections schematically rather than in proper physical positions.

## Examples

Harris describes the scope of network diagrams:

> "A diagram or map that shows how things are interconnected. A network diagram may show interconnected roads, or several pieces of computer equipment connected by wires. The definition is sometimes extended to include how such things as people and events are interrelated - for example, how lines of responsibility connect people in an organization chart, or how events are related in PERT and CPM charts." (p. 247)

On the schematic nature:

> "In many cases, little or no attempt is made to show the elements of the network in their proper physical locations or relative sizes. The things connected might be identified by words, symbols, or pictorial representations." (p. 247)

Harris provides three example illustrations:
1. A network of roads showing routes Rt.1 through Rt.14 connecting various points in a geographic layout
2. A PERT or CPM network showing events A through J connected by directional arrows
3. A network of computer equipment showing boxes (representing computers) connected by lines with a pictorial representation of equipment

## Usage

Network diagrams are appropriate when:
- Showing connectivity matters more than precise geography
- Multiple routes or relationships need visualization
- System structure needs to be understood
- Planning infrastructure or analyzing dependencies

Design choices:
- **Geographic layout**: When physical position matters
- **Schematic layout**: When connections matter more than positions
- **Hierarchical layout**: For organizational or dependency structures

Node representation options:
- Simple shapes (circles, squares) with labels
- Symbols indicating node type
- Pictorial representations of actual objects

Link representation options:
- Simple lines (undirected relationships)
- Arrows (directed relationships, flows)
- Varying line weights (connection capacity or importance)
- Labels (route numbers, relationship types)

## Notes

The network diagram concept spans a wide range of specific visualization types, from literal infrastructure maps to abstract project management charts. The common thread is the focus on connectivity - what is connected to what - rather than on precise geographic or spatial relationships.
