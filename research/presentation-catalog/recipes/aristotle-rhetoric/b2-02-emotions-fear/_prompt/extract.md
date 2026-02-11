# Extraction Prompt: b2-02-emotions-fear

## Task

Extract recipes from Aristotle's Rhetoric, Book 2, Chapters 5-7 (Fear, Confidence, Shame, Kindness).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b2-02-emotions-fear.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 2, Chapters 5-7 (approximately 1382a20-1385b10)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk continues the systematic treatment of emotions, covering **paired opposites**.

### Core Emotions to Extract

1. **Fear (phobos)**:
   - Definition: Pain at the appearance of impending evil
   - What things are feared (destructive, painful)
   - Who fears (those who think they can suffer)
   - Signs of fearful things (nearness, power of enemies)

2. **Confidence (tharsos)** — The opposite of fear:
   - Definition: Hope accompanied by imagination of safety
   - What produces confidence
   - Who feels confident
   - Conditions that make things seem distant/safe

3. **Shame (aischyne)**:
   - Definition: Pain concerning evils that seem to bring disrepute
   - What things cause shame (cowardice, injustice, etc.)
   - Before whom we feel shame (those whose opinion matters)
   - Conditions that make us sensitive to shame

4. **Shamelessness (anaischyntia)** — The opposite of shame:
   - Definition: Contempt or indifference toward shameful things
   - Conditions that produce shamelessness
   - Who is shameless

5. **Kindness/Favor (charis)**:
   - Definition: Service to one in need, not for return
   - What constitutes genuine kindness
   - Conditions that produce feelings of gratitude
   - Who receives kindness (those in need)

6. **Unkindness** — The opposite of kindness:
   - Conditions that negate kindness
   - What makes apparent kindness not count

### Extraction Hints

- Each emotion follows the **triadic structure** from the previous chunk
- **Fear and confidence** are explicitly paired — note the inversion
- **Shame** is particularly rich — Aristotle lists many shameful actions
- The "before whom" element of shame is important — audience awareness
- **Kindness** has specific criteria for what counts as genuine

### Direction Guidance

- **Fear**: `both` (arouse fear of consequences, or provide confidence)
- **Confidence**: `both` (build confidence, or undermine false confidence)
- **Shame**: `both` (make opponent's actions seem shameful, or defend against shame)
- **Kindness**: `both` (demonstrate kindness, or show opponent's unkindness)

### Extensions

```yaml
extensions:
  emotion_triad:
    state_of_mind: "..."
    toward_whom: "..."
    causes: "..."
  emotion_pair: "fear"  # Or its opposite "confidence"
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-02-emotions-fear/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1382b1-5` or `Book 2, Chapter 5, 1382b1`

## Terminology

Preserve Greek terms:
- phobos (fear)
- tharsos/tharrein (confidence)
- aischyne (shame)
- anaischyntia (shamelessness)
- charis (kindness, favor, gratitude)
- acharis (unkindness)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-02-emotions-fear/
```
