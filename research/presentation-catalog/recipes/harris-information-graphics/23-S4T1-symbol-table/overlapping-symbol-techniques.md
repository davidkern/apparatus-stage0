---
name: Overlapping Symbol Techniques
slug: overlapping-symbol-techniques
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, Overlapping plotting symbols, p. 384"

intent: Make hidden or overlapping data points visible in point and scatter graphs without misrepresenting their actual positions
direction: construction

components:
  - element: data-points
    encodes: Values at specific coordinates
    required: true
  - element: displacement-method
    encodes: How overlapping symbols are separated for visibility
    required: true
  - element: explanatory-note
    encodes: Information about the technique used (for unfamiliar viewers)
    required: false
  - element: legend
    encodes: Symbol meanings for techniques using varied symbols
    required: false

parameters:
  technique: stacking | distributing | jittering | unfilled | graduated | sunflower
  overlap_type: complete | partial | both

related: []  # TBD: see plotting-symbol

warnings:
  - "The spreading out of symbols does not imply an additional axis; symbols are spread for visibility only"
  - "Keep symbols as close together as practical to minimize misunderstanding and maintain accuracy"
  - "Include explanatory note if viewer may be unfamiliar with the technique"

extensions:
  harris_entry: "Symbol"
  typical_use: "Scatter plots, point graphs with dense data"
---

## Description

Hidden data points due to overlapping symbols can present a major problem when analyzing point and scatter graphs. Harris presents six methods for addressing this problem, each with different strengths for handling completely overlapped symbols versus partially overlapped symbols.

The techniques range from spatial displacement (stacking, distributing, jittering) to visual modifications (unfilled circles, graduated circles, sunflower symbols).

## Examples

Harris illustrates all techniques using a single-axis graph with 20 data points, showing specific overlap problems:
- 2 points completely overlapped
- 3 points completely overlapped
- 5 points completely overlapped
- 3 points partially overlapped
- 2 points partially overlapped

**Stacking** (p. 384):
> "In this technique overlapping symbols are stacked on top of one another on one side of their actual location. This method makes the completely overlapped symbols visible."

**Distributing** (p. 384):
> "In this technique the symbols are distributed equally on two sides of their actual location. This technique is similar to the stacking method. However, in this method the data points at the ends of the stacks are closer to their original location."

**Jittering** (p. 384):
> "With jittering, all data points are randomly shifted by a slight amount in the vertical direction for horizontal plots and in the horizontal direction for vertical plots. The distance points are shifted may be determined visually or mathematically. This method gives visibility to both the completely and partially overlapping symbols."

**Unfilled circles** (p. 384):
> "When solid dots are replaced by unfilled circles it gives some increased visibility to the partially overlapping symbols but does not improve the visibility of the completely overlapped symbols."

**Graduated unfilled circles** (p. 384):
> "Graduated unfilled circles provides a partial solution to both the total and partially overlapping problems. With this technique a legend is generally required."

**Sunflower symbols** (p. 384):
> "In this method the number of lines radiating from a data point corresponds to the number of overlapping data points, thus solving the completely overlapping problem, but not the partially overlapping situation."

## Usage

**Technique selection by overlap type:**

| Technique | Complete Overlap | Partial Overlap |
|-----------|------------------|-----------------|
| Stacking | Solves | Variation possible |
| Distributing | Solves | Variation possible |
| Jittering | Solves | Solves |
| Unfilled circles | Does not solve | Partially solves |
| Graduated circles | Partially solves | Partially solves |
| Sunflower | Solves | Does not solve |

**Important guidelines** (p. 384):
> "The spreading out of the symbols in the stacking, distributing, and jittering methods does not imply an additional axis. The symbols are simply spread out for improved visibility. To minimize misunderstanding and keep the graph as accurate as possible, the symbols are kept as close together as practical."

**Communication considerations:**
> "If the viewer is not familiar with the technique, a note is sometimes included explaining what has been done."

**Applicability:**
- Dots and circles used in illustrations, but most techniques work with other symbol types
- Single-axis examples shown, but all methods work equally well with two-axis graphs

## Notes

Jittering is the most versatile technique, addressing both complete and partial overlap. However, it introduces random displacement that may concern precision-focused audiences.

Sunflower symbols offer an elegant solution for complete overlap by encoding count directly into the symbol design, though they require a legend explaining the radiating line convention.

For graduated unfilled circles, the size progression (smallest = 1 point, larger = more points) requires careful legend design to ensure accurate decoding.
