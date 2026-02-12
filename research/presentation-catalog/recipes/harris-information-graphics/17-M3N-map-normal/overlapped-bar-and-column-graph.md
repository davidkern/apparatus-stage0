---
name: Overlapped Bar and Column Graph
slug: overlapped-bar-and-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Overlapped Bar Graph and Overlapped Column Graphs, p. 265"

intent: Make grouped bar and column graphs easier to read by shifting data series so that bars partially hide behind one another
direction: construction

components:
  - element: bar-or-column-groups
    encodes: Grouped rectangles representing multiple data series per category
    required: true
  - element: overlap-offset
    encodes: Amount successive series are shifted behind preceding series
    required: true
  - element: visible-portions
    encodes: Parts of each bar/column that remain visible for value reading
    required: true

parameters:
  overlap_percent: 0% | 25% | 50% | 75% | 100%
  orientation: horizontal-bar | vertical-column

related:
  - slug: grouped-bar-graph
    relationship: variant-of
  - slug: grouped-column-graph
    relationship: variant-of
  - slug: stacked-bar-graph
    relationship: contrasts

warnings:
  - "Care should be taken as the limit of 100% overlap is approached, since the graph can easily be mistaken for a stacked bar or column graph"
  - "Position shortest bars in front to avoid completely hiding longer bars"

extensions:
  harris_entry: "Overlapped Bar Graph and Overlapped Column Graphs"
  typical_use: "improving readability of grouped bar/column graphs"
  design_notes:
    overlap_range: "can range from barely to completely overlapped (100%)"
    bar_order: "position shortest bars in front"
    confusion_risk: "high overlap can be mistaken for stacked graphs"
---

## Description

In order to make grouped bar and column graphs easier to read, the rectangles are sometimes overlapped. In this process the rectangles representing complete data series are shifted such that the rectangles of each successive data series are partially hidden by the rectangles in front of them.

They may be shifted by any amount, ranging from barely to completely overlapped (100%).

## Examples

Harris illustrates (p. 265):

**Overlapped bar graph:**
- Three data series (A, B, C) with bars overlapping horizontally
- Values 0-100 on horizontal axis
- Categories on vertical axis

**Overlapped column graph:**
- Three data series (A, B, C) with columns overlapping
- Years '95-'91 on horizontal axis (reversed)
- Values 0-8 on vertical axis

## Usage

**When to use:**
- When grouped graphs have many data series and become difficult to read
- When reducing visual clutter improves comprehension
- When space is limited but comparison across series is needed

**Design considerations:**
- Overlap amount is variable; choose based on number of series and readability
- Position shortest bars/columns in front so longer ones remain visible
- Avoid 100% overlap unless clearly labeled, as it resembles stacked graphs

**Caution at high overlap:**
Care should be taken as the limit of 100% overlap is approached, since the graph can easily be mistaken for a stacked bar or column graph.

## Notes

See Bar Graph and Column Graph for basic construction. The overlapped variation is a readability improvement for grouped versions of these fundamental graph types.
