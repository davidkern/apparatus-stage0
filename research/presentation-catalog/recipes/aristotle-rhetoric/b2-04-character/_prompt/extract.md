# Extraction Prompt: b2-04-character

## Task

Extract recipes from Aristotle's Rhetoric, Book 2, Chapters 12-17 (Character Types).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b2-04-character.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 2, Chapters 12-17 (approximately 1388b31-1391b7)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk covers **ethos** from the audience perspective — character types and how to adapt speech accordingly.

### Core Topics to Extract

1. **Youth (neoi)** — Character of the young:
   - Passionate, quick-tempered, impulsive
   - Hopeful, trusting, easily deceived
   - Ambitious, honor-loving
   - Preference for the noble over the expedient
   - Live by feeling rather than reasoning

2. **Old Age (presbyteroi)** — Character of the elderly:
   - Cautious, suspicious, distrustful
   - Small-minded, concerned with survival
   - Live by memory, talk of the past
   - Neither hot nor cold in temper
   - Preference for the expedient over the noble

3. **Prime of Life (akme)** — Character of those in their prime:
   - Midpoint between youth and age
   - Neither excessive confidence nor excessive fear
   - Both courageous and temperate
   - Balance of nobility and expediency

4. **Good Birth (eugeneia)** — Character of the well-born:
   - Tendency to look down on those less well-born
   - Often degenerate from ancestors

5. **Wealth (ploutos)** — Character of the wealthy:
   - Insolent, arrogant
   - Believe money can buy everything
   - Soft, ostentatious
   - "Lucky fools"

6. **Power (dynamis)** — Character of the powerful:
   - More ambitious and manly than the wealthy
   - More serious because of responsibility
   - Dignified rather than ostentatious

7. **Good Fortune (eutychia)** — Character of the fortunate:
   - Combines traits of wealth, power, good birth
   - Relationship to the gods
   - Can breed insolence

### Extraction Hints

- Each character type is a recipe for **audience adaptation**
- The profiles tell speakers what appeals work with different audiences
- Look for the **contrasts** between types (youth vs. age especially)
- Note what each type **values** — this guides persuasive appeals
- These are generalizations Aristotle acknowledges have exceptions

### Direction Guidance

- **Character profiles**: `both` (adapt to audience, or recognize what appeals an opponent is using)
- **Audience adaptation**: `construction` (how to shape speech for different audiences)

### Extensions

```yaml
extensions:
  character_type: "youth" | "old_age" | "prime" | "well_born" | "wealthy" | "powerful" | "fortunate"
  audience_adaptation:
    appeals_to: "..."  # What this type values
    avoid: "..."       # What alienates this type
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-04-character/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1389a1-5` or `Book 2, Chapter 12, 1389a1`

## Terminology

Preserve Greek terms:
- ethos (character)
- neoi (young people, youth)
- presbyteroi (elders, old people)
- akme (prime of life)
- eugeneia (good birth, nobility)
- ploutos (wealth)
- dynamis (power)
- eutychia (good fortune)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-04-character/
```
