---
name: Passive Decision Diagram
slug: passive-decision-diagram
source:
  work: "Information Graphics: A Comprehensive Illustrated Reference"
  author: Robert L. Harris
  location: "Passive Decision Diagram, p. 268"

intent: Estimate outcomes based on decisions made by others by mapping decision trees with probabilities to calculate overall likelihood of various results
direction: both

components:
  - element: decision-nodes
    encodes: Points where decisions are made by external parties
    required: true
  - element: decision-branches
    encodes: Options available at each decision point
    required: true
  - element: branch-probabilities
    encodes: Estimated probability of each option being chosen
    required: true
  - element: cumulative-probabilities
    encodes: Product of all preceding probabilities in a channel
    required: true
  - element: time-scale
    encodes: Optional indication of when decisions will be made
    required: false

parameters:
  decision_levels: 2 | 3 | 4+
  time_representation: present | absent

related:
  - slug: decision-tree
    relationship: variant-of

warnings:
  - "Passive diagrams estimate outcomes of others' decisions, unlike active diagrams which aid your own decisions"
  - "Probabilities at each level must sum to 100% for accurate calculation"

extensions:
  harris_entry: "Passive Decision Diagram"
  typical_use: "estimating outcomes when you have no influence on the decisions"
  calculation: "cumulative probability = product of all preceding probabilities in channel"
  contrast_with_active: "active diagrams aid your own decisions; passive diagrams estimate others' decisions"
---

## Description

In addition to aiding an individual or organization in making their own decisions (active decision diagram), decision charts are sometimes used to estimate outcomes based on decisions made by others (passive decision diagram).

This type of diagram is used when an organization wants to estimate probabilities of various outcomes but has no influence on the decisions that determine those outcomes.

## Examples

Harris illustrates (p. 268) a passive decision diagram for a cement company:

**Scenario:**
A cement company supplies material to subcontractors. The exact subcontractor awarded a contract is important to them, but they have no influence on:
- Which prime contractor gets the main contract
- Which subcontractor each prime contractor selects

**Structure of the diagram:**
- **Level 1 - Prime Contractor Selection:**
  - Prime Contractor 1: 40% probability
  - Prime Contractor 2: 40% probability
  - Prime Contractor 3: 20% probability

- **Level 2 - Subcontractor Selection:**
  Each prime contractor has different probabilities of selecting different subcontractors (A, B, C, D, or E)

- **Cumulative Probabilities:**
  > "These values represent the probability that a subcontractor will receive a contract through a particular channel and are the product of all of the preceding probabilities in that particular channel. For example, 12% is the product of 30% times 40%."

**Results table showing overall probabilities:**
| Subcontractor | Overall Probability |
|---------------|---------------------|
| A | 20% |
| B | 19% |
| C | 25% |
| D | 6% |
| E | 31% |

> "Based on these results, the cement company should probably concentrate their efforts on subcontractors C (25%) and E (31%)."

**Time scale option:**
The diagram includes a time scale (Aug through Apr) showing approximately when decisions will be made at each level.

## Usage

**When to use:**
- When you need to estimate outcomes but cannot influence the decisions
- When decisions are made in stages by different parties
- When you need to prioritize where to focus efforts based on probability

**Calculation method:**
Cumulative probability at any endpoint = product of all probabilities along the path from start to that endpoint

**Extending the diagram:**
The diagram can be expanded to additional levels. In the example, it could include a third level showing the probability of the cement company getting orders from each subcontractor.

> "There are no limitations on the number of levels of decisions that can be included in this type of diagram."

## Notes

The passive decision diagram is valuable for strategic planning when outcomes depend on others' decisions. By calculating cumulative probabilities, organizations can rationally allocate resources to the most promising opportunities.
