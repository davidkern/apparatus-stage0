---
name: Column and Symbol Graph
slug: column-and-symbol-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Column and symbol graph, p. 92"

intent: Compare column values against reference points using symbols overlaid on the graph
direction: both

components:
  - element: data-columns
    encodes: Actual values via column height
    required: true
  - element: reference-symbols
    encodes: Budget, plan, prior year, or specification values
    required: true
  - element: quantitative-scale
    encodes: Numeric values on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true
  - element: symbol-legend
    encodes: What the symbols represent
    required: true

parameters:
  symbol_position: "alongside column | across column"
  symbol_count: "one set | multiple sets"
  symbol_type: "any crisp reference marker"

related:
  - slug: simple-column-graph
    relationship: variant-of
  - slug: combination-graph
    relationship: variant-of

warnings:
  - "Typically used with simple column graphs; seldom applied to grouped or stacked types"
  - "Multiple symbol sets can become cluttered"
  - "Symbol meaning must be clearly explained"

extensions:
  harris_entry: "Column Graph"
  alternate_names: []
  typical_use: "comparing actual vs. budget, tracking against targets, showing variance from specifications"
---

## Description

A column and symbol graph shows a series of symbols on column graphs to designate reference points or points of comparison for each column. The reference points might designate such things as budget, plan, last year's value, or specification value.

Using the symbols, the viewer can easily compare the actual value (shown by column top) with some other recognized measure. This creates an immediate visual indication of whether performance meets, exceeds, or falls short of the reference.

## Examples

> "Sometimes a series of symbols are shown on column graphs to designate reference points or points of comparison for each of the columns. The reference points might designate such things as budget, plan, last year's value, specification value, etc." (p. 92)

Harris shows two examples:
1. Triangular symbols positioned alongside columns
2. Horizontal line markers across columns

Key points:
- Any symbol that crisply identifies the reference value can be used
- Symbol can be alongside or across the column
- Multiple sets of symbols can be used on the same graph

> "Column and symbol graphs typically have only one data series represented by vertical rectangles. The technique is seldom applied to grouped or stacked type graphs." (p. 92)

## Usage

Symbol options:
- Triangles or arrows pointing at reference level
- Horizontal lines across or beside columns
- Dots or markers at reference heights
- Custom symbols relevant to the data

Design considerations:
- Choose symbols that are clearly distinct from column edges
- Position consistently (always alongside or always across)
- Include clear legend explaining symbol meaning
- Consider color coding to distinguish multiple reference types

When to use:
- Budget vs. actual comparisons
- Performance vs. targets
- Current vs. prior period
- Actual vs. specification

Limitations:
- Works best with simple column graphs
- Multiple reference series can become cluttered
- Not typically combined with grouped or stacked variations

## Notes

This technique creates a visual "at a glance" comparison capability. Viewers can quickly scan the graph to see which columns exceed their reference (symbol below column top) versus which fall short (symbol above column top).
