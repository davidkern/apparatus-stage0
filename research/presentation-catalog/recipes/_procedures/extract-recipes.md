# Procedure: Extract Recipes

This procedure describes how to extract recipes from a single chunk of source
material. It is source-agnostic — source-specific guidance comes from context
files.

## Prerequisites

- PDF chunk to extract from (path provided in parameters)
- SCHEMA.md defining the recipe format
- Integrated context providing source-specific guidance

## Task

Extract **recipes** from the provided source material. A recipe is a technique,
pattern, or method that can be used to achieve a communicative intent.

### Output Format

Create one markdown file per recipe in the current chunk directory.

Each file has:
1. YAML frontmatter conforming to SCHEMA.md
2. Markdown body with description, examples, and usage guidance

Filename: `<slug>.md` where slug matches the `slug` field in frontmatter.

### Required Frontmatter Fields

Every recipe must have:
- `name` — Technique name
- `slug` — URL-safe identifier (lowercase-kebab, matches filename)
- `source.work` — Source work title
- `source.author` — Author name
- `source.location` — Location reference (format per source context)
- `intent` — What this technique communicates/achieves
- `direction` — One of: `construction`, `recognition`, `both`

### Body Sections

#### Description
Full explanation of the technique. Include reasoning, context, how it works.

#### Examples
**Essential.** Quote examples directly from the source with location references.
Examples illuminate patterns better than abstractions.

#### Usage
When and how to apply the technique. Conditions that make it appropriate or
inappropriate. How it combines with other techniques.

#### Notes (optional)
Cross-references, historical context, relationship to other works.

## Granularity

- If a technique has a distinct name in the source, it's a separate recipe
- Parameter variations of the same technique are one recipe with `parameters` field
- When uncertain whether something is one recipe or two, prefer two files

## Cross-references

Leave `related` field empty during extraction. Note relationships in comments:
```yaml
related: []  # TBD: see also <related-technique>
```

Consolidation pass will fill these in.

## Quality Checks

Before completing:
1. Each file passes validation (run validator on output directory)
2. Every recipe has at least one quoted example from the source
3. Slug matches filename
4. Direction is specified for every recipe

## Completion

When extraction is complete:
1. Run the validator on all created files
2. Fix any validation errors
3. Report summary: number of recipes extracted, any issues encountered
