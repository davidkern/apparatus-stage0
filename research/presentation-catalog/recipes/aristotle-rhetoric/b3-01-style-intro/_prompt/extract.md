# Extraction Prompt: b3-01-style-intro

## Task

Extract recipes from Aristotle's Rhetoric, Book 3, Chapters 1-6 (Introduction to Style).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b3-01-style-intro.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 3, Chapters 1-6 (approximately 1403a17-1408a36)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk begins Book 3's treatment of **style (lexis)** — how to express arguments effectively.

### Core Topics to Extract

1. **Clarity (to saphes)** — The primary virtue of style:
   - Definition: Being understood
   - Means to clarity
   - Relationship to current/prevailing words
   - Avoiding obscurity

2. **Appropriateness (to prepon)** — Fitness of style to subject:
   - Matching style to subject matter
   - Matching style to speaker's character
   - Matching style to audience's emotion
   - Grand style for grand subjects

3. **Prose Rhythm (rhythmos)**:
   - Why prose should have rhythm but not meter
   - The paean as appropriate rhythm
   - Opening vs. closing rhythms
   - Avoiding poetic meters

4. **Introduction to Metaphor**:
   - Why metaphor is important for prose
   - Basic types of metaphor
   - (Fuller treatment in next chunk)

5. **Foreign/Unusual Words (glōtta)**:
   - Effect of unfamiliar vocabulary
   - When to use elevated diction
   - Dangers of excessive strangeness

6. **Compound Words**:
   - Dithyrambic compounds
   - When compounds are appropriate

7. **Correctness of Language (hellenismos)**:
   - Grammatical correctness
   - Proper use of connectives
   - Avoiding ambiguity
   - Using appropriate names for things

### Extraction Hints

- **Clarity** is the foundational virtue — extract as the primary style recipe
- **Appropriateness** has multiple dimensions (subject, character, emotion)
- The prose rhythm discussion is technical but has clear prescriptions
- Note the NEGATIVE guidance — what to AVOID is as important as what to do
- Aristotle references poetry often — distinguish prose-specific guidance

### Direction Guidance

- **Clarity**: `construction` (how to achieve clear expression)
- **Appropriateness**: `both` (achieve it and recognize when it's lacking)
- **Rhythm**: `construction` (how to create pleasing prose rhythm)
- **Correctness**: `construction` (how to write correct Greek — generalizable principles)

### Extensions

For style techniques:
```yaml
extensions:
  style_virtue: "clarity" | "appropriateness" | "rhythm" | "vividness"
  applies_to: "prose" | "poetry" | "both"
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b3-01-style-intro/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1404a1-5` or `Book 3, Chapter 2, 1404a1`

## Terminology

Preserve Greek terms:
- lexis (style, diction)
- to saphes (clarity)
- to prepon (appropriateness, propriety)
- rhythmos (rhythm)
- glōtta (foreign/rare word)
- hellenismos (correct Greek, grammatical correctness)
- metaphora (metaphor)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b3-01-style-intro/
```
