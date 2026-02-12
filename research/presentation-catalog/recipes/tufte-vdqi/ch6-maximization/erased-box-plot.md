---
name: Erased Box Plot
slug: erased-box-plot
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, p. 125"

intent: Simplify parallel schematic plots by removing redundant horizontal lines, retaining only vertical lines that encode data
direction: construction

components:
  - element: vertical-lines
    encodes: Range and quartiles of each group's distribution
    required: true
  - element: center-dots
    encodes: Median of each distribution
    required: true

parameters:
  line_count: range-only | full-quartile
  baseline: present | absent

warnings:
  - "Requires viewer familiarity with box plot conventions"
  - "Without horizontal lines, IQR box boundaries are less explicit"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "erasing"
  figure_reference: "p. 125"
  original_form: "parallel schematic plot (box plot)"
  ink_reduction: "80 line segments to 10"
---

## Description

The erased box plot applies data-ink maximization to the traditional parallel schematic plot (multiple box plots arranged for comparison). The conventional design requires drawing many horizontal lines—the tops and bottoms of boxes, the ends of whiskers—that carry redundant information. By erasing these horizontals, the design reduces to vertical lines only, which still encode the essential distribution information.

The simplification is dramatic: Tufte's example reduces 80 separate line segments (50 horizontals and 30 verticals) to just 10 verticals showing the same information.

## Examples

Tufte presents the case:

> "The same logic applies to many similar designs, such as this 'parallel schematic plot.' The original required 80 separate placings of the straightedge, 50 horizontals and 30 verticals." (p. 125)

The before image shows ten conventional box plots with full boxes, whiskers, and median lines. The after image shows ten simple vertical lines with dots marking medians:

> "An erased version requires only 10 verticals to show the same information." (p. 125)

On the practical benefit:

> "The large reduction in the amount of drawing is relevant for the use of such designs in informal, exploratory data analysis, where the research worker's time should be devoted to matters other than drawing lines." (p. 125)

## Usage

The erased box plot is appropriate when:
- Comparing multiple distributions
- The primary interest is in ranges and medians
- Quick hand-drawing is needed (exploratory analysis)
- Visual clutter should be minimized

The technique works because:
- The vertical position of line endpoints encodes min/max (or whisker extent)
- The vertical line implicitly shows range
- A dot or mark can indicate the median
- Quartile positions can be shown by line weight changes or small marks

Construction for minimal version:
1. Draw a single vertical line for each group
2. Line extends from minimum to maximum (or whisker boundaries)
3. Mark the median with a dot on the line
4. Optionally mark quartiles with ticks or line weight changes

The trade-off is explicitness: the original box shape makes the interquartile range visually distinct. The erased version requires more interpretation but shows the same data with far less ink.

## Notes

This technique appears at the beginning of Chapter 6, setting up the principle that will be elaborated throughout: "erasing and data-ink maximizing" can transform standard statistical graphics. The box plot example is particularly striking because the visual transformation is so dramatic (80 lines to 10) while the information content remains unchanged.

Tufte's emphasis on "the research worker's time" points to a practical consideration beyond aesthetics: simpler graphics are faster to produce, especially by hand. In the pre-computer era of the original edition (1983), this was a significant advantage for exploratory work.
