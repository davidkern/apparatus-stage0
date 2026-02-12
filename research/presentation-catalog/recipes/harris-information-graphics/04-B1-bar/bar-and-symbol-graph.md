---
name: Bar and Symbol Graph
slug: bar-and-symbol-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Bar and symbol graph, p. 47"

intent: Compare actual values (shown by bars) against reference or target values (shown by symbols) for each category
direction: both

components:
  - element: primary-bars
    encodes: Actual values (e.g., current performance, actual sales)
    required: true
  - element: reference-symbols
    encodes: Comparison values (e.g., budget, plan, last year, target)
    required: true
  - element: quantitative-scale
    encodes: Value axis (horizontal)
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true
  - element: legend
    encodes: Meaning of bars and symbols (if not self-evident)
    required: false

parameters:
  symbol_type: vertical-line | tick | diamond | other
  reference_sets: single | multiple
  comparison_type: budget | plan | prior-period | specification | target

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: bullet-graph
    relationship: variant-of

warnings:
  - "Multiple sets of symbols can clutter the graph"
  - "Seldom used with grouped or stacked bar graphs"
  - "Symbol meaning must be clear; use legend or labels"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "bar graph with reference markers"
    - "actual vs. target bar graph"
  typical_use: "performance dashboards comparing actual to budget, plan, or targets"
  reference_examples:
    - "budget"
    - "plan"
    - "last year's value"
    - "specification value"
    - "industry benchmark"
---

## Description

A bar and symbol graph adds reference markers to a bar graph, enabling viewers to compare actual values (bar ends) against comparison values (symbols). The symbols designate reference points such as budget, plan, prior period values, or specification targets.

## Examples

Harris illustrates two symbol styles (p. 47):

**Vertical line symbols:**
- Categories A-E on vertical axis
- Scale 0-6 on horizontal axis
- Bars show actual values
- Small vertical tick marks (▼) indicate reference values
- Viewer compares bar end position to symbol position

**Alternative symbol style:**
- Same layout
- Horizontal line segments with end caps (├─┤) as reference markers
- Slightly more visually prominent than tick marks

Both examples show symbols positioned at different points relative to bar ends—some bars exceed their reference, some fall short.

## Usage

**When to use:**
- Performance dashboards showing actual vs. target
- Budget variance analysis
- Comparing current values to historical benchmarks
- Quality control showing values vs. specifications

**Reference value types:**
- Budget or plan values
- Prior period (last year, last quarter)
- Specification or tolerance limits
- Industry averages or benchmarks

**Multiple reference sets:**
Multiple sets of symbols can indicate two or more reference values on the same graph—for example, both "budget" and "last year" on each bar. However, this adds complexity.

**Compatibility:**
- Works well with simple bar graphs (single data series)
- Seldom used with grouped bar graphs
- Seldom used with stacked bar graphs

**Symbol selection:**
Any symbol that crisply identifies the reference value can be used. Key requirement: the symbol must clearly mark a position on the scale without being confused with the bar itself.

## Notes

This technique is conceptually related to the "bullet graph" (a more recent innovation not in Harris), which integrates reference markers, qualitative ranges, and actual values into a compact display. The bar and symbol approach is the foundational technique.
