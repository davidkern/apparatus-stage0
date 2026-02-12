---
name: Half-Bidirectional Table
slug: half-bidirectional-table
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Half-Bidirectional Table, p. 186"

intent: Eliminate redundant symmetric information from a matrix by showing only one triangle of the full bidirectional table
direction: both

components:
  - element: triangular-matrix
    encodes: Unique pairwise relationships (non-redundant half)
    required: true
  - element: diagonal-headings
    encodes: Labels that apply to both rows and columns
    required: true
  - element: cells
    encodes: Values for each unique pair
    required: true

parameters:
  triangle_shown: "upper | lower"

related: []  # TBD: bidirectional-table, matrix

warnings:
  - "Only appropriate when the matrix is symmetric (value A-to-B equals B-to-A)"

extensions:
  harris_entry: "Half-Bidirectional Table"
  alternate_names: ["half-matrix"]
  typical_use: "distance tables, correlation matrices, similarity/difference matrices"
---

## Description

In certain bidirectional tables (matrices), information is duplicated due to the symmetric nature of the relationships. For example, the distance from City A to City B is the same as from City B to City A. A half-bidirectional table eliminates this redundancy by showing only one triangular half of the full matrix, reducing space requirements and making the table easier to read.

## Examples

Harris illustrates the transformation (p. 186):

> "In certain matrixes, particularly bidirectional tables, information is occasionally duplicated as a result of the type and arrangement of headings. In order to minimize the space required for the table or to make the table easier to read, the duplicated information is sometimes eliminated. When this is done the result is called a half-bidirectional table or half-matrix."

The example shows a 9x9 city distance matrix where the full table has a grayed area containing duplicates. The half-matrix version shows only the upper triangle with diagonal headings that serve both row and column purposes.

Harris notes that the diagonal headings "apply to both rows and columns."

## Usage

Half-bidirectional tables are appropriate when:
- The relationship is symmetric (order does not matter)
- Space efficiency is important
- The full matrix would have redundant cells

Common applications include:
- City-to-city distance tables
- Correlation matrices
- Similarity or dissimilarity matrices
- Tournament results where A vs B equals B vs A

## Notes

The diagonal heading arrangement requires careful design to ensure readability. The angled headers in Harris example allow the row/column dual function to be clear while fitting in a compact space.
