---
name: Data-Ink Ratio
slug: data-ink-ratio
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Data-Ink Ratio, p. 126"

intent: Maximize clarity by minimizing non-essential graphics in charts and graphs, keeping the ratio of essential to total ink as large as possible
direction: construction

components:
  - element: essential-ink
    encodes: Graphics required to communicate the information (bars, lines, axes)
    required: true
  - element: non-essential-ink
    encodes: Decorative or redundant elements that can be removed (backgrounds, duplicate labels, unnecessary gridlines)
    required: false

parameters:
  elements_to_evaluate: frame | background | gridlines | images | ticks | duplicate-labels | duplicate-values

related: []  # TBD: see also chartjunk

warnings:
  - "Removing too many elements can reduce readability; balance is required"
  - "Context matters: presentation graphics may benefit from some decoration"
  - "Grid lines aid accurate reading and may not be 'unnecessary'"

extensions:
  harris_entry: "Data-Ink Ratio"
  coined_by: Edward Tufte
  typical_use: "simplifying cluttered charts, improving information density"
---

## Description

The data-ink ratio is an expression coined in conjunction with the concept that, for clarity, it is often advantageous to keep the amount of unnecessary graphics to a minimum when generating a chart or graph.

The expression can be shown as:

> Data-Ink ratio = Amount of ink essential to communicate the information / Amount of ink actually used in the chart

The proposed objective is to keep the ratio as large as possible by reducing what is sometimes called chartjunk.

## Examples

**Low vs High Data-Ink Ratio** (p. 126)

Harris provides a side-by-side comparison of the same data presented with low and high data-ink ratios.

**Low data-ink ratio version includes:**
- Full frame around plot area
- Background shading or image
- Dense grid lines
- Tick marks on all axes
- Duplicate values (on bars and axis)
- Duplicate labels

**High data-ink ratio version eliminates:**
> "Items eliminated: Duplicate values, Duplicate labels, Part of frame, Background, Grid lines, Image, Ticks"

The result shows just the essential bars with minimal axis markings and single labels - the same information communicated with far less visual clutter.

## Usage

**Elements to evaluate for removal:**
- Backgrounds and decorative images
- Heavy or closely-spaced grid lines
- Full frames when partial frames suffice
- Tick marks that duplicate grid lines
- Values labeled both on data graphics and axes
- Labels repeated unnecessarily
- 3D effects that add no information

**Process:**
1. Identify all graphic elements in the chart
2. For each element, ask: "Does removing this lose information?"
3. If no information is lost, consider removing or reducing the element
4. Test readability after simplification

**Balancing considerations:**
While the principle favors simplification, some "non-essential" elements aid interpretation:
- Grid lines help readers estimate precise values
- Frames provide visual boundaries
- Some redundancy aids quick scanning

The goal is appropriate simplification, not minimalism for its own sake.

## Notes

This concept originates from Edward Tufte's work on information design. Harris presents it as one approach among many for chart design. The principle is most valuable when charts have become cluttered with decorative elements that distract from the data.

See also Chartjunk for related discussion of unnecessary graphical elements.
