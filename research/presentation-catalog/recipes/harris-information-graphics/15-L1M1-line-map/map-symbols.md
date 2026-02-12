---
name: Map Symbols
slug: map-symbols
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Map, Symbols, p. 231"

intent: Encode quantitative and descriptive information using visual marks that indicate location and attributes simultaneously
direction: both

components:
  - element: symbol-mark
    encodes: Location and/or attribute value
    required: true
  - element: legend
    encodes: Key for interpreting symbol meanings
    required: true

parameters:
  symbol_category: "literal | point | line | area/volume"
  information_type: "nominal | ordinal | interval | proportional"
  encoding_method: "size | shape | color | pattern | thickness | style | multiple"

related: []  # TBD: see also proportional-symbol-map

warnings:
  - "Complex multi-bit symbols require careful legend design"
  - "Some encodings work for only certain information types"

extensions:
  harris_entry: "Map"
  alternate_names: []
  typical_use: "encoding both location and attributes on maps"
---

## Description

Map symbols serve dual purposes: designating location and encoding information about what exists at that location. Harris presents a comprehensive matrix showing how different symbol forms can encode both descriptive (qualitative) and quantitative information.

## Examples

**Symbol classification matrix** (p. 231):

Harris organizes symbols by type and information category:

**Literal symbols** (words, numbers):
- Nominal: "library, coal mine, plant"
- Ordinal: "L, M, S" (large, medium, small)
- Interval: "10 ton, 20 passengers, 50 births"
- Proportional: "2.7 tons per acre, 1.2 births per family"
- Multiple bits: City names in different fonts/styles/colors encoding multiple attributes

**Point symbols** (geometric or pictorial):
- Size: Larger dots for larger values
- Shape: Different shapes for different categories (airport, church, mine)
- Multiple: Combining shape, size, and fill (e.g., circles showing percentage and kilograms)

**Line symbols**:
- Thickness: "unimproved road, light duty road, primary highway"
- Solid/dashed: "property boundary, township boundary, county boundary"
- Patterned: Different patterns for walls, streams, power lines
- Multiple: Railroad symbols with crosses, abandoned railroad with different pattern
- Symbols included: Fence line with dots, truck route with truck symbol

**Area and volume symbols**:
- Size: Different sized regions
- Shape: Footprint shapes indicating building use
- Multiple: Patterns within areas designating features

**Quantitative encoding examples**:
- Size: "$100 Sales, $200 Sales, $300 Sales"
- Shape/fill: "10 to 99 employees, 100 to 499 employees"
- Multiple axes: Pie charts on maps showing percentages by category

## Usage

Select symbol type based on:
- Type of information (categorical vs. quantitative)
- Number of attributes to encode
- Need for precise value reading vs. pattern recognition
- Map scale and density of features

The matrix shows that most symbol forms can encode multiple types of information, but some are better suited for specific purposes:
- Size works well for quantitative data
- Shape works well for categorical distinctions
- Pattern/fill helps distinguish areas
- Multiple encodings can convey complex multivariate data

## Notes

Harris cross-references the Symbol entry for additional information. The key insight is that map symbols are inherently multivariate - they always encode location, and can additionally encode one or more attributes through their visual properties.
