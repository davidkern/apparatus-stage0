---
name: Bubble Graph
slug: bubble-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bubble Graph, p. 61"

intent: Display three or more variables simultaneously by replacing data points with circles whose size encodes additional quantitative or qualitative information
direction: both

components:
  - element: bubble (circle)
    encodes: Primary data point position (x, y) plus a third variable via size
    required: true
  - element: horizontal axis
    encodes: First quantitative variable
    required: true
  - element: vertical axis
    encodes: Second quantitative variable
    required: true
  - element: center dot
    encodes: Precise data point location within the bubble
    required: false
  - element: legend
    encodes: Mapping between bubble size and the encoded variable
    required: false

parameters:
  size_encoding: diameter-proportional | area-proportional
  bubble_fill: opaque | transparent
  dimensionality: two-dimensional | three-dimensional
  third_variable_type: quantitative | qualitative | ordinal

related: []  # TBD: see also scatter-graph, point-graph

warnings:
  - "All positive or negative values can be encoded by means of bubbles - but not mixtures of the two"
  - "When opaque bubbles are used, there is the risk of some of the circles being hidden"
  - "Diameter-proportional and area-proportional sizing give somewhat different visual appearances"

extensions:
  harris_entry: "Bubble Graph"
  alternate_names: []
  typical_use: "displaying relationships between three variables, such as sales vs. expenses with bubble size indicating region"
  scale_types:
    horizontal: "quantitative"
    vertical: "quantitative"
    bubble_size: "quantitative or qualitative"
---

## Description

A bubble graph is a variation of a point or line graph where the data points (dots) have been replaced by circles (bubbles). The major advantage of a bubble graph versus a point or line graph is the ability to encode one or more additional variables by means of the bubble symbol. Bubble graphs might be two- or three-dimensional.

The technique builds on scatter plot conventions but adds an additional dimension of information through the size of each marker. This allows visualization of relationships among three or more variables in a single view.

## Examples

### Quantitative Variable Encoding (p. 61)

> "When the variable is quantitative, either the diameter or area of each bubble is proportional to the value it represents. The two alternatives give somewhat different visual appearances."

Harris shows a comparison of bubbles based on diameters versus areas for values 20, 10, 5, 2.5, and 1.25, demonstrating how the two encoding methods produce different visual impressions.

To enable the viewer to decode the quantitative information, a legend is provided, the values are shown on the bubbles, or the circles are coded and a cross reference is included.

### Qualitative Variable Encoding (p. 61)

> "When bubbles are used to convey qualitative or ordinal information, only a fixed number of different sizes of circles is generally required."

Harris illustrates a graph where each bubble represents the sales/expense information for a different sales person, with the sizes of the bubbles indicating what region the sales person is assigned to. Since there are four regions, there are four different bubble sizes. The same information could be encoded using four different colors of bubbles.

### Multiple Variables in Bubbles (p. 61)

> "Multiple variables can be encoded by using pie charts as the bubbles. The pie charts might be all the same size or still another variable can be encoded by varying the sizes of the pie charts."

## Usage

**Size encoding methods**: When using quantitative encoding, choose between diameter-proportional and area-proportional sizing. Area-proportional is generally considered more accurate for perception, but diameter-proportional creates more visual distinction between values.

**Legend requirements**: Various ways the values of the bubbles might be indicated:
- A linear or logarithmic scale for measuring circle widths
- Actual values noted in the circles
- Examples of selected values shown in a legend

**Handling overlap**: When opaque bubbles are used, there is the risk of some of the circles being hidden. One solution is to make the bubbles transparent.

**Center dots**: Dots in the centers help determine the locations of data points more accurately. Transparent bubbles with dots at their centers are sometimes used in conjunction with grid lines to enable the viewer to more accurately determine the exact location of the data point.

**Three-dimensional variations**: Bubble graphs can be rendered in three dimensions, adding depth as a fourth variable or for visual effect.

## Notes

### Limitations

All positive or negative values can be encoded by means of bubbles, but not mixtures of the two. This is because circle size has no inherent direction - a circle cannot be "negative."

### Comparison with Scatter Plots

The bubble graph extends the two-variable scatter plot to three or more variables. When only two variables need to be shown and precise location reading is important, a traditional scatter plot with uniform point markers may be more appropriate.

### Pie Chart Bubbles

Using pie charts as bubbles allows encoding of multiple categorical variables within each data point, in addition to the three variables already encoded by position and size. This technique significantly increases information density but requires careful design to remain readable.
