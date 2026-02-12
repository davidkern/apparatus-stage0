---
name: Graphical Linear Programming
slug: graphical-linear-programming
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Graphical Linear Programming, p. 178"

intent: Solve two-variable optimization problems graphically by plotting constraints and objective functions to find optimum solutions
direction: both

components:
  - element: constraint-lines
    encodes: Lines representing limitations (equal to, greater than, less than)
  - element: feasible-region
    encodes: Shaded polygon where all constraints are satisfied
  - element: vertexes
    encodes: Corner points of feasible region (candidates for optimum)
  - element: objective-function-lines
    encodes: Parallel lines (isolines) representing equal values of the objective
  - element: optimum-point
    encodes: Vertex where objective function is maximized or minimized

parameters:
  objective_type: "maximize | minimize"
  constraint_types: "equality | inequality (>=, <=)"

related: []  # TBD: isoline-graph, constraint-visualization

warnings:
  - "Only works for two-variable problems"
  - "All functions must be linear"
  - "No negative values allowed in standard form"

extensions:
  harris_entry: "Graphical Linear Programming"
  typical_use: "resource allocation, distribution problems, mixture and blend decisions"
---

## Description

Graphical linear programming is a graphical method for solving problems using the linear programming technique. It is basically restricted to problems that have only two variables, no negative numbers, and all linear functions.

Problems suited to this technique typically have two things in common: a single objective of maximizing or minimizing something (the objective function) and limitations (constraints) that are often stated as equalities or inequalities.

## Examples

Harris describes the three-step graphical solution process (p. 178):

**Step 1. Plot constraints and identify feasible region:**
> "Determine the mathematical expressions for the constraints and plot these equations to establish the region of feasible solutions."

The feasible region is the area where all constraints are satisfied simultaneously, bounded by a polygon.

**Step 2. Plot objective function lines:**
> "Determine the expressions for the objective function and plot a series of parallel lines with the slope of this equation."

These parallel lines (isolines) represent constant values of the objective. Moving farther from the origin increases the value (for maximization).

**Step 3. Find optimum:**
> "Overlay the two plots and determine the coordinates for the data point where the objective function line and the feasible solutions region just meet."

For **maximization**:
> "When maximizing something, one looks for the objective function line farthest from the origin that just touches the feasible solution area. That point at which the line just touches will be a vertex and is the optimum solution."

For **minimization**:
> "When minimizing something, one looks for the objective function line closest to the origin that just touches the feasible solution area."

Harris shows illustrated examples for both maximization (optimum at X=7, Y=5) and minimization (optimum at X=14, Y=0).

## Usage

**Problem requirements:**
- Exactly two variables (X and Y)
- Linear objective function (aX + bY)
- Linear constraints (inequalities or equalities)
- Non-negative values only

**Applications:**
- Resource allocation (how much of each product to make)
- Distribution problems (optimal routing)
- Mixture and blend decisions (ingredient proportions)

**Graphical process:**
1. Convert constraints to equations and plot on X-Y graph
2. Identify feasible region (intersection of all constraint areas)
3. Plot one objective function line, then identify parallel lines
4. Find vertex of feasible region that optimizes objective

**Terminology:**
- **Constraints**: Limitations forming the feasible region boundary
- **Feasible region**: Area satisfying all constraints (shaded polygon)
- **Vertexes**: Corner points of feasible region
- **Objective function lines**: Isolines of equal objective value
- **Optimum solution**: Vertex that maximizes/minimizes objective

## Notes

This graphical technique provides visual intuition for optimization that algebraic methods lack. While limited to two variables, it demonstrates concepts that extend to higher-dimensional linear programming solved computationally. The solution always occurs at a vertex of the feasible region.
