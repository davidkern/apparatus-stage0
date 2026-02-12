---
name: Ordering
slug: ordering
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Ordering, p. 259"

intent: Arrange information on a chart, graph, or table in a meaningful sequence to improve locatability and analysis
direction: construction

components:
  - element: sequence-criterion
    encodes: The basis for arrangement (alphabetical, numerical, ranked, attribute)
    required: true
  - element: ordered-elements
    encodes: The data items arranged according to the criterion
    required: true

parameters:
  ordering_method: alphabetical | numerical-sequence | ranked | by-attribute
  ranking_direction: ascending | descending

related:
  - slug: pareto-graph
    relationship: combines-with

warnings:
  - "Different ordering methods serve different purposes; choose based on whether the goal is location or analysis"
  - "When there are several types of interrelated data, consider ordering in multiple ways using a matrix format"

extensions:
  harris_entry: "Ordering"
  alternate_names:
    - "sorting"
  typical_use: "making information easier to locate and more meaningful for analysis"
  ordering_methods:
    alphabetize: "arrange by name/category alphabetically"
    numerical_sequence: "arrange by time card number, ID, etc."
    rank: "place in ascending or descending order by quantitative value"
    by_attribute: "arrange by address, product, religion, etc."
---

## Description

Ordering is the process of arranging information on a chart, graph, or table in some meaningful sequence. Four widely used methods are:

1. **Alphabetize**: Organize alphabetically by name/category
2. **Numerical sequence**: Organize by number (e.g., time card number)
3. **Rank**: Place in ascending or descending order by quantitative value
4. **By attribute**: Arrange by address, product, religion, etc.

Ordering makes information easier to locate, particularly when material is alphabetized or in numerical sequence, and more meaningful for purposes of analysis, particularly when information is ranked.

## Examples

Harris illustrates (p. 259) four bar graphs showing the same data ordered four different ways:
- Ordered alphabetically by name/category (Adams 67, Black 34, Crider 82, Dole 28, Eaton 54)
- Ordered by numerical sequence
- Ranked by quantitative value (descending: Crider 82, Adams 67, Eaton 54, Black 34, Dole 28)
- Ordered by attribute (region: East to West)

**Matrix ordering for interrelated data:**
When there are several types of interrelated data, it is sometimes advantageous to order it in several different ways. Harris shows a matrix example with six product lines ranked by:
- Dollars of sales
- Dollars of profit
- Profit as a percent of sales

> "If the data is ordered only one way, whether in tabular or graphical form, the viewer must mentally reorder the information to determine the other rankings. If the data is presented in a matrix form... the viewer can focus on the analysis without having to do any mental rearranging."

## Usage

**When to use each method:**
- **Alphabetical/numerical**: When the goal is to locate specific items quickly
- **Ranked**: When the goal is analysis and comparison of values
- **By attribute**: When grouping by category is meaningful

**Multiple orderings:**
For interrelated data with multiple characteristics worth comparing, consider presenting the same data ordered multiple ways in a matrix format. This allows viewers to focus on analysis rather than mental rearrangement.

## Notes

The choice of ordering method should match the primary use case: location (alphabetical, numerical) or analysis (ranked, by attribute).
