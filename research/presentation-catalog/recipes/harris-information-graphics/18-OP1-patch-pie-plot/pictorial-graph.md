---
name: Pictorial Graph
slug: pictorial-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Pictorial Charts and Graphs, Pictorial graph, pp. 277-278"

intent: Make charts more engaging and understandable by using pictures, icons, or symbols in place of or in addition to standard data graphics like bars or columns
direction: both

components:
  - element: axis-scale
    encodes: Quantitative measure
    required: true
  - element: pictorial-data-graphics
    encodes: Values through positioned or sized images
    required: true
  - element: category-labels
    encodes: What each bar/column represents (may be replaced by obvious symbols)
    required: false
  - element: value-labels
    encodes: Numeric values at ends of bars/columns
    required: false

parameters:
  image_method: "multiple-images | single-stretched | single-fixed-top"
  image_relationship: "cropped-to-value | fill-only | proportional"
  frame_visibility: "with-frame | without-frame"

related: []  # TBD: see pictorial-unit-chart, pictorial-proportional-chart

warnings:
  - "It may not be clear whether the top of one element or another designates the value (e.g., top of roof vs. top of chimney)"
  - "Single stretched images can create significant distortion"
  - "Symbol size and number may bear no relationship to value if used as fill only"

extensions:
  harris_entry: "Pictorial Charts and Graphs"
  alternate_names: ["pictogram", "pictograph", "picture bar", "picture graph"]
  typical_use: "making documents more interesting; overcoming language/culture barriers; improving orientation"
  reasons_for_use:
    - "Make document more interesting and appealing"
    - "Make material understandable to more people (overcoming language, culture, education differences)"
    - "Improve communication where appearance is better known than name/number"
    - "Facilitate easier reading by including orienting information"
---

## Description

Pictorial charts and graphs use pictures, sketches, symbols, icons, etc., in place of or in addition to standard data graph elements. For example, bars or columns might be replaced by small pictures or symbols of the thing they represent. Pictorial charts and graphs are used extensively in publications and presentations.

In pictorial graphs, it is the top, end, or edge of the graphic (pictures, icons, etc.) that is used to determine a value on the scale of the graph.

## Examples

Harris illustrates several variations (pp. 277-278):

**Multiple images per column:**
> "The top symbol is cropped so the upper edge coincides with the value the column or bar is designating."

One example shows symbols sized to match even intervals (e.g., each symbol = 10 units), with the top symbol cropped. Another shows:
> "In this example the size and number of symbols bears no relationship to the value the column represents. The symbols are simply used as fill."

**Single image per column:**
> "Each symbol is stretched or shrunk until its top or edge coincides with the value on the graph scale that the column or bar represents."

One variation elongates the entire symbol; another keeps the top portion same size while elongating only the lower portion, "thus reducing the amount of distortion in the symbols."

**Potential hazard:**
> "In this example, it is not clear whether the top of the roof or the top of the chimney designates the value."

**Variety of images:**
> "Even when multiple symbols are used, there is generally a common attribute or characteristic about all of them."

Example shows residential vs. industrial categories using varied but thematically consistent symbols.

## Usage

**When to use:**
- Publications and presentations for general audiences
- Cross-cultural communication
- When visual recognition aids comprehension
- When engagement and appeal matter

**Design methods:**

*Multiple images with cropping:*
- Select symbol size to match scale intervals
- Crop top symbol to exact value
- Clearest method for value communication

*Images as fill only:*
- Frame/outline determines value
- Symbols provide visual interest only
- Number/size of symbols is decorative

*Single stretched image:*
- Most distortion
- Consider fixed-top variation to reduce distortion

**Labeling:**
- When symbols are obvious, category labels may be omitted
- Numeric values at ends of bars assist rapid interpretation
- When each bar represents different entity, different symbols may be used

## Notes

Pictorial graphs trade precision for engagement. The primary benefit is making data more accessible and interesting, especially for non-technical audiences. However, the pictorial elements can introduce ambiguity (which part designates the value?) and distortion (stretched images).

Harris's caution about the house with chimney example highlights the importance of clear visual design: the element that marks the data value must be unambiguous.
