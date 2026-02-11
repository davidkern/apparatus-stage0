# Extract Recipes: Chapter 2 - Graphical Integrity

Extract presentation recipes from Chapter 2 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance (Lie Factor, data-ink, etc.)
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read these PDF files from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch2a.pdf` - Lie Factor introduction, distortion examples
2. `ch2b.pdf` - Context, design variation, sources of deception

**Page range**: pp. 53-77

## Chapter Content

Chapter 2 addresses honesty in data graphics. Key themes:

- **Lie Factor**: The ratio of effect size in the graphic to effect size in the data
- **Visual Distortion**: How graphics can misrepresent data
- **Context**: The importance of baselines, appropriate comparisons
- **Design Variation**: How changing visual variables affects perception
- **Sources of Graphical Lies**: Omitted baselines, non-zero origins, perspective distortion

## Visual Extraction

This chapter demonstrates distortion through negative examples. When extracting:

1. **Examine distorted graphics** - Understand what makes them deceptive
2. **Note the corrections** - Tufte often shows what the honest version would look like
3. **Quantify where possible** - Lie Factor calculations are demonstrative
4. **Describe the mechanism** - How does this specific distortion mislead?

### Key Figures to Examine

- Fuel economy graphic (pp. 57-58) - classic Lie Factor example
- Shrinking doctor graphic - perspective distortion
- New York Times graphics - both good and bad examples
- Baseline manipulation examples

## Extraction Guidance

### What to Extract

1. **Lie Factor**: The evaluation metric and how to calculate it
2. **Distortion types**: Each distinct way graphics can mislead
3. **Context principles**: When to show zero, appropriate baselines
4. **Design variation effects**: How visual encoding affects perception
5. **Integrity principles**: Tufte's stated rules for honest graphics

### Direction

This chapter includes both:
- **Recognition** techniques: How to detect graphical lies (Lie Factor, spotting distortions)
- **Construction** techniques: How to avoid creating misleading graphics

Many work `both` ways. Pure detection techniques should be `recognition`.

### Warnings

This chapter is rich in failure modes. Capture these in the `warnings` field:
- When a technique becomes deceptive
- Thresholds (Lie Factor > 1.05 indicates distortion)
- Common mistakes to avoid

### Extensions

Consider adding:
```yaml
extensions:
  lie_factor_effect: "exaggerates" | "minimizes"  # Direction of distortion
  figure_reference: "Figure X.X, p. XX"
  distortion_type: "perspective" | "baseline" | "area" | "scale"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch2-integrity/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch2-integrity/
```
