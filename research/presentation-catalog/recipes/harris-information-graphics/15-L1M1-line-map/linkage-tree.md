---
name: Linkage Tree
slug: linkage-tree
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Linkage Tree, p. 220"

intent: Organize information visually to establish groupings and categorize elements based on similarity
direction: both

components:
  - element: items-axis
    encodes: Individual elements being analyzed
    required: true
  - element: similarity-axis
    encodes: Degree of similarity between objects and clusters
    required: true
  - element: branching-structure
    encodes: Hierarchical relationships and cluster membership
    required: true
  - element: connection-points
    encodes: Values at which items/clusters merge
    required: true

parameters:
  orientation: "horizontal | vertical"

related: []  # TBD: see also dendrogram

warnings:
  - "The similarity measure used affects the resulting tree structure"
  - "Different clustering methods can produce different groupings from the same data"

extensions:
  harris_entry: "Linkage Tree"
  alternate_names: ["tree diagram", "cluster map", "dendrogram"]
  typical_use: "consumer perception studies, taxonomic classification, archeological specimen analysis"
---

## Description

A linkage tree is a graphical means of organizing information for the purpose of establishing groupings and/or categorizing individual elements. The tree structure shows which items are most similar to each other and how they cluster into larger groups.

One axis lists the items being analyzed. The other axis shows values proportional to the degree of similarity between objects and clusters. Items and clusters that merge (connect) at lower similarity values are more similar to each other.

## Examples

**Structure illustration** (p. 220):
The diagram shows items labeled A through P arranged vertically on one axis, with horizontal distance representing "values proportional to the degree of similarity between objects and clusters."

Items that are most similar connect first (at small distances from the left), forming initial clusters. These clusters then connect with other items or clusters at progressively larger distances, ultimately joining into a single group.

The rightmost connections indicate "Major category" groupings.

**Applications mentioned** (p. 220):
> "For example, one might study different groups of consumers to determine how they perceive a product, or a linkage tree might be used to look for relationships in a group of archeological specimens."

## Usage

Use linkage trees when:
- You need to identify natural groupings within a set of items
- Understanding hierarchical relationships between items matters
- Visualizing the output of cluster analysis
- Exploring how items relate based on multiple characteristics

Reading the tree:
- Items connecting at short distances are most similar
- The height/length where clusters merge indicates their degree of similarity
- Major branches represent major category distinctions

## Notes

Harris cross-references the Dendrogram entry, noting that "linkage tree" and "dendrogram" are often used interchangeably. This visualization is fundamental to hierarchical cluster analysis in statistics and is widely used in biology (phylogenetics), marketing (consumer segmentation), and many other fields.
