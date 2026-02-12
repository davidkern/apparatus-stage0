---
name: Shifted Frame and Scale
slug: shifted-frame-and-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Shifted frame and scale labels, p. 340"

intent: Improve readability of data points near axes by displacing the graph frame slightly from the axis lines
direction: construction

components:
  - element: shifted-frame
    encodes: Graph boundary moved away from zero axes
    required: true
  - element: shifted-scale-labels
    encodes: Scale labels repositioned with the frame
    required: true
  - element: axis-reference-lines
    encodes: Optional dashed lines showing original axis positions
    required: false

parameters:
  shift_amount: "distance frame is displaced from axes"
  axes_affected: "horizontal | vertical | both"
  reference_lines: "whether to show dashed lines at original axis positions"

related: []  # TBD: expanded-scale, linear-scale

warnings:
  - "Without reference lines, viewers may not realize axes are shifted"
  - "Shift should be small enough to not distort perception of data positions"

extensions:
  harris_entry: "Scale"
  typical_use: "making data points on or near axes more visible"
---

## Description

Most graphs have the scales and axes coincident with the frame of the graph. This sometimes makes it difficult to read data points on or close to the axes because the data markers can overlap with or be hidden by the frame lines.

One way to overcome this problem is to shift the frame and scale labels slightly away from the axes. This creates a small gap between where the data is plotted (relative to the true axes) and where the frame appears, making data points near zero or at the edges of the plot area more legible.

## Examples

> "Most graphs have the scales and axes coincident with the frame of the graph. This sometimes makes it difficult to read data points on or close to the axes. One way to overcome this problem is to shift the frame and scale labels slightly, as shown in the example at the right." (p. 340)

The PDF illustrates two versions of the same scatter plot:

**Standard layout**: Frame and scale placement coincident with the axes. Data points at x=0 or y=0 are partially obscured by the axis lines.

**Shifted layout**: Frame and scale labels shifted slightly outward. Data points near the axes are now clearly visible. An arrow indicates "Amount of shift." Optional dashed lines show the original axis positions.

## Usage

Shifted frames are appropriate when:
- Data points frequently fall on or very near the zero axes
- Maximum visibility of edge data is important
- The graph is small and axis lines would obscure data

Implementation notes:
- The dashed lines showing original axis positions may or may not be used
- The shift should be small enough that it does not mislead viewers about data positions
- This technique can be applied to most types of axes

## Notes

This is a refinement technique that improves graph usability without changing the underlying data representation. It is particularly useful for scatter plots and point graphs where individual data markers need to be visible regardless of their position relative to the axes.
