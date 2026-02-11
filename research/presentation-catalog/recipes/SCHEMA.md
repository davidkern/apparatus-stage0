# Recipe Schema

This document defines the precise schema for recipe files. Each recipe is a single
markdown file with YAML frontmatter for structured analysis and a rich body for
deeper understanding.

## Design Principles

1. **One file per recipe** — Avoids scalability issues, enables direct reference,
   isolates formatting mistakes.

2. **Structured frontmatter for analysis** — Precise schema we control, enabling
   programmatic analysis across the collection.

3. **Extensions for task flexibility** — Tasks may encounter patterns that don't
   fit the core schema. The `extensions` key allows structured additions without
   polluting the core schema.

4. **Rich body for understanding** — The frontmatter captures what we need for
   analysis; the body captures what we need for understanding. Neither is redundant.

## File Naming

```
<source>/<chunk>/<slug>.md
```

- `source`: Identifier for the source work (e.g., `aristotle-rhetoric`, `tufte-vdqi`)
- `chunk`: Extraction unit within the source (e.g., `b2-argument`, `ch1-intro`)
- `slug`: Kebab-case name derived from recipe name (e.g., `enthymeme-from-opposites`)

Example: `aristotle-rhetoric/b2-argument/enthymeme-from-opposites.md`

## Frontmatter Schema

```yaml
---
# === Identity ===
name: string                    # Technique name (required)
slug: string                    # URL-safe identifier, matches filename (required)
source:
  work: string                  # Source work title (required)
  author: string                # Author name (required)
  location: string              # Chapter, section, page (required)
  original_term: string         # Greek/Latin term if applicable (optional)

# === Classification ===
intent: string                  # What this technique communicates/achieves (required)
direction: enum                 # construction | recognition | both (required)
                                # - construction: how to produce this effect
                                # - recognition: how to identify this pattern
                                # - both: works bidirectionally

# === Structure ===
components:                     # What elements make up this technique (optional)
  - element: string             # Name of the component
    encodes: string             # What information/function this component carries
    required: boolean           # Whether this component is essential (default: true)

parameters:                     # What varies in application (optional)
  <param_name>: string          # Parameter name: type or enumeration

# === Relationships ===
related:                        # Connections to other recipes (optional)
  - slug: string                # Related recipe slug
    relationship: enum          # contains | contained-by | contrasts | combines-with | variant-of

# === Context ===
audience:                       # Audience/context sensitivity (optional)
  - context: string             # When/where this applies
    adaptation: string          # How the technique adapts

warnings:                       # Limitations and failure modes (optional)
  - string                      # Each warning as a string

# === Task Extensions ===
extensions:                     # Task-defined structured data (optional)
  <key>: <any>                  # Tasks may add any structured data here
---
```

## Required vs Optional Fields

**Required:**
- `name`, `slug`
- `source.work`, `source.author`, `source.location`
- `intent`
- `direction`

**Optional (include when relevant):**
- `source.original_term`
- `components` — for techniques with identifiable parts
- `parameters` — for techniques with variation
- `related` — for cross-references
- `audience` — for context-sensitive techniques
- `warnings` — for techniques with failure modes
- `extensions` — for task-identified patterns

## Body Structure

The markdown body follows the frontmatter and provides richer detail than the
structured summary. Suggested sections:

```markdown
## Description

Full explanation of the technique, its purpose, and how it works. May include
the reasoning behind it, historical context, or theoretical grounding.

## Examples

Concrete examples from the source text. These are essential — multiple independent
extractions noted that examples illuminate patterns better than abstractions.

Quote examples directly when possible:
> "The example text from the source" (location reference)

## Usage

Guidance on when and how to apply the technique. Include:
- Conditions that make this technique appropriate
- Conditions that make it inappropriate
- How it combines with other techniques

## Notes

Additional observations, cross-references to other works, or commentary that
doesn't fit elsewhere.
```

Not all sections are required. Include what's relevant to the recipe.

## Example File

