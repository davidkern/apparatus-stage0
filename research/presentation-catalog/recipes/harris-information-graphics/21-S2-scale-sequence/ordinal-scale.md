---
name: Ordinal Scale
slug: ordinal-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Ordinal scale, p. 337"

intent: Configure an axis displaying ranked positions without indicating the magnitude of differences between ranks
direction: both

components:
  - element: rank-labels
    encodes: Non-quantitative ranking terms (first, second, third; or small, medium, large)
    required: true
  - element: tick-marks
    encodes: Division points for each rank position
    required: true
  - element: axis-line
    encodes: Reference line along which ranks are arranged
    required: true

parameters:
  ranking_terms: "list of ordinal labels in sequence"
  direction: "ascending | descending (e.g., lowest to highest or vice versa)"

related: []  # TBD: time-series-scale, order-of-occurrence-scale, category-scale

warnings:
  - "Equal physical distances do not indicate equal differences between ranks"
  - "Ordinal labels rank information but do not quantify differences"
  - "Viewers may incorrectly assume equal intervals between ordinal positions"

extensions:
  harris_entry: "Scale"
  typical_use: "displaying ranked data, satisfaction scales, size classifications"
  scale_property: "equal physical distances, unequal or unknown actual differences"
---

## Description

An ordinal scale displays ranked information in non-quantitative terms such as small, medium, large; first, second, third; or lowest position, second lowest position, highest position. Ordinal labels appear on the scale in the same sequence as they occur in the ranking process.

The key characteristic of an ordinal scale is that while it indicates relative ordering (one thing is larger or better than another), it does not indicate how much larger or better. The physical distances between entries are equal, but there is no indication of how great the actual differences are between entries or whether the differences are equal.

## Examples

> "Ordinal designations rank information in nonquantitative terms such as small, medium, large; first, second, third; lowest position, second lowest position; etc. Ordinal labels appear on the scale in the same sequence as they occur in the ranking process." (p. 337)

The PDF illustrates an ordinal scale with labels: "Fourth highest position | Third highest position | Second highest position | Highest position." Below: "Equal physical distances but no indication of how great the differences are between entries or whether or not the differences are equal."

## Usage

Ordinal scales are appropriate when:
- Displaying ranked competition results (1st place, 2nd place, 3rd place)
- Showing size categories (small, medium, large, extra-large)
- Survey response scales (strongly disagree, disagree, neutral, agree, strongly agree)
- Any data where relative order matters but precise differences do not

Ordinal scales should not be used when:
- Quantitative differences between ranks are important
- Mathematical operations on the data are required
- Viewers need to understand the magnitude of differences

## Notes

Ordinal scales are distinguished from category scales in that ordinal labels have an inherent sequence that cannot be reordered without losing meaning. They are distinguished from quantitative scales in that the differences between positions are not necessarily equal or measurable. First place might be far ahead of second place, or barely ahead, but the ordinal scale shows only the ranking, not the margin.
