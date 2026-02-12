---
name: Pictorial Unit Chart
slug: pictorial-unit-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pictorial Charts and Graphs, Pictorial unit chart, p. 279"

intent: Communicate quantities by making the number of displayed graphical units proportional to the quantity being represented
direction: both

components:
  - element: graphical-units
    encodes: Standardized symbols each representing a fixed quantity
    required: true
  - element: unit-legend
    encodes: What quantity each symbol represents (e.g., "= 10 cars")
    required: true
  - element: numeric-values
    encodes: Actual totals (generally included)
    required: false
  - element: category-labels
    encodes: What each group represents
    required: true

parameters:
  unit_value: "1 | 10 | 50 | 100 | 1000 | custom"
  arrangement: "one-dimensional | two-dimensional | three-dimensional"
  comparison_type: "single-entity | multiple-entities"

related:
  - slug: pictorial-graph
    relationship: variant-of

warnings:
  - "May need to crop one symbol to show exact values"
  - "Symbol can represent what it looks like OR something associated with it (e.g., ship = passengers)"
  - "Must clearly indicate what each symbol represents in legend"

extensions:
  harris_entry: "Pictorial Charts and Graphs"
  alternate_names: ["isotype chart"]
  typical_use: "showing counts in accessible visual form; comparing quantities"
  design_guidelines:
    - "Each symbol represents a certain number of actual units"
    - "Generally have no scales, tick marks, or grid lines"
    - "Graphical units of same type are generally same size"
    - "Simple geometric shapes or irregular shapes equally effective"
---

## Description

A pictorial unit chart is a variation of a unit chart used for communicating numbers of things by making the number of data graphics displayed proportional to the quantity of things being represented. For example, if one graphical unit represents ten cars and five graphical units are shown, the viewer will mentally multiply ten times five and conclude that the graphical grouping represents 50 actual cars.

## Examples

Harris illustrates several variations (p. 279):

**Basic pictorial unit chart:**
Shows car symbols where each symbol = 10 cars:
- '90: 28 (about 3 symbols)
- '91: 40 (4 symbols)
- '92: 50 (5 symbols)

**Comparison of multiple entities:**
> "Unit charts can be used to convey information about a single entity (example at left) or to compare multiple entities (examples at right)."

Shows oil barrels comparing City A, City B, City C heating oil consumption.

**Cropping for exact values:**
> "When each data graphic represents more than one unit, it is sometimes necessary to crop one of the data graphics to have the total number come out to the exact value."

Shows hammers (35), pliers (20), and wrenches (29) with partial symbols for non-round numbers.

**Symbol meaning flexibility:**
> "A symbol might represent what it looks like or something closely associated with it. For example, the picture of a ship might represent a certain number of ships or a certain number of passengers or tons of cargo transported by ships."

**Encoding additional information:**
> "Additional qualitative information can be encoded into the chart by means of the size, shape, color, or shading of the data graphics."

Example shows apartment demographics using different symbols for children, women, and men.

**Table format:**
> "Pictorial unit charts are sometimes arranged in the form of a table. This format is sometimes referred to as a pictorial table."

## Usage

**General guidelines:**
- Each picture, icon, or symbol represents a certain number of actual units
- Actual numeric values may or may not be included, but generally are
- Generally have no scales, tick marks, or grid lines
- A graphical unit typically represents the same number regardless of size or shape
- Graphical units of the same type are generally all the same size
- Simple geometric shapes or irregular shapes equally effective
- Units may be arranged in one, two, or three dimensional groupings

**Design considerations:**
- Choose unit value appropriate to data scale
- Include legend explaining unit value
- Consider whether to show exact numbers alongside
- Crop symbols when needed for exact representation

## Notes

The pictorial unit chart (sometimes called isotype after Otto Neurath's visual statistics work) makes quantities tangible by representing them with countable objects. The technique works because counting symbols is more intuitive than reading bar heights.

The flexibility of symbol meaning is a double-edged feature: it allows creative representation but requires clear explanation. A ship symbol could mean ships, passengers, or cargo tons - the legend must make this explicit.
