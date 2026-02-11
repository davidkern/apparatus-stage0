# Extract Recipes: Chapter 7 - Multifunctioning Graphical Elements

Extract presentation recipes from Chapter 7 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (multifunctioning elements, data density)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read these PDF files from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch7a.pdf` - Multifunctioning elements, data measures as data
2. `ch7b.pdf` - Layering, puzzle graphics, complexity management

**Page range**: pp. 139-161

## Chapter Content

Chapter 7 explores elements that serve multiple purposes simultaneously. Key themes:

- **Multifunctioning Elements**: Single marks that convey multiple meanings
- **Data Measures as Data**: When statistics (mean, range) are themselves data
- **Data Density**: Quantifying information per unit area
- **Puzzle Graphics**: When complexity serves understanding
- **Layering and Separation**: Managing visual complexity

## Visual Extraction

This chapter shows how single elements can encode multiple variables.

1. **Examine multifunctioning examples** - What does each mark encode?
2. **Count the functions** - How many variables does one element show?
3. **Note layering techniques** - How is complexity organized?
4. **Look for data density** - Information per square inch

### Key Figures to Examine

- Examples of single marks encoding multiple variables
- Data density calculations and comparisons
- Complex graphics that remain readable
- Layering demonstrations

## Extraction Guidance

### What to Extract

1. **Multifunctioning types**: Different ways elements serve multiple purposes
2. **Data density concept**: The metric and how to calculate it
3. **Layering techniques**: How to separate visual planes
4. **Complexity management**: When and how to add complexity

### Direction

These techniques are primarily **construction** (how to design efficient graphics):
- Default to `both` for general techniques
- Use `construction` for specific design methods

### Components

Multifunctioning elements have layered structure:
```yaml
components:
  - element: mark
    encodes: Primary data value
  - element: mark-position
    encodes: Secondary variable
  - element: mark-size
    encodes: Tertiary variable
```

### Parameters

These techniques vary by:
```yaml
parameters:
  variable_count: "2 | 3 | 4+"
  complexity_level: "moderate | high"
```

### Extensions

```yaml
extensions:
  data_density: "X numbers per square inch"  # If calculated
  function_count: 3  # Number of functions served by element
  figure_reference: "Figure 7.X, p. XX"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch7-multifunctioning/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch7-multifunctioning/
```
