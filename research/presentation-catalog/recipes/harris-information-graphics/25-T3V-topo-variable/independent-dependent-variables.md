---
name: Independent and Dependent Variables
slug: independent-dependent-variables
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Variable, p. 430"

intent: Designate which variable in a relationship is the explanatory factor and which is the response to guide axis placement
direction: construction

components:
  - element: independent-variable
    encodes: The explanatory, causal, or manipulated factor
    required: true
  - element: dependent-variable
    encodes: The response, effect, or measured outcome
    required: true
  - element: axis-assignment
    encodes: Placement of variables on appropriate axes based on dependency
    required: true

parameters:
  relationship_type: "cause-effect or known-predicted or manipulated-measured or explanatory-response"

related: []

warnings:
  - "There is no single or simple definition for which variable should receive which designation"
  - "When plotting two unknown substances, there may be no clear dependency relationship"
  - "Category and sequence variables are almost always independent variables"

extensions:
  harris_entry: "Variable"
  typical_use: "determining axis placement when constructing graphs"
  axis_conventions:
    vertical_axis: "dependent variable (most graphs except bar)"
    horizontal_axis: "independent variable (most graphs) or dependent (bar graphs)"
    z_axis: "dependent variable (3D maps)"
---

## Description

Two related variables are often designated as independent and dependent with respect to one another. This designation guides how variables should be positioned on a graph, though Harris notes there is no single or simple definition for determining which designation applies.

The independent variable is generally understood as:
- The cause (effect is dependent)
- The known variable (predicted variable is dependent)
- The thing manipulated (measured outcome is dependent)
- Subject to independent change (response is dependent)
- The explanatory factor (response is dependent)
- Under experimental control (response is dependent)
- The case (variable is dependent)
- The invariant (component is dependent)

## Examples

Harris provides multiple ways to conceptualize the relationship (p. 430):

Independent variable corresponds to Dependent variable:
- Cause corresponds to Effect (the variable that is affected)
- Known variable corresponds to The variable that one is trying to predict
- Things that are manipulated corresponds to Things that are measured
- Subject to independent change corresponds to Affected by changes in independent variable
- Explanatory corresponds to Response
- Under experimental control corresponds to Response
- Case corresponds to Variable
- Invariant corresponds to Component

> "In some cases the decisions are easy. For example, category and sequence variables are almost always independent variables. In other cases it is more difficult. For example, if one is plotting the concentrations of two unknown substances, there may or may not be any interdependency and therefore it would be difficult to decide which, if either, is the independent and dependent variable." (p. 430)

## Usage

The primary use of this classification is to determine axis placement in graphs:

**Standard convention for most graphs**:
- Dependent variable on the vertical axis
- Independent variable on the horizontal axis

**Bar graphs**:
- Dependent variable on the horizontal axis
- Independent variable on the vertical axis (categories)

**Three-dimensional maps**:
- Dependent variable on the Z-axis (vertical)

**Tables and diagrams**:
- No generally accepted convention

Decision process:
1. Identify if one variable changes in response to another
2. If yes, the responsive variable is dependent
3. If the relationship is unclear or bidirectional, the designation may be arbitrary
4. Category and sequence variables default to independent
5. Place variables on axes according to convention

Common clear cases:
- Time (independent) vs. sales figures (dependent)
- Treatment condition (independent) vs. patient outcome (dependent)
- Geographic region (independent) vs. population (dependent)

Ambiguous cases:
- Two physical measurements of the same specimens
- Concentrations of two substances in a mixture
- Any correlation without clear causation

## Notes

The independent/dependent distinction is primarily a construction convention for determining graph layout. It does not necessarily imply actual causal relationships in the data.

When the relationship between variables is genuinely bidirectional or unknown, the choice of axis assignment may be arbitrary, but should be made consistently within a single analysis or presentation.
