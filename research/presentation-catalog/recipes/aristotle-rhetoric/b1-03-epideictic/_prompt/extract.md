# Extraction Prompt: b1-03-epideictic

## Task

Extract recipes from Aristotle's Rhetoric, Book 1, Chapter 9 (Epideictic Rhetoric).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b1-03-epideictic.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 1, Chapter 9 (approximately 1366a23-1368a37)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk covers **epideictic rhetoric** (epideiktikon) — ceremonial speeches of praise and blame.

### Core Topics to Extract

1. **Virtue (arete) and Its Species** — The excellences that merit praise:
   - Justice, courage, temperance
   - Magnificence, magnanimity
   - Liberality, gentleness, prudence, wisdom

2. **The Noble (to kalon)** — What is praiseworthy:
   - Definition of the noble
   - Relationship to virtue

3. **Praise Techniques** — How to construct praise:
   - Praising actions, not just character
   - Making the subject seem to have acted deliberately
   - Attributing noble intentions

4. **Amplification (auxesis)** — Making things seem greater:
   - Use of superlatives
   - Comparison with the great
   - Being first or only
   - Circumstances of achievement

5. **Blame Techniques** — The inverse of praise:
   - Vices as opposites of virtues
   - Making actions seem shameful

6. **Advice and Praise Connection** — Converting between epideictic and deliberative:
   - Transforming praise into advice
   - Using praise structure for persuasion

### Extraction Hints

- The virtue catalog is rich content — each virtue could be a recipe for how to praise it
- **Amplification techniques** are especially explicit and extractable
- Note the technique of converting between advice and praise — this is a meta-technique
- Look for the "first/only/most" patterns for amplification

### Direction Guidance

- **Praise/blame techniques**: `both` (can construct praise or recognize how others praise)
- **Virtue definitions**: `both` (know what to praise and what counts as praiseworthy)
- **Amplification**: `construction` primarily, but recognition is implicit

### Extensions

For epideictic-specific recipes:
```yaml
extensions:
  speech_species: ["epideictic"]
  time_orientation: present  # Epideictic concerns current state
  virtue_type: "..."  # If specific to a virtue
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-03-epideictic/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1366b1-5` or `Book 1, Chapter 9, 1366b1`

## Terminology

Preserve Greek terms:
- epideiktikon (epideictic)
- arete (virtue, excellence)
- to kalon (the noble, the beautiful)
- auxesis (amplification)
- epainos (praise)
- psogos (blame)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b1-03-epideictic/
```
