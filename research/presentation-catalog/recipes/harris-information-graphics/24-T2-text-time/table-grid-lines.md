---
name: Table Grid Lines
slug: table-grid-lines
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Table, Grid lines, pp. 395-396"

intent: Organize table information, assist visual tracking, emphasize key data, and improve appearance through strategic use of lines, shading, and visual hierarchy
direction: construction

components:
  - element: horizontal-grid-lines
    encodes: Row separations supporting left-to-right reading flow
    required: false
  - element: vertical-grid-lines
    encodes: Column separations supporting top-to-bottom reading flow
    required: false
  - element: shading-or-color
    encodes: Row or column highlighting for tracking wide tables
    required: false
  - element: bold-text
    encodes: Emphasis on key data rows or columns
    required: false
  - element: boxes
    encodes: Grouping of related data or emphasis on summary information
    required: false
  - element: guide-lines
    encodes: Light lines aligned with headings to aid symbol or text tracking
    required: false

parameters:
  grid_style: "none | horizontal-only | vertical-only | full-grid"
  emphasis_method: "shading | bold | boxes | combination"
  guide_line_use: "with-symbols | with-text"

related: []

warnings:
  - "Vertical lines can interfere with horizontal flow of information when reading left-to-right"
  - "Horizontal lines can interfere with vertical flow when reading top-to-bottom"
  - "Guide lines used with text are generally not as effective as when used with symbols"
  - "There are no industry standards; many organizations have their own conventions"

extensions:
  harris_entry: "Table"
  grid_line_purposes:
    - "Help organize information in tables"
    - "Assist the viewer in visually tracking data"
    - "Emphasize key information"
    - "Improve the appearance of tables"
---

## Description

Methods involving grid lines (sometimes called rules), guidelines, bold text, shading, and boxes help organize table information, assist visual tracking, emphasize key data, and improve appearance. Harris presents multiple techniques with guidance on when each is most appropriate, noting that while many organizations have standards, there are no universal industry conventions.

## Examples

### Basic Reference Table (p. 396)

Harris shows a reference table with no grid lines, rules, shading, or boxes. This establishes the baseline against which other techniques can be compared.

### Horizontal and Vertical Grid Lines (p. 396)

> "This example has grid lines separating all rows and columns."

Full grid provides maximum structure but can appear heavy.

### Horizontal Grid Lines Only (p. 396)

> "When the key flow of information is from left to right, vertical lines are sometimes omitted so they do not interfere with the horizontal flow of information."

### Vertical Grid Lines Only (p. 396)

> "When the key flow of information is vertical, horizontal lines are sometimes omitted so as not to interfere with the vertical flow of information. Lines are generally continuous."

### Shading or Color (p. 396)

> "In place of or in addition to grid lines, shading or coloring might be used to help the viewer track data, particularly in wide tables."

Harris shows alternating row shading to aid horizontal tracking across many columns.

### Bolding of Selected Information (p. 396)

> "Using bold type in selected rows or columns highlights key data and assists in the visual tracking of data."

Example shows Product A row entirely in bold, making it stand out while still being part of the table structure.

### Boxes Around Related Data (p. 396)

> "If the material in the table consists of distinctly different groups of information, boxes are sometimes drawn around the groupings. The boxes might run horizontal or vertical."

Harris shows Sales/Profit grouped separately from Expense A/Expense B.

### Boxes Around Summary Data (p. 396)

> "When the major focus is on particular data, grid lines or boxes might be used selectively to emphasize that information."

Example shows only the Total row boxed, drawing attention to summary figures.

### Guide Lines Used with Symbols (p. 396)

> "Guide lines aligned with headings and symbols can sometimes be more effective than grid lines between them. Guide lines always pass behind whatever data graphics are used."

Example shows features (Feature 1-4) tracked across brands (A-E) using dashed guide lines with symbols (circles, filled circles) placed on the lines.

### Guide Lines Used with Text (p. 396)

> "Guide lines can be used with numbers; however, they are generally not as effective as when used with symbols."

Example shows products tracked across years with dashed guide lines connecting values: "Product A -- 23.1 -- 23.7 -- 24.2 -- 24.9 -- 25.6"

## Usage

### Selecting grid line approach

**No grid lines**: Simple tables with few rows/columns where tracking is easy.

**Full grid (horizontal and vertical)**: Complex tables requiring maximum structure, formal documents.

**Horizontal only**: Tables where primary reading is left-to-right across rows; typical for time-series data.

**Vertical only**: Tables where primary reading is top-to-bottom within columns; typical for comparing categories.

### Adding emphasis

**Shading**: Wide tables where horizontal tracking is difficult; alternating rows reduce eye-tracking errors.

**Bold text**: Key rows or columns (totals, featured products, current period); maintains table unity while adding emphasis.

**Boxes around groups**: Tables containing logically distinct sections (revenues vs. expenses, different product lines).

**Boxes around summary**: When totals or key figures are the primary focus and detail rows are secondary.

### Guide line decisions

- Use with symbols when tracking feature presence/absence across categories
- Less effective with text/numbers due to visual complexity
- Always position guide lines behind data graphics
- Align with headings for clear association

## Notes

Harris emphasizes that grid line choices depend on the table's content and reading pattern. The principle of not interfering with information flow is key: if readers scan left-to-right, avoid vertical barriers; if readers scan top-to-bottom, avoid horizontal barriers.

The distinction between grid lines (structural separators) and guide lines (tracking aids) is important. Guide lines serve a different purpose and work particularly well with symbolic data where the visual connection between heading and symbol needs reinforcement.
