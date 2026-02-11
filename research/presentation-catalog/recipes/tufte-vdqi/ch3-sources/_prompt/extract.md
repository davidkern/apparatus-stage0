# Extract Recipes: Chapter 3 - Sources of Graphical Integrity and Sophistication

Extract presentation recipes from Chapter 3 of Tufte's *Visual Display of Quantitative Information*.

## Source Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/_context.md`

This provides:
- Work metadata and reference format
- Terminology guidance
- Direction hints for the `direction` field
- Extension patterns specific to Tufte

## Source Files

Read from `/work/apparatus-research/reference/tufte/visual-display-quantitative/`:

1. `ch3-4a.pdf` - **First portion only** (approximately pages 79-87)

**Important**: This file contains both Chapter 3 and the beginning of Chapter 4. Extract only Chapter 3 content, which ends before "Part II: Theory of Data Graphics" begins.

**Page range**: pp. 79-87 (the conclusion of Part I)

## Chapter Content

Chapter 3 examines why some graphics are better than others. Key themes:

- **Institutional Sources**: Why news graphics differ from scientific graphics
- **Doctrine vs. Practice**: What designers are taught vs. what works
- **Sophistication Measures**: Audience assumptions and their effects
- **Publishing Context**: How medium affects graphic quality
- **The State of the Art**: Assessment of contemporary practice

## Visual Extraction

This chapter is more analytical than visual, but still examine:

1. **Comparison graphics** - News vs. scientific publication examples
2. **Quality spectrum** - Range from poor to excellent
3. **Context effects** - How the same data appears in different venues

### Key Content to Examine

- Comparison of graphics from different publications
- Analysis of why certain contexts produce better graphics
- Tufte's critique of design doctrine

## Extraction Guidance

### What to Extract

1. **Context principles**: How publishing context affects quality
2. **Audience calibration**: Adjusting sophistication to audience
3. **Doctrine critiques**: What common advice Tufte rejects and why
4. **Quality indicators**: Signs of sophisticated vs. unsophisticated graphics

### Direction

This chapter is primarily analytical:
- **Recognition**: Evaluating graphics based on context
- **Construction**: Some guidance on matching graphics to audience

Most techniques here will be `recognition` or `both`.

### Expected Recipe Density

Lower density than Chapters 4-6. This chapter is more philosophical, establishing context for the redesign techniques that follow. Extract:
- Distinct evaluation criteria
- Audience calibration techniques
- Any named principles

### Extensions

Consider adding:
```yaml
extensions:
  context_type: "scientific" | "news" | "business"
  sophistication_level: "high" | "medium" | "low"
```

## Output

Write recipe files to: `/work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch3-sources/`

Each file: `<slug>.md` following the schema in `recipes/SCHEMA.md`

## General Extraction Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

This provides format requirements, body structure, and quality checks.

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/tufte-vdqi/ch3-sources/
```
