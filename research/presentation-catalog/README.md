# Presentation Catalog Research

This directory contains research toward a catalog of presentation semantics — the
vocabulary of what code wants to communicate (intents) and how that communication
is realized (forms, techniques, patterns).

## Structure

```
presentation-catalog/
├── README.md                    # This file
├── _tools/                      # Scripts, validators, utilities
├── extracts/                    # Survey-level source extractions
│   └── <source>/                # One directory per source
│       ├── _meta.md             # Source metadata (provenance, URLs)
│       ├── _original/           # Backup of original files
│       ├── _stash/              # Files that don't fit yet
│       └── <item>.md            # Individual extracted items (leaf values)
├── recipes/                     # Deep primary source extractions
│   ├── SCHEMA.md                # Frontmatter schema for recipes
│   ├── _generators/             # Templates guiding task behavior
│   │   ├── setup-source.md
│   │   ├── generate-chunk-extractions.md
│   │   ├── extract-recipes.md
│   │   └── consolidate-source.md
│   ├── _context.md              # General extraction context
│   ├── _prompt/                 # Instantiated prompts (seed prompts)
│   │   └── setup-<source>.md
│   └── <source>/                # One directory per source (generated)
│       ├── _context.md          # Source metadata and extraction guidance
│       ├── _generators/         # Source-specific generators (optional)
│       ├── _prompt/             # Staged prompts for next steps
│       │   ├── generate-chunks.md
│       │   └── consolidate.md
│       └── <chunk>/             # One directory per extraction unit (generated)
│           ├── _context.md      # Chunk-specific guidance (optional)
│           ├── _prompt/
│           │   └── extract.md   # Extraction prompt for this chunk
│           └── <recipe>.md      # Individual recipes (leaf values)
└── _dimension/                  # Organizational views via symlinks
```

## Naming Conventions

### Content Files

Leaf values (extracted items, recipes) use **lowercase-kebab** names:

```
enthymeme-from-opposites.md
reveal-data.md
small-multiples.md
```

### Documentation Files

Public interface documentation uses **UPPERCASE** names without underscore:

| File | Purpose |
|------|---------|
| `README.md` | Overview and entry point for a directory |
| `SCHEMA.md` | Frontmatter schema definition for a space |

### System Files (Underscore Prefix)

Files and directories with `_` prefix are **implementation concerns** — not content.

| Name | Purpose |
|------|---------|
| `_context.md` | Metadata and guidance at this level (hierarchical) |
| `_prompt/` | Generated prompts passed to tasks |
| `_notes.md` | Observations, tensions, questions |
| `_tools/` | Scripts, validators, utilities |
| `_stash/` | Files that don't fit the structure yet |
| `_original/` | Backups of files before processing |
| `_dimension/` | Symlink-based organizational views |

## Generators, Context, and Prompts

Extraction work follows a two-phase model: **generation** (top-down) creates
structure and prompts, **execution** (bottom-up) runs the actual work.

### Generators (`_generators/`)

Templates that guide task behavior. Each generator has single responsibility:
set up its level and stage the next level's entry point.

```
_generators/
├── setup-source.md                 # Examine source, create _context.md, stage next step
├── generate-chunk-extractions.md   # Create chunk directories and extraction prompts
├── extract-recipes.md              # Extract recipes from a single chunk
└── consolidate-source.md           # Consolidate recipes across chunks
```

Generators don't run automatically — they guide tasks that have agency to adapt
based on what they find (e.g., choosing chunked vs. single extraction).

Sources can have their own `_generators/` for source-specific needs (e.g.,
multimodal extraction for image-heavy sources).

### Context Files (`_context.md`)

Metadata and guidance at each level. Context files provide structured reference
data (chunk inventories, paths) and prose guidance (extraction hints, terminology).

```
recipes/_context.md                    # General recipe extraction guidance
recipes/aristotle-rhetoric/_context.md # Source metadata + extraction guidance
recipes/aristotle-rhetoric/b2-argument/_context.md  # Chunk-specific (optional)
```

### Prompts (`_prompt/`)

Instantiated prompts combine a generator reference with parameters. Each level
stages prompts for the next level:

