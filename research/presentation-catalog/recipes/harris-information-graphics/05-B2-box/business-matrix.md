---
name: Business Matrix
slug: business-matrix
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Business Matrix, p. 63"

intent: Plot entities on a two-dimensional grid with subjective or relative axes to categorize, compare, or guide strategic decisions
direction: both

components:
  - element: grid
    encodes: Two-dimensional framework typically 2x2 to 5x5
    required: true
  - element: axis labels
    encodes: Variables being compared, often subjective (e.g., low/medium/high)
    required: true
  - element: quadrant/cell labels
    encodes: Categories or suggested actions for entities in that region
    required: false
  - element: entity markers
    encodes: Things being analyzed (products, people, companies)
    required: true
  - element: marker size
    encodes: Additional quantitative variable (e.g., sales, market share)
    required: false

parameters:
  grid_size: "2x2 | 3x3 | 4x4 | 5x5"
  marker_type: dots | circles | pie-charts | words
  size_encoding: uniform | proportional
  axis_type: subjective | quantitative

related: []  # TBD: see also scatter-graph, bubble-graph

warnings:
  - "Axes are often subjective; placement of entities may involve judgment calls"
  - "Quadrant labels (e.g., stars, dogs, cash cows) may oversimplify complex situations"

extensions:
  harris_entry: "Business Matrix"
  alternate_names:
    - "portfolio matrix"
    - "strategic matrix"
    - "2x2 matrix"
  typical_use: "product portfolio analysis, competitive positioning, candidate evaluation, strategic planning"
---

## Description

The basic grid of a business matrix typically consists of two to five rows and columns. The vertical and horizontal axes display variables which are often subjective, such as breadth of product line, industry attractiveness, or relative quality. There generally are a minimum of labels; simple terms such as low, medium, and high or relative values such as one to five are frequently used.

Once the labels are designated, cells may be assigned terms or phrases that describe the things plotted (e.g., stars, dogs, cash cows, achievers, people-oriented) or suggest an action that might be taken (e.g., invest heavily, divest, analyze in more detail, put on fast track, deemphasize).

## Examples

Harris provides three variations (p. 63):

### Proportional Circle Example
> "Example where the diameter of the circles are proportional to some characteristic, such as sales, of the companies they represent."

Shows companies A, B, C, and D plotted on axes of "Quality" (1-5) vs "Breadth of product line" (1-5), with circle sizes indicating sales volume.

### Pie Chart Example
> "Example where two variables are encoded by means of pie charts. A third variable is encoded by the size of the pie charts."

Shows Products A, B, C, and D on axes of "Product strength" (Low/Medium/High) vs "Industry attractiveness" (High/Medium/Low), with pie charts of varying sizes encoding multiple variables per product.

### Labeled Quadrant Example
> "Example where labels are shown in each quadrant to describe or categorize entities in that quadrant. In this example it is salespersons."

Shows a 2x2 matrix with:
- "Focus on customer" (Low to High) on vertical axis
- "Focus on sale" (Low to High) on horizontal axis
- Quadrants labeled: "People oriented" (high customer, low sale), "Problem solving oriented" (high both), "Self oriented" (low both), "Goal oriented" (low customer, high sale)
- Individual salespeople (Smith, Green, Adams, Story, White, Kelly) plotted as dots

## Usage

**Typical applications** include:
- Analyzing product potentials
- Planning acquisitions and divestitures
- Developing market strategies
- Competitive analyses
- Comparing financial performances
- Prioritizing projects
- Evaluating candidates
- Analyzing human characteristics

**Marker options**: The things being studied are generally represented by words, a simple symbol (dots and circles are most common) or small pie charts (for designating multiple variables). The sizes of the circles and pie charts might be uniform or proportional in size to some characteristic of the thing the circle represents.

**Positioning**: When circles and pie charts are used, the centers of the symbols designate the actual locations of the entities represented.

**Axis design**: Keep axis labels simple. Complex scales undermine the matrix's purpose of providing quick strategic insight.

## Notes

The business matrix is a strategic thinking tool rather than a precise analytical instrument. Its value lies in:
- Forcing explicit consideration of multiple dimensions
- Creating a shared visual framework for discussion
- Highlighting patterns in how entities cluster
- Suggesting strategic categories or actions

Famous examples include the BCG Growth-Share Matrix (stars, cash cows, question marks, dogs) and the GE-McKinsey Matrix.
