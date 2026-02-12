---
name: Relationship Diagram
slug: relationship-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Relationship Diagram, p. 328"

intent: Organize and display things (events, concepts, actions, problems) to establish, analyze, and communicate their interdependencies through directed connections
direction: both

components:
  - element: entity-symbols
    encodes: Nodes representing events, concepts, actions, problems, or other items under investigation
    required: true
  - element: directed-arrows
    encodes: Lines with arrowheads showing cause-effect or influence relationships between entities
    required: true
  - element: symbol-attributes
    encodes: Size, shape, or fill encoding additional information (importance, organization, type)
    required: false

parameters:
  arrow_direction_meaning: "causes | is-caused-by"
  symbol_encoding: "none | size | shape | fill | combined"
  bidirectional_arrows: "allowed | not-used"

related: []

warnings:
  - "Arrow direction convention must be consistent throughout - either 'A causes B' or 'B is caused by A' but not mixed"
  - "Bidirectional arrows indicate the cause-effect relationship varies or applies in both directions"

extensions:
  harris_entry: "Relationship Diagram"
  alternate_names: ["interrelationship digraph", "relations diagram"]
  typical_use: "root cause analysis, understanding complex interdependencies, identifying key drivers"
---

## Description

A relationship diagram is a graphical tool for organizing and displaying things so their interdependencies can be established, analyzed, recorded, and communicated. It can be applied to events, concepts, actions, problems, social preferences, and many other domains.

**Construction process**:
1. Generate a symbol for each thing bearing on the issue under investigation
2. Draw arrows between all things that have an interdependency
3. Maintain consistent arrow direction convention throughout (either base-to-head shows "causes" or "is caused by")

**Analysis**: After all arrows are drawn, it becomes clear which things have the greatest effect, which are isolated items, and where attention should be focused.

## Examples

> "For example, if a program is falling behind, one would make symbols for all the things that might be causing delays. Next, arrows are drawn between all things that have an interdependency, such as the castings being late because the raw material was delivered late, or the material being delivered late because the purchase order was placed late." (p. 328)

Harris shows an example with items A through J (p. 328):
- Item C affects four other items (A, B, E, H) while nothing affects C - a "major or root event, cause, action, etc."
- Item J is isolated, unrelated to other items - may need independent attention
- Bidirectional arrow between G and H indicates the relationship varies or applies both ways

> "The size, shape, and/or fill of the symbols are sometimes used to encode additional information such as the relative importance of the item the symbol represents, what organization is responsible for or affected by the item, etc." (p. 328)

## Usage

Relationship diagrams help identify:
- **Root causes**: Items with many outgoing arrows but no incoming arrows
- **Dependent items**: Things affected by many other factors
- **Isolated issues**: Problems unconnected to the main web of relationships
- **Key leverage points**: Where intervention might resolve multiple dependent issues

The technique is particularly valuable when causes and effects are not linear but form a complex web of mutual influences.

## Notes

Symbol attributes can encode:
- **Size**: Magnitude, importance, degree of impact
- **Shape**: Type of event, problem category, organizational unit
- **Fill/color**: Responsibility, status, urgency

This visual encoding allows the diagram to communicate multiple dimensions of information about the relationships being analyzed.
