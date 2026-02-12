---
name: Table Grid Lines (Rules)
slug: table-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Grid and Grid Line, Grid lines on tables, p. 184"

intent: Use horizontal and vertical rules in tables to organize information, guide visual tracking, and indicate data groupings
direction: construction

components:
  - element: horizontal-rules
    encodes: Lines separating rows or row groups
  - element: vertical-rules
    encodes: Lines separating columns
  - element: header-rules
    encodes: Lines distinguishing header from body
  - element: total-rules
    encodes: Lines indicating totals or summaries (often double or heavier)

parameters:
  line_pattern: "none | horizontal-only | vertical-only | full-grid"
  line_weight: "light | medium | heavy | mixed"
  line_style: "solid | dashed | double"

related: []  # TBD: table-design, visual-hierarchy

warnings:
  - "Too many lines can make tables harder to read, not easier"
  - "Inconsistent rule usage confuses viewers"
  - "Heavy vertical lines are often unnecessary and add visual weight"

extensions:
  harris_entry: "Grid and Grid Line"
  alternate_names: ["rules", "ruling lines", "table lines"]
---

## Description

Grid lines are used on tables to help organize and compartmentalize information, assist the viewer in visually tracking data, emphasize key information, indicate where totals occur, and improve the appearance of the table. The number of lines used ranges from none to one or more between every row and column, with different weights and types used to differentiate groupings.

## Examples

Harris provides six variations showing different rule patterns (p. 184):

**No lines:**
The reference example shows data with no grid lines at all, relying on spacing and alignment alone.

**Horizontal lines with double line for totals:**
> "Horizontal lines with a double line indicating totals"

Horizontal rules separate rows, with a distinctive double line before the total row.

**Vertical lines only:**
Only vertical lines between columns, with no horizontal separation.

**Vertical and horizontal lines:**
A full grid with lines between every row and column.

**Partial horizontal lines with gap for totals:**
> "Partial horizontal lines with a gap indicating totals"

Horizontal lines run across most of the table but leave a gap before the total column.

**Grid lines independent of text:**
> "Grid lines/rules drawn independent of text"

Lines form a grid structure with cells, and text is positioned within the cells. This is typical of forms.

## Usage

**Line pattern selection:**
- **No lines**: Clean look, works when alignment provides sufficient structure
- **Horizontal only**: Aids row tracking, light visual weight
- **Vertical only**: Emphasizes column separation, less common
- **Full grid**: Maximum structure, can feel heavy; use for dense data or forms

**Indicating totals and groupings:**
- Double line or heavier line before totals row
- Gap in lines can also indicate summary boundary
- Grouped rows may share lines at group boundaries only

**Line weight variation:**
- Heavier lines for major divisions (header vs. body, groups)
- Lighter lines for row-by-row separation
- Consistent weight within each level

**Design principles:**
- Use minimum lines needed for clarity
- Vertical rules often unnecessary; horizontal space can separate columns
- Rules should serve function, not just fill space

## Notes

The trend in modern table design is toward fewer lines, using spacing and alignment to provide structure. Harris shows that extensive gridding is one option among many, and that the "no lines" approach can work well when data is well-organized.
