# Generate Chunk Extractions — Prompt Template

Template for creating prompts that run the generate-chunk-extractions procedure.
Replace `<placeholders>` with actual values.

---

You are generating extraction prompts for all chunks in a source.

## Your Task

Follow the generate-chunk-extractions procedure to create `_prompt/extract.md` files for each chunk in <SOURCE_DESCRIPTION>.

## Procedure

Read and follow: `/work/apparatus-research/research/presentation-catalog/recipes/_procedures/generate-chunk-extractions.md`

## Source Information

- **Source directory**: `<PATH_TO_SOURCE_DIRECTORY>`
- **Source context**: `<PATH_TO_SOURCE_DIRECTORY>/_context.md` (contains chunk inventory)

## References

- Extraction procedure: `/work/apparatus-research/research/presentation-catalog/recipes/_procedures/extract-recipes.md`
- Recipe schema: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`
- General context: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Output Location

Create chunk directories and `_prompt/extract.md` files within the source directory.

## Instructions

1. Read the generate-chunk-extractions procedure
2. Read the source's `_context.md` to get the chunk inventory
3. For each chunk:
   a. Create the chunk directory if it doesn't exist
   b. Create `_prompt/` subdirectory
   c. Generate `_prompt/extract.md` by integrating context and procedure
4. Report what you created
