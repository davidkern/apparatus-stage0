# Procedure: Generate Chunk Extraction Prompts

This procedure describes how to generate extraction prompts for all chunks in a
source. It produces `_prompt/extract.md` files for each chunk directory.

## Prerequisites

- Source directory exists with `_context.md` (contains metadata and extraction guidance)
- `_context.md` contains chunk inventory with paths
- General `_context.md` at recipes root
- `_procedures/extract-recipes.md` as the extraction procedure template
- SCHEMA.md defining the recipe format

## Task

For each chunk listed in the source's `_context.md`:

1. Create the chunk directory if it doesn't exist
2. Create `_prompt/` subdirectory
3. Generate `_prompt/extract.md` by integrating:
   - The `extract-recipes.md` procedure
   - Context from recipes root (`_context.md`)
   - Context from source level (`<source>/_context.md`)
   - Context from chunk level (`<source>/<chunk>/_context.md`) if it exists
   - Parameters from `_context.md` (PDF path, chunk content description)

## Integration Rules

When combining context files:

1. **Order**: General before specific (recipes → source → chunk)
2. **Conflicts**: More specific guidance wins
3. **Accumulation**: Non-conflicting guidance from all levels is preserved

The generated prompt must be **self-contained** — a fresh agent receiving only
the prompt and referenced files (PDF, SCHEMA.md) should be able to execute
the extraction without access to context files or procedures.

## Output Structure

For a source with chunks `[chunk-a, chunk-b, chunk-c]`:

```
<source>/
├── chunk-a/
│   └── _prompt/
│       └── extract.md    # Generated
├── chunk-b/
│   └── _prompt/
│       └── extract.md    # Generated
└── chunk-c/
    └── _prompt/
        └── extract.md    # Generated
```

## Generated Prompt Format

Each `extract.md` should contain:

```markdown
# Extract Recipes: <Source> - <Chunk>

## Context

<Integrated context from all levels, adapted for this specific chunk>

## Task

<Extraction task description, from extract-recipes.md procedure>

## Source Material

- **PDF**: <absolute path to chunk PDF>
- **Content**: <description of what this chunk covers>
- **Reference system**: <how to cite locations, from source _context.md>

## Output

- **Directory**: <path to chunk directory>
- **Format**: One file per recipe, `<slug>.md`
- **Schema**: <path to SCHEMA.md>

## Validation

Run: `python <path to validate.py> <chunk directory>`

Fix all errors before completing.
```

## Completion

When all chunk prompts are generated:
1. Verify each chunk directory has `_prompt/extract.md`
2. Spot-check that prompts are self-contained
3. Report summary: chunks processed, any issues
