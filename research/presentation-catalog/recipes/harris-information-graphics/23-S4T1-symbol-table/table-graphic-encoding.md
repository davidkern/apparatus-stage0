---
name: Table Graphic Encoding
slug: table-graphic-encoding
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Table, Body/field of table, p. 394"

intent: Use graphics (symbols, icons, images) instead of or in addition to numbers and words in table cells to communicate information visually
direction: both

components:
  - element: cell-content
    encodes: Data value using graphic representation
    required: true
  - element: legend
    encodes: Mapping between graphic variations and meanings
    required: true
  - element: encoding-system
    encodes: Consistent rules for graphic interpretation
    required: true

parameters:
  content_type: numbers | words | symbols | icons | mixed
  symbol_encoding: presence | degree | proportion | trend | quantity
  graphic_complexity: simple | compound | pictorial

related: []  # TBD: see table, symbol

warnings:
  - "When graphics are used, the table is sometimes referred to as a graphic table"
  - "Accompanying text is normally required for full understanding of tables with images or icons"
  - "Legend must clearly explain all graphic variations used"

extensions:
  harris_entry: "Table"
  alternate_names: ["graphic table", "pictorial table", "symbol table"]
  typical_use: "Feature comparison tables, status dashboards, quick-scan displays"
---

## Description

There are many options for how information might be encoded into tables. When graphics are used instead of words or numbers, the table is sometimes referred to as a graphic table. Harris presents a comprehensive catalog of encoding methods, from simple presence/absence symbols to complex pictorial representations.

## Examples

**Numbers** (p. 394):
> "Most tables that are used for analysis purposes use numbers in the body."

Standard numeric table with products as rows, years as columns.

**Words** (p. 394):
> "Sometimes referred to as word tables. The number of words used might vary from a single word to a sentence or even a paragraph."

Example: Product lifecycle table with stages (introduced, growing, maturing) as columns and characteristics (Sales, Profit, Cash flow) as rows containing descriptive words.

**Simple symbols - presence/absence** (p. 394):
> "In its simplest form, a geometric symbol is used to indicate yes or no, available or not available, done or not done, etc. Color or fill can be used to encode additional information."

Example: Feature availability with filled circles (available 110 & 220 volts) vs. unfilled circles (110 volts only).

**Symbols showing degree** (p. 394):
> "A number of techniques can be used to indicate such things as varying degrees of something, a phasing in and out, etc."

Example: Responsibility matrix with solid fill (total responsibility) and partial fill (partial responsibility) showing gradual shifts between departments.

**Proportional symbols** (p. 394):
> "The size of the symbol can be shown in proportion to some feature such as price, rating, volume, etc."

Example: Circle sizes proportional to values in cells.

**Multiple symbol shapes** (p. 394):
> "Various shapes can be used to indicate yes or no to multiple questions: Is a given feature available? Is it available at a given store? etc."

Example: Circles, squares, and triangles indicating black and white, 16 colors, and 256 colors availability.

**Qualitative/ordinal symbols** (p. 394):
> "Qualitative or ordinal information can be communicated by using different color, size, or numbers of symbols."

Example: Rating scale using different numbers of small squares (Very good = 4, Good = 3, Fair = 2, Poor = 1).

**Quantitative encoding** (p. 394):
> "Quantitative information can be encoded by the use of symbols such as small pie charts, framed rectangles, etc."

Example: Backup status using pie-chart symbols (empty = no backup, half = 50%, full = 100%).

**Trend symbols** (p. 394):
> "Trends, directions, political positions, etc., can be indicated by symbols such as arrows."

Example: Market share trends using arrows (up dramatically, up slightly, stable, down slightly, down dramatically).

**Icons and images** (p. 394):
> "Icons and images are sometimes included in the category of symbols. When used in the body of a table, pictures, images, or icons become quantitative if their size or quantity is proportional to some value associated with the entity they represent. Accompanying text is normally required for full understanding of a table with images or icons. Sometimes called pictorial table."

Example: Export/import table using airplane and ship icons of varying sizes.

## Usage

**Encoding method selection:**

| Information Type | Recommended Encoding |
|-----------------|---------------------|
| Presence/absence | Single symbol (filled/unfilled) |
| Degree/intensity | Fill level or symbol count |
| Proportion | Proportional size or pie segments |
| Rank/ordinal | Symbol count or size progression |
| Trend/direction | Arrows |
| Category | Different shapes |
| Multiple attributes | Compound symbols |

**Design considerations:**
- Simple symbols for rapid scanning
- Compound symbols for dense information
- Always include legend for non-obvious encodings
- Maintain consistency across all cells
- Consider colorblind-safe alternatives to color-only encoding

**Advantages of graphic encoding:**
- Faster visual scanning than reading numbers
- Patterns emerge more readily
- Space-efficient for certain data types
- Cross-language accessibility

**Limitations:**
- Precise values harder to read
- Requires legend space
- May need explanation for unfamiliar audiences
- Complex encodings can confuse

## Notes

Harris's comprehensive catalog demonstrates that tables need not be limited to text and numbers. The choice between numeric precision and visual pattern recognition depends on whether viewers need exact values or quick comparisons and trend identification.

The pictorial table example with export/import icons shows how visual encoding can make geographic and categorical patterns immediately apparent, something that would require careful study in a numeric table.
