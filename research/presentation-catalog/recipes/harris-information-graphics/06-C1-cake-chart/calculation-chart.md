---
name: Calculation Chart
slug: calculation-chart
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Calculation Chart/Tree, p. 64"

intent: Illustrate graphically how a given value is calculated using words, boxes, and lines instead of mathematical notation
direction: both

components:
  - element: boxes
    encodes: Individual elements or values in the calculation
    required: true
  - element: connecting-lines
    encodes: Mathematical relationships (addition, multiplication, division) between elements
    required: true
  - element: labels
    encodes: Names of values, categories, or operations
    required: true
  - element: arrows
    encodes: Direction of calculation flow (optional)
    required: false
  - element: actual-values
    encodes: Numeric amounts within boxes (optional)
    required: false

parameters:
  orientation: horizontal | vertical
  complexity: simple | detailed | comprehensive
  value_display: labels_only | with_amounts | with_amounts_and_labels

related: []

warnings:
  - "Complexity should match intended purpose - too much detail obscures the main calculation"
  - "Same result can be arrived at using different calculation methods; choose layout that best serves communication goal"

extensions:
  harris_entry: "Calculation Chart/Tree"
  alternate_names: ["calculation tree"]
  typical_use: "explaining financial calculations, showing what elements contribute to a result, troubleshooting variations"
---

## Description

A calculation chart illustrates graphically how a given value is calculated. Instead of using typical mathematical symbols and notations, a calculation chart generally uses only words, boxes, and lines. This approach makes calculations more understandable for those not familiar with mathematics.

The chart accomplishes several purposes:
- Makes calculations more understandable for non-mathematical audiences
- Shows the elements that go into the final result
- Helps in explaining and troubleshooting variations in the final result
- Defines the areas, departments, indicators, etc., that impact the end result
- Shows, through multiple charts, how the same result can be arrived at using different calculation methods

## Examples

Harris provides a detailed example calculating return on assets (p. 64):

> The diagram shows how return on assets is calculated from operating profit divided by total assets. Operating profit comes from sales minus total costs and expenses. Total costs and expenses aggregate labor costs, material costs, factory overhead, selling expenses, general expense, and admin expenses. Current assets combine inventories, accounts receivable, and cash. Total assets combine current assets and fixed assets.

The simplest form would have only three boxes: operating profit, total assets, and return on assets. A more detailed version breaks each category down further - fixed assets into land, facilities, equipment, and vehicles; inventories into raw material, work-in-process, and finished goods.

> "Various shaped enclosures, different colors, different type styles, etc., might be used to encode additional information such as the organization responsible, over or under budget, internally or externally controlled, value increasing or decreasing, etc." (p. 64)

## Usage

Calculation charts are most effective when:
- Explaining financial metrics to non-financial audiences
- Documenting how key performance indicators are derived
- Troubleshooting why a calculated result changed
- Training new employees on business metrics
- Presenting to audiences unfamiliar with mathematical notation

The complexity of a calculation chart should match its intended purpose:
- For showing the simplest way to calculate a value: use minimal boxes
- For showing contributing elements: break categories into components
- For showing actual impact: include dollar amounts in boxes

## Notes

Calculation charts can include actual values to give viewers a feel for the size of each element and its impact on the ultimate value. The example shows inventories at $4,875 thousand, accounts receivable at $12,425 thousand, etc., flowing into current assets of $24,371 thousand.

Words are used instead of mathematical symbols to describe operations: "Divided By" replaces division symbols, "Minus" replaces subtraction, "Multiplied By" replaces multiplication.
