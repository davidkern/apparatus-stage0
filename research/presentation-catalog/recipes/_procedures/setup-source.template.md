# Setup Source — Prompt Template

Template for creating prompts that run the setup-source procedure.
Replace `<placeholders>` with actual values.

---

You are setting up a new source for recipe extraction.

## Your Task

Follow the setup-source procedure to create the initial structure for extracting recipes from <SOURCE_DESCRIPTION>.

## Procedure

Read and follow: `/work/apparatus-research/research/presentation-catalog/recipes/_procedures/setup-source.md`

## Source Material

- **PDF chunks location**: `<PATH_TO_CHUNKS>`
- **Work**: <WORK_TITLE>
- **Author/Translation**: <AUTHOR_AND_TRANSLATION_INFO>

## Output Location

Create the source structure at: `/work/apparatus-research/research/presentation-catalog/recipes/<SOURCE_ID>/`

## References

- Recipe schema: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`
- General context (for understanding what recipes are): `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Instructions

1. Read the setup-source procedure
2. List the PDF chunks to understand what's available
3. Examine a sample of the source material (read one or two chunks) to understand the content, reference system, and terminology
4. Create `_context.md` with source metadata and extraction guidance
5. Create empty `_prompt/` directory
6. Report what you created
