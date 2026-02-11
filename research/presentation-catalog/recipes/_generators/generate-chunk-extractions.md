# Generator: Generate Chunk Extractions

Creates chunk subdirectories and stages extraction prompts for each.

## When to Use

Use this generator for **primarily textual sources** where:
- The core content is conveyed through prose
- Visual elements (if any) are supplementary, not essential
- Text extraction captures the techniques being described

For sources where visual content is essential to understanding (diagrams, charts,
figures that demonstrate rather than merely illustrate), use
`generate-multimodal-chunk-extractions.md` instead.

## Responsibility

Single responsibility: Create chunk-level structure and stage extraction prompts.
Does NOT run the extractions.

## Input

- Source `_context.md` with chunk inventory
- Reference to `_generators/extract-recipes.md` for extraction guidance

## Process

### 1. Read Chunk Inventory

From the source's `_context.md`, get the list of chunks:
- Chunk identifiers
- Content coverage
- File paths

### 2. Create Chunk Directories

For each chunk:
```
<source>/<chunk>/
└── _prompt/
    └── extract.md
```

### 3. Generate Extraction Prompts

For each chunk, create `_prompt/extract.md` that:
- Integrates context from source `_context.md`
- References the specific chunk's PDF/text file
- Describes what content this chunk covers
- Provides extraction guidance specific to this chunk's content

Each prompt must be **self-contained** — a task receiving only the prompt and
referenced files should be able to execute extraction.

### 4. Create Chunk `_context.md` (if needed)

If a chunk needs specific guidance beyond what's in the source context:
- Create `<chunk>/_context.md` with chunk-specific notes
- Reference it in the extraction prompt

Most chunks won't need this.

## Output

```
<source>/
├── _context.md
├── _prompt/
│   ├── generate-chunks.md    # This prompt (already run)
│   └── consolidate.md        # Staged by setup-source
├── <chunk-1>/
│   └── _prompt/
│       └── extract.md
├── <chunk-2>/
│   └── _prompt/
│       └── extract.md
└── ...
```

## Agency

The task has latitude to:
- Adapt extraction prompts based on chunk content (e.g., "this chunk focuses on emotions")
- Create chunk-specific `_context.md` if needed
- Note relationships between chunks that might affect extraction

## Next Steps (for orchestrator)

After this generator runs:
1. Generation phase continues into each chunk directory
2. Chunks have no further generation (extract.md is a leaf)
3. Execution phase runs each chunk's extract.md
4. Then consolidate.md at source level
