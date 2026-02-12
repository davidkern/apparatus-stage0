---
name: Nomograph
slug: nomograph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Nomograph, p. 248"

intent: Solve equations involving three or more variables graphically by aligning a straight line across calibrated scales
direction: both

components:
  - element: variable-scales
    encodes: Calibrated axes for each variable in the equation (minimum three)
    required: true
  - element: alignment-line
    encodes: Straight line connecting values that satisfy the equation
    required: true
  - element: scale-labels
    encodes: Variable names and units for each scale
    required: true

parameters:
  scale_type: "linear | logarithmic | nonlinear"
  configuration: "parallel | N-shaped | Z-shaped | V-shaped"
  operation: "addition | subtraction | multiplication | division | complex"

related: []

warnings:
  - "Precision is proportional to the size of the graph and detail of the scales"
  - "Upper and lower scale limits must be set appropriately for the application"
  - "Many scales do not start at zero"

extensions:
  harris_entry: "Nomograph"
  alternate_names: ["nomogram", "calculation graph", "alignment graph"]
  typical_use: "repetitive calculations, quick reference lookup"
---

## Description

Nomographs are sometimes thought of as special-purpose calculators or reference tables. They are particularly useful in situations where a given calculation is done repetitively or where a convenient, quick reference document is desired.

A nomograph is designed to solve an equation involving three or more variables. It consists of three or more scales arranged so that a straight line crossing each of the scales intersects the scales at values that satisfy the equation. The equation might be complex or as simple as A + B = C.

## Examples

Harris demonstrates the basic concept:

> "A nomograph is designed to solve an equation involving three or more variables. It consists of three or more scales arranged so that a straight line crossing each of the scales intersects the scales at values that satisfy the equation. The equation might be complex, or as simple as A + B = C." (p. 248)

For a simple addition/subtraction nomograph:

> "A straight line connecting numbers in scales A and B crosses scale C at a number equal to the sum of the two numbers connected in scales A and B. Alternately, a straight line connecting numbers in scales A and C crosses scale B at a number equal to the difference between the numbers in C and A." (p. 248)

On the flexibility of nomograph design:

> "Multiplication and division can be performed as easily as addition and subtraction. Linear and nonlinear scales are used. Nomographs can be arranged multiple ways to perform the same function." (p. 248)

Harris describes a powerful feature:

> "The graph on the left also demonstrates a unique feature of nomographs that allows the user to pivot a straight line around a fixed value for one of the variables to see all possible combinations of the other two variables that satisfy the equation. In this example, the lines show combinations of A and B that when multiplied together equal 50." (p. 248)

The illustrations show multiple nomograph configurations:
- Parallel scales for addition/subtraction
- Parallel nonlinear scales for multiplication
- Parallel linear scales for multiplication (different arrangement)
- Chart with plus and minus values, log and linear scales, and two scales on one axis
- Double N or Z chart for situations with four variables
- V-shaped chart for special applications

## Usage

Nomographs are valuable when:
- The same calculation is performed repeatedly
- Quick field references are needed without calculators
- Training users to understand relationships between variables
- Historical applications before electronic calculators were widespread

Design considerations:
- **Scale limits**: Based on realistic ranges for the application
- **Precision**: Proportional to graph size and scale detail
- **Configuration**: Chosen based on the equation form and required precision
- **Scale types**: Linear for addition/subtraction; logarithmic for multiplication/division

The technique of pivoting around a fixed value is particularly powerful for exploring trade-offs - for example, pivoting around a desired flow rate to see what combinations of pipe diameter and velocity achieve that flow.

## Notes

While nomographs have been largely superseded by electronic calculators and computers for general calculation, they retain value in specialized applications: field references where electronics may not be available, training aids for understanding variable relationships, and historical documentation of engineering standards.
