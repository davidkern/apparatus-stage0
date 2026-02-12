---
name: Equation Function Graph
slug: equation-function-graph
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Equation/Function Graph, p. 146-147"

intent: Display mathematical equations visually by plotting points that satisfy the equation and connecting them, enabling exploration of mathematical relationships
direction: both

components:
  - element: quantitative-axes
    encodes: Variable ranges for the equation
  - element: plotted-curve
    encodes: All points (x,y) or (x,y,z) that satisfy the equation
  - element: axis-limits
    encodes: Boundaries defining visible portion of the function
  - element: equation-label
    encodes: The mathematical formula being displayed
    required: false

parameters:
  dimensions: two | three
  rendering: continuous-line | mesh-surface
  equation_count: single | family

related: []

warnings:
  - "Axis limits dramatically affect how the curve appears; explore multiple ranges"
  - "3D equations rendered as solid surfaces may be difficult to interpret"

extensions:
  harris_entry: "Equation/Function Graph"
  alternate_names: []
  typical_use: "exploring mathematical relationships, planning scenarios, visualizing formulas for analysis"
---

## Description

Most equations can be displayed graphically by plotting points that satisfy the equation and connecting them with lines. Computer graphing tools automate this by calculating many points and drawing continuous curves. Graphs of equations typically have quantitative scales on all axes.

The visual representation transforms abstract mathematical relationships into perceivable shapes, enabling pattern recognition and insight that formulas alone may not provide.

## Examples

Harris shows equations of varying complexity (p. 146):

Simple linear: Y = 75, Y = 1.35X
Quadratic: Y = 14 + .23X
Parabolic: Y = .0005 * (X - 20)^2 * (50 - X)
Three-dimensional: Z = X^2 - 3X + Y^2 - 6Y + 200

**Three-dimensional rendering:**
> "If an equation describes a surface on a three-dimensional graph and all points that satisfy the equation are plotted, a solid data graphic results... This many times makes it difficult to interpret the graph. To overcome this problem, only a limited number of values along the X and Y axes are typically plotted, which results in a mesh or fishnet appearance."

**Specifying limits:**
> "When graphing equations, limits must be established... The person doing the analysis generally decides which graph is most meaningful or if several are required to fully understand the nature of the equation and the phenomenon it describes."

Harris shows four plots of the same equation (Y = 5X^6 - 54X^5 + 60X^4 + 10) with different axis limits, demonstrating how limit choices reveal different aspects of the function.

**Families of equations:**
> "In order to consider combinations of changes in the two variables, multiple equations (sometimes called a family of equations) are plotted on the same graph."

The business example shows earnings per share as function of shares outstanding and total earnings, with multiple curves enabling selection among alternatives.

## Usage

Equation graphs serve multiple purposes:
- **Mathematical exploration**: Visualizing function behavior
- **Business planning**: Showing option spaces and trade-offs  
- **Scientific analysis**: Understanding model predictions
- **Education**: Making abstract relationships concrete

For planning purposes, families of curves present options for decision-makers. The example shows how to achieve a target earnings-per-share through various combinations of earnings increases and share reductions.

## Notes

The choice of axis limits is not neutral. Different ranges reveal different aspects of a function: local behavior vs. global trends, critical points vs. asymptotic behavior. When exploring unfamiliar equations, generating multiple views with different limits provides fuller understanding.

Three-dimensional equations benefit from mesh/fishnet rendering where only selected isolines appear, creating a translucent surface that shows shape without obscuring detail.
