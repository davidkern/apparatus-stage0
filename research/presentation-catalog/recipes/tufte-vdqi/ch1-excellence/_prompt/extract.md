# Extract Recipes: Chapter 1 - Graphical Excellence

Extract presentation recipes from Chapter 1 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (data-ink, chartjunk, etc.)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read these PDF files from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch1-graphical-excellence.pdf` - Opening of Part I, introduction to excellence principles
2. `ch1a.pdf` - Data maps, time-series examples
3. `ch1b.pdf` - Small multiples, relational graphics
4. `ch1-late-section.pdf` - Narrative graphics, aesthetic principles

**Page range**: pp. 13-51

## Chapter Content

Chapter 1 establishes what makes a graphic excellent. Key themes:

- **Graphical Excellence Defined**: Complex ideas communicated with clarity, precision, efficiency
- **Data Maps**: Spatial data visualization (cancer rates, galaxy distributions)
- **Time-Series**: The most common form (Playfair's invention, railroad schedules)
- **Small Multiples**: Repeated frames showing change
- **Relational Graphics**: Scatterplots, showing relationships between variables
- **Narrative Graphics**: Napoleon's march, Challenger O-rings

## Visual Extraction

This chapter is highly visual. When extracting:

1. **Examine figures carefully** - Many techniques are demonstrated, not just described
2. **Describe visual components** - Use the `components` field to capture visual elements
3. **Reference figures** - Include figure numbers and page references in examples
4. **Note visual-only techniques** - Some recipes may have no textual description

### Key Figures to Examine

- Minard's Napoleon march graphic (p. 40) - canonical example of multivariate display
- Marey's train schedule (p. 31) - time-series innovation
- Playfair's time-series (pp. 32-34) - historical origins
- Cancer mortality maps - data mapping examples
- Small multiples examples - horse motion, dance notation

## Extraction Guidance

### What to Extract

1. **Named principles**: "Graphical excellence" defined, five principles (p. 51)
2. **Graphic types**: Data maps, time-series, small multiples, relational graphics
3. **Design techniques**: How to show multivariate data, how to use space
4. **Evaluation criteria**: What makes a graphic excellent vs. mediocre

### Direction

Most techniques in this chapter work bidirectionally:
- **Construction**: How to design excellent graphics
- **Recognition**: How to evaluate graphic quality

Default to `both` unless the technique is purely about creation or evaluation.

### Extensions

Consider adding:
```yaml
extensions:
  tufte_principle: "..."  # If derived from a named principle
  figure_reference: "Figure X.X, p. XX"  # Primary visual example
  graphic_type: "data-map" | "time-series" | "small-multiples" | "relational"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch1-excellence/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch1-excellence/
```
