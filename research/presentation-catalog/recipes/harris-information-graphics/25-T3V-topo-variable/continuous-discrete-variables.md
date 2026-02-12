---
name: Continuous and Discrete Variables
slug: continuous-discrete-variables
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Variable, p. 431"

intent: Distinguish variables that can take any value within a range from those that take only specific values to guide appropriate display methods
direction: both

components:
  - element: continuous-variable
    encodes: Quantitative data that can take any value within a range (determined by measurement)
    required: false
  - element: discrete-variable
    encodes: Data that takes only specific values with no gradations between (often determined by counting)
    required: false

parameters:
  variable_type: "continuous or discrete"
  data_source: "measurement or counting"

related: []

warnings:
  - "Discrete quantitative variables should not be interpolated between values"
  - "Categorical discrete variables have no inherent relationship between elements"
  - "Continuous variables displayed as discrete (binned) lose precision"

extensions:
  harris_entry: "Variable"
  typical_use: "determining whether interpolation is meaningful and what graph types are appropriate"
---

## Description

Variables are classified as continuous or discrete based on whether they can take any value within a range or only specific, separated values.

**Continuous variables** (sometimes called indiscrete) are quantitative variables that can take any value within a given range. For example, outdoor temperature can be any fraction of a degree between its lowest and highest values. The amount of rainfall can be any fraction of an inch from zero to its maximum. Values for continuous variables are typically determined by measurement.

**Discrete variables** (sometimes called discontinuous) might be quantitative or qualitative. When quantitative, elements take on only specific values with nothing in between. For example, when counting people, there are only whole numbers. There are either ten or eleven people, not ten and a fourth. When a discrete variable is quantitative, values are frequently determined by counting.

In many cases, elements of a discrete variable have no relationship to one another, especially if categorical. Companies A, B, C, and D are discrete entities with no gradations in between and perhaps nothing more in common than that they are all companies.

## Examples

Harris illustrates both types with graphs (p. 431):

**Continuous examples**:
- Temperature over time (can be any value, determined by measurement)
- Distance from stage (can be any value along the continuum)

**Discrete examples**:
- Number of employees at different companies (whole numbers only, determined by counting)
- Type of buyer: Wholesaler, Distributor, Retailer, End user (categorical, no gradations between)

> "A continuous variable is a quantitative variable that can take on any value within a given range. For example, the outdoor temperature can be any fraction of a degree between its lowest and highest temperatures." (p. 431)

> "A discrete variable might be quantitative or qualitative. When quantitative, the elements take on only specific values and no values in between. For example, when counting people, there are only whole numbers and nothing in between. There are either ten or eleven people, not ten and a fourth, etc." (p. 431)

## Usage

The continuous/discrete distinction affects visualization choices:

**For continuous variables**:
- Line graphs are appropriate (interpolation between points is meaningful)
- Area graphs make sense (the area under the curve is meaningful)
- Smooth curves can connect data points
- Any value along the scale is potentially valid

**For discrete quantitative variables**:
- Column/bar graphs may be more appropriate than lines
- Step functions rather than smooth curves
- Points should not be interpolated
- Only specific values on the scale are valid

**For discrete categorical variables**:
- Order of categories may be arbitrary
- Bar charts with separated bars
- No interpolation is meaningful
- Each category is independent

Display decisions:
1. Determine if the variable is measured (likely continuous) or counted (likely discrete)
2. For continuous variables, consider line graphs with connected points
3. For discrete quantitative variables, consider column graphs or point graphs without connecting lines
4. For discrete categorical variables, use bar charts or other categorical displays

## Notes

The distinction has practical implications for graph interpretation. A line connecting points on a continuous variable graph suggests all intermediate values are valid. A line connecting points on a discrete variable graph may mislead viewers into thinking intermediate values exist.

Some variables that are technically discrete are treated as continuous when the discrete steps are small relative to the range (e.g., currency in cents when the range is thousands of dollars).