```markdown
---
name: Enthymeme from Opposites
slug: enthymeme-from-opposites
source:
  work: Rhetoric
  author: Aristotle
  location: Book 2, Chapter 23, 1397a7
  original_term: ek tōn enantiōn

intent: Establish a conclusion by showing that if the opposite claim leads to the opposite result, the original claim leads to the original result
direction: both

components:
  - element: opposite-pair
    encodes: Two contrary states or actions
  - element: consequence-pair
    encodes: The results that follow from each
  - element: implicit-premise
    encodes: That opposites yield opposite results (unstated)

parameters:
  domain: actions | states | qualities

related:
  - slug: enthymeme-from-correlatives
    relationship: variant-of

warnings:
  - "Opposites must be genuine contraries, not merely different things"
  - "The opposite consequence must actually follow; correlation is not enough"

extensions:
  aristotle_topic_number: 1
  fallacious_form:
    name: false-dichotomy
    description: "Presenting non-opposites as if they were contraries"
---

## Description

The first of Aristotle's twenty-eight valid topics for constructing enthymemes.
The speaker argues that if one thing is true of X, the opposite is true of not-X.
The power of this topic lies in the implicit premise — audiences naturally assume
opposites yield opposite results without the speaker stating it explicitly.

This topic works bidirectionally: it can construct arguments for a position by
examining its opposite, or it can refute arguments by showing the opposite claim
doesn't yield the opposite result.

## Examples

> "Self-control is good, for lack of self-control is harmful." (1397a9)

The argument leaves unstated: "harmful things are bad, therefore the opposite
(self-control) must be good."

> "If war is the cause of present evils, things should be set right by peace."

Kennedy notes this example from the *Messeniacus* demonstrates the topic in
deliberative context — arguing for a policy by examining its opposite.

## Usage

Most effective when:
- The opposites are obvious and uncontroversial
- The consequences are well-known or easily established
- The audience is predisposed to accept symmetry

Less effective when:
- The situation is asymmetric (good of X doesn't imply bad of not-X)
- The opposites are contested or unclear
- The audience is analytically sophisticated

Combines well with:
- **Enthymeme from correlatives** — for relationships that aren't strictly opposite
- **Amplification** — to emphasize the contrast

## Notes

Aristotle lists this first among the topics, suggesting its fundamental importance.
Kennedy notes the topic appears frequently in the *Topics* (113b15ff) where it
receives fuller treatment.

The fallacious form (false dichotomy) occurs when the speaker treats non-opposites
as if they were contraries. Aristotle addresses apparent enthymemes in Chapter 24.
```

## Validation

Run the validator before completing extraction work:

```bash
# From recipes/ directory
python _tools/validate.py <source>/<chunk>/

# Validate single file
python _tools/validate.py <source>/<chunk>/<recipe>.md
```

The validator checks:
- **Schema conformance**: Required fields present, correct types, valid enum values
- **Slug/filename match**: Slug must match the filename (minus `.md`)
- **Body quality**: Content present, examples recommended
- **Structure**: Components, related, audience, warnings have correct shape

Exit codes:
- `0`: Passed (may have warnings)
- `1`: Failed (has errors)

Fix all errors before completing. Warnings indicate recommended improvements.

## Extraction Methodology

When extracting recipes from a source:

1. **One file per recipe** — Create a separate file for each distinct technique.
   If uncertain whether something is one recipe or two, prefer two files.

2. **Frontmatter first** — Fill in the structured fields before writing the body.
   This forces clarity about what the recipe actually is.

3. **Direction is required** — Every recipe must specify whether it's for
   construction, recognition, or both. This was the strongest signal from
   independent extraction convergence.

4. **Preserve examples** — Examples from the source are essential. Quote them
   directly with location references.

5. **Note warnings** — If the source mentions limitations, failure modes, or
   when the technique doesn't apply, capture these in the `warnings` field.

6. **Use extensions for patterns** — If you encounter a pattern that doesn't fit
   the schema (e.g., emotional triads, character types, topic numbering), add it
   under `extensions` with a clear key name. Don't force it into the core schema.

7. **Body elaborates, doesn't duplicate** — The body should add understanding,
   not repeat the frontmatter in prose form.
