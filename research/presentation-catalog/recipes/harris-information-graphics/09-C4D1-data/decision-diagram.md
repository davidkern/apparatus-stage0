---
name: Decision Diagram
slug: decision-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Decision Diagram, pp. 130-132"

intent: Visualize alternative decisions or actions and their potential outcomes to support decision-making
direction: both

components:
  - element: decision-points
    encodes: Points where a choice must be made, typically shown as diamonds or squares
    required: true
  - element: branches
    encodes: Lines connecting decisions to outcomes or subsequent decisions
    required: true
  - element: outcomes
    encodes: Terminal nodes showing results of decision paths, often as rectangles
    required: true
  - element: probability-values
    encodes: Likelihood of each branch occurring (in probabilistic diagrams)
    required: false
  - element: monetary-values
    encodes: Financial impact associated with branches or outcomes
    required: false
  - element: time-scale
    encodes: When decisions will be made
    required: false

parameters:
  diagram_type: binary | multiple-choice | active | passive | tree
  orientation: horizontal | vertical
  quantification: none | probabilities | monetary | both

related: []  # TBD: see also flow-chart, tree-diagram

warnings:
  - "Only those familiar with the data can determine whether outcomes are accurately estimated"
  - "Probabilities at each decision point should sum to 100%"
  - "Complex sequential decisions may become difficult to read"

extensions:
  harris_entry: "Decision Diagram"
  alternate_names: ["decision chart", "decision tree", "decision flow chart"]
  typical_use: "pricing policy, plant sizing, research project selection, proposal evaluation, job decisions"
---

## Description

A decision diagram is a graphic representation of alternative decisions or actions that might be taken, plus potential outcomes resulting from those decisions and actions. The ability to see options and estimated outcomes before decisions are made is one of the main advantages of decision diagrams.

Such diagrams can be used by almost any type of organization to make simple or complex decisions on a qualitative or quantitative basis. Applications include establishing pricing policy, deciding the size of a new plant, determining which research projects to pursue, deciding which proposal to accept, and personal decisions like whether to change jobs.

## Examples

**Binary Decision Diagram** (p. 130)
> "If each decision point on a diagram allows only one of two decisions (e.g., yes or no), the chart is called a binary decision diagram."

Harris shows an example with diamond-shaped decision points asking questions like "Will competition follow our price increase?" with Yes/No branches leading to further decisions or outcomes like "Raise prices now" or "Delay price increase."

**Multiple-Choice Decision Diagram** (p. 130)
> "If more than two options are possible at decision points the chart is sometimes called a multiple-choice decision diagram."

The example shows Decision 1 branching to Decisions 2, 3, and 4, each with their own subsequent decisions leading to Outcomes A through I.

**Combination Decision and Flow Chart** (p. 131)
> "In some cases decision diagrams include only symbols that represent decisions. In other cases symbols representing other events and activities are also included. This latter variation is frequently called a flow chart."

Harris notes that arrow heads indicate direction of flow, which is particularly important when feedback loops are included.

**Passive Decision Diagram** (p. 131)
> "In addition to aiding individuals or organizations in making their own decisions (an active decision diagram), decision charts are sometimes used to estimate outcomes based on decisions made by others (passive decision diagram)."

The example shows a cement company estimating which subcontractor will receive work based on decisions by others (the organization having work done, prime contractors, and subcontractors), with probabilities assigned to each branch. The analysis reveals Subcontractors C and E have the highest probability (25% and 31%) of receiving contracts.

**Tree Diagram with Monetary Values** (p. 132)
> "In addition to utilizing probabilities, the decision tree also incorporates monetary values and combinations of the two. This type of diagram is sometimes used when making risk decisions in which probabilities are assigned to each uncontrollable event."

Key terminology:
- Squares represent decisions or action points
- Circles represent event or chance points (over which decision maker has no control)
- Nodes are numbered for reference
- Branches emanating from chance points show "states of nature" with probabilities
- Outcomes/payoffs appear in the rightmost column

> "Such diagrams are typically horizontal, constructed from left to right, and are analyzed from right to left. For example, in analyzing a diagram, the most desirable outcome is selected from all possible outcomes... Next, the path is followed from right to left to see what decisions have to be made to achieve the desired outcome."

## Usage

**Diagram orientation:**
- Horizontal diagrams progress from left to right
- Vertical diagrams proceed from top to bottom

**Quantification approaches:**
1. Qualitative only: Just shows decision options and outcomes
2. With probabilities: Assigns likelihood to each branch
3. With monetary values: Shows costs or payoffs for each path
4. Combined: Uses expected monetary value (EMV) calculations

**Time scales:**
> "Time scales can be used to give some indication as to when certain decisions will be made."

The passive decision diagram example includes a timeline showing when each decision maker (organization, prime contractor, subcontractor) will make their decision.

**Sequential decisions:**
> "In an actual situation one series of decision and chance events may be all that is involved. In some cases, however, two or more such sequences follow one another. These are called sequential decisions or multiperiod decision processes."

## Notes

The distinction between active and passive diagrams is important:
- **Active**: You are making the decisions; the diagram helps you choose
- **Passive**: Others are making decisions; the diagram helps you estimate likely outcomes

Symbol conventions vary but typically:
- Diamonds indicate decision points
- Rectangles indicate events, activities, or outcomes
- Circles indicate chance events in decision trees
- Lines with arrows show flow direction
