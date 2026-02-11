# Prompt: Consolidate Aristotle Rhetoric Recipes

## Procedure

Follow: `/work/apparatus-research/research/presentation-catalog/recipes/_generators/consolidate-source.md`

## Context

Read: `/work/apparatus-research/research/presentation-catalog/recipes/aristotle-rhetoric/_context.md`

## Scope

Consolidate all recipes extracted from the 12 chunks of Aristotle's Rhetoric:

- `b1-01-definition/`
- `b1-02-deliberative/`
- `b1-03-epideictic/`
- `b1-04-judicial/`
- `b2-01-emotions-intro/`
- `b2-02-emotions-fear/`
- `b2-03-emotions-envy/`
- `b2-04-character/`
- `b2-05-argument/`
- `b3-01-style-intro/`
- `b3-02-style-metaphor/`
- `b3-03-arrangement/`

## Expected Consolidation Tasks

### Duplicate Identification

Likely duplicates to watch for:

1. **Enthymeme/paradigm**: Defined in b1-01-definition, referenced throughout
2. **Amplification**: Discussed in b1-03-epideictic and b3-03-arrangement
3. **Maxims**: Introduced in b2-05-argument, applied in b3-03-arrangement
4. **Metaphor**: Foundation in b3-01-style-intro, elaboration in b3-02-style-metaphor
5. **Ethos/pathos/logos**: Defined in b1-01, elaborated in Book 2

Resolution principle: Keep the most complete version where the technique is *primarily*
discussed. Add `also_found_in` extension noting other locations.

### Cross-Reference Population

Key relationships to establish:

1. **28 Topics**: Many share structural patterns (variant-of, contrasts relationships)
2. **Emotions**: Paired emotions (anger/calmness, fear/confidence) contrast each other
3. **Speech parts**: Prooemion, narration, proof, epilogue contain other techniques
4. **Fallacious forms**: Each apparent enthymeme contrasts with a valid topic

### Consistency Checks

1. **Bekker numbers**: All locations should use consistent format
2. **Greek terms**: Check `original_term` uses transliteration consistently
3. **Direction**: Verify `both` is appropriate (not defaulted without consideration)
4. **Extensions**: Standardize keys (`aristotle_topic_number`, `emotion_triad`, etc.)

### Gap Identification

Document in `_notes.md`:

1. **Topics not extracted**: Cross-check against the 28 named topics
2. **Emotions missed**: Verify all emotion chapters yielded recipes
3. **Referenced techniques**: Note any techniques mentioned but not extracted
4. **Book 3 coverage**: Style/arrangement often overlooked - verify coverage

## Output

After consolidation:

```
aristotle-rhetoric/
├── _context.md
├── _notes.md          # Gaps, observations, consolidation decisions
├── _prompt/
│   ├── generate-chunks.md
│   └── consolidate.md
├── b1-01-definition/
│   └── *.md           # Consolidated recipes
├── ...
└── b3-03-arrangement/
    └── *.md
```

## Validation

Run validator on entire source after consolidation:

```bash
python _tools/validate.py aristotle-rhetoric/
```

Fix any errors before completing.

## Report

When complete, report:

1. Total recipes after consolidation
2. Duplicates resolved (count and which)
3. Cross-references added (count)
4. Gaps identified (list)
5. Any issues requiring manual attention
