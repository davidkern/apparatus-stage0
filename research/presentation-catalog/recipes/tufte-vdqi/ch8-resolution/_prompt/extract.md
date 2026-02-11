# Extract Recipes: Chapter 8 - High-Resolution Data Graphics

Extract presentation recipes from Chapter 8 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (data density, shrink principle, small multiples)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch8-9a.pdf` - Chapter 8: High-resolution graphics, data density, shrinking

**Page range**: pp. 163-177

## Chapter Content

Chapter 8 argues for denser, smaller graphics. Key themes:

- **Data Density**: Numbers per square inch as a metric
- **The Shrink Principle**: Graphics can shrink far more than text
- **Small Multiples**: Repeated frames for comparison
- **High-Resolution Displays**: Maximizing information per page
- **Eye-Brain Capacity**: What readers can actually process

## Visual Extraction

This chapter advocates for visual density and demonstrates it.

1. **Note data density comparisons** - Sparse vs. dense examples
2. **Examine shrunk graphics** - Do they remain readable?
3. **See small multiples** - Arrays of repeated designs
4. **Compare resolutions** - Same data at different sizes

### Key Figures to Examine

- Data density calculations (numbers per square inch)
- Shrunk graphics demonstrations
- Small multiples arrays
- High-resolution example pages

## Extraction Guidance

### What to Extract

1. **The Shrink Principle** (p. 167): Named principle about graphic sizing
2. **Data density calculation**: The metric and benchmarks
3. **Small multiples design**: When and how to use repeated frames
4. **Resolution techniques**: How to increase information density

### Direction

Mixed:
- **Construction**: How to design dense, small graphics
- **Recognition**: Evaluating whether graphics could be denser

Default to `both`.

### Components

Small multiples have structure:
```yaml
components:
  - element: frame
    encodes: Single data state
  - element: array
    encodes: Comparison across states
  - element: constant-design
    encodes: What stays the same (enabling comparison)
```

### Parameters

```yaml
parameters:
  array_dimension: "1D | 2D"
  variation_type: "time | condition | category"
```

### Extensions

```yaml
extensions:
  tufte_principle: "The shrink principle"
  data_density: "X numbers per square inch"
  figure_reference: "Figure 8.X, p. XX"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch8-resolution/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch8-resolution/
```
