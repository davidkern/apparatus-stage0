---
name: One-Way Table
slug: one-way-table
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "One-Way Table, p. 258"

intent: Display two or more variables along a single axis (either horizontal or vertical) in tabular form
direction: both

components:
  - element: primary-axis
    encodes: The axis (vertical or horizontal) along which all variables are displayed
    required: true
  - element: variable-columns-or-rows
    encodes: Each variable occupies one column (vertical list) or row (horizontal list)
    required: true
  - element: grid-lines
    encodes: Optional visual separators between cells
    required: false

parameters:
  orientation: vertical-list | horizontal
  variable_count: 2 | 3 | 4+
  grid_lines: present | absent

related:
  - slug: two-way-table
    relationship: contrasts
  - slug: list
    relationship: contained-by

warnings:
  - "If only one variable is shown in a single column it is called a list, not a one-way table"

extensions:
  harris_entry: "One-Way Table"
  typical_use: "displaying multiple variables in list format"
  design_notes:
    vertical_format: "referred to as list format"
    single_variable: "single column with one variable is called a list"
---

## Description

A one-way table is a table displaying two or more variables along either the horizontal or vertical axis. The vertical axis is frequently used, and referred to as the list format of a one-way table. If only one variable is shown in a single column it is called a list.

## Examples

Harris illustrates (p. 258):

**Two-variable examples:**
- Without grid lines: Name, Age columns (Alice 6, Bill 7, Harry 4, Sue 5)
- With grid lines: Same data with cell borders
- Horizontal orientation: Name and Age as rows with values as columns

**Three-variable example:**
Year, Product, Value columns showing data from 1990-1992 for products A-D

**Four-variable example:**
Year, Sex, Age, Value columns showing data from 1980-1990 with Male/Female and Under 40/Over 40 categories

## Usage

**When to use:**
- When multiple related variables need to be displayed in list form
- When vertical space is more available than horizontal space (use vertical/list format)
- When data records have consistent variable structure

**Orientation choice:**
- Vertical (list format): Most frequently used; variables as columns, records as rows
- Horizontal: Variables as rows, records as columns

**Grid lines:**
Optional; can improve readability for larger tables

## Notes

The distinction between a list (one variable) and a one-way table (two or more variables) is important. One-way tables can accommodate any number of variables, though practical limits depend on page width and readability.
