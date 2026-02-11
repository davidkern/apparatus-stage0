# Setup Source: Tufte's Visual Display of Quantitative Information

Instantiated prompt for setting up tufte-vdqi source.

---

You are setting up a new source for recipe extraction.

## Generator

Read for guidance: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/setup-source.md`

## Parameters

- **Source material**: `/work/apparatus-research/reference/tufte/visual-display-quantitative/`
- **Work**: The Visual Display of Quantitative Information
- **Author**: Edward R. Tufte
- **Edition**: 2nd Edition (2001)
- **Output directory**: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/`

## References

- Recipe schema: `/work/apparatus-research/research/presentation-catalog/recipes/SCHEMA.md`
- Root context: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`
- Available generators: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/`

## Task

1. **Examine** the source material to understand its structure
2. **Create** source directory with `_context.md` containing:
   - Work information
   - Chunk inventory (files found, content coverage)
   - Reference system
   - Key concepts and terminology
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
