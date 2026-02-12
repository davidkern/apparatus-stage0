---
name: Cash Flow Graph
slug: cash-flow-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Cash Flow Graph, p. 68"

intent: Project and monitor key financial figures over the life cycle of a project, program, or investment
direction: both

components:
  - element: time-axis
    encodes: Phases of the life cycle (development, introduction, growth, maturity, decline)
    required: true
  - element: value-axis
    encodes: Financial values (positive and negative, often with zero line)
    required: true
  - element: multiple-data-series
    encodes: Different financial metrics (sales, capital expenditures, cash flow, profit)
    required: true
  - element: phase-boundaries
    encodes: Divisions marking transitions between life cycle phases
    required: true

parameters:
  phase_names: standard_product_lifecycle | custom
  metrics_tracked: sales_cashflow_profit | custom_set
  scale_configuration: single | multiple_for_different_magnitudes

related: []

warnings:
  - "Different metrics may require separate scales due to magnitude differences"
  - "Phase lengths should reflect actual expected durations, not equal divisions"

extensions:
  harris_entry: "Cash Flow Graph"
  alternate_names: ["product life cycle graph"]
  typical_use: "new product financial planning, investment analysis, project monitoring"
---

## Description

A cash flow graph is a graph that projects and/or monitors key financial figures over the life cycle of a project, program, investment, etc. One of the key functions of this type of graph is to show the relative timing of key activities and their resulting financial impact.

## Examples

Harris describes a hypothetical new product cash flow graph (p. 68):

> "In the example shown here, it can be seen that this new hypothetical product does not become profitable until the end of the introduction phase, and the cash flow does not become positive (more money coming in than going out) until more than halfway into the growth phase."

The example shows phases labeled Development, Introduction, Growth, Maturity, and Decline along the horizontal axis. Multiple lines track:
- Sales (increasing through growth, peaking in maturity, declining)
- Capital expenditures (high in development, declining)
- Cash flow (negative initially, crossing zero during growth)
- Profit (crossing zero at end of introduction)

> "A companion graph may use the same time scale but show cumulative values for each of the items being tracked." (p. 68)

## Usage

Cash flow graphs are valuable for:
- New product financial planning
- Investment decision-making
- Project justification presentations
- Monitoring actual vs. projected performance

Key insights the graph provides:
- When the project/product becomes profitable
- When cash flow turns positive
- How phases relate to financial milestones
- The magnitude and timing of initial investment requirements

The names and lengths of phases along the horizontal axis, as well as the specific items plotted, can differ depending on the specific application.

## Notes

Because of relative sizes of values (e.g., total sales vs. profit margin), separate scales are often required for different data series on the same graph.
