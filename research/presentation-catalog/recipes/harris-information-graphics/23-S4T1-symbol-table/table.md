---
name: Table
slug: table
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Table, pp. 387-394"

intent: Organize information in rows and columns for precise value communication, compact presentation, comparison, rapid reference, and data storage
direction: both

components:
  - element: table-heading
    encodes: Title and subtitle identifying the table content
    required: false
  - element: column-headings
    encodes: Labels for each column (boxheads)
    required: true
  - element: row-headings
    encodes: Labels for each row (stubs)
    required: true
  - element: field
    encodes: Data cells at row-column intersections
    required: true
  - element: spanner-headings
    encodes: Groupings that bridge multiple columns
    required: false
  - element: grid-lines
    encodes: Visual separation between rows and columns
    required: false
  - element: notes
    encodes: Explanations, sources, and clarifications
    required: false

parameters:
  format: one-way | two-way | multiway | bidirectional
  content_type: numbers | words | symbols | graphics | mixed
  purpose: analysis | reference | scheduling | forms

related: []  # TBD: see table-format, table-graphic-encoding

warnings:
  - "Negative numbers might use parentheses or minus signs; in accounting, parentheses are often preferred"
  - "Missing data should be indicated with a dash or N/A to show it has not been overlooked"
  - "Dollar signs are generally aligned in each column even if this causes large spaces"

extensions:
  harris_entry: "Table"
  alternate_names: ["matrix"]
  terminology:
    cell: "Area where column and row intersect"
    field: "Body of the table (shaded area)"
    feet: "Bottom of columns"
    stub: "Row headings"
    boxhead: "Column headings"
---

## Description

Tables are charts with information arranged in rows and columns in some meaningful way. Sometimes referred to as a matrix, tables serve multiple important functions in information presentation.

Harris identifies six major reasons for using tables (p. 387):
1. They are one of the best ways to convey exact numerical values
2. They present data more compactly than in sentence form
3. They assist the viewer in making comparisons, determining how things are organized, noting relationships between various sets of data
4. They are one of the most convenient ways of storing data for rapid reference
5. They are an excellent vehicle for recording and communicating repetitive information (forms)
6. They organize information for which graphing would be inappropriate

## Examples

**Table description convention** (p. 387):
> "Tables are sometimes described by the number of rows and columns of data they contain. For example, this table can be described as a 4 by 3 (sometimes written 4X3), since it has four rows and three columns of data. Total and summary columns and rows are generally excluded."

**Terminology diagram** (p. 387):
Harris provides an annotated example showing all key elements:
- Table heading (Title, Subtitle/headnote)
- Spanner headings bridging multiple columns
- Spanner rule and subspanner rule
- Column headings (column captions, column titles, column labels, boxheads)
- Row headings (row labels, stubs, stub items, line categories, categories, captions)
- Cell (intersection of column and row)
- Field or body (shaded data area)
- Vertical and horizontal grid lines/rules
- Base line
- Feet (bottoms of columns)
- Leader (connecting stub heading to columns)

**Formatting conventions** (p. 387):
- Negative numbers: parentheses or minus signs
- Missing data: dash or N/A
- Decimal alignment: numbers with decimal points aligned on decimal
- Dollar signs: aligned in column, typically shown in top and bottom rows
- Notes placement: directly below the table (general notes, specific notes, source notes)

## Usage

**Applications** (p. 388):

**Analysis tables** (statistical, summary, analytical):
> "Their major function is to assist the viewer in analyzing the information included in the table. There are always two or more variables and the data in the body is normally numeric. Information is generally arranged, ranked, sorted, etc., to make such things as relationships, trends, comparisons, distributions, and anomalies stand out."

**Reference tables** (source tables):
> "The major emphasis of such tables is on easy retrieval of data. Information is generally arranged in alphabetical order, by geographic area, numerically in ascending or descending order, chronologically, etc., so specific bits of information can be located rapidly."

**Scheduling tables** (charts):
Often called machine loading charts, Gantt charts, milestone charts. Things being scheduled listed on vertical axis, time intervals on horizontal.

**Calendar tables**:
> "Calendars represent one of the simplest forms of tables. They have a unique characteristic in that the information shown on them flows from one line to the next the same as text does."

**Forms**:
Endless varieties of forms utilize a tabular format.

## Notes

Harris emphasizes that "Except for bidirectional tables, there is no required relationship between the number of rows and columns" (p. 387).

The distinction between tables for analysis versus reference significantly impacts design decisions, particularly regarding data ordering and organization. Analysis tables rank and sort to reveal patterns; reference tables alphabetize or sequence for retrieval speed.

When tables are used in specific applications, parts receive additional names related to the application. For example, in databases, a column might be called a field and a row referred to as a record.
