# Procedure: Setup Source

This procedure describes how to create the initial structure for a new source.
The output is authored, not mechanically generated — this procedure guides the
authoring process to produce consistent starting structures.

## Prerequisites

- Source material acquired (PDFs, scans, or text)
- Source material chunked into extraction units (if large)
- Chunk files accessible at a known location

## Task

Create the initial directory structure and authored files for a new source:

```
<source>/
├── _meta.md      # Source parameters
├── _context.md   # Source-specific extraction guidance
└── _prompt/      # Empty, ready for generated prompts
```

## Step 1: Create Directory Structure

```bash
mkdir -p recipes/<source>/_prompt
```

Use a descriptive source identifier: `aristotle-rhetoric`, `tufte-vdqi`, `quintilian-institutio`.

## Step 2: Create `_meta.md`

Examine the source material and document:

### Work Information
- Title, author, translation/edition
- Total size (pages, chapters)

### Chunk Inventory
List all chunks with:
- Chunk identifier (used as directory name)
- Content coverage (chapters, sections, page ranges)
- File path (relative to repository root)

Format as a table for clarity.

### Reference System
Document how locations are cited in this source:
- Page numbers? Section numbers? Line numbers?
- Standard scholarly reference system (e.g., Bekker numbers, Stephanus pages)?
- Format examples

## Step 3: Create `_context.md`

Examine the source material (read introduction, sample chapters, table of contents)
and document guidance specific to this source:

### Source Structure
- How is the work organized?
- What are the major divisions?
- What content appears where?

### Terminology
- Does the source use technical terms that need consistent handling?
- Original language terms to preserve?
- Translation conventions to note?

### Source-Specific Patterns
- What kinds of content will be extracted? (techniques, patterns, principles)
- Are there recurring structures? (e.g., triads, catalogs, examples)
- Any content types that need special handling?

### Extraction Hints
- What should extractors pay attention to?
- What might be confusing or easily missed?
- Any known conventions from the scholarly tradition?

## Step 4: Incorporate Prior Knowledge

If this source type has been extracted before (e.g., another rhetoric text),
incorporate relevant learnings:

- Patterns that apply across similar sources
- Common pitfalls to avoid
- Schema extensions that proved useful

This is authored knowledge, not mechanical copying. Adapt to the specific source.

## Step 5: Verify Structure

Confirm:
- [ ] `_meta.md` has complete chunk inventory
- [ ] `_meta.md` documents reference system with examples
- [ ] `_context.md` provides actionable extraction guidance
- [ ] `_prompt/` directory exists (empty)
- [ ] Paths in `_meta.md` are correct and files exist

## Output

A source directory ready for extraction prompt generation:

```
<source>/
├── _meta.md      # Complete
├── _context.md   # Complete
└── _prompt/      # Empty
```

Next step: Use `generate-chunk-extractions` procedure to create extraction prompts.

## Notes

- `_context.md` will evolve as extraction proceeds — this is the initial version
- Don't try to anticipate everything; capture what's known now
- The goal is a useful starting point, not a perfect specification
