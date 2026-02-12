---
name: Block Diagram
slug: block-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Block Diagram, p. 55"

intent: Lay out systems, networks, concepts, procedures, or structures schematically using geometric figures and symbols without excessive detail
direction: construction

components:
  - element: blocks
    encodes: Major elements, functions, or entities in the system
    required: true
  - element: connecting lines or arrows
    encodes: Relationships, flow, or sequence between blocks
    required: false
  - element: block labels
    encodes: Names or descriptions of what each block represents
    required: true
  - element: block shapes
    encodes: Type of function, facility, organization, etc. (when varied)
    required: false

parameters:
  connectivity: connected | unconnected
  block_shapes: uniform | varied-by-type
  arrangement: sequential | spatial | hierarchical

related: []  # TBD: see also flow-chart, process-chart

warnings:
  - "Block diagrams generally address the broad overview of a subject; when they become detailed descriptions, they are many times referred to as flow charts, process charts, or procedural charts"
  - "Unconnected blocks may obscure relationships between elements"

extensions:
  harris_entry: "Block Diagram"
  alternate_names:
    - "conceptual diagram"
  typical_use: "planning, development, communication, and organization of thoughts"
---

## Description

A block diagram is a variation of a conceptual diagram. A block diagram uses geometric figures and symbols (referred to as blocks) to lay out things schematically such as systems, networks, concepts, circuits, procedures, structures, etc. Block diagrams are used for such things as planning, development, communication, and organization of thoughts.

Block diagrams generally address the broad overview of a subject. When they become detailed descriptions of the subject, they are many times referred to as flow charts, process charts, or procedural charts.

## Examples

Harris provides an example of starting a business (p. 55):

> "For example, a block diagram for starting a company might have five blocks representing five key elements. Those elements might be developing the idea or concept; raising capital; assembling a management team; acquiring facilities, product, and a work force; and initiating the business."

**Unconnected blocks**: "If these five elements are enclosed in rectangles... the resulting graphic might be called a simplified block diagram (even though the blocks are not connected)."

**Connected blocks**: "When used for planning purposes, a group of people might shuffle these blocks around until they agree on the best sequence for a particular situation. Once agreement is reached, the blocks might be arranged in their proper sequence and connected by arrows."

> "When used in this way, block diagrams function as an aid in the planning, development, and communicating processes by providing a graphical means of addressing major elements of a project without getting involved in too much detail."

### Shape Encoding

> "The blocks on a diagram may have different shapes to indicate type of function, facility, organization, etc., and may be connected with one or more lines or arrows."

### Unconnected Variations

> "When the purpose of the block diagram is simply to indicate such things as relative physical location or the existence of marginally related ideas, or information, there may be no interconnecting lines."

Harris illustrates a "Block diagram of a typical automobile showing the location of major elements" with Engine compartment, Passenger compartment, and Luggage compartment as adjacent, unconnected blocks.

## Usage

**Planning applications**: Block diagrams support collaborative planning by allowing participants to shuffle blocks until they agree on the best sequence or arrangement.

**Level of detail**: Keep block diagrams at a high level of abstraction. If more detail is needed, transition to flow charts or process charts.

**Shape conventions**: When using different shapes to encode information (e.g., rectangles for processes, ovals for decisions), maintain consistency and provide a legend if the conventions are not standard.

**Connectivity decisions**: Choose connected or unconnected blocks based on whether sequence/flow or spatial/conceptual relationships are more important.

## Notes

Block diagrams occupy a middle ground between:
- Simple lists or outlines (no visual structure)
- Detailed flow charts (full procedural specification)

They are particularly useful early in planning when the overall structure needs to be understood before details are worked out.
