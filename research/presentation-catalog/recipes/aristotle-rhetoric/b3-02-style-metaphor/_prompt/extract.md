# Extraction Prompt: b3-02-style-metaphor

## Task

Extract recipes from Aristotle's Rhetoric, Book 3, Chapters 7-12 (Metaphor, Simile, Wit, Written vs. Spoken Style).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b3-02-style-metaphor.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 3, Chapters 7-12 (approximately 1408a37-1414a28)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk contains Aristotle's detailed treatment of **metaphor** and related devices.

### Core Topics to Extract

1. **Metaphor Types** (Chapter 10-11):
   - From genus to species
   - From species to genus
   - From species to species
   - **By analogy/proportion** — the most valued type (A:B :: C:D)
   - Active vs. passive metaphors

2. **Simile (eikōn)** — Comparison with "like":
   - Relationship to metaphor (simile = metaphor + "like")
   - When to use simile vs. metaphor
   - Extended similes

3. **Wit and Urbanity (asteia)** — Chapter 11:
   - Definition of urbanity (quick learning)
   - Sources of wit
   - Surprise and recognition
   - Well-turned phrases

4. **Bringing Before the Eyes (pro ommatōn)**:
   - Making things vivid
   - Actuality and motion
   - Showing things in action

5. **Written vs. Spoken Style** — Chapter 12:
   - Precision for written style
   - Delivery suited for spoken
   - What works on page vs. in performance
   - Repeated words in spoken style

6. **Appropriateness of Metaphor** — Chapter 7:
   - Matching metaphor to subject
   - Avoiding inappropriate elevation/degradation
   - Proportionate metaphors

7. **Sources of Metaphor**:
   - From beautiful things
   - To the ear (sound)
   - To the mind (meaning)
   - Before the eyes (visualization)

### Extraction Hints

- **Metaphor by analogy** is the key technique — extract with the A:B :: C:D structure
- **Wit/asteia** chapter is rich with examples — quote them
- The **written vs. spoken** distinction is highly practical
- "Bringing before the eyes" (energeia/enargeia) is a major concept
- Many examples from poets — generalize the techniques beyond their examples

### Direction Guidance

- **Metaphor types**: `construction` (how to create effective metaphors)
- **Simile**: `construction` (how to use comparisons)
- **Wit**: `both` (create wit and recognize what makes things witty)
- **Vividness**: `construction` (how to make prose vivid)
- **Written/spoken**: `construction` (how to adapt style to medium)

### Extensions

For metaphor types:
```yaml
extensions:
  metaphor_type: "genus-species" | "species-genus" | "species-species" | "analogy"
  analogy_structure:  # For analogical metaphors
    a: "..."
    b: "..."
    c: "..."
    d: "..."
```

For style mode:
```yaml
extensions:
  style_mode: "written" | "spoken" | "both"
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b3-02-style-metaphor/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1410b1-5` or `Book 3, Chapter 10, 1410b1`

## Terminology

Preserve Greek terms:
- metaphora (metaphor)
- eikōn (simile, image, likeness)
- asteia (witty sayings, urbanities)
- asteios (witty, urbane)
- pro ommatōn (before the eyes)
- energeia (actuality, vividness)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b3-02-style-metaphor/
```
