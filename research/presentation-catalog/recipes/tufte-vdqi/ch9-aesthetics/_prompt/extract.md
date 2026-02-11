# Extract Recipes: Chapter 9 - Aesthetics and Technique in Data Graphical Design

Extract presentation recipes from Chapter 9 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch8-9b.pdf` - Chapter 9: Aesthetics, integration, design principles

**Page range**: pp. 177-191

## Chapter Content

Chapter 9 synthesizes the book's argument and adds aesthetic principles. Key themes:

- **Integration of Evidence**: Words, numbers, and images together
- **Graphical Elegance**: Simplicity of design, complexity of data
- **Friendly Graphics**: Design that respects the viewer
- **Design Principles Summary**: Tufte's concluding guidelines

## Visual Extraction

This chapter is more philosophical but still demonstrates principles.

1. **Examine integration examples** - How text and graphics combine
2. **Note elegance demonstrations** - Simple designs, complex data
3. **Look for principle statements** - Quotable guidelines
4. **See friendly vs. unfriendly** - Contrast examples

### Key Figures to Examine

- Integrated displays (words + numbers + graphics)
- Elegance examples
- Friendly vs. unfriendly graphic comparisons
- Summary principle statements

## Extraction Guidance

### What to Extract

1. **Integration of Evidence** (p. 181): Named principle about combining modes
2. **Graphical elegance criteria**: What makes a graphic elegant
3. **Friendly graphics principles**: Design that respects viewers
4. **Summary design principles**: Any quotable concluding guidelines

### Direction

This chapter is primarily **construction** oriented (how to design better):
- Default to `both` for general principles
- Use `construction` for specific design guidance

### Expected Recipe Density

Lower than Chapters 4-6. This chapter is philosophical and synthetic. Extract:
- Named principles (integration of evidence)
- Aesthetic criteria
- Design guidelines with specific content

### Extensions

```yaml
extensions:
  tufte_principle: "Integration of evidence"
  chapter_position: "conclusion"  # This is the synthesis chapter
  figure_reference: "Figure 9.X, p. XX"
```

## Cross-Reference Note

This chapter references and synthesizes principles from earlier chapters. In the Notes section of recipes, mention the earlier appearance:

> "This principle builds on the data-ink maximization from Chapter 4."

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch9-aesthetics/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch9-aesthetics/
```