```
recipes/_prompt/setup-aristotle.md           # Seed prompt (we write this)
  ↓ (task runs, creates:)
aristotle-rhetoric/_prompt/generate-chunks.md   # Staged by setup
aristotle-rhetoric/_prompt/consolidate.md       # Staged by setup
  ↓ (task runs, creates:)
aristotle-rhetoric/b2-argument/_prompt/extract.md  # Staged by generate-chunks
```

### Two-Phase Execution

**Generation phase (top-down):**
1. Run prompt at current level
2. Task creates structure and stages prompts for next level
3. Recurse into generated directories
4. Continue until no more generation needed

**Execution phase (bottom-up):**
1. Run extraction prompts at leaf nodes (chunks)
2. Run consolidation at source level
3. Done

The orchestrator (currently manual) runs prompts in each phase. The prompts
themselves are self-contained — the orchestrator doesn't need deep knowledge
of what each level does.

## Leaf Files (Content)

Each leaf file represents one extracted item with YAML frontmatter and markdown body.

### Frontmatter

Required fields vary by space. Each space defines its schema in `SCHEMA.md`.

**Extracts** (survey-level) use minimal frontmatter:

```yaml
---
source: aristotle-rhetoric
proposed-category: Evidential
proposed-group: Logical      # optional
name: Enthymeme
---
```

**Recipes** (deep extraction) use structured frontmatter per `recipes/SCHEMA.md`.

### Body

The body contains the item's definition, examples, and extracted content. The body
elaborates on frontmatter — it should add understanding, not duplicate structured
fields in prose.

## Spaces

### Extracts

Survey-level extractions from secondary sources (web summaries, overviews). Used to
validate that a concept space exists before deep extraction.

Extracts are **fixed points** — immutable source data. Organization happens via
symlinks in `_dimension/`, not by moving files.

### Recipes

Deep extractions from primary sources with structured schemas. Each recipe is
actionable — precise enough to implement.

Recipes use the schema in `recipes/SCHEMA.md` and follow the context/prompt
pattern for reproducibility.

## Dimensions (Organizational Views)

The `_dimension/` directory contains symlink-based views that organize values
without moving or duplicating them.

```
_dimension/intent/
├── evidential/
│   ├── reveal-data.md -> ../../recipes/tufte-vdqi/.../reveal-data.md
│   └── enthymeme.md -> ../../recipes/aristotle-rhetoric/.../enthymeme.md
├── comparative/
│   └── small-multiples.md -> ../../recipes/tufte-vdqi/.../small-multiples.md
└── ...
```

Multiple dimensions can coexist. The same item can appear in multiple categories.

## Tools

The `_tools/` directory (at any level) contains scripts and utilities:

```
_tools/validate.py              # Schema validation
_tools/split-extracts.py        # Processing scripts
```

Tools at higher levels work across the space. Tools within a source directory
are source-specific.

## Workflow

1. **Extract** — Run tasks against sources, producing leaf files with frontmatter
2. **Validate** — Run `_tools/validate.py` to check schema conformance
3. **Organize locally** — Use `_dimension/` within each source to categorize
4. **Organize globally** — Use top-level `_dimension/` to consolidate across sources
5. **Iterate** — Create alternative organizations as understanding improves

## Found Processes

Methodological insights discovered while working with this structure.

### Preserve extraction hypotheses

When organizing items, use `proposed-category` from frontmatter as-is. The
extraction agent had reasoning we may not have access to. Overwriting with
our own interpretation loses information.

**Do:** Build `_dimension/` structure following proposed categories exactly.

**Don't:** Restructure based on our judgment of what "fits better."

### Record observations, don't restructure

When reviewing organized items, observations about potential miscategorization
or structure issues should be recorded in `_notes.md`, not acted upon immediately.

This preserves:
- The extraction's original hypothesis
- Our observations as separate metadata
- The ability to see both perspectives

Restructuring happens later, informed by cross-source patterns.

### Catch-all categories signal data quality

When an extraction produces one large heterogeneous category (e.g., "Emotional"
with 11 diverse items), this may indicate:
- The extraction agent ran out of category ideas
- The source material grouped these together
- The extraction prompt was underspecified

Record this observation in `_notes.md` with specific items that seem out of place.
Cross-source comparison will reveal if this is systematic.

### Questions for cross-source comparison

When recording observations, frame them as questions that cross-source work
can answer:
- "Do other sources have similar catch-all categories?"
- "Does [item] appear in other sources? Under what category?"
- "Is [proposed category] a real pattern or extraction artifact?"
