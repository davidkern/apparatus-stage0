---
name: Pictorial Bar Graph
slug: pictorial-bar-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Bar Graph, Pictorial bar graph, p. 41"

intent: Enhance visual appeal and communication by replacing or filling rectangular bars with pictures, icons, or symbols
direction: both

components:
  - element: pictorial-bars
    encodes: Values represented by symbol-filled or symbol-replaced bars
    required: true
  - element: symbols
    encodes: Pictures, sketches, or icons representing the data subject
    required: true
  - element: quantitative-scale
    encodes: Value axis for reading precise values
    required: true
  - element: category-scale
    encodes: Category labels on vertical axis
    required: true

parameters:
  symbol_method: filled-rectangles | repeated-symbols | stretched-symbol
  symbol_count: single | multiple
  cropping: cropped-to-value | whole-symbols-only

related:
  - slug: simple-bar-graph
    relationship: variant-of
  - slug: pictograph
    relationship: variant-of

warnings:
  - "Stretched symbols can distort proportions and mislead about values"
  - "Cropped symbols may be unclear if the cropping point is ambiguous"
  - "Visual appeal should not compromise accuracy of data communication"

extensions:
  harris_entry: "Bar Graph"
  alternate_names:
    - "pictograph"
    - "picture bar graph"
    - "icon bar graph"
  typical_use: "making graphs more visually appealing and facilitating better communication through recognizable imagery"
  symbol_techniques:
    filled_rectangles: "rectangular bars filled with pictures/icons depicting what the bars represent"
    repeated_symbols: "multiple symbols where each represents a certain number of units; end symbol cropped to value"
    stretched_symbol: "single symbol stretched so end aligns with value on scale"
---

## Description

A pictorial bar graph replaces or enhances rectangular bars with pictures, sketches, or icons. There are two main variations:

1. **Rectangles filled with symbols** — Traditional bar shape with pictures inside depicting the items the bars represent
2. **Symbols substituted for rectangles** — Pictures replace the bars entirely

In both variations, one or more symbols may be used per bar. The primary purposes are to make the graph more visually appealing and to facilitate better communication by using recognizable imagery.

## Examples

Harris illustrates several techniques (p. 41):

**Repeated symbols (housing starts example):**
- Towns A-D on vertical axis
- Scale: 0 to 100 housing starts
- Each house icon represents a certain number of units
- End symbol is cropped such that its edge aligns with the value on the scale

**Stretched symbol:**
- Same towns, same scale
- A single house symbol is stretched horizontally
- The end of the symbol aligns with the value the bar represents

**Filled rectangles (vehicles example):**
- Categories: Planes, Trucks, Boats, Vans
- Scale: 0 to 1,000,000
- Each bar is a rectangle filled with icons of the relevant vehicle type
- Multiple icons create a pattern within the bar shape

## Usage

**When to use:**
- General audiences where visual engagement matters
- When the subject matter has recognizable, simple iconography
- Infographics and presentations where aesthetic appeal is valued

**When to avoid:**
- Technical or scientific contexts requiring precision
- When symbols would be unclear or cluttered
- Dense comparisons where visual noise would impair reading

**Technique considerations:**

*Repeated symbols with cropping:*
- Each symbol represents a fixed quantity
- Final symbol cropped at the precise value point
- Clear but requires understanding the symbol-to-value mapping

*Stretched symbols:*
- Single symbol distorted to fit value
- Simple but can misrepresent the subject (a "stretched house" looks strange)
- Works better with abstract symbols

*Filled rectangles:*
- Maintains precise bar shape for accurate reading
- Adds visual context without distorting geometry
- Best balance of precision and appeal

## Notes

Harris references "Pictorial Charts and Graphs" entry for more comprehensive treatment. The pictorial technique can be applied to grouped and other bar graph variations, though it works best with simple bar graphs where visual complexity is already low.
