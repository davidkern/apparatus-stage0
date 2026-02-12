---
name: Change Graph
slug: change-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Change Graph, p. 70"

intent: Compare multiple factors at two points in time or under two different conditions, showing both actual values and direction of change
direction: both

components:
  - element: data-graphics
    encodes: Visual elements (bars, columns, arrows) spanning from prior value to subsequent value
    required: true
  - element: direction-indicator
    encodes: Coding showing whether change is increase or decrease (arrows, colors, patterns)
    required: true
  - element: favorability-indicator
    encodes: Additional coding showing whether change is favorable or unfavorable (optional)
    required: false
  - element: value-labels
    encodes: Numeric change values displayed on data graphics (optional)
    required: false

parameters:
  direction_encoding: arrows | colors | patterns
  favorability_encoding: colors | patterns | text_labels
  graph_orientation: bar | column

related: []

warnings:
  - "No particular direction is always favorable - must interpret based on context"
  - "Need clear legend when using multiple coding systems simultaneously"

extensions:
  harris_entry: "Change Graph"
  alternate_names: []
  typical_use: "forecast revisions, period-over-period comparisons, indicator tracking"
  variant_of: "difference graph"
---

## Description

A change graph is a variation of a difference graph that compares multiple factors at two points in time or under two different sets of conditions. Actual values are plotted. The numeric value of the change may or may not be shown on the data graphics.

For example, if the values before and after a change were 40 and 60 respectively, the data graphic would extend from 40 to 60. The numeric change of 20 may or may not be noted on the graph.

With this type of graph, the direction of change or difference is generally considered important; therefore, a coding system is used to indicate the direction of change. Since no particular direction is always favorable (desirable) or unfavorable (undesirable), an additional coding system is sometimes used to designate whether the change is favorable or not.

## Examples

Harris describes three encoding approaches (p. 70):

> **Arrows approach**: "Arrows indicate the direction of change. The base and tip of the arrows indicate the prior and subsequent values, respectively." Example shows sales forecasts changing from March to April: May forecast drops from $60K to $40K (arrow pointing down), June rises from $18K to $28K (arrow pointing up).

> **Bars with favorability colors**: Shows measures A through D as horizontal bars. "Color, shading, or patterns can be added to indicate whether the change was favorable (desirable) or unfavorable (undesirable)." Measure A shows +20 (favorable), Measure B shows +28 (unfavorable), etc.

> **Combined encoding**: Uses both color/pattern for direction AND text labels for favorability. Shows indices A through D with bars indicating whether 1995 or 1996 was greater, plus "Fav." or "Unfav." labels.

Typical applications include:
- Changes in sales forecasts from one month to the next
- Changes in unemployment from one period to the next
- Changes in key business indicators from one period to another

## Usage

Change graphs are effective when:
- Comparing the same measures across two time points or conditions
- Both the magnitude and direction of change matter
- Favorability of change varies by measure (increase good for some, bad for others)

The dual-coding system (direction + favorability) addresses the reality that "up" is not always good: increased sales is favorable, but increased costs is unfavorable.

## Notes

Both bar and column orientations can be used. The choice depends on the number of items being compared and labeling requirements.
