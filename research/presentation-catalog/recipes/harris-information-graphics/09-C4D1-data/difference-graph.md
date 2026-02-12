---
name: Difference Graph
slug: difference-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Difference Graph, pp. 138-139"

intent: Display the differences between two data series or between a data series and a known reference to highlight deviations and variances
direction: both

components:
  - element: reference-series
    encodes: Baseline data series or known reference (budget, standard, prior period)
    required: true
  - element: comparison-series
    encodes: Data series being compared to the reference
    required: true
  - element: difference-encoding
    encodes: Visual representation of positive and negative differences
    required: true
  - element: zero-axis
    encodes: Line where difference equals zero
    required: true

parameters:
  display_mode: actual-values-highlighted | differences-only | cumulative-differences
  data_type: positive-only | positive-and-negative
  graph_type: column | bar | line

related: []  # TBD: see also deviation-graph, curve-difference-graph

warnings:
  - "Which series is the reference affects interpretation of positive vs negative differences"
  - "Cumulative differences can mask recent performance if early deviations were large"
  - "Gross deviation graphs can appear balanced when net deviation is significant"

extensions:
  harris_entry: "Difference Graph"
  alternate_names: ["deviation graph"]
  subtypes:
    - "gross deviation graph: shows actual positive and negative values"
    - "net deviation graph: shows algebraic sum of positive and negative"
    - "deviation graph: differences from known reference like budget"
    - "over-under graph: column variation of gross deviation"
    - "split bar graph: bar variation of gross deviation"
---

## Description

The terms difference and deviation are sometimes used to describe the same graph. Generally, a deviation graph is considered a variation of a difference graph that displays the differences between a data series and some known reference such as budget, industry standard, etc.

In each case the difference or deviation is between the elements of two data series or a data series and a known reference. The visual encoding highlights where actual values exceed or fall short of the reference.

## Examples

**Difference Between Two Data Series with Positive Values** (p. 138)
> "With this type of data the actual values might be plotted and the differences highlighted or just the numeric differences might be plotted from a zero axis. One of the data series is generally used as a reference."

Harris shows rain in 1994 vs 1995:
- Graph 1: Both years plotted with differences highlighted by fill
- Graph 2: Only differences plotted, showing positive values where 1995 > 1994 and negative where 1994 > 1995

> "If 1995 were considered the reference, the absolute difference values (ignoring plus and minus signs) would be the same but the highlighting and plus and minus values would be reversed."

**Gross Deviation and Net Deviation Graphs** (p. 138)
> "In this variation, both positive and negative values are compared: cash in and cash out, expenses that increased and those that decreased, value of stocks that went up and value of stocks that went down."

The gross deviation graph shows both positive (cash received) and negative (cash dispersed) as separate data graphics. The net deviation graph shows their algebraic sum - the actual net cash position for each period.

> "The column graph variation of a gross deviation graph is sometimes called an over-under graph. The bar graph variation of a gross deviation graph is sometimes called a split bar graph."

**Deviation Graph (Reference Comparison)** (p. 138)
> "A typical deviation graph displays the differences between a data series and a fixed or known reference such as budget, average, industry standard, etc."

Example shows actual profit vs budget, with positive deviations when profit exceeds budget and negative when below budget.

**Gross and Net Combined** (p. 139)
> "The information for gross and net deviation graphs can be plotted on the same bar or column graph so that the viewer sees both types of information at the same time."

**Labels Between Data Graphics** (p. 139)
> "Labels can be located between the data graphics for the two data series. When the graph is particularly tall or wide, this placement can make it easier for the viewer to relate the labels with the proper data graphic."

## Usage

**Selecting display mode:**

| Information Need | Recommended Display |
|-----------------|---------------------|
| See both actual values and differences | Actual values with differences highlighted |
| Focus purely on variance | Differences only from zero axis |
| Track cumulative variance over time | Cumulative differences |

**Cumulative Differences** (p. 139)
> "In this type of graph the value plotted for a specific time period is equal to the difference or deviation for that period plus the algebraic sum of all the similar values of the preceding time intervals."

This is often called "month-to-date" or "year-to-date" difference or deviation graphs.

**Graph Type Comparison** (p. 139)
Harris provides a systematic comparison showing the same data displayed as:
- Column graphs (vertical orientation)
- Bar graphs (horizontal orientation)
- Line graphs (continuous representation)

Each works for:
- Actual values for reference
- Differences showing actual values
- Differences showing only deviations
- Cumulative differences

## Notes

The choice of reference series matters significantly. Using 1994 as reference vs using 1995 as reference produces identical absolute differences but reverses the sign (positive vs negative) interpretation. Always clearly indicate which series serves as the baseline.

Gross deviation graphs are useful for seeing the magnitude of both positive and negative movements, while net deviation graphs reveal whether the overall position improved or declined.
