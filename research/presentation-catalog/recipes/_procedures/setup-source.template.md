# Setup Source — Seed Prompt Template

This is the prompt template for running the setup-source procedure on a new source.
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
2. List the PDF/source chunks to understand what's available
3. Examine a sample of the source material (read one or two chunks) to understand the content, reference system, and terminology
4. Create `_meta.md` with chunk inventory and reference system
5. Create `_context.md` with source-specific extraction guidance
6. Create empty `_prompt/` directory
7. Report what you created

---

## Example Instantiation (Aristotle)

```
- SOURCE_DESCRIPTION: Aristotle's Rhetoric
- PATH_TO_CHUNKS: /work/apparatus-research/reference/aristotle/chunks/
- WORK_TITLE: Aristotle's "Rhetoric" (also called "On Rhetoric")
- AUTHOR_AND_TRANSLATION_INFO: George A. Kennedy (Oxford University Press, 2007)
- SOURCE_ID: aristotle-rhetoric
```
