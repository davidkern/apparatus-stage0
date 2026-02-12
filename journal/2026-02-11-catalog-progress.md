# Presentation Catalog Progress

Validated the recipe extraction methodology on Tufte's *Visual Display of Quantitative Information*
Chapter 6: Data-Ink Maximization and Graphical Design.

## Results

Ran the extraction prompt at `recipes/tufte-vdqi/ch6-maximization/_prompt/extract.md` against
the source PDF (pp. 123-137). The extraction produced **8 recipes**, all passing validation:

| Recipe | Slug | Description |
|--------|------|-------------|
| Erased Box Plot | `erased-box-plot` | Simplify parallel schematic plots by removing redundant lines |
| Bar Chart Redesign | `bar-chart-redesign` | Progressive simplification via erasing frame, axis, ticks |
| White Grid | `white-grid` | Show coordinates through gaps in data elements |
| Range-Frame | `range-frame` | Axes extending only to observed data min/max |
| Quartile Plot | `quartile-plot` | Range-frame extended with five-number summary |
| Dot-Dash-Plot | `dot-dash-plot` | Scatterplot framed with marginal distributions |
| Rugplot | `rugplot` | Connect multiple scatterplots via shared marginal fringes |
| Stem-and-Leaf Plot | `stem-and-leaf-plot` | Distribution display using data values as graphical elements |

## Implementability Assessment

The recipes have the structure needed for implementation:

**Actionable parameters** (from bar-chart-redesign):
```yaml
parameters:
  frame: present | absent
  vertical_axis: full | ticks-only | none
  baseline: solid | thin | absent
  grid_style: black-lines | white-gaps | none
```

**Component structure** (from quartile-plot):
```yaml
components:
  - element: x-axis-segment
    encodes: Full range (min to max) of X variable
  - element: y-quartile-marks
    encodes: First quartile, median, third quartile positions on Y axis
```

**Step-by-step guidance** in body text with quoted rationale from Tufte.

These recipes could directly inform a presently rendering implementation.

## Methodology Validation

The context/prompt system worked smoothly:

1. `recipes/_context.md` — General extraction guidance
2. `recipes/tufte-vdqi/_context.md` — Source-specific terminology and patterns
3. `recipes/tufte-vdqi/ch6-maximization/_prompt/extract.md` — Chapter-specific extraction prompt

The multimodal extraction correctly identified visual redesigns from the figures, not just
the prose descriptions. This matters for Tufte since the figures carry as much information
as the text.

## Current State

| Source | Chunk | Recipes | Status |
|--------|-------|---------|--------|
| Aristotle (Kennedy) | b2-05-argument | 44 | Complete |
| Tufte VDQI | ch6-maximization | 8 | Complete |

Total: **52 validated recipes** across two foundational sources.

## Consolidation Dry-Run

Ran consolidation analysis on Aristotle b2-05-argument (44 recipes) without saving changes.
Confirmed the consolidation machinery works:

- Identified ~40 cross-references to add within the collection
- Found fallacy-to-topic relationships (fallacies that "corrupt" valid topics)
- Coverage complete: all 28 topics, all 9 fallacies present
- Consistency strong: location format, Greek transliteration all uniform

Schema observation: Analysis proposed a `corrupts` relationship type. Current schema has:
contains, contained-by, contrasts, combines-with, variant-of. May need expansion.

## Third Source Selection

Starting point: Rich library (terminal rendering). Expanded the set of what it produces
(tables, trees, panels, progress bars, etc.) to find the larger conceptual family.

After exploring candidates (Bertin, Bringhurst, Müller-Brockmann, Schriver), settled on:

| Source | Role | Pages |
|--------|------|-------|
| **Engelhardt** - The Language of Graphics (2002) | Grammar/theory | 169 |
| **Harris** - Information Graphics (1999) | Vocabulary/catalog | 448 |

Engelhardt provides systematic framework (10 graphic types, syntactic relations, building blocks).
Harris provides concrete examples (850+ entries, 4000 illustrations).

## Source Preparation Methodology

Created `methodology/source-preparation.md` documenting PDF splitting process:
- Prerequisites (poppler-utils)
- Chunk boundary planning
- Splitting commands (with sort -V fix for numeric ordering)
- **Verification step** — critical addition for checking semantic boundaries

Added `poppler-utils` to devenv.nix for PDF tools.

## Engelhardt Chunking

Split into 10 chunks (169 pages total):

| Chunk | Pages | Content |
|-------|-------|---------|
| ch1-intro | 20 | Ch1 + Ch2 intro |
| ch2a-relations | 33 | Object-to-object relations |
| ch2b-spaces | 25 | Meaningful spaces, syntactic roles |
| ch2c-composite | 16 | Composite structures |
| ch3a-correspondence | 24 | Types of correspondence |
| ch3b-expression | 18 | Mode of expression, roles |
| ch4-classification | 14 | 10 primary + 6 hybrid types |
| ch5-analysis | 10 | Analysis methods |
| ch6-conclusions | 4 | Conclusions |
| glossary | 5 | Term definitions |

**Bugs found and fixed:**
1. Shell glob sorting: `page-100.pdf` sorted before `page-92.pdf` lexicographically.
   Fix: Use `sort -V` for version/numeric sorting.
2. Mid-section splits: Initial boundaries cut sections in half, losing context.
   Fix: Added verification step, adjusted 3 boundaries (ch2a/2b, ch2b/2c, ch3a/3b).

## Next Steps

1. Split Harris using same methodology (fresh session to validate procedure)
2. Set up extraction prompts for Engelhardt
3. Run extraction on both new sources
4. Extract remaining Tufte and Aristotle chunks as batch
