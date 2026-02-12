---
name: Table Heading Options
slug: table-heading-options
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Table, Table heading options, pp. 392-393"

intent: Select appropriate heading content (words, numbers, symbols) and positioning to optimize table readability and information access
direction: construction

components:
  - element: heading-content
    encodes: Row and column identifiers (words, numbers, or symbols)
    required: true
  - element: heading-position
    encodes: Location of headings (top, bottom, left, right)
    required: true
  - element: heading-alignment
    encodes: How headings align with data rows/columns
    required: true
  - element: data-alignment
    encodes: How values align within columns (left, right, center, decimal)
    required: true

parameters:
  heading_type: words | numbers | symbols | mixed
  row_heading_position: left | right | both
  column_heading_position: top | bottom | both
  number_alignment: right | centered | decimal
  word_alignment: left | centered | right

related: []  # TBD: see table

warnings:
  - "Numbers with decimal points should almost always be aligned on the decimal points"
  - "Numbers are almost never aligned to the left except occasionally as scales on graphs"
  - "Long headings can be accommodated better on the vertical axis"

extensions:
  harris_entry: "Table"
  typical_use: "Designing table headers and data formatting"
---

## Description

Table headings can use words, numbers, symbols, or combinations thereof. The choice affects how quickly viewers can orient themselves and find information. Harris provides guidance on heading content types, positioning, ordering, and alignment.

## Examples

**Words as headings** (p. 392):
Most common approach. Example shows hospitals (A-F) as row headings with features as column headings.

**Numbers as headings** (p. 392):
> "In some cases, such as this one, the numbers represent quantitative values. In other cases the numbers are used for identification purposes and have no quantitative significance."

Example: Heat index table with Air Temperature (vertical) and Percent Relative Humidity (horizontal) as numeric headings.

**Symbols as headings** (p. 392):
> "Some symbols are called icons, images, pictures, etc. Symbols sometimes:
> - Convey more information in less space
> - Are faster for orienting the viewer
> - Overcome language barriers
> Accompanying text is sometimes required for a full understanding of the meaning of a symbol."

Example: Table using airplane, car, and other transport icons as column headings with directional arrows for rows.

## Heading Arrangement

**Location of headings** (p. 392):
> "Row headings are most frequently located on the left of the table and column headings at the top of the table. It is not uncommon, however, to see headings located elsewhere."

Example: Heat index table has column headings at bottom. Wide tables may repeat row headings on the right.

**Order of headings** (p. 392):

For sequential/quantitative variables:
> "The individual headings are arranged in their proper sequential or numerical order progressing from left to right along the horizontal axis. On the vertical axis they might progress either up or down."

For category headings, ordering options include:
- Alphabetical
- Ascending/descending by data values
- Chronological (order of occurrence)
- Geographical
- Qualitative (best, second best, etc.)
- Frequently compared items placed close together
- Related columns/rows located near each other
- Important values near top or left
- Total columns/rows at far right or bottom (though some place them first after headings)

**Interchangeability** (p. 393):
> "In many tables the row and column heading can be transposed with no degradation of the information."

Decision factors:
- Which combination makes data most meaningful
- Number of variables
- Number of entries (large counts often on vertical axis)
- Length of headings (long headings fit better on vertical axis)

## Alignment

**Positioning of headings** (p. 393):

Options for aligning headings and data in same row:
- Data and headings aligned (same baseline)
- Data aligned with lowest line in multi-line heading
- Data aligned with vertical center of heading
- Data aligned with first line in heading

**Numbers** (p. 393):
> "If the numbers have decimal points, they are almost always aligned on the decimal points. If the column contains no decimal places, the numbers might be aligned to the right or centered. Numbers are almost never aligned to the left except occasionally as scales on graphs."

**Words** (p. 393):
> "Words in a column are usually aligned to the left, although they may be centered or aligned to the right. When the column has a mixture of words, numbers, and/or symbols, all of them are often centered."

**Rotated headings** (p. 393):
> "If there is a space limitation, the heading is sometimes rotated. Rotation seldom exceeds 90 degrees."

## Usage

**Heading content selection:**
- Use words when precision and clarity are paramount
- Use numbers when values serve as lookup keys
- Use symbols to save space, speed orientation, or cross language barriers
- Combine types when appropriate

**Alignment rules of thumb:**
- Decimal numbers: align on decimal point
- Integers: right-align or center
- Words: left-align
- Mixed content: center

**Dependent vs. independent variable** (p. 393):
> "In tables there is no generally accepted standard as to which axis the independent variable is placed on; therefore, it is sometimes found on the vertical axis and other times on the horizontal axis."

## Notes

The guidance on heading order reveals that table design involves strategic decisions about information access patterns. Analysis tables benefit from value-based ordering to highlight patterns; reference tables benefit from alphabetical or systematic ordering for rapid lookup.
