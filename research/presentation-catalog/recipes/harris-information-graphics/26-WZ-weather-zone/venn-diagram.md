---
name: Venn Diagram
slug: venn-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Venn Diagram, pp. 435-436"

intent: Display relationships between two or more sets of things using overlapping geometric shapes to show intersections, unions, and complements
direction: both

components:
  - element: set-symbols
    encodes: Individual sets of elements (typically circles)
    required: true
  - element: intersection-area
    encodes: Elements common to multiple sets (overlap region)
    required: false
  - element: complement-area
    encodes: Elements not belonging to specified sets
    required: false
  - element: universal-set-rectangle
    encodes: The total population containing all elements
    required: false
  - element: labels
    encodes: Set identifiers (letters, numbers, or descriptive text)
    required: true
  - element: values
    encodes: Quantitative counts within each region
    required: false

parameters:
  number_of_sets: "2 | 3 | 4 | more"
  quantified: boolean
  symbol_shape: circles | rectangles | other-shapes

related: []  # TBD: conceptual-diagram

warnings:
  - "Labels on circumference reduce confusion about whether label applies to entire set or portion"
  - "Generally no attempt is made to have size of symbols proportional to values"
  - "Most diagrams use between two and four sets"

extensions:
  harris_entry: "Venn Diagram"
  alternate_names: ["set diagram", "Ballantine diagram"]
  typical_use: "illustrating interrelationships between groups, analyzing overlapping categories"
---

## Description

Venn diagrams are graphical tools used to describe relationships between two or more sets of things or information. They accomplish this by the relative positioning of geometric shapes (normally circles) representing the sets. The positioning and overlapping of shapes shows which elements are shared between sets and which are unique to each set.

Harris notes that Venn diagrams are used in many different fields including mathematics, psychology, education, advertising, and sociology for diverse purposes such as studying complex concepts, introducing children to mathematics, analyzing interrelationships between groups, and illustrating ideas in presentations.

## Examples

### Basic Overlap
> "Two circles might be used to qualitatively depict two sets of buyers. One circle might indicate the set of buyers that bought brand X cars from a given dealer and the other circle the set of buyers that bought red cars from the same dealer... If one wanted to convey the idea that some of the same buyers appear in both circles (i.e., they bought red brand X cars), the two circles might be drawn overlapped." (p. 435)

### Quantified Venn Diagram
Harris provides a detailed example (p. 435):
- Universe: 500 car buyers
- Set A (Brand X buyers): 175 total (150 non-red + 25 red)
- Set B (Red car buyers): 100 total (75 non-brand-X + 25 brand X)
- Intersection (A and B): 25 buyers of red brand X cars
- Complement: 250 buyers who bought neither brand X nor red cars

### Three-Set Overlap
> "An example of a Venn diagram with three symbols and two levels of overlapping is shown at the left. One level of overlap indicates that each pair of departments shares responsibility in some areas (gray). The other level indicates that all three departments share responsibility in other areas (black)." (p. 435)

## Usage

### Key Terminology
- **Universe/Universal set**: The total population containing all elements of all sets
- **Intersection**: Elements common to multiple sets
- **Complement**: Elements not part of specified sets
- **Subset**: A set totally inside another set
- **Disjointed sets**: Sets with no common elements (no overlap)
- **Union**: When two sets combine into one

### Variations

**Subsets**: When a set is totally inside another set, it provides more detail (e.g., two-door brand X cars form a subset of all brand X cars).

**Disjointed sets**: When two sets have no common elements, they are drawn without touching.

**Union**: When two sets combine, the union functions as a single set and can intersect with other sets.

### Design Choices

**Shape of symbols**: Although circles are typical, other shapes can be substituted. Symbols in a diagram do not have to be the same shape.

**Color, shading, and patterns**: Used extensively to designate specific areas or highlight certain features.

**Labels**: Can be placed inside circles or on the circumference. Circumference placement is sometimes preferred because it reduces confusion about whether the label applies to the entire set or just a portion.

**Segment identification**: Individual segments of intersecting circles can be identified by lowercase letters while uppercase letters identify entire sets. Actual values for segments can also be shown, including totals.

## Notes

Nonquantitative Venn diagrams are sometimes considered variations of conceptual diagrams. When quantified, values are placed directly on the data graphics or identified through legends, but generally no attempt is made to make symbol sizes proportional to values.
