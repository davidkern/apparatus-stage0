---
name: Dendrogram
slug: dendrogram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Dendrogram, pp. 133-134"

intent: Organize information to establish groupings and categorize individual elements by visualizing similarity relationships as a hierarchical tree structure
direction: both

components:
  - element: objects
    encodes: Individual elements being categorized, shown along one axis
    required: true
  - element: stems
    encodes: Lines leading from objects toward linkages
    required: true
  - element: linkages
    encodes: Horizontal connections joining objects or subclusters at specific similarity levels
    required: true
  - element: similarity-scale
    encodes: Axis showing numeric values proportional to similarity between joined elements
    required: true
  - element: clusters
    encodes: Groups of objects connected within the hierarchy
    required: false

parameters:
  orientation: horizontal | vertical
  linkage_method: single | complete | average | other

related: []  # TBD: see also tree-diagram, cluster-analysis

warnings:
  - "Different linkage methods can produce different groupings from the same data"
  - "The value at which linkages occur indicates similarity, not absolute distance"
  - "Interpretation requires domain knowledge to determine meaningful cluster boundaries"

extensions:
  harris_entry: "Dendrogram"
  alternate_names: ["tree diagram", "linkage tree", "cluster map"]
  typical_use: "market research, archaeology, biology, any field requiring grouping of objects by similarity"
---

## Description

A dendrogram is a graphical means of organizing information to establish groupings and/or categorize individual elements (often referred to as objects or single member clusters). The technique reveals natural groupings by connecting items based on their similarity.

Applications include studying how different consumer groups perceive a product, looking for meaningful groupings in archaeological specimens, or any analysis where identifying natural categories from similarity data is valuable.

## Examples

**Construction Process** (p. 133)
> "In constructing a dendrogram, the data regarding each individual object is first organized into a matrix. From this matrix and a series of calculations, numeric values are established that are proportional to the similarities between the objects and/or groups of objects."

> "After the numbers are calculated, the stems (the lines leading from the objects) of the two or more objects with the greatest similarity are connected (fused or linked) forming a subcluster. Next the objects and/or subclusters with the second greatest similarity are connected. This process is continued until all objects are connected into a single cluster."

**Interpreting Similarity** (p. 134)
> "The value at which a linkage crosses from one element or subgroup to another is generally proportional to the degree of similarity between the elements or subgroups."

From Harris's example with objects A through P:
> "From the example shown, one might conclude that objects M, B, and E have the greatest similarity. Objects O, K, and L have the next largest similarity, etc."

**Identifying Major Categories** (pp. 133-134)
> "After the dendrogram is complete, overall groupings or families of elements sometimes stand out. In the example, there are two major clusters or categories that the objects fall into - one above the horizontal dashed line and one below."

**Terminology** (p. 133)
- Objects are sometimes called "single member clusters"
- Stems are "the lines leading from the objects"
- Linkages or fusions are the connections between objects/subclusters
- The completed diagram is "a hierarchy of clusters"

## Usage

**Construction steps:**
1. Organize data about each object into a matrix
2. Calculate similarity values between all pairs of objects
3. Identify the pair with greatest similarity and connect them (first linkage)
4. Recalculate similarities treating the new subcluster as a unit
5. Connect the next most similar pair (objects or subclusters)
6. Repeat until all objects are connected into a single cluster

**Reading the dendrogram:**
- Objects along one axis represent items being categorized
- The perpendicular axis shows similarity scale
- Shorter linkages (closer to objects) indicate greater similarity
- Longer linkages indicate less similarity
- Natural clusters often appear as groups joined at short distances with longer links to other groups

**Display orientation:**
Harris shows objects listed vertically with the similarity scale running horizontally, but notes the axes "may be the vertical or horizontal axis."

## Notes

> "There are several methods used to quantify the degree of similarity between the various elements as well as how the linkages are drawn between the elements and clusters."

Dendrograms are one facet of the broader subject of cluster analysis. The specific linkage method (how similarity between clusters is calculated) affects the resulting groupings. Common methods include single linkage (nearest neighbor), complete linkage (furthest neighbor), and average linkage.

The choice of where to "cut" the dendrogram to define clusters requires judgment. Harris's example shows a horizontal dashed line separating two major categories, but this boundary is an interpretation rather than something automatically determined by the algorithm.
