---
name: Table Format
slug: table-format
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Table, Table format, pp. 389-391"

intent: Choose appropriate table structure (one-way, two-way, multiway, or bidirectional) based on number of variables and analysis needs
direction: construction

components:
  - element: variable-axes
    encodes: Distribution of variables between rows, columns, and body
    required: true
  - element: data-values
    encodes: Information in table body cells
    required: true
  - element: heading-structure
    encodes: Organization of row and column labels
    required: true

parameters:
  format: one-way | two-way | multiway | bidirectional
  variable_count: 2 | 3 | 4+
  bidirectional_type: full | one-half

related: []  # TBD: see table

warnings:
  - "One-way format makes it much harder to analyze data than two-way format"
  - "As the number of variables increases in multiway tables, it becomes more difficult to spot trends and relationships"
  - "Three-dimensional tables are difficult to construct and interpret"

extensions:
  harris_entry: "Table"
  typical_use: "Choosing table structure for data presentation"
---

## Description

How a table is formatted depends on the type of data, amount of data, number of variables, purpose of the table, and how it will be used. Harris identifies four primary table formats, each suited to different analytical needs.

The key insight is that the same data can be arranged in different formats, with dramatic effects on how easily patterns can be spotted.

## Examples

**One-way table** (p. 389):
> "A one-way table is a table displaying two or more variables (sets of data) along the same axis which might be either the horizontal or vertical. The vertical axis is most frequently used and the resulting table is sometimes referred to as the list or vertical format."

Example structure:
```
Year  Product  Value
1990  A        2
1990  B        10
1990  C        8
...
```

**Two-way table** (p. 389):
> "A table displaying three variables, one along each of the two axes and the third in the body of the table."

Same data reorganized:
```
        1990  1991  1992
Product A  2     4     6
Product B  10   12    17
Product C  8     7     6
Product D  22   29    20
```

Harris notes: "A comparison of the two formats indicates how much easier it is to analyze data in the two-way format than in the one-way."

**Multiway table** (p. 389):
> "A table displaying four or more variables distributed between the two axes and the body of the table."

Two approaches:
1. Additional columns/rows for each variable over three
2. Series of two-way tables (one for each value of additional variable)

> "In this way, large numbers of variables can be displayed. As the number of variables increases, however, it becomes more and more difficult to spot trends and relationships within the data."

**Bidirectional table (matrix)** (p. 390):
> "When the same headings are used for both the rows and columns, the table is referred to as matrix or bidirectional table. Such tables are frequently used to indicate distances between locations."

- **Full bidirectional**: Data repeated in upper and lower triangles (may use different units, e.g., miles and kilometers)
- **One-half bidirectional**: Duplicate values eliminated, showing only one triangle

## Additional Format Variations

**Frequency and percent tables** (p. 390):
- Frequency tables show counts of occurrences
- Percent tables show proportions
- Three percent types: row percentages, column percentages, total percentages
- Marginal values/distributions shown in table margins

**Irregularly shaped tables** (p. 390):
> "There are no restrictions as to the shape of a table, although most are rectangular. Irregularly shaped tables can sometimes be helpful in highlighting relationships that might otherwise be difficult to spot."

**Three-dimensional tables** (p. 391):
> "Although three-dimensional tables can be constructed, they are not widely used, primarily because they are difficult to construct and interpret. Three-dimension tables are sometimes used for their aesthetic value."

**Doubling up long tables** (p. 391):
> "When tables become too long for easy analysis or to fit in the space available, they are sometimes divided into two or more smaller tables and placed above or beside one another."

**Multiple values in cells** (p. 391):
> "In most tables a single piece of information is included in each cell. There is; however, no limitation on the amount of data that can be included in a given cell and in some cases multiple entries per cell can be extremely useful."

Example: Showing totals with breakdowns (e.g., "320 total: 287 Full-time, 33 Part-time")

## Usage

**Format selection guidance:**

| Variables | Recommended Format | Notes |
|-----------|-------------------|-------|
| 2 | One-way (list) | Simple listing |
| 3 | Two-way | Third variable in body |
| 4+ | Multiway | Consider series of two-ways |
| Same row/column headings | Bidirectional | Use one-half if data symmetric |

**When to use one-way vs. two-way:**
The dramatic improvement in pattern visibility when moving from one-way to two-way format suggests always preferring two-way when three variables are involved.

**When multiple values per cell:**
- Average/median with min/max
- Current period with prior period
- Count with breakdown by subcategory

## Notes

Harris provides clear visual examples showing identical data in one-way and two-way formats, demonstrating that format choice fundamentally affects analytical utility, not just appearance.

The frequency/percent table section shows how the same raw data can be expressed as row percentages, column percentages, or total percentages, each supporting different analytical questions.
