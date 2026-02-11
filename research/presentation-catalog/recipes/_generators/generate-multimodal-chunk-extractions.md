# Generator: Generate Multimodal Chunk Extractions

Creates chunk subdirectories and stages extraction prompts that use both text and visual content.

## When to Use

Use this generator instead of `generate-chunk-extractions.md` when:
- Source material contains significant visual content (diagrams, charts, figures)
- Visual examples are essential to understanding the techniques described
- Text-only extraction would miss critical information

## Responsibility

Single responsibility: Create chunk-level structure and stage multimodal extraction prompts.
Does NOT run the extractions.

## Input

- Source `_context.md` with chunk inventory
- Reference to `_generators/extract-recipes.md` for extraction guidance
- PDF files containing visual content

## Process

### 1. Read Chunk Inventory

From the source's `_context.md`, get the list of chunks:
- Chunk identifiers
- Content coverage
- File paths (both PDF and text versions if available)

### 2. Create Chunk Directories

For each chunk:
```
<source>/<chunk>/
└── _prompt/
    └── extract.md
```

### 3. Generate Multimodal Extraction Prompts

For each chunk, create `_prompt/extract.md` that:
- References the **PDF file** (not text-only) for extraction
- Instructs the extractor to examine visual content
- Provides guidance on describing visual techniques
- Integrates context from source `_context.md`

Each prompt must be **self-contained** and explicitly instruct the task to:
- Read the PDF to see images, charts, and figures
- Extract techniques that are demonstrated visually
- Describe visual components in recipe `components` field
- Reference specific figures/pages in examples

### 4. Visual Content Guidance

Extraction prompts should include:

```markdown
## Visual Extraction

This source contains essential visual content. When extracting:

1. **Examine figures and charts** — Many techniques are demonstrated, not just described
2. **Describe visual components** — Use the `components` field to capture visual elements
3. **Reference figures** — Include figure numbers and page references in examples
4. **Note visual-only techniques** — Some recipes may have no textual description, only visual demonstration
```

### 5. Create Chunk `_context.md` (if needed)

If a chunk has particularly dense visual content or needs specific guidance:
- Create `<chunk>/_context.md` with notes on key figures
- Reference it in the extraction prompt

## Output

```
<source>/
├── _context.md
├── _prompt/
│   ├── generate-chunks.md    # This prompt (already run)
│   └── consolidate.md        # Staged by setup-source
├── <chunk-1>/
│   └── _prompt/
│       └── extract.md        # References PDF, includes visual guidance
├── <chunk-2>/
│   └── _prompt/
│       └── extract.md
└── ...
```

## Agency

The task has latitude to:
- Identify which chunks have the most visual content
- Adapt extraction prompts to emphasize visual vs. textual extraction
- Create chunk-specific `_context.md` noting important figures
- Decide if some chunks can use text-only extraction

## Difference from Text-Only Generator

| Aspect | `generate-chunk-extractions` | `generate-multimodal-chunk-extractions` |
|--------|------------------------------|----------------------------------------|
| Source file | `.txt` files | `.pdf` files |
| Extraction focus | Textual descriptions | Text + visual demonstrations |
| Components | Logical structure | Visual elements + logical structure |
| Examples | Quoted text | Text + figure references |

## Next Steps (for orchestrator)

After this generator runs:
1. Generation phase continues into each chunk directory
2. Chunks have no further generation (extract.md is a leaf)
3. Execution phase runs each chunk's extract.md (must use multimodal-capable model)
4. Then consolidate.md at source level
