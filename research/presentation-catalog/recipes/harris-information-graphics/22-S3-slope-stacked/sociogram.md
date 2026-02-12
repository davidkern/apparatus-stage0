---
name: Sociogram
slug: sociogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Sociogram, pp. 355-356"

intent: Display social relationships and group dynamics through directed graphs showing positive and negative connections between individuals
direction: both

components:
  - element: member-symbols
    encodes: Individual group members (circles, shapes, or labeled nodes)
    required: true
  - element: positive-arrows
    encodes: Positive sentiment or selection (arrow from chooser to chosen)
    required: true
  - element: negative-indicators
    encodes: Negative sentiment (perpendicular line replacing arrowhead)
    required: false
  - element: mutual-connections
    encodes: Two-way positive relationships (double arrows)
    required: false
  - element: symbol-attributes
    encodes: Additional variables via color, shape, or size
    required: false

parameters:
  relationship_type: "positive only | positive and negative"
  symbol_encoding: "shape (gender) | color (attribute) | size (tenure, rank)"
  layout: "free-form | structured"

related: []  # TBD: relationship-diagram, network-diagram

warnings:
  - "Layout can significantly affect interpretation"
  - "Complex groups may produce cluttered, hard-to-read diagrams"
  - "Information typically from confidential questionnaires requires ethical handling"

extensions:
  harris_entry: "Sociogram"
  field: "sociometry (branch of social psychology)"
  typical_use: "studying group dynamics, identifying leaders and isolates"
  key_patterns:
    star: "person with many arrows pointing toward them (leader)"
    isolate: "person with no arrows pointing toward them"
    pair: "two people with mutual positive arrows"
    triangle: "three people with mutual positive arrows"
    clique: "group of individuals who have chosen one another"
---

## Description

A sociogram is a specialized relationship diagram used in sociometry (a branch of social psychology) to visualize social interactions within groups. The chart displays group members as symbols (typically circles) connected by arrows indicating positive or negative sentiments. When person A selects person B positively, an arrow is drawn from A to B. When A expresses negative feelings about B, a line with a perpendicular mark (instead of an arrowhead) connects them.

Harris explains that sociograms are "helpful in identifying potential leaders, informal groupings, individuals who might require attention, changes in group dynamics over time, etc."

## Examples

From the detailed illustration on p. 356, Harris shows a sociogram with approximately 18 members (A through R and beyond) demonstrating:

- **Single arrows**: "the person at the base of the arrow is positive about the person at the head of the arrow"
- **Double arrows (pairs)**: "both parties are positive about each other. The two people are called a pair" (examples: A & B, M & N)
- **Perpendicular lines**: "the person at the other end of the line expressed negative comments or feelings about this person"
- **Isolate**: "a person with no arrows pointing towards him or her" (examples: C and K)
- **Star**: "a person with many arrows pointing towards them" (example: G)
- **Triangle**: "when arrows point both directions among three people" (examples: P, Q, & R)

The example also shows how "color, shape, or size can encode an additional variable."

## Usage

Sociograms are used for:
- Identifying potential leaders (stars) and at-risk individuals (isolates)
- Organizing harmonious work groups
- Assuring compatibility in confined living environments
- Tracking changes in group dynamics over time
- Understanding informal power structures

Data collection typically involves confidential questionnaires with questions like:
- "Who would you like to be on a task force with?"
- "Who would you like to see as chairperson?"
- "Is there anyone you would not like on a task force with you?"

Harris notes: "Different questions asked of the same group of people many times yield entirely different sociograms."

## Notes

Three methods for indicating mutual selection are shown: double-headed arrows, two separate arrows, and a single line with arrowheads at both ends. The technique can be applied at various time intervals to track changes resulting from interventions or natural group evolution. While developed for social psychology research, the underlying network visualization principles apply broadly to relationship mapping.
