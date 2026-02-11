# Extract Recipes: Chapter 4 - Data-Ink and Graphical Redesign

Extract presentation recipes from Chapter 4 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (data-ink ratio, erasing principles)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read these PDF files from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch3-4a.pdf` - **Latter portion only**, starting at "Part II: Theory of Data Graphics" (approximately p. 91)
2. `ch3-4b.pdf` - Continuation of Chapter 4, redesign demonstrations

**Important**: The ch3-4a.pdf file begins with Chapter 3 content. Start extraction where Part II begins, marked by "Part II: Theory of Data Graphics".

**Page range**: pp. 91-105

## Chapter Content

Chapter 4 introduces Tufte's central theoretical framework. Key themes:

- **Data-Ink Ratio**: The fundamental metric (data-ink / total ink)
- **Erasing Principles**: Two principles for improving graphics through removal
- **Bar Chart Redesign**: Step-by-step demonstration of erasing non-data-ink
- **Box Plot Evolution**: From raw data to Tukey's box plot
- **Above All Else Show the Data**: The primary principle

## Visual Extraction

**High visual density.** This chapter is built around before/after demonstrations.

1. **Examine redesign sequences** - Multiple versions showing progressive improvement
2. **Capture each erasing step** - What gets removed and why
3. **Note the before/after pairs** - These are the core examples
4. **Describe visual components** - What remains after erasing

### Key Figures to Examine

- Bar chart redesign sequence (pp. 96-100) - step-by-step erasing
- Box plot development sequence - from data to final form
- Data-ink ratio diagrams - the concept visualized
- Comparison graphics - before and after versions

## Extraction Guidance

### What to Extract

1. **Named principles**:
   - "Above all else show the data" (p. 92)
   - "Maximize the data-ink ratio" (p. 96)
   - "Erase non-data-ink" (p. 96)
   - "Erase redundant data-ink" (p. 96)
   - "Revise and edit" (p. 105)

2. **Redesign techniques**: Each distinct erasing/simplification method
3. **Evaluation metrics**: Data-ink ratio as calculation
4. **Specific redesigns**: Bar chart simplification, box plot development

### Direction

Most techniques are `construction` (how to improve graphics) but also work for `recognition` (identifying what could be erased):
- Default to `both` for erasing principles
- Use `construction` for specific redesign techniques

### Components

These techniques have clear structural components:
```yaml
components:
  - element: data-ink
    encodes: Information that varies with the data
  - element: non-data-ink
    encodes: Structure that could be removed
```

### Extensions

This chapter is rich in principle statements:
```yaml
extensions:
  tufte_principle: "Above all else show the data"
  data_ink_effect: "increases"  # Effect on data-ink ratio
  redesign_type: "erasing" | "redrawing"
  figure_reference: "Figure 4.X, p. XX"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch4-data-ink/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch4-data-ink/
```
