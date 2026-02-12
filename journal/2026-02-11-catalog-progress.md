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

## Harris Consolidation Experiment

After extracting 379 recipes from Harris across 25 chunks, ran consolidation. First attempt
used the original `consolidate-source.md` prompt. Results were poor:

**Problems with original approach:**

1. **Edited in place** — Deleted 38 "duplicate" files without merging unique content
2. **Mechanical framing** — Focused on deduplication rather than knowledge synthesis
3. **Missing context** — Had to discover that some "duplicates" were split entries spanning
   chunk boundaries; others were primary vs. secondary treatments
4. **Underspecified merging** — "Merge unique content" without defining what/how
5. **Wrong goal** — Cleaning up extraction artifacts rather than restructuring for intent

The implied goal: restructure knowledge to support intent-driven visualization selection.
System accepts user intent → produces visualization guidance. Needs to traverse:
Intent → Techniques → Chart Types → Construction.

Harris organizes alphabetically by chart name. Need to reorganize around:
- **Intents**: What user wants to communicate (compare, show change, part-to-whole, etc.)
- **Techniques**: Reusable patterns (stacking, grouping, 100% normalization, etc.)
- **Data requirements**: What constrains visualization choice
- **Components**: Shared building blocks (axes, scales, legends)

**Revised approach:**

Wrote new prompt: `harris-information-graphics/_prompt/synthesize.md`

Key changes:
1. **Read-only source** — Output to `_synthesized/`, don't modify extractions
2. **Phased approach** — Analysis → Structure Design → Synthesis
3. **"What to expect" section** — Explains split entries, primary vs. secondary, etc.
4. **Goal-oriented framing** — Restructure for intent navigation, not cleanup
5. **Flexible output** — Can use .md, .yaml, directory structure, symlinks

**Phase 1 results:**

Ran analysis phase. Produced `_synthesized/analysis.md` with:
- 10 communication intents identified (compare, show-change, part-to-whole, distribution, etc.)
- 13 reusable techniques (stacking, grouping, circular, matrix, proportional sizing, etc.)
- 5 data requirement dimensions
- 17+ fragmented concepts needing unification
- Clear fragment inventory with primary/secondary identification

Much better than first attempt — no destructive changes, structured output, ready for iteration.

**Observations for prompt design:**

1. Framing matters more than mechanical instructions
2. "What to expect" sections reduce discovery friction
3. Phased approach prevents premature action
4. Read-only source + separate output enables iteration
5. Goal statement should be explicit and early

**Phase 2 results:**

Produced `_synthesized/structure.md` with comprehensive design:

1. **Organization scheme**: 6 top-level directories
   - `intents/` (10 files) - communication goals
   - `techniques/` (12 files) - reusable construction patterns
   - `chart-types/` (~60 files) - organized by visual family (bar/, column/, line/, etc.)
   - `components/` (~20 files) - shared building blocks
   - `data-types/` (4 files) - characteristic definitions
   - `mappings/` (4 YAML files) - machine-navigable relationships

2. **Recipe transformations** explicitly categorized:
   - 1:1 mappings (simple-bar-graph transfers directly)
   - Merging (mosaic-graph from 4 sources → 1 unified recipe)
   - Extraction (stacking technique → independent file, referenced by 6+ chart types)
   - Restructuring (separation of selection vs. construction guidance)

3. **Relationship representation** via YAML mappings:
   - `intent-to-charts.yaml` with selection conditions and strength ratings
   - `chart-to-techniques.yaml` with applicability patterns
   - `data-to-charts.yaml` with compatible/incompatible constraints
   - `chart-to-components.yaml` with required/optional components

4. **Seven key decisions documented** with rationale and trade-offs:
   - Family-based chart organization (preserves Harris structure, mappings handle navigation)
   - Techniques as first-class recipes (avoid duplication, enable composition)
   - YAML for traversal, Markdown for description
   - Symlinks for dual membership (histogram is column variant AND statistical display)
   - Provenance tracking in separate file
   - Intent files as primary entry points
   - Secondary mentions absorbed into primary recipes

The structure supports three navigation patterns:
1. Intent-driven: "I want to show X" → find compatible charts
2. Data-driven: "I have Y data" → see what works
3. Construction: Building a chart → follow technique/component refs

**Observations:**

- The phased approach worked well - analysis informed structure naturally
- Having the agent explain decisions/trade-offs produced useful documentation
- YAML mapping examples are concrete enough to implement
- Symlink decision is pragmatic (histogram dual-membership)
- Provenance tracking addresses "where did this come from" systematically

Ready for Phase 3 (actual synthesis) but that's the heavy lifting.

## Next Steps

1. Complete Harris consolidation experiment (Phase 2, Phase 3)
2. Refine consolidation prompt based on findings
3. Split Harris using source-preparation methodology (separate from consolidation)
4. Set up extraction prompts for Engelhardt
5. Run extraction on both new sources
