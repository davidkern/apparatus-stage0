---
name: Stacked Area Graph
slug: stacked-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stacked Area Graph, p. 358"

intent: Show how multiple data series combine to form a cumulative total over time, with each series stacked atop the previous one
direction: both

components:
  - element: baseline
    encodes: Zero reference from which the first data series is measured
    required: true
  - element: stacked-layers
    encodes: Multiple data series, each measured from the top of the layer below
    required: true
  - element: cumulative-top-line
    encodes: Total of all component series at each point
    required: true
  - element: sequence-axis
    encodes: Time or ordered categories (typically horizontal)
    required: true
  - element: quantitative-axis
    encodes: Cumulative values (typically vertical)
    required: true
  - element: fill-differentiation
    encodes: Color or pattern distinguishing each data series
    required: true

parameters:
  series_count: "2 or more data series"
  fill_type: "color | pattern | shade"
  baseline_type: "zero | other reference value"

related: []  # TBD: stacked-column-graph, stacked-bar-graph, area-graph

warnings:
  - "Intermediate layers are difficult to read accurately since they don't reference the baseline"
  - "The shape of upper layers is distorted by variations in layers below them"
  - "Best suited for showing totals and general part-to-whole relationships over time, not precise component values"

extensions:
  harris_entry: "Stacked Area Graph"
  alternate_names:
    - "layer area graph"
    - "multiple-strata graph"
    - "strata graph"
    - "stratum graph"
    - "divided area graph"
    - "subdivided area graph"
    - "subdivided surface graph"
  typical_use: "showing how components contribute to a changing total over time"
---

## Description

A stacked area graph displays multiple data series stacked vertically on top of one another, with each layer representing a component of the cumulative total. The bottom layer is plotted from the baseline (typically zero), and each subsequent layer is plotted from the top of the layer immediately below it. The top edge of the uppermost layer represents the sum of all components at each point along the horizontal axis.

Harris notes this is "the area graph format most frequently used." The stacking arrangement allows viewers to see both individual component contributions and the overall total simultaneously, making it effective for visualizing part-to-whole relationships that change over time.

## Examples

From the illustration on p. 358, Harris shows a stacked area graph with three data series (A, B, and C) plotted over years 1994-1998. The graph demonstrates:
- Series A forms the bottom layer, measured from zero
- Series B stacks on top of Series A
- Series C stacks on top of Series B
- The top line shows total values ranging from about 5 to 20 units

The visual clearly shows how each series contributes to the growing total over the five-year period.

## Usage

Stacked area graphs are most effective when:
- The primary interest is in the cumulative total and general contribution patterns
- Data series are all positive values
- Showing trends in both components and totals over a sequence (typically time)
- Comparing the relative sizes of components at different points

Less effective when:
- Precise values for individual components (other than the bottom layer) are needed
- Components have very different scales or some are negative
- Many data series would create too many layers to distinguish
- The audience needs to compare non-adjacent layers directly

The technique combines well with legends that clearly identify each layer and may benefit from labeling the total line explicitly.

## Notes

The stacked area graph is functionally equivalent to the stacked line graph but fills the area below each line, making the cumulative effect more visually prominent. Harris also refers to this format under the entries "Strata Graph," "Stratum Graph," "Subdivided Area Graph," and "Subdivided Surface Graph" (pp. 372-373).
