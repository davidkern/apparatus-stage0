---
name: Envelope
slug: envelope
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Envelope, p. 145"

intent: Approximate the boundaries of a data set with paired lines to help viewers estimate general shape and trend despite point scatter
direction: both

components:
  - element: data-points
    encodes: Individual observations being bounded
  - element: upper-boundary-line
    encodes: Approximate upper limit of data
  - element: lower-boundary-line
    encodes: Approximate lower limit of data
  - element: regression-line
    encodes: Central trend through the data
    required: false

parameters:
  construction_method: freehand | mathematical
  coverage: all-points | most-points

related: []

warnings:
  - "Envelopes may or may not encompass all data points"
  - "Freehand envelopes are subjective; mathematical envelopes depend on method chosen"

extensions:
  harris_entry: "Envelope"
  alternate_names: []
  typical_use: "showing data spread around a trend, indicating prediction boundaries, summarizing scatter"
  graph_types: ["point graph", "line graph"]
---

## Description

An envelope consists of a pair of lines drawn at the top and bottom (or both sides) of a series of data points. These boundary lines approximate where the data lies, helping viewers perceive the general shape and spread of a scattered dataset without needing to trace every individual point.

Envelopes can be drawn freehand based on visual judgment or calculated using mathematical procedures. They may include all points within their bounds or allow some outliers to fall outside.

## Examples

Harris shows two applications (p. 145):

**Line graph with complete containment:**
> "Line graph in which all data points are inside the envelope"

Shows a line graph with parallel curved boundaries fully containing the oscillating data line.

**Point graph with outliers:**
> "Point graph where a few stray data points are outside the envelope"

Shows a scatter plot with loose boundary lines where most but not all points fall within.

Harris explains:
> "An envelope is generated when a pair of lines are drawn at the top and bottom or on both sides of a series of data points. The lines may be drawn free hand or plotted based on some mathematical procedure. They may or may not encompass all of the data points. The purpose of the lines is to approximate the boundaries of the data to assist the viewer in estimating the general shape and trend of a group of data points."

## Usage

Envelopes are appropriate when:
- Data shows substantial scatter around a trend
- The range/spread of values matters as much as central tendency
- Viewers need to quickly grasp data boundaries
- Smoothing individual point noise aids interpretation

The relationship to regression:
> "A regression line may or may not be used in conjunction with the envelope."

When both are shown, the regression captures central trend while the envelope captures spread.

## Notes

Envelopes are generally used only with point and line graphs where data points exist to be bounded. They relate conceptually to confidence intervals and prediction bands from statistics, though envelopes as Harris describes them may be more informal.

The choice of whether to include all points or allow outliers outside affects interpretation: inclusive envelopes show the full range; exclusive envelopes highlight what is typical while flagging exceptions.
