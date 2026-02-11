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
├── _context.md   # Source metadata and extraction guidance
└── _prompt/      # Empty, ready for generated prompts
```

## Step 1: Create Directory Structure

```bash
mkdir -p recipes/<source>/_prompt
```

Use a descriptive source identifier: `aristotle-rhetoric`, `tufte-vdqi`, `quintilian-institutio`.

## Step 2: Create `_context.md`

This single file contains both source metadata (reference data) and extraction
guidance (how to extract recipes from this source).

### Work Information

Document the source:
- Title, author, translation/edition
- Total size (pages, chapters)
- Overall structure (major divisions)

### Chunk Inventory

List all chunks with:
- Chunk identifier (used as directory name)
- Content coverage (chapters, sections, page ranges)
- File path (relative to repository root)

Format as a table for easy reference.

### Reference System

Document how locations are cited in this source:
- Page numbers? Section numbers? Line numbers?
- Standard scholarly reference system (e.g., Bekker numbers, Stephanus pages)?
- Format examples with YAML showing how `source.location` should look

### Terminology

- Does the source use technical terms that need consistent handling?
- Original language terms to preserve (use `source.original_term`)?
- Translation conventions to note?

### Source Structure

- How is the work organized?
- What are the major divisions and what content appears where?
- What kinds of content will be extracted? (techniques, patterns, principles)

### Extraction Hints

- What should extractors pay attention to?
- What patterns recur that need consistent handling?
- Direction guidance (default to `both`? recognition-only sections?)
- Components vs. parameters guidance
- How to handle examples from the source

### Extensions

Document any source-specific patterns that should use the `extensions` field:
- Numbered items (e.g., Aristotle's 28 topics)
- Recurring structures (e.g., emotion triads)
- Content type markers (e.g., fallacious patterns, audience-adaptation)

## Step 3: Incorporate Prior Knowledge

If this source type has been extracted before (e.g., another rhetoric text),
incorporate relevant learnings:

- Patterns that apply across similar sources
- Common pitfalls to avoid
- Schema extensions that proved useful

This is authored knowledge, not mechanical copying. Adapt to the specific source.

## Step 4: Verify Structure

Confirm:
- [ ] `_context.md` has complete chunk inventory with correct paths
- [ ] `_context.md` documents reference system with YAML examples
- [ ] `_context.md` provides actionable extraction guidance
- [ ] `_prompt/` directory exists (empty)

## Output

A source directory ready for extraction prompt generation:

```
<source>/
├── _context.md   # Complete
└── _prompt/      # Empty
```

Next step: Use `generate-chunk-extractions` procedure to create extraction prompts.

## Notes

- `_context.md` will evolve as extraction proceeds — this is the initial version
- Don't try to anticipate everything; capture what's known now
- The goal is a useful starting point, not a perfect specification
