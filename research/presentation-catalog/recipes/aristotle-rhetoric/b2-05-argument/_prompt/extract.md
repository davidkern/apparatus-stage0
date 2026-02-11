# Extraction Prompt: b2-05-argument

## Task

Extract recipes from Aristotle's Rhetoric, Book 2, Chapters 18-26 (Common Topics, Enthymemes, Maxims, Refutation).

Follow the extraction procedure in `/work/apparatus-research/research/presentation-catalog/recipes/_generators/extract-recipes.md`.

## Source

- **File**: `/work/apparatus-research/reference/aristotle/chunks/b2-05-argument.txt`
- **Work**: Rhetoric
- **Author**: Aristotle
- **Translation**: George A. Kennedy (Oxford, 2007)
- **Coverage**: Book 2, Chapters 18-26 (approximately 1391b8-1403a16)

## Context

Integrate guidance from:
- `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`
- `/work/apparatus-research/research/presentation-catalog/recipes/_context.md`

## Content Focus

This is the **densest chunk for extraction** — containing the 28 common topics (topoi koinoi), maxims, apparent enthymemes, and refutation techniques.

### Core Topics to Extract

#### The 28 Common Topics (Chapter 23)

Aristotle numbers these explicitly. Each is a distinct recipe:

1. From opposites (ek tōn enantiōn)
2. From grammatical forms (ek tōn homoiōn ptōseōn)
3. From correlatives (ek tōn pros allēla)
4. From more and less (ek tou mallon kai hētton)
5. From consideration of time (ek tou chronou)
6. From turning opponent's words (ek tōn eirēmenōn kath' hautou)
7. From definition (ek tou horisasthai)
8. From multiple meanings (ek tou posachōs)
9. From division (ek dihaireseōs)
10. From induction (ex epagōgēs)
11. From existing judgment (ek kriseōs)
12. From parts (ek tōn merōn)
13. From consequences (ek tou akolouthou)
14. From contradictory alternatives (antistrophōs)
15. From non-appearance vs. expectation (ek tou mē phanerōs)
16. From proportional results (ek tōn analogon)
17. From identical results (ek tou tauton)
18. From changed choices (ek tou metaballein)
19. From attributed motive (ek tou houtou heneka)
20. From incentives and deterrents (ek tōn protreptikōn kai apotreptikōn)
21. From incredible but true (ek tōn apistōn)
22. From contradiction (ek tou enantiousthai)
23. From cause of false impression (ek tēs aitias)
24. From omitted cause (ek tou endechetai aitian)
25. From better alternative (ek tou beltion)
26. From inconsistent actions (ek tōn mē homoiōs)
27. From previous mistakes (ek tou hamartēmatos)
28. From name etymology (ek tou onomatos)

#### Maxims (gnōmai) — Chapters 21-22

- Definition of maxim
- Types of maxims (with/without epilogue)
- When to use maxims
- Effect of maxims (make speech ethical)

#### Apparent Enthymemes (Chapter 24)

Nine types of fallacious or sophistical enthymemes:
1. From diction (appearance of conclusion)
2. From homonymy
3. From dividing the combined
4. From combining the divided
5. From exaggeration
6. From sign (non-necessary)
7. From accident
8. From consequence (affirming consequent)
9. From post hoc (false cause)

#### Refutation (lysis) — Chapter 25

- Four kinds of objection
- Refuting enthymemes
- Counter-enthymemes vs. objections

#### Amplification — Chapter 26

- Not a separate topic but a use of topics
- Uses of "more and less"

### Extraction Hints

- **Number the 28 topics explicitly** in extensions
- Each topic has a NAME — preserve the Greek in `original_term`
- Aristotle gives EXAMPLES for each — quote them
- The fallacious forms (Chapter 24) are WARNINGS — extract separately
- Refutation techniques are bidirectional — know both to attack and defend

### Direction Guidance

- **All 28 topics**: `both` (construct arguments and recognize opponent's)
- **Maxims**: `construction` primarily
- **Apparent enthymemes**: `recognition` primarily (identify fallacies)
- **Refutation**: `both` (refute and defend against refutation)

### Extensions

For the 28 topics:
```yaml
extensions:
  aristotle_topic_number: 1-28
```

For apparent enthymemes:
```yaml
extensions:
  fallacious_form:
    name: "..."
    description: "..."
```

## Output

Create recipe files in: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-05-argument/`

**Expect 40+ recipes from this chunk** — the 28 topics, maxim types, 9 apparent enthymemes, refutation techniques.

Each file: `<slug>.md` conforming to SCHEMA.md

## Location References

Use Bekker numbers: `1397a7` or `Book 2, Chapter 23, 1397a7`

The 28 topics begin at approximately 1397a7.

## Terminology

Preserve Greek terms for all named topics. Key terms:
- topoi koinoi (common topics)
- gnome (maxim)
- enthymema (enthymeme)
- lysis (refutation, solution)
- auxesis (amplification)

## Validation

After extraction, run:
```bash
python /work/apparatus-research/research/presentation-catalog/recipes/_tools/validate.py /work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/b2-05-argument/
```
