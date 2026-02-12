---
name: Flow Diagram
slug: flow-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Flow Diagram, p. 156"

intent: Show the physical route or spatial flow of people, materials, or communications overlaid on a floor plan or map
direction: both

components:
  - element: base-map
    encodes: Physical layout where activities take place (floor plan, map)
    required: true
  - element: flow-path
    encodes: Route of movement between locations
    required: true
  - element: activity-symbols
    encodes: Types of activities at each location (operation, inspection, delay, transport)
    required: false
  - element: legend
    encodes: Symbol meanings for transportation, delay, operation, inspection
    required: true

parameters:
  base_type: "floor plan | area map | schematic"
  coding_correspondence: "linked to flow chart | standalone"
  entity_type: "people | materials | paperwork | vehicles | communications"

related:
  - slug: flow-chart
    relationship: combines-with

warnings:
  - "Flow diagrams show WHERE activities occur; flow charts show the SEQUENCE of activities"
  - "Without the companion flow chart, the logical sequence may be unclear"

extensions:
  harris_entry: "Flow Diagram"
  typical_use: "studying movement patterns of people, animals, automobiles through physical spaces"
  distinguishing_feature: "Superimposed on floor plans or maps; counterpart to flow/process charts"
---

## Description

A flow diagram is a graphic representation of the physical route or flow of people, materials, paperwork, vehicles, or communications associated with a process, procedure, plan, or investigation. A flow diagram is often the counterpart of a flow or process chart: while the flow or process chart indicates the sequential order of activities, the flow diagram indicates the location of these activities and how the physical flow occurs between them.

Flow diagrams are frequently used to study the movement patterns of people, animals, automobiles, etc. They are typically superimposed on floor plans or maps of the area where the activities take place.

## Examples

> "For example, a flow diagram of the way customers wander through a store or department might indicate to merchandisers how and where to display certain products or how to rearrange counters to get the customer to spend more time in the store or department." (p. 156)

Harris illustrates a flow diagram showing a customer's path through a clothing store (p. 156). The diagram shows:
- A floor plan with counters and a cashier location
- The route of customer movement traced through the space
- A legend indicating symbols for: Transportation, Delay/pause, Operation/activity, Inspection

## Usage

Flow diagrams are appropriate when:
- Analyzing physical movement patterns through a space
- Identifying bottlenecks in physical layouts
- Optimizing store layouts for customer flow
- Studying manufacturing floor movement of materials
- Investigating traffic patterns

A flow diagram may or may not be coded to correspond to a flow chart, process chart, plan, or research study. When coded to correspond, the activities shown on the physical layout can be matched to their logical sequence in the companion flow chart.

## Notes

The distinction between "Flow Diagram" (type 2, physical routing) and "Flow Chart" (also called Flow Diagram type 1, logical sequence) is important. Harris uses superscript numbers to distinguish these: Flow Diagram^1 refers to flow charts, while Flow Diagram^2 refers to physical flow diagrams.
