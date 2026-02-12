---
name: Quantile Graph
slug: quantile-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Quantile Graph, pp. 317-319"

intent: Display the distribution of data elements by plotting values against their quantile positions, enabling analysis of data distribution shape and comparison to theoretical distributions
direction: both

components:
  - element: data-points
    encodes: Individual data elements plotted at their calculated quantile positions
    required: true
  - element: quantile-axis
    encodes: Scale from 0 to 1 (or 0% to 100% as percentiles) showing cumulative proportion
    required: true
  - element: value-axis
    encodes: Quantitative scale showing actual data values
    required: true
  - element: fitted-curve
    encodes: Line connecting data points showing distribution shape
    required: false
  - element: reference-lines
    encodes: Horizontal lines marking quartiles, deciles, or other statistical divisions
    required: false

parameters:
  quantile_axis_position: "horizontal | vertical"
  scale_type: "linear | probability"
  reference_markers: "none | quartiles | deciles | custom"

related: []

warnings:
  - "With very large data sets, plotting every data point may be unnecessary; plotting every fifth or tenth point often preserves curve shape"
  - "Interpolation between quantile labels on one-axis graphs can yield incorrect results"

extensions:
  harris_entry: "Quantile Graph"
  alternate_names: ["percentile graph"]
  typical_use: "analyzing data distribution, determining if data follows normal distribution, comparing relative positions of data points"
  scale_types:
    horizontal: "quantitative or quantile"
    vertical: "quantitative or quantile"
---

## Description

A quantile graph plots data values against their quantile positions, providing a visual representation of how data is distributed. Unlike cumulative frequency graphs that use class intervals, quantile graphs calculate a quantile number for each individual data element and plot that element's value against its quantile position.

Quantile values range from 0 to 1 and are calculated by: (1) arranging data elements in ascending order, (2) assigning consecutive numbers starting with 1 for the smallest, (3) subtracting 0.5 from the assigned number, and (4) dividing by the total number of data elements. Multiplying by 100 converts quantile values to percentiles.

The quantile axis can be placed on either the horizontal or vertical axis. For the same data set, quantile graphs and cumulative frequency graphs produce very similar curves.

## Examples

> "Three graphs with the same quantile data plotted on each. Only the scales are different." (p. 317)

Harris shows three equivalent representations: quantile values on the horizontal axis with value on vertical, quantile on vertical with value on horizontal, and percentile scale on vertical with value on horizontal.

> "In the case of quantile graphs, a quantile number is calculated for each data element and the values of the data elements plotted against their respective quantile numbers." (p. 317)

## Usage

Quantile graphs serve several analytical purposes:

**Distribution Analysis**: The shape of the curve reveals distribution characteristics. A normal distribution produces an S-shaped curve on linear scales.

**Relative Position Determination**: Reference lines at quartiles and deciles allow observations such as:
- "50% of the data elements are less than and larger than about 2.3"
- "10% of the data elements are equal to or greater than 4.5"
- "The spread of values between the lower decile and the median is 1.0"

**Advantages over cumulative frequency graphs**:
- Easier construction
- Actual data points shown (not class interval summaries)
- No decisions required about class interval size
- Same curve functions as both less-than and greater-than curve
- Actual maximum and minimum values displayed

## Notes

With small to medium data sets, every data element is typically plotted. With very large data sets, plotting only a fraction of points (e.g., every fifth element) detracts little from effectiveness, particularly with normal distributions.
