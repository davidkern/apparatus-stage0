# Extract Recipes: Chapter 6 - Data-Ink Maximization and Graphical Design

Extract presentation recipes from Chapter 6 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (data-ink ratio, range-frame, etc.)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch5-6b.pdf` - Chapter 6: Maximization techniques and redesigns

**Page range**: pp. 123-137

## Chapter Content

Chapter 6 demonstrates specific redesign techniques that maximize data-ink. Key themes:

- **White Grid**: Using white space instead of black lines
- **Range-Frame**: Axes that encode data range, not just scale
- **Dot-Dash-Plot**: Marginal distributions on scatterplots
- **Redesigned Tables**: Data rectangles, row-column graphics
- **Histogram Redesign**: From bars to alternative displays

## Visual Extraction

**Very high visual density.** This chapter is a showcase of redesign techniques.

1. **Examine each redesign** - See the before and after
2. **Capture the technique precisely** - What changes? What's removed? What's added?
3. **Note the visual components** - Each technique has specific elements
4. **Compare variations** - Some techniques have multiple versions

### Key Figures to Examine

- White grid demonstration (vs. black grid)
- Range-frame examples - axes that show data extent
- Dot-dash-plot construction - marginal distributions
- Table redesigns - data rectangles
- Stem-and-leaf displays
- Histogram alternatives

## Extraction Guidance

### What to Extract

1. **Named techniques**:
   - White grid
   - Range-frame
   - Dot-dash-plot
   - Stem-and-leaf

2. **Redesign methods**: Each distinct transformation
3. **Component structures**: What elements make up each technique
4. **When to apply**: Conditions for each technique

### Direction

These are **construction** techniques with recognition implications:
- Default to `both`
- Some are purely `construction` (how to build a range-frame)

### Components

Each technique has identifiable parts:
```yaml
components:
  - element: range-frame
    encodes: Data range on each axis
  - element: data-point
    encodes: Individual observations
```

### Extensions

These techniques are highly specific:
```yaml
extensions:
  tufte_principle: "Maximize the data-ink ratio"
  data_ink_effect: "increases"
  redesign_type: "restructuring"  # These go beyond erasing to new forms
  figure_reference: "Figure 6.X, p. XX"
  original_form: "standard scatterplot"  # What it replaces
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch6-maximization/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch6-maximization/
```
