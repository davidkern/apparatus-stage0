# Generator Prompt

This document describes how to generate concrete prompts from procedures, context,
and parameters. It is the meta-level instruction for prompt generation.

## The Generation Model

A concrete prompt is produced by combining:

1. **Procedure** — A template from `_procedures/` defining the task structure
2. **Context chain** — `_context.md` files from root to target, integrated

```
procedure + context chain → concrete prompt
```

## Generation Process

To generate a prompt for a task at a given level:

### 1. Identify the procedure

Select the appropriate procedure from `_procedures/` based on the task type:
- `generate-chunk-extractions.md` — For creating extraction prompts across chunks
- `extract-recipes.md` — For extracting recipes from a single chunk
- `consolidate-source.md` — For consolidating recipes across chunks

### 2. Gather context files

Collect `_context.md` files from the recipes root down to the target level:

```
recipes/_context.md                    # Always included
recipes/<source>/_context.md           # If generating for a source or below
recipes/<source>/<chunk>/_context.md   # If generating for a chunk (if exists)
```

### 3. Integrate

Combine the components into a self-contained prompt:

1. Start with the procedure as the structural template
2. Integrate context by:
   - Including general guidance first, then specific
   - When guidance conflicts, more specific wins
   - Preserving all non-conflicting guidance from each level
3. Bind specifics:
   - Replace generic references with concrete values (chunk name, paths)
   - Include relevant reference data (chunk inventory, citation format)

### 4. Record

Write the generated prompt to `_prompt/<task>.md` at the target level.

The prompt must be **self-contained** — a fresh agent receiving only this prompt
(plus any referenced files like PDFs) should be able to execute the task without
access to the procedure, context, or meta files.

## Prompt Structure

A generated prompt should include:

```markdown
# <Task Name>

## Context

<Integrated context from all levels>

## Task

<The specific task, from the procedure, with parameters bound>

## Output

<Expected outputs and where to write them>

## Constraints

<Quality requirements, validation, etc.>

## References

<Paths to files the task needs: PDFs, SCHEMA.md, etc.>
```

## Variability Control

Prompt generation involves judgment (integration, conflict resolution). To control
variability:

1. **Use this document** — Follow the process described here
2. **Record the result** — The generated `_prompt/<task>.md` is the artifact
3. **Don't edit after generation** — If changes needed, regenerate

Once generated, a prompt becomes the fixed input for its task. Reproducibility
comes from recording the generated prompt, not from deterministic generation.

## Example

Generating `aristotle-rhetoric/b2-05-argument/_prompt/extract.md`:

1. **Procedure**: `_procedures/extract-recipes.md`
2. **Context chain**:
   - `recipes/_context.md` (general recipe guidance)
   - `recipes/aristotle-rhetoric/_context.md` (Aristotle-specific: includes chunk inventory, Bekker refs, terminology)
   - `recipes/aristotle-rhetoric/b2-05-argument/_context.md` (if exists)
3. **Chunk specifics**: b2-05-argument (Book 2, Ch 18-26)
4. **Output**: Self-contained prompt in `b2-05-argument/_prompt/extract.md`
