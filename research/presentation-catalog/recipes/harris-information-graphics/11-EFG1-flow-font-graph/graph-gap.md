---
name: Graph Gap Spacing
slug: graph-gap
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Gap, Graph, p. 163"

intent: Control spacing between bars, columns, and groups to optimize readability and visual grouping
direction: construction

components:
  - element: series-gap
    encodes: Space between columns within a group (inter-column space)
    required: false
  - element: cluster-gap
    encodes: Space between groups/clusters/categories (inter-group space)
    required: true
  - element: margin-gap
    encodes: Space between first/last columns and the frame
    required: false

parameters:
  gap_basis: "percent of column width | percent of cluster width | percent of cluster-plus-gap"
  overlap: "positive gap | zero gap | negative gap (overlap)"

related: []

warnings:
  - "Overlapping columns within clusters is sometimes done but should be used carefully"
  - "Gap percentages mean different things depending on what they are based on"

extensions:
  harris_entry: "Gap, Graph"
  applies_to: ["column graph", "bar graph"]
  component_entry: true
---

## Description

The term gap is applied to the spaces between bars and columns or groups of bars and columns. The term is applicable to both two- and three-dimensional graphs.

## Types of Gaps

Harris identifies three types of gaps (p. 163):

1. **Series gaps (inter-column spaces)**: Spaces between columns within a group. When columns overlap, they are said to have negative gaps or negative inter-column spaces.

2. **Cluster gaps (category gaps, inter-group spaces)**: Spaces between groups/clusters/categories.

3. **Margin gaps (column margins)**: Spaces between the first and last columns and the frame.

## Specifying Gap Sizes

Sizes of gaps are generally specified in percents. The basis for the percentage varies:

### Single Data Series

When there is a single data series, percents might be based on column width or the combination of space and column width.

Harris shows the same simple column graph with varying gap widths (p. 163):
- No gap (0%)
- 50% gap
- 100% gap (gap equals column width)
- 200% gap

### Multiple Data Series

When there are multiple data series, the space between clusters might be based on:

1. **Percent of column width**: A gap equal to one column width is described as 100%

2. **Percent of cluster width**: A gap equal to the width of one column of a two-column cluster is described as 50%

3. **Percent of cluster-plus-gap distance**: A gap equal to the width of one column of a two-column cluster is described as 33%

## Overlapping Columns

Overlapping of bars or columns is specified in terms of percent of column or bar width. The overlapping is sometimes referred to as negative gap but still in terms of column width.

Harris shows examples (p. 163):
- 0% overlap: No positive or negative gap between columns within clusters
- 33% overlap: 33% negative gap between columns
- 66% overlap: 66% negative gap between columns
- 33% positive gap: Space between columns (generally not done within clusters)

## Examples

> "Spaces between the columns within a group are sometimes called series gaps or inter-column spaces. When columns overlap, they are said to have negative gaps or negative inter-column spaces." (p. 163)

The visual examples on page 163 demonstrate how the same data appears with different gap settings, showing the visual impact of gap choices on chart readability and appearance.

## Usage

Gap settings affect:
- **Visual grouping**: Larger cluster gaps emphasize category distinctions
- **Comparison ease**: Overlapping or adjacent columns within clusters facilitate direct comparison
- **Chart density**: Smaller gaps allow more data in less space
- **Aesthetic balance**: Gap proportions affect overall chart appearance

The same terminology applies to bar graphs, except "column" is replaced by "bar."
