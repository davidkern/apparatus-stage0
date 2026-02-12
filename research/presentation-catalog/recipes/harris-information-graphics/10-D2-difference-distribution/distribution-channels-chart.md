---
name: Distribution Channels Chart
slug: distribution-channels-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Distribution Channels Chart, p. 141"

intent: Graphically display the channels and paths used to move something from its source to end recipients, showing flow proportions through each channel
direction: both

components:
  - element: source-node
    encodes: Origin of product/information (typically at top or left)
  - element: recipient-nodes
    encodes: Ultimate users or destinations (at bottom or right)
  - element: intermediary-nodes
    encodes: Organizations or entities through which flow passes (distributors, retailers)
  - element: channel-arrows
    encodes: Flow paths between nodes
  - element: flow-percentages
    encodes: Proportion of product/dollars passing through each channel
    required: false

parameters:
  orientation: vertical | horizontal
  flow_values: none | percentages | absolute-values

related: []  # TBD: see flow-chart

warnings:
  - "Sum of values entering a node should generally equal sum leaving it"
  - "Complex channel structures may require multiple charts for clarity"

extensions:
  harris_entry: "Distribution Channels Chart"
  alternate_names: []
  typical_use: "product distribution analysis, supply chain visualization, information flow mapping"
---

## Description

A distribution channels chart visualizes the paths used to get something from its source to end recipients. While most commonly used for product distribution, it applies to any flow scenario: information, currency, authority, or resources.

The chart uses rectangles connected by arrows to show how flow splits and recombines through various intermediaries. Unlike simple flow charts that show sequence, distribution channels charts emphasize the branching and proportion of flow through alternative paths.

## Examples

Harris illustrates a product distribution example (p. 141):

> "Distribution channels chart showing the percent of products moving through each channel"

The example shows:
- Producer or Source at top (8% + 23% + 56% + 13% leaving)
- Wholesaler receiving 56%, passing 52% to Retailer and 4% to Distributor
- Retailer receiving from both Wholesaler and direct from Producer
- Distributor as alternative channel
- End customer at bottom receiving from multiple sources

Annotations note:
> "Each arrow represents a channel of distribution. A channel might represent transporting product from one city to another or simply a change in ownership."
> "The values can have any units of measure such as dollars, units, percent, etc. The sum of the values entering a rectangle generally equals the values leaving the rectangle."

## Usage

Distribution channels charts are appropriate when:
- Multiple paths exist between source and destination
- Proportions through each channel matter
- Comparing current vs. planned distribution strategies
- Analyzing competitor distribution approaches

For planning purposes, multiple charts may compare:
- Current state vs. future state
- One organization vs. another
- Different product lines

Orientation typically flows top-to-bottom or left-to-right, with the source at the starting position and recipients at the ending position.

## Notes

When multiple categories of ultimate users exist (e.g., domestic and foreign customers), multiple rectangles at the bottom or multiple separate charts may be needed.

The chart balances simplicity with detail. Too many intermediaries create visual complexity; too few may oversimplify the actual distribution structure.
