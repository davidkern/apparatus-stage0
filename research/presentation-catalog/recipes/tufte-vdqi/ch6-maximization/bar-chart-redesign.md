---
name: Bar Chart Redesign
slug: bar-chart-redesign
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, pp. 126-129"

intent: Progressively simplify the standard bar chart by erasing non-data-ink elements while maintaining or increasing information
direction: construction

components:
  - element: data-bars
    encodes: Quantitative values for each category
    required: true
  - element: baseline
    encodes: Zero reference (optional, can be implied by bar alignment)
    required: false
  - element: white-grid
    encodes: Scale reference through gaps in bars
    required: false

parameters:
  frame: present | absent
  vertical_axis: full | ticks-only | none
  baseline: solid | thin | absent
  grid_style: black-lines | white-gaps | none

warnings:
  - "Removing too many elements may confuse unfamiliar viewers"
  - "Baseline removal requires bars to align precisely to imply zero"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "erasing"
  figure_reference: "pp. 126-129"
  original_form: "standard bar chart (Playfair style)"
  historical_reference: "William Playfair's original bar chart design"
---

## Description

The bar chart redesign demonstrates Tufte's erasing principles through a step-by-step transformation of the standard bar chart. Starting from the conventional design "endorsed by the practices and the style sheets of many statistical and scientific publications" (p. 126), Tufte shows how each non-data element can be questioned and often removed.

The progression moves from a fully-framed bar chart with axis lines and ticks to a minimal design where only the bars themselves remain, optionally enhanced with a white grid for scale reference.

## Examples

Tufte begins by noting the historical continuity:

> "Its architecture differs little from Playfair's original design." (p. 126)

He then demonstrates the erasure sequence:

**Step 1 - Erase the frame:**
> "The box can be erased." (p. 127)

The bounding rectangle around the plot area is removed.

**Step 2 - Reduce the vertical axis:**
> "And the vertical axis, except for the ticks." (p. 127)

The solid axis line is erased, leaving only tick marks.

**Step 3 - Create white grid:**
> "Even part of the data measures can be erased, making a white grid, which shows the coordinate lines more precisely than ticks alone." (p. 127)

White gaps are cut through the bars at tick positions, and the ticks are removed.

**Step 4 - Consider baseline removal:**
> "Although the intersection of the thicker bar with the thinner baseline creates an attractive visual effect (but also the optical illusion of gray dots at the intersections), the baseline can be erased since the bars define the end-point at the bottom." (p. 128)

**Step 5 - Optional thin baseline:**
> "Still, a thin baseline looks good." (p. 128)

The final form balances minimalism with aesthetics.

## Usage

The redesign principles apply broadly:

> "The techniques—no frame, no vertical axis, no ticks, and the white grid—apply to other designs." (p. 129)

Tufte demonstrates application to a variable-width notched box plot, showing the same erasing principles work beyond simple bar charts.

Redesign checklist:
1. Can the frame be erased? (Usually yes)
2. Can the axis line be erased, keeping only ticks? (Usually yes)
3. Can ticks be replaced with white gaps through data elements? (Often yes)
4. Can the baseline be erased or thinned? (Sometimes)

Each step should be evaluated for whether information is lost. In most cases, no information is lost; the data bars themselves carry all necessary information, and scale reference can be provided by the white grid technique.

## Notes

The bar chart redesign is both a specific technique and a demonstration of methodology. Tufte uses it to model how any graphic can be approached: start with the conventional form, identify each non-data element, question whether it can be erased, and proceed until only data-ink remains.

The reference to Playfair connects the redesign to the history of statistical graphics. Playfair invented the bar chart in the 1780s, and its basic form has remained unchanged for over two centuries. Tufte's intervention is to question the accumulated conventions that have built up around that original design.

The bar chart redesign also introduces the white grid technique, which becomes a transferable tool applicable to many other chart types.
