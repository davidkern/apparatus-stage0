---
name: One-Axis Data Distribution Graph
slug: one-axis-data-distribution-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "One-Dimensional Data Distribution Graph, p. 257"

intent: Show the distribution of individual data elements in a data set by plotting each element as a separate symbol along a single quantitative scale
direction: both

components:
  - element: quantitative-scale
    encodes: Range of possible values for data elements
    required: true
  - element: data-point-symbols
    encodes: Individual data elements positioned at their actual values
    required: true
  - element: dummy-variable-symbols
    encodes: Different symbols to distinguish subgroups within the data (optional)
    required: false

parameters:
  symbol_type: dot | line | stripe
  dummy_variable: present | absent

related:
  - slug: scatter-graph
    relationship: contrasts
  - slug: marginal-frequency-distribution-graph
    relationship: combines-with

warnings:
  - "Overlapping of symbols can be misleading, since what appears to be a single symbol may actually be multiple symbols representing two or more data elements"

extensions:
  harris_entry: "One-Dimensional Data Distribution Graph"
  alternate_names:
    - "univariate graph"
    - "number line"
    - "number axis"
    - "one-axis data distribution graph"
    - "stripe graph"
    - "density stripe"
  typical_use: "visualizing distribution of a single variable"
  observable_features:
    - "largest and smallest data elements in a set"
    - "whether points are clustered and where"
    - "whether points are skewed towards one end or the other"
    - "how many data elements are in the set"
    - "whether there are outliers"
---

## Description

The one-axis data distribution graph is the simplest variation of a data distribution graph. It shows graphically how the data elements of a data set are distributed by using a separate symbol to represent each data element of a data set. The data elements are plotted at their actual values along a single quantitative scale.

From such graphs the viewer can observe:
- The largest and smallest data elements in a set
- Whether the points are clustered and if so where
- Whether the points are skewed towards one end or the other
- Whether there are many or few data elements in the set
- Whether there are any points at the extremes that look like they don't belong with the set (outliers)

## Examples

Harris illustrates (p. 257):

**Basic distribution showing features:**
- Two clusters of data points
- Gap in data points
- Unusual point (outlier)

**Using dummy variables:**
> "One-axis data distribution graphs can also be used to note differences within a data set. For example, if the values are measured times for performing a particular task and half were measured on the day shift and half on the night shift, different symbols might be used for the two shifts to see if there are differences."

The example shows:
- Day shift: open circles
- Night shift: filled circles
- Both plotted on same scale (16-25)

**Symbol types:**
- Dots: most widely used
- Lines/stripes: creates "stripe graph" or "density stripe"

## Usage

**When to use:**
- To visualize the distribution of a single variable
- To identify clusters, gaps, and outliers
- To compare subgroups within data (using dummy variables)
- Along axes of scatter graphs as marginal frequency distribution graphs

**Symbol selection:**
Any symbol can be used to designate the data points. Dots and lines/stripes are the most widely used.

**Overlapping problem:**
Overlapping of symbols can be misleading, since what appears to be a single symbol may actually be multiple symbols representing two or more data elements. Methods for addressing this problem are discussed under Symbol.

## Notes

One-axis data distribution graphs are sometimes used to display the distribution of data along the individual axes of scatter graphs. See Marginal Frequency Distribution Graph for this application.
