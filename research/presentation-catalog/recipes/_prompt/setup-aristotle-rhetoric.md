# Setup Source: Aristotle's Rhetoric

Instantiated prompt for setting up aristotle-rhetoric source.

---

You are setting up a new source for recipe extraction.

## Generator

Read for guidance: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/setup-source.md`

## Parameters

- **Source material**: `/work/apparatus-research/reference/aristotle/chunks/`
- **Work**: Aristotle's "Rhetoric" (also called "On Rhetoric")
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford University Press, 2007)
- **Output directory**: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/`

## References

- Recipe schema: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`
- Root context: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`
- Chunk extraction generator: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/generate-chunk-extractions.md`
- Recipe extraction generator: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`
- Consolidation generator: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/consolidate-source.md`

## Task

1. **Examine** the source material to understand its structure
2. **Create** source directory with `_context.md` containing:
   - Work information
   - Chunk inventory (files found, content coverage)
   - Reference system (Bekker numbers)
   - Terminology guidance
   - Extraction hints
3. **Decide** what next step is appropriate based on what you find
4. **Stage** the next step by creating appropriate `_prompt/` files
5. **Report** what you created and what the next step should be

## Agency

You have latitude to:
- Structure `_context.md` based on what the source material needs
- Decide whether chunked extraction or single extraction is appropriate
- Create source-specific generators in `_generators/` if needed
- Stage consolidation if chunked extraction is chosen
