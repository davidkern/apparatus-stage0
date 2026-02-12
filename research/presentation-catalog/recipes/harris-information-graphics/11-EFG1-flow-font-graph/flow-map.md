---
name: Flow Map
slug: flow-map
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Flow Map, pp. 157-158"

intent: Show movement, migration, or transfer of things between geographic locations with direction and quantity encoding
direction: both

components:
  - element: base-map
    encodes: Geographic context for the flow
    required: true
  - element: flow-arrows
    encodes: Direction of movement from source to destination
    required: true
  - element: arrow-width
    encodes: Quantity, value, or volume of flow (when proportional)
    required: false
  - element: flow-labels
    encodes: Specific values or descriptions of what flows
    required: false
  - element: symbols
    encodes: Type of thing flowing (icons for products, weather fronts, etc.)
    required: false
  - element: scale
    encodes: Reference for interpreting proportional arrow widths
    required: false

parameters:
  quantity_encoding: "proportional width | labeled values | legend | none"
  direction_precision: "general | city-to-city | detailed (yards)"
  flow_type: "tangible (people, products) | intangible (credit, goodwill)"
  conveyance_encoding: "none | mode of transport | responsibility"

related: []

warnings:
  - "Route maps show paths; flow maps show what and how much moves in what direction"
  - "When arrow sizes are only approximate, a scale is generally not used"
  - "If viewer is expected to estimate values from arrow width, include a scale"

extensions:
  harris_entry: "Flow Map"
  typical_use: "showing trade flows, migration patterns, resource distribution, network traffic"
  contrasts_with: "route maps (which show paths but not quantities or direction of flow)"
---

## Description

Route maps show the paths from one point to another but generally do not indicate what or how much moves or flows in what direction along the paths. Flow maps, on the other hand, say little or nothing about the exact path but do indicate:
- What it is that flows, moves, migrates, etc.
- What direction the flow is moving and/or what the source and destination are
- How much is flowing, being transferred, transported, etc.
- General information about what is flowing and how it is flowing

Flow maps can show movement of almost anything, including tangible things such as people, products, produce, natural resources, and weather, as well as intangible things such as know-how, talent, credit, or goodwill.

## Methods for Encoding Information

### Designating What Is Flowing

> "Sometimes the subject of a flow map is indicated in the title of the map. In other cases it is noted directly on the map... In still other cases, it is denoted by symbols." (p. 157)

Harris shows examples including labeled arrows for "Capital," "Goodwill," "Exports," "Auto parts," "Produce," and "Tourists" emanating from a region. Symbols such as weather front icons (cold weather front, warm weather front, water currents) can identify what is flowing.

### Designating Direction and Destination

How precisely the direction and location of flow is indicated may range from very general to very detailed:
- **General**: Simply showing flow from one country to other parts of the world
- **City-to-city**: Indicating movement from one specific city to other defined cities
- **Detailed**: Rendering detail in yards, as in a tactical combat map

> "Arrows are almost always used to indicate direction of flow." (p. 157)

For distributed movement occurring in many directions at once (not concentrated like a railroad), special data graphics are sometimes developed, such as weather front symbols.

### Designating Quantity

> "In many cases the amount of the thing that is being moved is simply noted on the arrow... or placed in a legend or note on the map. In these cases the width of arrows is usually the same." (p. 158)

Alternatively, the width of arrows can be proportional to the quantity, value, etc., of the thing being moved. When the size of arrows is meant only to be approximate, a scale is generally not used. If the viewer is expected to estimate values based on arrow width, a scale is generally included.

Harris shows two types of scales for proportional flow lines:
- Horizontal bar scale with numeric labels
- Arrow-shaped scale showing width-to-value correspondence

Sometimes actual values are placed adjacent to flow lines even when widths are proportional, which is "particularly useful when there are many values."

A special type of flow map shows values that change as things progress from point to point. Examples: subway passenger density varying with distance from a main station, a delivery truck's weight varying through its route, volume of natural gas varying with distance from supply source.

### Encoding General Information

Flow lines can be coded to indicate specific characteristics about the entity that moves or the medium by which it moves. Examples:
- A transcontinental phone call traveling by local phone lines, long distance cable, microwave, and satellite
- Distinguishing loaded truck from empty truck returns
- Indicating company truck versus public carrier routes
- Symbols showing mode of transport (air, sea, microwave, pipe), speed, or responsibility

## Examples

Harris illustrates multiple flow map variations (pp. 157-158):
- Flow map showing approximate amounts and destinations with varying arrow sizes
- Flow map where specific cities are designated as source and destination
- Flow map with values changing along the route (subway passengers, delivery truck weight)
- Flow map including information about conveyance method
- Flow map showing responsibility for different parts of flow (company truck vs. public carrier)

## Usage

Flow maps are appropriate when:
- Showing trade or resource flows between regions
- Visualizing migration or travel patterns
- Displaying network traffic or communication flows
- Illustrating supply chain or distribution patterns

Consider the level of precision needed:
- General audiences may need only approximate flows
- Analytical applications may require precise values and scales
