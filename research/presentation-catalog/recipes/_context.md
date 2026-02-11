# Recipe Extraction Context

This context applies to all recipe extractions regardless of source.

## Task

You are extracting **recipes** from a primary source text. A recipe is a technique,
pattern, or method that can be used to achieve a communicative intent.

## Output Format

Create one markdown file per recipe. Each file has:
1. YAML frontmatter conforming to `recipes/SCHEMA.md`
2. Markdown body with description, examples, and usage guidance

Filename: `<slug>.md` where slug matches the `slug` field in frontmatter.

## Required Frontmatter Fields

Every recipe must have:
- `name` — technique name
- `slug` — URL-safe identifier (lowercase-kebab, matches filename)
- `source.work` — source work title
- `source.author` — author name
- `source.location` — chapter, section, page/line reference
- `intent` — what this technique communicates/achieves
- `direction` — one of: `construction`, `recognition`, `both`

## Direction Field

This was the strongest signal from independent extraction convergence (6+ files):
- `construction` — how to produce this effect
- `recognition` — how to identify this pattern
- `both` — works bidirectionally (most rhetorical techniques)

If a technique can be used to both create an effect AND to identify when someone
else is using it, use `both`.

## Body Content

The body should include:

### Description
Full explanation of the technique. Include reasoning, context, how it works.

### Examples
**Essential.** Quote examples directly from the source with location references.
Examples illuminate patterns better than abstractions.

### Usage
When and how to apply the technique. Conditions that make it appropriate or
inappropriate. How it combines with other techniques.

### Notes (optional)
Cross-references, historical context, relationship to other works.

## Quality Checks

Before completing, verify:
1. Each file passes validation (`python _tools/validate.py <directory>`)
2. Every recipe has at least one quoted example from the source
3. Slug matches filename
4. Direction is specified

## Granularity

If a technique has a distinct name in the source, it's a separate recipe.
Parameter variations of the same technique are one recipe with `parameters` field.

When uncertain whether something is one recipe or two, prefer two files.

## Cross-references

Leave `related` field empty during extraction. Note relationships in comments:
```yaml
related: []  # TBD: see also enthymeme-from-correlatives
```

Consolidation pass will fill these in.
