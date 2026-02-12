---
name: Grouped Column Graph
slug: grouped-column-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Column Graph, Grouped column graph, pp. 81-82"

intent: Compare multiple data series side-by-side at each category or time interval
direction: both

components:
  - element: column-clusters
    encodes: Groups of columns representing multiple data series at each interval
    required: true
  - element: differentiated-columns
    encodes: Each data series via distinct color, shade, or pattern
    required: true
  - element: legend
    encodes: Mapping of colors/patterns to data series
    required: true
  - element: quantitative-scale
    encodes: Numeric values on vertical axis
    required: true
  - element: category-or-sequence-scale
    encodes: Categories or time periods on horizontal axis
    required: true
  - element: inter-group-space
    encodes: Visual separation between clusters
    required: true
  - element: inter-column-space
    encodes: Space between columns within a cluster (typically zero)
    required: false

parameters:
  data_series_count: "2 to 4 recommended; more becomes confusing"
  column_width: "uniform within graph"
  inter_group_spacing: "any width, uniform throughout"
  inter_column_spacing: "zero | small gap | negative (overlapping)"
  values: "positive | negative | both"

related:
  - slug: grouped-bar-graph
    relationship: variant-of
  - slug: simple-column-graph
    relationship: variant-of
  - slug: overlapped-column-graph
    relationship: variant-of

warnings:
  - "If the number of data series goes above three or four, the graph can become confusing"
  - "Negative values with overlapping columns yields what appear to be columns of unequal widths, which can be distracting"
  - "Three-dimensional variations are often of little help when comparing multiple data series with negative values"

extensions:
  harris_entry: "Column Graph"
  alternate_names: ["clustered column graph", "multiple column graph", "side-by-side column graph"]
  typical_use: "comparing multiple items at various points in time, showing relationships between multiple items over time, looking for correlations between data series"
  scale_types:
    vertical: "quantitative (linear)"
    horizontal: "category or sequence"
---

## Description

A grouped column graph plots two or more data series side-by-side on the same graph. Each data element of each data series is represented by a separate column. The columns from each data series that correspond to the same interval on the horizontal axis are placed side-by-side to form a group or cluster.

Grouped column graphs enable the user to:
- Compare multiple items at various points in time
- Show how relationships between multiple items change with time
- Look for correlations or meaningful relationships between multiple data series
- Condense onto one graph what otherwise would require multiple graphs

## Examples

> "With this type of graph, each data element of each data series is represented by a separate column. The data series are differentiated from one another by assigning a different color, shade, or pattern to each data series." (p. 81)

Harris illustrates a grouped column graph comparing three organizations' membership from 1991-1995, with columns for Organization A, B, and C clustered at each year.

> "Technically there is no limit as to the number of data series that can be plotted on a single graph. Practically, if the number goes above three or four, the graph can become confusing." (p. 81)

## Usage

Design specifications:
- **Column width**: Can be any width; generally uniform throughout the graph
- **Inter-column space**: Typically no space between columns in a group/cluster; if present, it is small. Overlapping results in negative inter-column spacing.
- **Inter-group space**: Space between groups can be any width; generally uniform throughout
- **Column margin**: Space is generally provided between columns and the frame, except in histograms
- **Tick marks**: May or may not be used on the horizontal axis

When displaying both positive and negative values:
- Vertical grid lines sometimes help visually separate groups when negative values are present
- Negative values with overlapping columns create apparent unequal widths, which can distract
- Three-dimensional variations are often unhelpful for comparing multiple data series with negative values

## Notes

Grouped column graphs can be extended with three-dimensional rendering, introducing a third axis along which data series are distributed. This adds depth but can sacrifice accuracy in decoding values. The depth of columns can vary from almost none to the point where columns touch one another.
