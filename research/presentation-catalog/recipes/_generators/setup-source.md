# Generator: Setup Source

Sets up a recipe extraction directory for a prepared source.

## Responsibility

Single responsibility: Examine source material, create source-level structure, and
stage the prompt for the next step. Does NOT run the next step.

## Parameters

- **Source directory**: Path to prepared source
- **Output directory**: Path for extraction output

The source directory must contain a valid `_source.yaml` (see `methodology/source-preparation.md`).
Work metadata (title, author, slug, chunks) is read from `_source.yaml`.

Create the output directory in `research/presentation-catalog/recipes` with the
same name as the source directory.

## References

These paths are relative to the repository root:

- Recipe schema: `research/presentation-catalog/recipes/SCHEMA.md`
- Root context: `research/presentation-catalog/recipes/_context.md`
- Other generators: `research/presentation-catalog/recipes/_generators/`

## Process

### 1. Read Source Metadata

Read `_source.yaml` from the source directory to get:
- Work title, author, edition
- Chunk inventory (ids, pages, content descriptions)
- Any notes about the source

### 2. Examine Source Material

Look at the actual chunk files to understand:
- Content type (text-heavy, graphics-heavy, mixed)
- Structure within chunks (chapters, sections, entries)
- Any special considerations (images, tables, diagrams requiring multimodal)

### 3. Create Output Directory

```
<output-dir>/
├── _context.md
└── _prompt/
    └── <next-step>.md
```

### 4. Create `_context.md`

Document:
- **Work Information**: Title, author, translation, structure (from _source.yaml)
- **Chunk Inventory**: What chunks exist and what they contain (from _source.yaml)
- **Reference System**: How to cite locations (with YAML examples)
- **Terminology**: Technical terms, domain vocabulary to preserve
- **Extraction Guidance**: What to look for, direction hints, patterns

This is authored with judgment based on examining the source, not mechanically copied.

### 5. Decide and Stage Next Step

Based on source material examination:

**If multiple chunks exist:**
- Create `_prompt/generate-chunks.md` referencing `_generators/generate-chunk-extractions.md`
- Create `_prompt/consolidate.md` referencing `_generators/consolidate-source.md`

**If single source file:**
- Create `_prompt/extract.md` referencing `_generators/extract-recipes.md`

**If special extraction needed (e.g., multimodal):**
- Create source-specific `_generators/` directory with custom generator
- Create `_prompt/` referencing the custom generator

## Output

```
<output-dir>/
├── _context.md                    # Source metadata and extraction guidance
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
- Recommend chunk prioritization based on expected recipe density

## Next Steps (for orchestrator)

After this generator runs:
1. Run `_prompt/generate-chunks.md` (or `_prompt/extract.md`)
2. Continue generation phase until tree is complete
3. Then run execution phase from leaves to root
