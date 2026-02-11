# Extraction Prompt: b2-01-emotions-intro

## Task

Extract recipes from Aristotle's Rhetoric, Book 2, Chapters 1-5 (Introduction to Emotions).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b2-01-emotions-intro.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 2, Chapters 1-5 (approximately 1377b12-1382a19)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This chunk begins Aristotle's systematic treatment of **emotions (pathe)** as means of persuasion.

### Core Topics to Extract

1. **Triadic Structure of Emotions** — Aristotle's analytical framework:
   - **State of mind** (pos echontes): What condition makes one feel this emotion
   - **Toward whom** (tisin): Who/what the emotion is directed at
   - **Causes** (epi poiois): What occasions/triggers the emotion

   This structure applies to ALL emotions — it's the master recipe for emotional appeals.

2. **Anger (orge)**:
   - Definition: Desire for revenge for apparent slight
   - Three types of slight: contempt, spite, insult
   - Who feels anger (state of mind)
   - Toward whom anger is felt
   - What causes anger

3. **Calmness/Mildness (praotes)** — The opposite of anger:
   - Definition: Settling down of anger
   - Conditions that produce calmness
   - Types of people toward whom we are calm

4. **Friendship/Liking (philia)** and **Enmity (echthra)**:
   - Definition of friend vs. enemy
   - Conditions for friendship
   - What produces friendly feelings
   - What produces enmity

5. **Fear Introduction** — Beginning of fear treatment:
   - Definition of fear
   - What things are feared
   - (Continues in next chunk)

### Extraction Hints

- The **triadic structure** is the key meta-recipe — extract it explicitly
- Each emotion (anger, calmness, friendship) follows this structure
- Look for Aristotle's explicit definitions: "Let anger be defined as..."
- The **three types of slight** (contempt, spite, insult) are named techniques
- Aristotle shows how to **arouse** and **calm** each emotion — bidirectional

### Direction Guidance

- **Emotion triads**: `both` (arouse the emotion, or calm/prevent it)
- **Anger techniques**: `both` (make audience angry at opponent, or calm their anger)
- **Friendship**: `construction` primarily (create goodwill toward speaker/client)

### Extensions

For emotion recipes, use the triadic structure:
```yaml
extensions:
  emotion_triad:
    state_of_mind: "..."
    toward_whom: "..."
    causes: "..."
  emotion_pair: "anger"  # Or the opposite emotion
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-01-emotions-intro/`

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1378a1-5` or `Book 2, Chapter 2, 1378a1`

## Terminology

Preserve Greek terms:
- pathos/pathe (emotion/emotions)
- orge (anger)
- praotes (calmness, mildness)
- philia (friendship, liking)
- echthra (enmity, hatred)
- phobos (fear)
- oligoria (slight, belittling)
- kataphronesis (contempt)
- epereasmós (spite)
- hybris (insult, outrage)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-01-emotions-intro/
```
