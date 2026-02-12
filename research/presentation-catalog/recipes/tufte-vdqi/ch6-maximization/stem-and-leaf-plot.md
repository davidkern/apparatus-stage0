---
name: Stem-and-Leaf Plot
slug: stem-and-leaf-plot
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, p. 140 (Chapter 7 content)"

intent: Display distribution shape using the data values themselves as graphical elements
direction: construction

components:
  - element: stem
    encodes: Leading digit(s) defining value class
    required: true
  - element: leaves
    encodes: Trailing digit(s) of individual observations
    required: true

parameters:
  stem_unit: powers-of-ten | custom
  leaf_unit: single-digit | two-digit
  leaf_ordering: original | sorted

related: []  # TBD: see also living-histogram

warnings:
  - "Works best with moderate data sizes (20-200 observations)"
  - "Very large datasets cause leaves to extend too far"
  - "Stem unit choice affects distribution appearance"

extensions:
  tufte_principle: "Mobilize every graphical element to show the data"
  data_ink_effect: "increases"
  redesign_type: "restructuring"
  figure_reference: "p. 140"
  original_form: "histogram"
  inventor: "John Tukey"
---

## Description

The stem-and-leaf plot constructs a distribution display using the actual numerical values of the data. Instead of bars or other abstract shapes, each observation contributes its own digits to form the display. The "stem" consists of the leading digits (defining the row), and the "leaf" is the trailing digit that gets placed in that row.

The result looks like a sideways histogram but carries far more information: the viewer can read back the approximate value of every observation, not just the bin counts.

## Examples

Tufte presents the design as an example of multifunctioning elements:

> "Building data measures out of the data increases the quantitative detail and dimensionality of a graphic. The stem-and-leaf plot constructs the distribution of a variable with numbers themselves." (p. 140)

The example shows heights of 218 volcanoes (in 100-foot units). The display structure:
```
0 | 9 = 900 feet
19 | 3 = 19,300 feet
```

Stems run from 0 to 19, and leaves are single digits. The shape of the distribution is visible from the row lengths, while individual values can be recovered.

On the invention and motivation:

> "The idea of making every graphical element effective was behind the design of the stem-and-leaf plot. In presenting his invention, John Tukey wrote: 'If we are going to make a mark, it may as well be a meaningful one. The simplest—and most useful—meaningful mark is a digit.'" (p. 140)

## Usage

The stem-and-leaf plot is appropriate when:
- Distribution shape needs to be seen
- Individual values should remain recoverable
- Dataset size is moderate (not too small to show shape, not too large for manual construction)
- Quick hand-drawn analysis is needed

Construction steps:
1. Determine stem and leaf units (typically stem = 10s or 100s, leaf = units)
2. List all stems in order vertically
3. For each observation, write its leaf digit in the corresponding stem row
4. Optionally sort leaves within each row

The design trades precision for readability: leaves are typically single digits, so only the first digit of the fractional part is preserved. But this is usually sufficient for understanding distribution shape while retaining much more detail than a histogram.

Tufte also mentions the "living histogram" where actual people arrange themselves by height, creating a bimodal distribution visible in a photograph (p. 140). This is an extreme example of "data as data measure."

## Notes

Although this recipe appears in Chapter 7's content (Multifunctioning Graphical Elements), Tufte introduces it in the context of data-ink maximization principles. The stem-and-leaf plot maximizes data-ink by making every mark carry information: there is no ink in the display that is not a data value.

The design was invented by John Tukey and presented in his 1972 paper "Some Graphic and Semigraphic Displays." Tukey's work on exploratory data analysis heavily influenced Tufte's thinking about statistical graphics.

The stem-and-leaf plot exemplifies the principle that will be stated in Chapter 7: "Mobilize every graphical element, perhaps several times over, to show the data" (p. 139). Each digit serves as both a data point and a visual element contributing to the distribution shape.
