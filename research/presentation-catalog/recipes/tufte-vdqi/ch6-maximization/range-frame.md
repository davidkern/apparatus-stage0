---
name: Range-Frame
slug: range-frame
source:
  work: The Visual Display of Quantitative Information
  author: Edward R. Tufte
  location: "Chapter 6, pp. 130-132"

intent: Make axis lines communicate data by extending them only to the observed minimum and maximum of each variable
direction: both

components:
  - element: x-axis-segment
    encodes: Range of X variable (min to max)
    required: true
  - element: y-axis-segment
    encodes: Range of Y variable (min to max)
    required: true
  - element: data-points
    encodes: Individual bivariate observations
    required: true
  - element: scale-labels
    encodes: Numeric values at axis endpoints (optional but recommended)
    required: false

parameters:
  axis_style: solid | tick-marked
  dimensions: bivariate | univariate

related: []  # TBD: see also quartile-plot, dot-dash-plot

warnings:
  - "Axis segments must accurately reflect observed data extremes"
  - "Outliers will extend the range-frame, potentially dominating the visual"

extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "restructuring"
  figure_reference: "pp. 130-131"
  original_form: "standard scatterplot with full rectangular frame"
---

## Description

A range-frame replaces the conventional rectangular frame of a scatterplot with axis lines that extend only to the observed minimum and maximum of each variable. The frame lines become data-communicating elements: their endpoints show the data range without requiring the viewer to read off scale values and mentally calculate extent.

The transformation is simple but powerful. In a conventional scatterplot, the frame extends to arbitrary round numbers on the scale, conveying no information about the data itself. By trimming the frame to match observed data limits, the same ink now serves double duty: it still provides the coordinate reference function, but it also explicitly encodes the range of each variable.

## Examples

Tufte introduces the concept through the erasing principle:

> "A useful fact, brought to notice by the maximization and erasing principles, is that the frame of a graphic can become an effective data-communicating element simply by erasing part of it. The frame lines should extend only to the measured limits of the data rather than, as is customary, to some arbitrary point like the next round number marking off the grid and grid ticks of the plot." (p. 130)

The result:

> "The result, a range-frame, explicitly shows the maximum and minimum of both variables plotted (along with the range), information available only by extrapolation and visual estimation in the conventional design. The data-ink ratio has increased: some non-data-ink has been erased, and the remainder of the frame, now carrying information, has gone over to the side of data-ink." (p. 130)

Tufte provides a side-by-side comparison showing a conventional scatterplot versus a range-frame version, with labels indicating min X, max X, min Y, and max Y positions where the axes terminate.

On self-explanation:

> "A range-frame does not require any viewing or decoding instructions; it is not a graphical puzzle and most viewers can easily tell what is going on. Since it is more informative about the data in a clear and precise manner, the range-frame should replace the non-data-bearing frame in many graphical applications." (p. 131)

## Usage

The range-frame is appropriate for:
- Any scatterplot where the data range is meaningful
- Exploratory data analysis where quick range assessment matters
- Published graphics where space is at a premium

Range-frames work in single dimensions too:

> "Range-frames can also present ranges along a single dimension. Here the historical high and low are shown in the vertical frame. This is an excellent practice and should be used widely in all sorts of displays, both scientific and unscientific." (p. 132)

Construction steps:
1. Plot data points as in standard scatterplot
2. Identify minimum and maximum values for each variable
3. Draw X-axis segment from min(X) to max(X) only
4. Draw Y-axis segment from min(Y) to max(Y) only
5. Optionally label axis endpoints with their values

The technique combines naturally with other data-ink maximization methods:

> "Erasing and editing has led to the display of ten extra numbers (the minimum, maximum, two quartiles, and the median for both variables)." (p. 132)

This refers to extending the range-frame concept into a quartile plot.

## Notes

The range-frame exemplifies Tufte's principle of converting non-data-ink into data-ink. Rather than simply erasing the frame (which would reduce information), the technique restructures it to carry information. The frame remains visually familiar as a coordinate reference while gaining communicative power.

The design is "nearly always better than the conventionally framed scatterplot" (p. 132) because it provides more information with similar visual weight.
