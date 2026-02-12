---
name: Power Scale
slug: power-scale
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Scale, Power scale, p. 336"

intent: Configure a scale where displayed values are a power transformation of underlying linear values
direction: both

components:
  - element: major-tick-marks
    encodes: Primary scale divisions at equal physical intervals
    required: true
  - element: labels
    encodes: Power-transformed values (e.g., squares of linear values)
    required: true
  - element: axis-line
    encodes: Reference line along which scale is drawn
    required: true

parameters:
  power: "exponent applied to linear values (e.g., 2 for squares, 0.5 for square roots)"
  base_interval: "linear interval underlying the transformation"

related: []  # TBD: linear-scale, logarithmic-scale

warnings:
  - "Equal physical distances represent unequal amounts"
  - "The relationship between position and value is non-intuitive"

extensions:
  harris_entry: "Scale"
  typical_use: "specialized applications requiring power transformations"
  scale_property: "equal distances represent values raised to a power"
---

## Description

In a power scale, the values shown are based on some power of the values in a linear scale. The physical spacings between major scale values are all equal, but the numerical increments are not.

For example, if the underlying linear values are 0, 2, 4, 6, 8, and 10, and the power is 2 (squaring), the displayed scale values would be 0, 4, 16, 36, 64, and 100. These values appear at equal physical intervals even though the numerical differences between them vary (4, 12, 20, 28, 36).

Alternatively, a power scale can be understood as a scale with values such that taking each value to a particular power yields a linear scale. In the example above, taking the square root (power of 0.5) of 0, 4, 16, 36, 64, 100 yields the linear sequence 0, 2, 4, 6, 8, 10.

## Examples

> "In a power scale, the values shown are based on some power of the values in a linear scale. For instance, in the example above, the values are the squares (power of two) of the linear values of 0, 2, 4, 6, 8, and 10." (p. 336)

The PDF shows a power scale from 0 to 100 with major tick marks at 0, 4, 16, 36, 64, and 100. These are the squares of 0, 2, 4, 6, 8, and 10. The notation "Equal distances & unequal amounts" emphasizes the non-linear relationship.

## Usage

Power scales are appropriate when:
- Data follows a power-law relationship
- Linearizing squared or cubed relationships
- Area-based measurements where perception follows square-root law
- Specialized scientific or engineering applications

Power scales are less common than linear or logarithmic scales and require clear labeling to avoid misinterpretation.

## Notes

Power scales can be constructed using any power. Common applications include square scales (power of 2) for area-based data and square-root scales (power of 0.5) for perceptual adjustments. The choice of power depends on the mathematical relationship in the underlying data.
