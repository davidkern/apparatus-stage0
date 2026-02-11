# Presentation Recipes

## Background

### The Broader Problem

When we present information — whether to humans or machines — we engage in a
lossy pipeline:

1. **Intent** — what we want to communicate (comparison, distribution, causation)
2. **Encoding** — how we structure it (table, chart, prose, audio)
3. **Rendering** — physical manifestation (pixels, glyphs, waveforms)
4. **Parsing** — recipient reconstructs meaning

Each step loses information. AI agents parse rendered manifestations, synthesize
across sources, and re-render — compounding losses. Humans present ad-hoc, mixing
concerns and muddling intent. Solving this is a fundamental information efficiency
problem touching presentation, reasoning, and knowledge storage.

### What We Tried

We attempted to build a comprehensive intent taxonomy by extracting from diverse
sources:

| Source | Type | Depth |
|--------|------|-------|
| Aristotle's Rhetoric | Web summaries | Shallow (19 items, 2k words) |
| Instructional Design | Web summaries | Shallow (25 items, 3.6k words) |
| Narrative Theory | Web summaries | Shallow (35 items, 4.2k words) |
| Conversation Analysis | Web summaries | Shallow (26 items, 4k words) |
| Legal Language | Web summaries | Shallow (24 items, 5.7k words) |
| Scientific Writing | Web summaries | Shallow (25 items, 4.6k words) |
| Accessibility | Web summaries | Shallow (21 items, 3.4k words) |
| **Tufte** | **Primary text** | **Deep (303 items, 56k words)** |

This survey validated that an Intent dimension exists across domains, with
overlaps confirming the framing is correct. But survey data validates "there's
something here" — it doesn't provide depth for "here's the complete taxonomy."

### Why Taxonomy Is Premature

1. **Shallow data** — Most extracts are surface-level web summaries, not
   comprehensive analysis of primary sources.

2. **Inconsistent structure** — Each extraction invented its own format.
   Automated consolidation lost information.

3. **Wrong abstraction** — We extracted "what category is this intent?" when
   presently needs "how do I render this specific thing?"

4. **Scope mismatch** — Comprehensive taxonomy requires full attention to a
   huge problem space. The apparatus project needs concrete results now.

### The Reframe: Recipe Book

Instead of taxonomy (comprehensive, abstract), build a recipe book (practical,
concrete, incremental).

A taxonomy asks: "What are all the categories of intent?"
A recipe asks: "How do you render this specific thing?"

**Taxonomy output:**
```
Category: Distributional
  - Display Distribution Summary
  - Show Marginal Distributions
  - Identify Outliers
```

**Recipe output:**
```yaml
name: Quartile Plot
intent: Display distribution shape and spread
components:
  - element: vertical-line
    encodes: range (min to max)
  - element: box
    encodes: interquartile range (Q1 to Q3)
  - element: mark
    encodes: median
  - element: width (optional)
    encodes: sample size
parameters:
  orientation: vertical | horizontal
  show_outliers: boolean
  notched: boolean
forms:
  visual: box-and-whisker diagram
  typographic: five-number summary table
  prose: "The distribution ranges from {min} to {max}, with median {median}..."
```

A recipe is actionable. You can write code that takes data and a recipe and
produces output.

## Recipe Format

See **[SCHEMA.md](SCHEMA.md)** for the precise schema definition.

Key design principles:

1. **One file per recipe** — Avoids scalability issues, enables direct reference
2. **Structured frontmatter** — YAML fields for programmatic analysis
3. **Extensions key** — Tasks can add structured data without polluting core schema
4. **Rich body content** — Markdown elaboration for deeper understanding

The schema was refined based on independent convergence across 12 parallel extractions:
- **Bidirectionality** (6+ files): Added `direction: construction | recognition | both`
- **Audience sensitivity** (4+ files): Added `audience` field with context/adaptation
- **Warnings/limitations** (2+ files): Added `warnings` field
- **Examples essential** (3+ files): Body structure emphasizes examples

## Extraction Plan

Rather than survey many sources shallowly, extract recipes deeply from a few
foundational sources:

### Phase 1: Foundational Sources

1. **Tufte's three books** (primary text access)
   - The Visual Display of Quantitative Information
   - Envisioning Information
   - Visual Explanations

   These provide the core vocabulary for data presentation — charts, tables,
   small multiples, sparklines, etc.

2. **Classical Rhetoric** (primary text, not Wikipedia)
   - Aristotle's Rhetoric (actual text)
   - Quintilian's Institutio Oratoria

   These provide the vocabulary for argument, persuasion, and oral presentation
   that predates and underlies modern communication.

3. **One other foundational source** (TBD)
   - Possibly Bringhurst for typography
   - Possibly Mayer for instructional design
   - Possibly Grice/Austin/Searle for speech acts

### Phase 2: Implementation-Driven

Instead of building taxonomy then implementing, implement directly:

1. Pick a recipe the apparatus project actually needs
2. Extract/refine that recipe from sources
3. Implement it in presently
4. Repeat

The recipe collection grows organically from real needs. Taxonomy emerges later
(if needed) from the recipe collection.

## Relationship to Existing Work

The `extracts/` directory contains our survey-level work:
- Validates that Intent vocabulary exists across domains
- Shows overlaps that confirm framing is correct
- Provides raw material for future deep extraction
- Not deep enough to build recipes from (except Tufte)

The `recipes/` directory will contain:
- Deep extractions in recipe format
- Actionable specifications for presently
- Grows incrementally as we need things

We're not abandoning the larger project — we're balancing concrete results
against developing the larger theory. The survey work informed our understanding.
Now we need to build.

## Directory Structure

```
recipes/
├── README.md                    # This file
├── SCHEMA.md                    # Frontmatter schema definition
├── _generator-prompt.md         # How to generate prompts from procedures + context
├── _procedures/                 # Reusable procedure templates
│   ├── setup-source.md
│   ├── generate-chunk-extractions.md
│   ├── extract-recipes.md
│   └── consolidate-source.md
├── _context.md                  # General extraction context
├── _prompt/                     # Generated prompts for recipes-level tasks
│   └── <task>.md
├── _tools/
│   └── validate.py              # Schema validator
└── <source>/
    ├── _context.md              # Source metadata and extraction guidance
    ├── _prompt/                 # Generated prompts for source-level tasks
    │   └── <task>.md
    └── <chunk>/
        ├── _context.md          # Chunk-specific guidance (optional)
        ├── _prompt/             # Generated prompts for chunk-level tasks
        │   └── <task>.md
        └── <recipe>.md          # Extracted recipes
```

### Key Concepts

- **`_procedures/`** — Reusable templates (how to do something, source-agnostic)
- **`_context.md`** — Metadata and guidance (at each level, combines reference data and prose)
- **`_prompt/<task>.md`** — Concrete prompts (procedure + integrated context)

See the top-level `presentation-catalog/README.md` for the full model.

## Next Steps

1. ~~Define recipe YAML schema precisely~~ — Done: [SCHEMA.md](SCHEMA.md)
2. ~~Set up context/prompt structure~~ — Done: `_context.md` files created
3. Pilot extraction on `aristotle-rhetoric/b2-argument/` to validate methodology
4. Full Aristotle re-extraction (12 chunks)
5. Extract recipes from Tufte raw data
6. Implement first recipes in presently

## Extraction History

| Source | Status | Location |
|--------|--------|----------|
| Aristotle (Kennedy) | Pilot pending | `aristotle-rhetoric/` |
| Tufte VDQI | Raw extracts available | `../extracts/tufte/` |
