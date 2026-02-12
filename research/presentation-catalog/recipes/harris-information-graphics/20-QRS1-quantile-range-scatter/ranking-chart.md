---
name: Ranking Chart
slug: ranking-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Ranking Chart, p. 326"

intent: Compare how the rankings of multiple entities change between two or more time periods or conditions using parallel axes connected by slope lines
direction: both

components:
  - element: ranking-axes
    encodes: Vertical axes showing ordinal rank positions (1st, 2nd, 3rd, etc.)
    required: true
  - element: entity-positions
    encodes: Points marking each entity's rank on each axis
    required: true
  - element: connecting-lines
    encodes: Lines linking the same entity's positions across time periods
    required: true
  - element: entity-labels
    encodes: Names or identifiers for each ranked entity
    required: true
  - element: period-labels
    encodes: Time period or condition labels for each ranking axis
    required: true

parameters:
  number_of_periods: "2 or more"
  rank_direction: "1-at-top | 1-at-bottom"

related: []

warnings:
  - "Shows only relative position changes, not the magnitude of differences between ranks"
  - "With many entities, crossing lines can become difficult to follow"

extensions:
  harris_entry: "Ranking Chart"
  alternate_names: ["bump chart", "slope graph (for rankings)"]
  typical_use: "comparing competitive rankings over time, tracking relative performance changes"
---

## Description

A ranking chart is a variation of a comparative graph that displays how the rankings of several entities change between two or more time periods. The chart uses parallel vertical axes, one for each time period, with ranking positions marked along each axis. Lines connect the same entity's positions across time periods, making rank changes immediately visible through the slope of the connecting lines.

If there are no changes in rankings between periods, all connecting lines are horizontal. When an entity's ranking improves (moves to a higher position), its connecting line slopes upward; when ranking declines, the line slopes downward.

## Examples

> "For example, in 1990, five different models of cars might have been ranked based on fuel efficiency. In 1995, those same five models of cars might have been ranked again on the same feature. A ranking chart displays those two sets of rankings on two vertical axes with lines connecting the pairs of rankings for each model." (p. 326)

Harris shows five car models (A through E) with their fuel efficiency rankings in 1990 and 1995:
- Model A: improved from 4 to 1
- Model B: stayed at 2
- Model C: dropped from 3 to 4
- Model D: dropped from 1 to 5
- Model E: improved from 5 to 3

The crossing lines immediately reveal the dramatic reversal between Models A and D.

## Usage

Ranking charts are effective when:
- The ordinal position matters more than absolute values
- Comparing competitive standings across time
- Showing how relative performance has shifted
- Tracking changes in survey rankings, sports standings, or quality ratings

The format excels at showing "winners" and "losers" in terms of relative position change while abstracting away the underlying quantitative values that determined those rankings.

## Notes

This differs from ranking in general data display, where ranking simply means ordering data in ascending or descending sequence based on quantitative values. The ranking chart specifically visualizes changes in ordinal positions over time, not the values themselves.
