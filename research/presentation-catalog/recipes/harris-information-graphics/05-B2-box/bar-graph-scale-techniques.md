---
name: Bar Graph Scale Techniques
slug: bar-graph-scale-techniques
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Scales, pp. 51-52"

intent: Configure quantitative scales on bar graphs to balance accuracy, readability, and honest representation of data
direction: construction

components:
  - element: zero baseline
    encodes: The reference point from which bar lengths are measured
    required: true
  - element: scale axis
    encodes: Quantitative values with tick marks and labels
    required: true
  - element: scale break indicator
    encodes: Visual signal that a portion of the scale has been omitted
    required: false
  - element: grid lines
    encodes: Reference lines for reading values
    required: false

parameters:
  zero_inclusion: included | omitted-with-indicator
  scale_continuity: continuous | broken
  break_style: "zigzag | gap | jagged-edge | dual-graph"
  scale_position: left | bottom | top | both-ends

related: []  # TBD: see also simple-bar-graph, grouped-bar-graph

warnings:
  - "Many people associate the length or area of the bar with its value; violating scale conventions can cause misinterpretation"
  - "Eliminating the lower portion of the scale and starting at a non-zero value is one of the most dangerous variations since it is easy for the viewer to overlook"
  - "Use only linear scales; avoid nonlinear scales such as logarithmic on bar graphs"

extensions:
  harris_entry: "Bar Graph"
  continuation_note: "Continues Bar Graph entry from chunk 04"
  typical_use: "ensuring bar graphs communicate values accurately while showing meaningful differences"
---

## Description

Bar graph scales require careful design because viewers associate both the length and area of bars with their values. While the actual value is determined by the location of the end of the bar, readers often make judgments based on visual proportions. This creates potential for misinterpretation when standard scale conventions are violated.

Harris provides general guidelines for quantitative scales on bar graphs, along with documented exceptions and techniques for handling special cases where standard conventions may need modification.

## Examples

### General Scale Guidelines (p. 51)

Harris offers the following guidelines for quantitative scales on bar graphs:
- Have all scales include zero unless it is clearly identified otherwise
- Locate zero where the vertical axis crosses the horizontal axis
- Have positive values increase to the right and negative values to the left
- Make scales continuous (no breaks)
- The upper scale value should be larger than any value plotted
- Use only linear scales (e.g., avoid nonlinear scales such as logarithmic)
- Except for area bar graphs, make all bars the same width

### Exceptions to Guidelines (p. 51)

> "With range and difference graphs the scale sometimes does not start at zero since the bars do not extend to the zero axis. With these types of graphs, the lower scale value should be lower than the lowest value being plotted."

> "With simple and grouped bar graphs the scales are sometimes broken and/or expanded to make changes and differences from bar to bar more visible."

### Scale Break Methods (p. 51)

Harris illustrates several methods for handling scale breaks:

1. **Standard scale break**: Expand the scale and take a section out of the middle. "The center example tends to make the break most obvious. The lower portion of the scale is sometimes retained to help the viewer more easily determine the size of the intervals."

2. **Eliminated lower scale**: "An alternative to a scale break is to eliminate the lower portion of the scale and start the scale at some value just under the lowest value on the graph. This is one of the most dangerous variations since it is easy for the viewer to overlook the fact that the lower portion of the scale is missing and reach a conclusion based on the height or area of the bars instead of the value at the end of the bar."

3. **Jagged edge indicator**: "Making the left hand portion of the graph uneven helps to call the viewers attention to the fact that the lower portion of the scale is missing."

4. **Dual graph approach**: "This alternative lets the viewer see each of the values in relation to one another using a zero axis (upper graph) and also lets the viewer more accurately see the detailed differences using the enlargement of the critical area (lower graph)."

### Multiple Quantitative Scales (p. 51)

> "Scales are generally located on the left side and bottom. Typically there is only one scale on both the vertical and horizontal axis. Occasionally the identical quantitative scale will be repeated on the top, particularly if the graph is tall. Two different quantitative scales can be used but seldom are. If there are two different quantitative scales and both do not apply to all bars, care must be taken to identify which scale applies to which bars if it is not obvious."

## Usage

**When to use scale breaks**: Scale breaks are appropriate when large actual values combined with small differences make variations from bar to bar difficult to estimate. However, they should always be clearly indicated.

**Dual graph technique**: When both overall magnitude and detailed differences are important, consider using two graphs: one with a zero-based scale showing relative magnitudes, and one with an expanded scale showing detailed differences.

**Scale position**: For tall graphs, repeating the quantitative scale on the top can aid reading. When using two different quantitative scales, clearly identify which bars correspond to which scale.

## Notes

This entry continues the Bar Graph coverage from chunk 04-B1-bar. The scale techniques apply to all bar graph variations including simple, grouped, and stacked forms.
