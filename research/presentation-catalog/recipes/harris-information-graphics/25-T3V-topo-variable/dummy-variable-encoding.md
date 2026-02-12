---
name: Dummy Variable Encoding
slug: dummy-variable-encoding
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Variable, p. 431"

intent: Highlight a subset of data points sharing a characteristic to reveal patterns not visible in the primary variables
direction: construction

components:
  - element: primary-data-points
    encodes: The main scatter of data plotted against independent and dependent variables
    required: true
  - element: dummy-variable-markers
    encodes: Visual differentiation (circles, colors) identifying points with a specific characteristic
    required: true
  - element: legend
    encodes: Explanation of what the dummy variable markers indicate
    required: true

parameters:
  characteristic_type: "any binary or categorical attribute of data points"
  visual_encoding: "shape or color or size or outline"

related: []

warnings:
  - "Generally only one dummy variable is shown per graph to avoid visual confusion"
  - "There is no limit to how many dummy variables can be designated, but display them separately"

extensions:
  harris_entry: "Variable"
  typical_use: "investigating whether a subgroup shows different patterns than the overall population"
---

## Description

A dummy variable is designated to gain insight into a data series by identifying a subset of data points that share a particular characteristic. Unlike the primary independent and dependent variables that define the graph axes, a dummy variable is used to highlight patterns within the data that might otherwise go unnoticed.

The technique involves plotting data normally according to the primary variables, then visually marking those points that possess some additional characteristic of interest. This allows viewers to see whether the marked subset behaves differently from the overall population.

## Examples

Harris illustrates with a reaction time study (p. 431):

> "For example, if a study is done to see how reaction time varies with age, a group of people of all ages might be tested and the data plotted on a scatter graph... In this example, age and reaction times are the independent and dependent variables, respectively. As an extension of the study, one might identify those data points that represent individuals with some particular characteristic, such as those who are active in sports. This would be called a dummy variable." (p. 431)

The example shows:
1. First graph: Basic scatter plot of reaction time vs. age
2. Second graph: Same data with circles added around points representing individuals active in sports

> "If circles were used to identify those individuals active in sports, the graph might look like the one at the left, which indicates that those individuals active in sports tend to score higher than those who are not." (p. 431)

## Usage

Dummy variable encoding is appropriate when:
- You want to investigate whether a subgroup shows different patterns
- A characteristic of interest can be identified for each data point
- The primary relationship (independent vs. dependent variable) is already established
- Visual inspection of subset patterns would be informative

Construction process:
1. Plot the primary scatter of data according to independent and dependent variables
2. Identify the characteristic that defines the dummy variable
3. Select a visual encoding (shapes, colors, outlines) to mark relevant points
4. Apply the marking to all points possessing the characteristic
5. Add a legend explaining the dummy variable encoding
6. Assess whether marked points cluster differently than unmarked points

Practical considerations:
- Generally display only one dummy variable per graph
- Multiple dummy variables can be analyzed by creating separate graphs
- The visual encoding must be clearly distinguishable from unmarked points
- Consider using transparent markers if overlap is significant

## Notes

The power of dummy variable encoding is in revealing patterns that exist within data but are hidden when viewing the overall distribution. In Harris's example, the observation that sports-active individuals tend to have better reaction times only becomes visible when those individuals are marked.

While there is no limit to how many dummy variables could theoretically be designated for a data series, displaying multiple encodings on a single graph typically creates visual confusion. The recommended practice is to explore one dummy variable at a time.
