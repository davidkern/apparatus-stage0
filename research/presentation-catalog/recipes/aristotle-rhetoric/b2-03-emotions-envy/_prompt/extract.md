# Extraction Prompt: b2-03-emotions-envy

## Task

Extract recipes from Aristotle's Rhetoric, Book 2, Chapters 8-11 (Pity, Indignation, Envy, Emulation).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b2-03-emotions-envy.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 2, Chapters 8-11 (approximately 1385b11-1388b30)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk completes the treatment of emotions with a complex set of **social/comparative emotions**.

### Core Emotions to Extract

1. **Pity (eleos)**:
   - Definition: Pain at apparent evil, destructive or painful, befalling one who does not deserve it
   - What evokes pity (undeserved suffering, death, old age, etc.)
   - Who feels pity (those who think they could suffer similarly)
   - Who is pitied (those similar to us, recently known to us)
   - Conditions that block pity (too much misfortune, too little)

2. **Indignation (nemesis)** — Righteous anger at undeserved fortune:
   - Definition: Pain at undeserved good fortune
   - Distinguished from envy (nemesis is about justice)
   - Who feels indignation (those who think they deserve goods)
   - What triggers indignation (nouveaux riches, unworthy power)

3. **Envy (phthonos)**:
   - Definition: Pain at good fortune of equals/similar people
   - Distinguished from indignation (envy is regardless of desert)
   - Who feels envy (ambitious, small-minded)
   - Toward whom envy is felt (those similar in age, reputation, etc.)
   - What is envied (goods we desire ourselves)

4. **Emulation (zelos)** — The positive version of envy:
   - Definition: Pain at presence of honored goods in others, not because they have them but because we don't
   - Distinguished from envy (emulation is noble, envy is base)
   - Who feels emulation (those who think they deserve goods)
   - What is emulated (virtues, possessions of the good)

### Extraction Hints

- These emotions form a **complex web** of relationships:
  - Pity vs. indignation (about suffering vs. fortune)
  - Envy vs. emulation (base vs. noble response to others' goods)
  - Nemesis vs. envy (about desert vs. regardless of desert)
- Aristotle's distinctions between similar emotions are themselves techniques
- **Pity** is especially important for judicial rhetoric
- The "similarity" condition recurs — we pity/envy those like us

### Direction Guidance

- **Pity**: `both` (arouse pity for client, or block pity for opponent)
- **Indignation**: `both` (make audience indignant at opponent's undeserved fortune)
- **Envy**: `both` (usually to avoid arousing envy against oneself)
- **Emulation**: `construction` (inspire audience to virtuous emulation)

### Extensions

```yaml
extensions:
  emotion_triad:
    state_of_mind: "..."
    toward_whom: "..."
    causes: "..."
  emotion_distinction:
    contrasts_with: "..."  # Related emotion it's distinguished from
    key_difference: "..."  # What makes them different
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-03-emotions-envy/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1386a1-5` or `Book 2, Chapter 8, 1386a1`

## Terminology

Preserve Greek terms:
- eleos (pity, compassion)
- nemesis (indignation, righteous anger)
- phthonos (envy)
- zelos (emulation, rivalry)
- epichairekakia (malicious joy, schadenfreude) — if present

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-03-emotions-envy/
```
