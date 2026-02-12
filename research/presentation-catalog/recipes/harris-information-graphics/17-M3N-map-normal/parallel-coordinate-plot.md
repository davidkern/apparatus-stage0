---
name: Parallel Coordinate Plot
slug: parallel-coordinate-plot
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Parallel Coordinate Plot, p. 266"

intent: Compare multiple entities across multiple characteristics by plotting each entity as a line connecting its values on parallel vertical axes
direction: both

components:
  - element: parallel-axes
    encodes: Multiple vertical axes, one per characteristic being compared
    required: true
  - element: entity-lines
    encodes: Lines connecting each entity's values across all axes
    required: true
  - element: axis-labels
    encodes: Names of characteristics being compared
    required: true

parameters:
  entity_count: 2 | 3 | 4+
  characteristic_count: 2 | 3 | 4+

related:
  - slug: profile-graph
    relationship: variant-of
  - slug: comparative-graph
    relationship: variant-of

extensions:
  harris_entry: "Parallel Coordinate Plot"
  alternate_names:
    - "profile graph"
  typical_use: "comparing strategies, characteristics, or profiles across multiple entities"
  interpretation_note: "entities with similar profiles will have approximately parallel curves"
---

## Description

A parallel coordinate graph is a variation of a comparative graph that compares multiple entities and characteristics at a given time. Each characteristic has its own vertical axis, and entities are represented as lines connecting their values across all axes.

Entities having similar profiles will have approximately parallel curves.

## Examples

Harris illustrates (p. 266) a parallel coordinate plot comparing investment strategies of five mutual funds:

- Four types of investments on horizontal axis: Cash, Government securities, Bonds, Stocks
- Percent of mutual fund invested on vertical axis (0-70%)
- Five mutual funds (A through E) shown as lines
- Funds C and D have approximately parallel curves, indicating similar investment strategies

> "Those funds having similar strategies will have approximately parallel curves, similar to funds C and D on the graph at the right."

## Usage

**When to use:**
- To compare multiple entities across multiple characteristics
- To identify entities with similar profiles (parallel lines)
- To spot outliers or entities with unusual characteristic combinations

**Interpretation:**
- Parallel or nearly parallel lines indicate similar profiles
- Crossing lines indicate divergent characteristics
- Steep slopes indicate large differences between adjacent characteristics

**Example applications:**
- Comparing investment strategies of mutual funds
- Comparing product specifications
- Comparing demographic profiles of regions

## Notes

The parallel coordinate plot excels at revealing patterns of similarity and difference across multiple dimensions simultaneously. The visual pattern of parallel vs. crossing lines makes similarity immediately apparent.
