---
name: Break-Even Graph
slug: break-even-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Break-Even Graph, p. 60"

intent: Determine the volume of business at which total sales equals total costs, identifying the threshold for profitability
direction: both

components:
  - element: total sales line
    encodes: Revenue as a function of units sold
    required: true
  - element: total costs line
    encodes: Sum of fixed and variable costs as a function of units
    required: true
  - element: fixed costs region
    encodes: Costs that do not vary with production volume
    required: true
  - element: variable costs region
    encodes: Costs that increase with production volume
    required: true
  - element: break-even point
    encodes: The intersection where sales equals costs
    required: true
  - element: profit region
    encodes: Area above break-even where sales exceeds costs
    required: false
  - element: loss region
    encodes: Area below break-even where costs exceed sales
    required: false

parameters:
  horizontal_axis: "units | volume | time"
  line_shape: straight | curved | stepped
  layout_variant: "standard | inverted"

related: []  # TBD: see also line-graph, grouped-line-graph

warnings:
  - "In practice it is not easy to apply with a high degree of accuracy due to the difficulty of accurately estimating and allocating each of the values"
  - "In a theoretical break-even graph, the lines are generally drawn straight. In practice these lines might be straight, curved, or stepped"

extensions:
  harris_entry: "Break-Even Graph"
  alternate_names: []
  typical_use: "business planning, pricing decisions, production volume analysis"
  scale_types:
    horizontal: "quantitative (units)"
    vertical: "quantitative (dollars)"
---

## Description

A break-even graph is a special application of a grouped line graph used to estimate when the total sales of a company equals the total costs of the company: the break-even point. The same concept and graph can also be applied to a product, a type of service, or any facet of a business where sales and fixed and variable costs can be identified and the variable costs calculated on a per unit basis.

One of the main purposes in establishing the break-even point is to determine the volume of business a company must do to begin making a profit.

## Examples

Harris provides two layout variations (p. 60):

**Standard layout**: The upper example shows:
- Units (e.g., pieces, volume, time) on the horizontal axis
- Total sales dollars and total costs on the vertical axis
- Fixed costs as a horizontal band at the bottom
- Variable costs building upward from fixed costs
- Break-even point where the total sales line crosses the total costs line
- Profit region above the intersection
- Loss region below the intersection
- Annotation showing "Volume that must be sold to reach break-even point"

**Inverted layout**: The alternate variation shows the same information with a different visual arrangement, placing the break-even point in a different visual position but yielding the same result.

> "In theory the graph is valuable and easy to use and understand. In practice it is not easy to apply with a high degree of accuracy due to the difficulty of accurately estimating and allocating each of the values."

## Usage

**Horizontal axis**: Units (e.g., pieces, volume, time) are generally shown on the horizontal axis.

**Vertical axis - Sales**: Total sales dollars are plotted as one of the variables on the vertical axis. Total sales typically include such things as product mix, various discount schedules, returns, etc.

**Vertical axis - Costs**: The other variable plotted is total costs, both direct and indirect. The categories of fixed and variable may differ from application to application.

**Line shapes**: In a theoretical break-even graph, the lines are generally drawn straight. In practice these lines might be straight, curved, or stepped, depending on the actual cost and revenue structures.

**Interpretation**: Where the sales and total cost line intersect is considered the break-even point, beyond which the company, product, etc., being studied theoretically begins making a profit.

## Notes

The break-even graph combines analytical utility with visual communication. While the concept is straightforward, practical application requires careful estimation of:
- Fixed costs (rent, salaries, equipment)
- Variable costs per unit (materials, direct labor)
- Pricing and revenue per unit
- How these values change at different volume levels

The graph is most useful for understanding the general relationship between volume and profitability rather than determining precise break-even volumes.
