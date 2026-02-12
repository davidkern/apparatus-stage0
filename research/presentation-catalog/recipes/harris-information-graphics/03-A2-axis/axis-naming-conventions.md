---
name: Axis Naming Conventions
slug: axis-naming-conventions
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Axis, Letter designations for axes, p. 23-24"

intent: Apply consistent terminology when referring to graph axes by letter, direction, or position
direction: both

components:
  - element: letter-designation
    encodes: X, Y, Z identifiers for axes
    required: false
  - element: directional-name
    encodes: Vertical, horizontal orientation labels
    required: false
  - element: positional-name
    encodes: Left, right, top, bottom, upper, lower labels
    required: false
  - element: scale-based-name
    encodes: Names derived from the variable or units displayed
    required: false

parameters:
  graph_dimensions: two-axis | three-axis
  naming_system: letter | directional | positional | scale-based

related: []  # TBD: see also quantitative-axis, dual-axis

warnings:
  - "In three-axis graphs, which axes are X and Y varies by application, software, and individual"
  - "With the ability to rotate graphs 360 degrees, terms like vertical, horizontal, top, bottom become less precise"
  - "On 3D graphs, X and Y axes reverse their relative left/right positions from top to bottom"

extensions:
  harris_entry: "Axis, Graph"
  naming_systems:
    letter: "X, Y, Z designations"
    directional: "Vertical, horizontal"
    positional: "Left, right, top, bottom, upper, lower"
    ordinate: "Ordinate (Y-axis), Abscissa (X-axis)"
    scale_based: "Named by variable or units (sales axis, profit axis)"
---

## Description

Harris documents multiple systems for naming graph axes, each with different conventions and limitations. Understanding these naming systems helps in communicating clearly about graph structure and in interpreting documentation from different sources.

The choice of naming system depends on context: letter designations are common in mathematical and technical contexts, directional names suit visual description, positional names work for layout discussions, and scale-based names connect axes to their content.

## Examples

**Letter designations (X, Y, Z):**
> "In two-dimensional graphs it is almost universal that Y designates the vertical axis and X the horizontal axis. In three-axis graphs, Z is widely accepted as the designation for the vertical axis." (p. 23)

> "Which of the other two axes of a three-axis graph are designated X and Y varies depending on the application, the software, and/or the individual preparing the graph." (p. 23)

**Directional names:**
> "In one- and two-axis graphs it is common to refer to axes as vertical and horizontal. In three-axis graphs, the term vertical axis is also widely used; however, the term horizontal axis is seldom used since most three-dimensional graphs are shown tilted and consequently there are generally no horizontal axes." (p. 23)

**Positional names:**
> "On two-dimensional graphs it is common to refer to the upper and lower horizontal axes or the right and left vertical axes." (p. 24)

**Traditional mathematical terms:**
> "In two-dimensional graphs the vertical or Y-axis is sometimes referred to as the ordinate axis and the horizontal or X-axis as the abscissa axis." (p. 23)

**Scale-based names:**
> "It is not uncommon for an axis to be referred to by the title or units of measure of the scale on the axis. For example, if a graph shows sales in units along the horizontal axis and dollars of profit along the vertical axis, it is not unusual to have the horizontal axis referred to as the units or sales axis and the vertical axis as the dollars or profit axis." (p. 24)

## Usage

Choose naming convention based on audience and purpose:
- **Technical/mathematical**: Use X, Y, Z letter designations
- **General description**: Use directional terms (vertical, horizontal)
- **Layout discussion**: Use positional terms (left, right, top, bottom)
- **Content-focused**: Use scale-based names (profit axis, time axis)

Be aware of ambiguity in three-dimensional graphs where:
- X and Y assignment varies by convention
- Left/right relationships reverse between top and bottom of 3D views
- Rotation eliminates fixed horizontal/vertical orientations

## Notes

Some individuals and software developers refer to all lines around a graph as axes, while others call them scale lines or frame lines. The terminology varies whether or not the lines have tick marks and labels. This inconsistency means readers should infer meaning from context rather than assuming universal definitions.
