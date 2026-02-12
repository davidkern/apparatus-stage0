---
name: Decomposition Graph
slug: decomposition-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graph, Multiple graphs representing elements of a composite, p. 173"

intent: Separate a composite data series into its component parts and display each component alongside the composite to reveal underlying structure
direction: both

components:
  - element: composite-graph
    encodes: The aggregate or summed data series
  - element: component-graphs
    encodes: Individual graphs for each contributing data series
  - element: visual-relationship
    encodes: Layout showing how components sum to composite
  - element: aligned-time-axis
    encodes: Common temporal reference across all graphs

parameters:
  component_count: "2 or more"
  composition_type: "additive | multiplicative"

related: []  # TBD: time-series-decomposition, stacked-area-graph

warnings:
  - "Components must actually sum to the composite for the relationship to be valid"
  - "Works best with additive decomposition; multiplicative is harder to visualize"
  - "Many components can make the display complex"

extensions:
  harris_entry: "Graph"
  alternate_names: ["component analysis graph", "breakdown graph"]
  typical_use: "time series analysis showing trend, seasonal, cyclical, and random components"
---

## Description

Sometimes the data series from which a graph is plotted is the sum of several component data series. When those component data series are separated out and plotted individually, the result is sometimes called a decomposition graph. This technique reveals the underlying structure of aggregate data by showing each contributing element.

## Examples

Harris provides a time series decomposition example (p. 173):

> "The examples at the right show the composite curve as well as graphs of the four component data series that comprise it."

The illustration shows five aligned graphs spanning 1990-1995:
1. **Composite graph**: The total data series showing overall pattern
2. **General trend**: Long-term upward or downward movement
3. **Cyclical fluctuations**: Medium-term periodic variations
4. **Seasonal fluctuations**: Regular annual patterns
5. **Random fluctuations**: Irregular, unpredictable variations

> "This graph is a composite of the four graphs at the right. The graph on the left is the result of adding together the curves shown on the four graphs above."

## Usage

Most effective when:
- Aggregate data has known or suspected component structure
- Understanding contributing factors is important
- Components have different characteristics (trends vs. cycles vs. noise)
- Time series data needs decomposition analysis

Classic decomposition:
- **Trend**: Long-term direction
- **Cyclical**: Multi-year business cycles
- **Seasonal**: Annual patterns
- **Random/Residual**: Unexplained variation

Design considerations:
- Align all graphs on the same time axis
- Use consistent scales where meaningful
- Show composite prominently to anchor the decomposition
- Label each component clearly

Less effective when:
- Components don't actually sum to the composite
- Too many components would create clutter
- The decomposition method is not established

## Notes

Decomposition graphs are fundamental to time series analysis. By separating trend from seasonal patterns from random noise, analysts can better understand the underlying dynamics and make more informed forecasts. The visual separation helps viewers distinguish signal from noise.
