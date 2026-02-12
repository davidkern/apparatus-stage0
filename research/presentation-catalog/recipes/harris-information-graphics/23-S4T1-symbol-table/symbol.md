---
name: Symbol
slug: symbol
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Symbol, pp. 379-386"

intent: Use small graphic representations to convey quantitative information, descriptive information, location, differentiation, enclosure, highlighting, or meaningful display
direction: both

components:
  - element: symbol-shape
    encodes: Type or category of data element (geometric, pictorial, specialized)
    required: true
  - element: symbol-size
    encodes: Quantitative value when varied proportionally
    required: false
  - element: symbol-fill
    encodes: Category, class interval, or additional variable
    required: false
  - element: symbol-color
    encodes: Category differentiation or quantitative class
    required: false
  - element: legend
    encodes: Mapping between symbol variations and their meanings
    required: false

parameters:
  symbol_type: literal | point | line | area | volume
  information_type: nominal | ordinal | interval | proportional
  function: quantitative | descriptive | location | differentiation | enclosure | highlighting | display

related: []  # TBD: see plotting-symbol, proportional-symbol

warnings:
  - "Viewers tend to underestimate the relative sizes of larger circles; consider using apparent-magnitude scaling for proportional symbols"
  - "The same symbol might serve multiple functions simultaneously (e.g., location and type of facility)"
  - "Without a legend, viewers may not understand non-standard symbol meanings"

extensions:
  harris_entry: "Symbol"
  alternate_names: ["marker", "plot symbol", "icon", "dingbat"]
  symbol_categories:
    - literal: "Words, numbers, abbreviations"
    - point: "Geometric or pictorial shapes"
    - line: "Thickness, pattern, dashing variations"
    - area: "Enclosed regions with fill"
    - volume: "Three-dimensional shapes"
---

## Description

Symbols are typically small graphic representations of things, either tangible or intangible. They serve as fundamental building blocks in information graphics, capable of encoding multiple types of information simultaneously. Harris identifies seven major functions that symbols perform in charts and graphs.

The same symbol might serve two or more functions at the same time in the same chart (e.g., location and type of facility), or the same symbol might be used for one function on one chart and for a completely different function on another chart.

## Major Functions of Symbols

Harris identifies seven primary functions:

1. **Convey quantitative information** - Sizes, shapes, and colors varied in proportion to values; number of symbols proportional to quantity; different symbols assigned different values (p. 379)

2. **Convey descriptive information** - Indicate what something is, what it might be used for, how big it is; minimize text; overcome language differences (p. 379)

3. **Designate location** - Small geometric plotting symbols locate data points on graphs; shapes denote specific locations on maps; lines designate paths, highways, railroads (p. 379)

4. **Differentiate and identify** - Different symbols identify data points belonging to the same series and differentiate them from other series (p. 379)

5. **Serve as an enclosure** - Organize information on organization charts, flow charts, diagrams; make charts more legible; improve appearance (p. 379)

6. **Highlight specific information** - Bullets indicate new ideas on text charts; arrows call attention to particular locations or values (p. 379)

7. **Form meaningful displays by themselves** - Icon comparison displays encode many bits of information into each symbol (p. 379)

## Examples

The table on page 380 illustrates how standard symbol forms encode information:

> "With each basic form (i.e., literal, point, line, area, and volume) a row of examples is included to show how multiple bits of information might be incorporated into that type of symbol." (p. 380)

**Literal symbols** (words, numbers):
- Standard: "library, coal mine, plant"
- Multiple bits encoded: "Portland = In the west, New York = In the east, Tulsa = In the south"

**Point symbols** (geometric or pictorial):
- Size variation: Small dot = minor, medium dot = average, large dot = major
- Shape variation: Triangle = airport, cross = church, hexagon = tin deposit
- Multiple symbols: Number of dots proportional to value (p. 380)

**Line symbols**:
- Thickness: Thin = unimproved road, medium = light duty road, thick = primary highway
- Solid/dashed: Solid = property boundary, dashed = township boundary, dotted = county boundary
- Pattern: Wavy = stream, zigzag = power line (p. 380)

**Area and volume symbols**:
- Size proportional to value
- Shape indicates category (footprint vs. oil reserves)
- Patterns designate features (p. 380)

## Usage

**When to use different symbol types:**
- **Geometric shapes** - Best for graphs and maps where precision location matters
- **Pictorial/iconic symbols** - Best when conveying what something is, especially for audiences unfamiliar with conventions
- **Literal symbols** - When precision and clarity are paramount; overcome ambiguity

**General variations available with most symbols** (p. 382):
- **Opacity**: Solids stand out; transparency improves readability when data points overlap
- **Orientation**: Symbols can be rotated 360 degrees for appearance or to encode information
- **View**: Plan/top view vs. profile/side view; oblique or perspective for appearance
- **Two- or three-dimensional**: 2D most common; 3D for aesthetic purposes
- **Color, shading, fill**: Used extensively for encoding both quantitative and qualitative information

## Notes

Harris provides an extensive table (p. 380) showing examples of symbols across all five types (literal, point, line, area, volume) and four information classifications (nominal, ordinal, interval, proportional). This matrix demonstrates the breadth and depth of symbol usage in information graphics.

The circular symbol is noted as "the most versatile and widely used of all the symbols" (p. 381), with variations including size, fill, segmentation, and nested arrangements for encoding multiple variables.
