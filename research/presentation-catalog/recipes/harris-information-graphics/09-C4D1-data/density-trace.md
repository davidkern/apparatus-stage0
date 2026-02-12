---
name: Density Trace
slug: density-trace
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Density Trace, p. 134"

intent: Smooth the jagged appearance of histograms by using overlapping class intervals to better reveal the underlying distribution shape
direction: construction

components:
  - element: overlapping-intervals
    encodes: Class intervals intentionally chosen to overlap with adjacent intervals
    required: true
  - element: smoothed-curve
    encodes: Line connecting the midpoints of overlapping interval frequencies
    required: true
  - element: value-axis
    encodes: Horizontal scale of data values
    required: true
  - element: frequency-axis
    encodes: Vertical scale showing density or frequency (may be omitted)
    required: false

parameters:
  interval_count: 10-100 (or more)
  interval_width: units | percent-of-range
  weighting: equal | distance-weighted
  vertical_scale: frequency | density | density-per-unit

related: []  # TBD: see also histogram, frequency-polygon

warnings:
  - "Values will be larger than standard histogram due to duplicate counting from overlapping intervals"
  - "Exact location and shape of curve varies depending on interval width and center distance"
  - "May smooth out real features if intervals are too wide"

extensions:
  harris_entry: "Density Trace"
  typical_use: "revealing underlying distribution shape without histogram artifacts"
---

## Description

A density trace smooths the jaggedness that occurs in many histograms and minimizes the impression that data elements are evenly distributed across the width of class intervals. The technique works on the principle of overlapping class intervals.

In standard histograms, class intervals do not overlap. In density trace graphs, the number and width of class intervals are purposefully chosen to assure that every interval overlaps with two or more other class intervals.

## Examples

**Comparison with Histogram** (p. 134)

Harris shows a conventional histogram with discrete bars for comparison, then demonstrates the density trace process:

> "The dots designate the centers of the class intervals. They are the points connected by the line that forms the density trace."

> "In this particular example, class intervals are three units wide and on center distances of one unit which results in the overlap of four other class intervals."

The resulting density trace curve shows the general shape of the distribution more smoothly than the stepped histogram bars.

**Intermediate Construction Step** (p. 134)

Harris includes an intermediate graph showing:
> "Values are larger than those in the standard histogram shown above because of the duplicate counts resulting from the overlapping."

This clarifies why the frequency values differ between a histogram and density trace of the same data.

**Shape Variation** (p. 134)
> "The exact location of the mode as well as the shape of the curve vary depending on the combination of class interval width and center line distance selected."

## Usage

**Method variations** (p. 134):

> "Listed below are some of the variations used in the various methods for generating density trace graphs:
> - The number of class intervals is optional and might range as high as 50 to 100.
> - The width of the class intervals is optional and might be specified in units as used on the horizontal axis or percent of the range from minimum to maximum of the data set.
> - A vertical scale may or may not be displayed.
> - If displayed, the vertical scale might be in terms of frequency, density (frequency divided by the total number of elements in the data set), or density per unit of measure on the horizontal axis.
> - All elements in a class interval might be considered equal or a weighting method employed so those elements further from the center of the interval have less impact."

**When to use:**
- Distribution shape is more important than exact frequencies
- Standard histogram appears overly jagged or sensitive to bin placement
- Comparing distributions where small histogram differences are distracting
- Presenting to audiences unfamiliar with interpreting histogram bars

## Notes

The density trace is essentially a kernel density estimation technique presented before that term became widespread. The overlapping intervals act like a moving average across the value range, smoothing random variations while preserving the overall distribution shape.

The trade-off is between smoothing (wider intervals, more overlap) and detail preservation (narrower intervals, less overlap). Too much smoothing can obscure real features like bimodality; too little smoothing retains the jaggedness the technique aims to reduce.
