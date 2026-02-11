# Generator: Setup Source

Sets up a source directory and stages the next level's entry point.

## Responsibility

Single responsibility: Examine source material, create source-level structure, and
stage the prompt for the next step. Does NOT run the next step.

## Input

Parameters provided in the instantiated prompt:
- Source material location (directory of PDFs/text files)
- Work metadata (title, author, translation)

## Process

### 1. Examine Source Material

Look at the source material to understand:
- How many files? (single PDF vs. multiple chunks)
- What structure? (chapters, sections, continuous)
- Any special considerations? (images, tables, diagrams)

This examination informs what next step to stage.

### 2. Create Source Directory

```
<source>/
├── _context.md
└── _prompt/
    └── <next-step>.md
```

### 3. Create `_context.md`

Document:
- **Work Information**: Title, author, translation, structure
- **Inventory**: What source files exist and what they contain
- **Reference System**: How to cite locations (with YAML examples)
- **Terminology**: Technical terms, original language terms to preserve
- **Extraction Guidance**: What to look for, direction hints, patterns

This is authored with judgment, not mechanically generated.

### 4. Decide and Stage Next Step

Based on source material examination:

**If multiple chunks exist:**
- Create `_prompt/generate-chunks.md` that will create chunk subdirectories
- Reference `_generators/generate-chunk-extractions.md` for guidance

**If single source file:**
- Create `_prompt/extract.md` directly
- Reference `_generators/extract-recipes.md` for guidance

**If special extraction needed (e.g., multimodal):**
- Create source-specific `_generators/` directory with custom generator
- Create `_prompt/` referencing the custom generator

### 5. Stage Consolidation (if chunked)

If staging chunk-based extraction, also create `_prompt/consolidate.md` that will
run after all chunk extractions complete.

## Output

```
<source>/
├── _context.md                    # Source metadata and guidance
├── _generators/                   # (optional) Source-specific generators
└── _prompt/
    ├── generate-chunks.md         # OR extract.md for simple sources
    └── consolidate.md             # (if chunked)
```

## Agency

The task has latitude to:
- Decide chunked vs. single extraction based on material
- Create custom generators if source needs special handling
- Structure `_context.md` appropriately for the specific source

## Next Steps (for orchestrator)

After this generator runs:
1. Run `_prompt/generate-chunks.md` (or `_prompt/extract.md`)
2. Continue generation phase until tree is complete
3. Then run execution phase from leaves to root
