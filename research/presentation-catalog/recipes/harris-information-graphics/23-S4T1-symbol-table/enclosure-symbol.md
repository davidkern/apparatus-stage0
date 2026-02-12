---
name: Enclosure Symbol
slug: enclosure-symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, Enclosures as symbols, p. 385"

intent: Use symbol shapes around text in diagrams to organize information, convey additional data, and improve legibility
direction: both

components:
  - element: enclosure-shape
    encodes: Type of event, operation, or category
    required: true
  - element: enclosure-fill
    encodes: Status, completion level, or additional category
    required: false
  - element: border-style
    encodes: State (e.g., dashed = proposed, solid = existing)
    required: false
  - element: enclosure-count
    encodes: Quantity (multiple enclosures for multiple items)
    required: false
  - element: compartments
    encodes: Multiple data fields within single enclosure
    required: false

parameters:
  shape_variation: none | meaningful
  fill_encoding: none | binary | partial
  border_encoding: none | solid-dashed | weighted

related: []  # TBD: see flow-chart symbols

warnings:
  - "In many charts enclosures are all the same and have no significance beyond organization"
  - "When variations encode information, ensure consistent use and provide legend if needed"

extensions:
  harris_entry: "Symbol"
  typical_applications: ["organization charts", "flow charts", "tree diagrams", "PERT charts", "network diagrams"]
---

## Description

Enclosures around text on diagrams like organization charts, flow charts, tree diagrams, and PERT charts serve multiple purposes: they organize information, sometimes convey additional information, make charts easier to read and understand, and improve appearance.

In many charts, enclosures are uniform and have no significance beyond organization. However, Harris shows how features of enclosures can be systematically varied to encode additional information such as position, skill, type of equipment, function, timing, and more.

## Examples

**Methods for encoding additional information** (p. 385):

| Technique | Example Use |
|-----------|-------------|
| 100% colored/shaded | Encodes one additional bit of data |
| Partially colored/shaded | Indicates partially completed, partial responsibility |
| Dashed border | Indicates new, to be eliminated, proposed |
| Number of enclosures | Corresponds to number of people, forms, orders at location |
| Shape variations | Many possible interpretations by category |
| Shadows or decorations | Can have significance (e.g., 3D effect for hierarchy) |
| Compartmentalized | Display multiple bits of data in standardized format |

**Organization chart example** (p. 385):
Shows symbols functioning as enclosures while also conveying information about positions, with:
- Fill indicating tenure (less than one year, position vacant)
- Shape indicating role type

**Document flow example** (p. 385):
> "Symbols indicate number of copies, where they go, and where they mate up."

Shows invoice copies (Green, Gold, Pink, White) flowing to different destinations (To file, To customer, To accounts receivable, To accounting).

**PERT chart example** (p. 385):
Demonstrates compartmentalized enclosures containing:
- Event number in top left
- Duration in top right
- Event name in center
- Early/late start times

**Flow chart convention** (p. 385):
> "Flow charts make extensive use of different shapes of symbols to denote different types of operations."

Different shapes (rectangles, diamonds, parallelograms, ovals, etc.) indicate different operation types.

## Usage

**When enclosures are purely organizational:**
- Use consistent shapes throughout
- Focus on layout and connection clarity
- No legend needed for shape meanings

**When enclosures encode information:**
- Establish consistent meaning for each variation
- Provide legend if meanings are not self-evident
- Can combine multiple encoding methods (shape + fill + border)

**Compartmentalized enclosures:**
- Useful for standardized multi-field displays
- Each compartment has consistent meaning across all enclosures
- Particularly valuable for scheduling and project management charts

**Design considerations:**
- Each encoding method can be used independently or combined
- More encoding dimensions increase information density but may reduce clarity
- Consider whether variations will be immediately understood or require explanation

## Notes

Harris references flow charts as making "extensive use of different shapes of symbols to denote different types of operations" and points readers to the Flow Chart entry for more detail.

The compartmentalized PERT chart enclosure is particularly notable as a standardized multi-field format that has become a convention in project management visualization.
