---
name: Decomposition Graph
slug: decomposition-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Decomposition Graph, p. 133"

intent: Separate and display the individual components that combine to form a composite data series, revealing underlying patterns
direction: both

components:
  - element: composite-graph
    encodes: The original combined data series
    required: false
  - element: component-graphs
    encodes: Individual factors that sum to create the composite
    required: true
  - element: aligned-time-scale
    encodes: Common horizontal axis allowing comparison across components
    required: true

parameters:
  component_types: trend | cyclical | seasonal | random
  display_arrangement: side-by-side | stacked-vertically

related: []  # TBD: see also time-series

warnings:
  - "Decomposition requires assumptions about which components exist in the data"
  - "Different decomposition methods can produce different component estimates"
  - "Random component may still contain unidentified systematic patterns"

extensions:
  harris_entry: "Decomposition Graph"
  typical_use: "time series analysis, separating trend from seasonal and cyclical variations"
---

## Description

Sometimes the data from which a graph is plotted is made up of several components. When the data for those components are separated out and plotted individually, the resulting set of graphs is sometimes called a decomposition graph.

This technique is particularly valuable for time series data where multiple underlying factors combine to produce the observed values. By separating these factors, analysts can better understand what drives changes in the data and make more accurate forecasts.

## Examples

**Sales Data Decomposition** (p. 133)
> "For example, a five-year sales curve might include the continuing growth of the company, the cyclical fluctuations of the economy, seasonal fluctuations, and random fluctuations due to such things as special promotions."

Harris illustrates this with:
- **Composite graph**: Shows the actual observed sales data (1990-1995), with values ranging roughly 8-22
- **General trend**: Smooth upward line showing long-term company growth
- **Cyclical fluctuations**: Wave pattern showing economic cycles
- **Seasonal fluctuations**: Regular repeating pattern within each year
- **Random fluctuations**: Irregular variations after other components removed

The caption notes: "Graphs of the components that, when added together, make up the graph on the left."

## Usage

**When to use decomposition:**
- Analyzing time series data with suspected multiple underlying patterns
- Separating signal from noise
- Understanding what portion of change is due to trend vs seasonal factors
- Improving forecasting by projecting components separately

**Standard components:**
1. **Trend**: Long-term direction of the data (growth, decline, or stable)
2. **Cyclical**: Multi-year waves often tied to economic cycles
3. **Seasonal**: Regular patterns that repeat within a year
4. **Random/Irregular**: Unexplained variation after other components removed

**Display considerations:**
- Align all component graphs on the same time scale for comparison
- Use consistent vertical scale units or clearly label different scales
- Consider showing the composite alongside components for reference

## Notes

Decomposition graphs are analytical tools that help reveal structure in complex data. The technique assumes the components are additive (composite = trend + cyclical + seasonal + random), though multiplicative decomposition is also used in some applications.

The random component ideally contains only unpredictable noise. If patterns remain visible in the random component, it may indicate additional systematic factors that should be identified and separated.
