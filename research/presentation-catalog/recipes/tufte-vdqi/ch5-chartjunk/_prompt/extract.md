# Extract Recipes: Chapter 5 - Chartjunk

Extract presentation recipes from Chapter 5 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (chartjunk, moire, ducks)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch5-6a.pdf` - Chapter 5: Chartjunk types and examples

**Page range**: pp. 107-121

## Chapter Content

Chapter 5 catalogs types of non-data-ink that actively harm graphics. Key themes:

- **Moire Vibration**: Optical interference from dense parallel lines
- **The Grid**: When gridlines help vs. harm
- **Ducks**: Decoration that doesn't serve the data (from architecture)
- **Unintentional Optical Art**: When design creates visual noise
- **Self-Promoting Graphics**: When style overwhelms substance

## Visual Extraction

**Critical visual chapter.** Chartjunk is identified visually.

1. **Examine each chartjunk type** - See what moire, grids, ducks look like
2. **Note the visual effect** - How does this specific junk harm reading?
3. **Look for corrections** - What does the clean version look like?
4. **Categorize precisely** - Each chartjunk type is distinct

### Key Figures to Examine

- Moire pattern examples - vibrating crosshatch, dense fills
- Grid comparison - over-gridded vs. minimal
- "Duck" examples - graphics shaped like their subject
- Design magazine examples - style over substance

## Extraction Guidance

### What to Extract

1. **Chartjunk taxonomy**: Each distinct type of harmful non-data-ink
   - Moire vibration
   - Heavy gridlines
   - Ducks (decorative theming)
   - Unintentional optical art

2. **Detection criteria**: How to identify each type
3. **Remediation**: How to fix each type
4. **Edge cases**: When grids are acceptable, when decoration helps

### Direction

These are primarily **recognition** techniques (identifying chartjunk) that inform **construction** (avoiding chartjunk):
- Use `both` for most chartjunk types
- The chapter teaches both what to avoid and how to spot problems

### Warnings

Each chartjunk type should include warnings:
```yaml
warnings:
  - "Dense crosshatching creates moire vibration"
  - "Avoid fills with more than X lines per inch"
```

### Extensions

Categorize the chartjunk:
```yaml
extensions:
  chartjunk_type: "moire" | "grid" | "duck" | "optical-art"
  data_ink_effect: "decreases"  # All chartjunk decreases effective data-ink ratio
  figure_reference: "Figure 5.X, p. XX"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch5-chartjunk/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch5-chartjunk/
```
