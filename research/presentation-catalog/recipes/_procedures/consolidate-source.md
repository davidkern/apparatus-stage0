# Procedure: Consolidate Source Recipes

This procedure describes how to consolidate recipes extracted from multiple chunks
of a single source. It identifies duplicates, fills cross-references, and produces
a coherent collection.

## Prerequisites

- All chunks have been extracted (recipe files exist)
- All recipes pass validation

## Task

Review all recipes across chunks and:

1. **Identify duplicates** — Same technique extracted from multiple chunks
2. **Resolve duplicates** — Keep the most complete version, note alternates
3. **Fill cross-references** — Populate `related` fields with actual slugs
4. **Identify gaps** — Note techniques referenced but not extracted
5. **Verify consistency** — Ensure naming, formatting, reference style is uniform

## Duplicate Resolution

When the same technique appears in multiple chunks:

1. Compare the extractions for completeness (examples, description depth)
2. Keep the more complete version in its original location
3. Add a note to the kept version listing where else it was found:
   ```yaml
   extensions:
     also_found_in: ["b1-definition", "b3-arrangement"]
   ```
4. Delete the less complete duplicates

If extractions are equally complete, keep the one from the chapter where the
technique is primarily discussed (per source structure).

## Cross-Reference Population

For each recipe:

1. Review `related` comments (e.g., `# TBD: see also X`)
2. Find the referenced recipe by name/concept
3. Replace comment with actual reference:
   ```yaml
   related:
     - slug: enthymeme-from-correlatives
       relationship: variant-of
   ```
4. Use appropriate relationship type:
   - `contains` — This recipe includes another as a component
   - `contained-by` — This recipe is part of a larger pattern
   - `contrasts` — Techniques that achieve opposite effects
   - `combines-with` — Techniques often used together
   - `variant-of` — Similar technique with key difference

## Gap Identification

Create `_notes.md` in the source directory listing:
- Techniques mentioned in recipes but not extracted
- Cross-references that couldn't be resolved
- Apparent gaps in coverage

## Consistency Check

Verify across all recipes:
- Location references use consistent format (per `_meta.md`)
- Slugs follow naming convention (lowercase-kebab)
- Direction field is appropriate (not defaulting without consideration)
- Extensions use consistent key names for similar patterns

## Output

After consolidation:
- Duplicate recipes removed
- `related` fields populated where applicable
- `<source>/_notes.md` with gaps and observations
- Summary report of changes made

## Completion

1. Run validator on entire source directory
2. Review `_notes.md` for significant gaps
3. Report: duplicates resolved, cross-references added, gaps identified
