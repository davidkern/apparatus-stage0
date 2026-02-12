---
name: Flow Chart
slug: flow-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Flow Chart, p. 153-154"

intent: Visually display interrelated information such as events, steps, functions, or decisions in an organized sequential or chronological fashion
direction: both

components:
  - element: symbols
    encodes: Events, activities, steps, functions, or decisions (various shapes)
  - element: text-labels
    encodes: Descriptions within symbols
  - element: connecting-lines
    encodes: Flow paths between steps (with arrows for direction)
  - element: reference-numbers
    encodes: Sequential identifiers for symbols
    required: false

parameters:
  orientation: vertical | horizontal
  symbol_set: basic | standardized | custom
  flow_encoding: line-type | line-width | color

related: []

warnings:
  - "Very large programs may require multiple cross-referenced charts"
  - "Symbol shape meanings should be consistent within an organization"

extensions:
  harris_entry: "Flow Chart"
  alternate_names: ["flow diagram"]
  typical_use: "process documentation, procedure definition, system logic description, training materials"
---

## Description

A flow chart is a diagram that visually displays interrelated information in an organized fashion, typically sequentially or chronologically. It can represent tangible things (products being manufactured, currency moving between banks) or intangible things (development of an idea, approval procedures).

Flow charts range from very general overviews to highly detailed operational documents. They can describe complete sequences from start to finish or address just a portion of a larger process.

## Examples

Harris provides a blouse manufacturing example (p. 153-154):

The flow chart shows: Enter order -> Process paperwork and order material -> Decision: Sew in-house? -> (Yes) Cut fabric or (No) Purchase basic blouse -> Perform major stitching -> Add trimming and monogram -> Press and inspect -> Decision: Meets specification? -> (No) Return for corrections loop or (Yes) Ship

**Key features:**
> "Word descriptions of events, activities, steps, or functions are typically enclosed by symbols and connected by lines or arrows."
> "Generally two-dimensional... Typically not hierarchical or quantitative... Typically plotted sequentially... Typically not plotted against a time scale."

**Symbol meanings:**
- Oval/rounded: Beginning, end, start, stop, pause, interrupt
- Rectangle: Activity, task, step, function
- Diamond: Decision, choice, selection
- Document shape: Document

**Line variations encode:**
- What the line represents (material, information, paperwork)
- Method of flow (electronic, telephone, paper forms, verbal)
- Status (existing, proposed, eliminated)

**Variations recognized as flow charts:**
- Organization chart (flow of authority)
- Decision tree (sequence of decisions)
- Time and activity charts (sequence of events)
- Process charts (step-by-step process description)
- Procedural charts (procedures for goals)
- Flow diagrams (software system logic)

## Usage

Reasons for using flow charts:
- Describe processes, ideas, networks (especially complex or abstract ones)
- Define, analyze and explicate procedures
- Improve communications and clarify ideas
- Aid in troubleshooting
- Serve as planning and forecasting tools
- Reduce misunderstandings and conserve time
- Simplify training
- Document procedures
- Illustrate cross-functional relationships

Flow direction is normally top to bottom or left to right. Feedback loops and return paths go in the opposite direction. Large flow charts often run horizontally due to space considerations.

## Notes

The shape of symbols typically has standardized meanings within organizations or industries, though there is no universal standard. Some organizations establish their own symbol standards for specific needs.

Symbol variations (color, fill, outline style, size, shadow) can encode additional information such as department responsible, critical operation status, or whether the step is pending, proposed, or to be eliminated.
