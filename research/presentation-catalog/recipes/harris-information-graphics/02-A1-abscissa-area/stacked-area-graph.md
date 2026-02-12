---
name: Stacked Area Graph
slug: stacked-area-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Area Graph, Stacked area graph, pp. 14-15"

intent: Show how multiple data series contribute to a total over time while displaying the trend of both the total and the relative proportions of components
direction: both

components:
  - element: stacked-data-series
    encodes: Multiple data series positioned on top of one another
    required: true
  - element: top-curve
    encodes: The uppermost line representing the total of all data series
    required: true
  - element: filled-bands
    encodes: Shaded regions between each pair of adjacent curves
    required: true
  - element: horizontal-axis
    encodes: Baseline touched only by the bottom data series
    required: true
  - element: vertical-scale
    encodes: Linear quantitative scale starting at zero
    required: true
  - element: legend
    encodes: Key identifying which band represents which data series
    required: true

parameters:
  number_of_series: integer
  series_order: "most important on bottom | most stable on bottom | custom"
  curve_type: segmented | stepped | smooth

related: []  # TBD: see also 100-percent-stacked-area-graph, grouped-area-graph, simple-area-graph

warnings:
  - "When accuracy is desired, this type of graph is generally not used, particularly when values fluctuate significantly and/or slopes are steep"
  - "Many people assume area graphs are always stacked, causing potential confusion with grouped area graphs"
  - "Only the bottom data series can be read directly from the axis; all others are referenced from the series below"
  - "Negative values create data graphics that are very difficult to interpret"
  - "The relative position of data series can significantly impact readability"

extensions:
  harris_entry: "Area Graph"
  alternate_names: ["layer graph", "strata graph", "multiple-strata graph", "stratum graph", "divided area graph", "subdivided area graph", "subdivided surface graph"]
  typical_use: "showing how component parts contribute to a changing total over time"
  scale_requirements:
    vertical: "linear, starts at zero, continuous, positive values only"
---

## Description

The stacked area graph is the most widely used variation of area graph. It is similar to a linked stacked column graph. In stacked area graphs, data series are stacked on top of one another such that the top curve represents the total of all the data series shown on the graph. Only the bottom data series is referenced from or touches the horizontal axis. Each of the other data series on the graph is referenced from the data series immediately below it. One can think of a stacked area graph as a stacked column graph with the areas between the columns filled.

The stacked area graph is often used to show relative sizes of the components that make up the whole. For example, stacked area graphs are frequently used to show how many dollars of sales each product line contributes to the overall dollar sales of a company and how the overall sales dollars have trended.

## Examples

> "In stacked area graphs - probably the most widely used variation of area graphs - each data series is added to the one below it. Only the bottom data series touches the horizontal axis. The top of the upper data series represents the total of all the data series plotted." (p. 11)

> "When approximations are all that are needed, stacked area graphs are usually adequate. When accuracy is desired, this type of graph is generally not used, particularly when the values fluctuate significantly and/or the slopes of the curves are steep." (p. 14)

The PDF shows a comparison on page 14 demonstrating how the same data can be displayed as a linked stacked column graph, a stacked area graph with segmented curves, and a stacked stepped area graph.

An important example on page 14 shows how reversing the relative positions of data series A and B can "significantly improve the readability of the information" - illustrating that series order is a design decision with real impact.

## Usage

Stacked area graphs are appropriate when:
- Showing how component parts contribute to a total
- Displaying trends in both the total and the components
- Approximate values are sufficient
- The data series have relatively smooth trends

**Series ordering strategies:**
- Place the most important data series on the bottom for clearest reading
- Place the most stable variable on the bottom to minimize visual distortion of upper series
- Experiment with different orderings to find the most meaningful arrangement

**Scale guidelines for stacked area graphs:**
- Include zero at the horizontal axis intersection
- Make scales continuous with no breaks
- Use only linear scales (not logarithmic)
- Upper value should exceed the largest total plotted
- Use only positive values

## Handling Negative Values

Technically, both positive and negative values can be plotted on a stacked area graph. Practically, it is seldom done because the data graphics that result can be very difficult to interpret. When one or more data series contains negative numbers, consider using a different graph type for easier interpretation.

## Three-Dimensional Variants

Two- and three-axis stacked area graphs might be displayed as three-dimensional. The two-axis variation is used primarily for its aesthetic value. Depth may or may not be added to the data graphics in the three-axis graph. More than three segments generally becomes confusing.

## Notes

If an area graph with multiple data series has no indication as to what type it is, it is fairly safe to assume it is a stacked area graph, given its prevalence. Some software programs do not even offer grouped area graphs as an option.
