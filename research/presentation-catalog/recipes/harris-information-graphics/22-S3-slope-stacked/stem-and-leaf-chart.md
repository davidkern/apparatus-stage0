---
name: Stem and Leaf Chart
slug: stem-and-leaf-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Stem and Leaf Chart, pp. 369-370"

intent: Display data distribution while preserving individual data values through a digit-based visual representation
direction: both

components:
  - element: stem
    encodes: Common leading digit(s) of grouped values
    required: true
  - element: leaves
    encodes: Trailing digit(s) of individual values
    required: true
  - element: vertical-divider
    encodes: Separation between stems and leaves
    required: true
  - element: row-arrangement
    encodes: Distribution shape (similar to histogram)
    required: true

parameters:
  digit_split: "first digit | first two digits | custom"
  leaf_ordering: "unordered | ascending"
  orientation: "standard | back-to-back (for comparison)"

related: []  # TBD: histogram, dot-array, frequency-distribution

warnings:
  - "Hand-written charts may have uneven digit widths creating misleading visual impressions"
  - "Overlapping leaf values can obscure data density"
  - "Less familiar to general audiences than histograms"

extensions:
  harris_entry: "Stem and Leaf Chart"
  advantages:
    - "Retains identity of each data value (unlike histogram)"
    - "Reduces number of digits to write (unlike raw data listing)"
  variations:
    - "back-to-back (comparing two data sets)"
    - "multiple stems per first digit (for narrow ranges)"
    - "class interval stems (for sparse or spread data)"
---

## Description

A stem and leaf chart displays data distribution in a format similar to a histogram, but with the crucial difference that individual data values remain visible. The chart splits each data value into a "stem" (the leading digit or digits) placed on the left of a vertical line, and "leaves" (the trailing digits) placed on the right.

Harris explains: "The common first or leading digit (referred to as stem) of a group of numbers is placed on the left side of the line. The other digits (referred to as leaves or trailing digits) are placed on the right of the vertical line."

## Examples

From the illustration on p. 369, Harris shows a basic stem and leaf chart:

```
1 | 5614
2 | 23658745621472
3 | 2365480024586264  <- Mode (highest frequency)
4 | 565874
5 | 537
6 |                   <- Gap in data
7 |
8 | 05
9 | 3
10|
11|                   <- Unusual data point
12| 2
```

Key observations visible from this display:
- The spread of data (from teens to 120s)
- The mode location (30s have most values)
- Skewness direction (tail extends toward higher values)
- A gap in the data (60s and 70s empty)
- An unusual data point (122)

Harris demonstrates the construction: "with the numbers 41, 43, 46, and 47, the common first or leading digit, four, is placed on the left of the line and the remaining digits 1, 3, 6 and 7 are placed side-by-side on the right."

## Usage

Stem and leaf charts are most effective when:
- Both distribution shape AND individual values matter
- Data sets are moderate in size (20-100 values)
- Quick manual construction is needed
- Teaching statistical concepts about distributions
- Exploratory data analysis where retaining values aids interpretation

Less effective when:
- Data sets are very large (leaves become unwieldy)
- Audience is unfamiliar with the convention
- Only distribution shape matters (histogram is clearer)
- Values have many significant digits

**Variations for special cases:**
- **Few first digits**: Use multiple stems per digit (e.g., 6(0-4) and 6(5-9))
- **Single first digit**: Use ten stems, one per second digit
- **Three+ digit values**: Enter last two digits as leaves, separated by commas
- **Wide spread/sparse data**: Combine first digits into class interval stems

## Notes

Harris provides extensive comparison with other distribution display methods (p. 370), showing the same data as raw values, stem and leaf chart, and dot array. The key advantage is that "the identity of each number is retained in the stem and leaf chart" while still showing distribution shape. Back-to-back stem and leaf charts enable direct comparison of two data sets, similar to paired bar graphs.
