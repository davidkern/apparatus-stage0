# Experiment 001: Check Initial State

*Predates formalized experiment procedure. Reconstructed from original files.*

**Apparatus state**: commit `4f8a36e` -- three-file structure (spec.md, infrastructure.md, bootstrap.md). See `/apparatus` repo history.

## Prompt

This repository contains three documents that describe a knowledge management process. Read all three. Then evaluate: could you execute a real design task using only what's written here?

Specifically:

- Walk through the manual procedures in infrastructure.md step by step. For each one, identify any point where you'd have to guess what to do.
- Check that every term used in the procedures traces back to a definition in spec.md.
- Check that the frontmatter schemas in infrastructure.md cover every field the procedures tell you to set.
- If you find gaps, propose minimal fixes -- the smallest change that resolves the ambiguity. Do not add features, elaboration, or edge case handling.

## Response

### Procedure walkthrough: where you'd have to guess

**Start an Investigation** -- Fully executable. All fields and steps are specified.

**Add Research** -- You'd have to guess. Step 2 says create the file "with frontmatter linking to the parent topic" but doesn't tell you to set `apparatus.type: research` or `apparatus.id: NNN`. You'd need to independently find the Research frontmatter schema earlier in the document and cross-reference it. The same pattern repeats for:

- **Add an Experiment** -- Step 2 tells you to set hypothesis and status but not type, topic, or id, all of which appear in the Experiment schema.
- **Record a Decision** -- Step 2 tells you to set type, status, and options but not `apparatus.design` (parent design name) or `apparatus.id`, both of which appear in the Decision schema.

**Run an Experiment** -- The schema defines five statuses: `planned | running | passed | failed | blocked`. The procedure jumps from planned directly to passed/failed/blocked. It never tells you to set `running`. You'd have to guess whether to use it and when.

**Complete an Investigation** -- Fully executable.

**Design: Identify Open Questions** -- Step 4 says to set the Design's status to waiting when an investigation is spawned. But no procedure covers the reverse transition (waiting → open) when the investigation completes. The spec's state diagram shows this transition, and the "Complete an Investigation" procedure doesn't mention updating the parent Design. You'd have to guess to do it.

**Complete a Design** -- Fully executable.

**Supersede a Decision** -- Fully executable.

### The maturity gap

The spec defines Document Maturity (proposed | specified | implemented | superseded) as an axis on all documents, orthogonal to lifecycle status (spec.md:104-120). No frontmatter schema in infrastructure.md includes a maturity field. No procedure tells you to set it. You'd have no idea where to record it.

This is compounded by the fact that the three existing documents themselves use `status: specified` in their frontmatter -- but `specified` is a maturity value, not a lifecycle status for any kind. The Design schema says `status: open | waiting | complete`. So the existing documents contradict the schema they define.

### Term tracing: procedures → spec definitions

Every term used in the procedures traces to a definition in spec.md except:

| Term | Where used | Spec status |
|------|------------|-------------|
| `disposition` (investigate \| defer) | Open Questions procedure, Design schema | Not in spec. The spec describes the concept but never uses the word "disposition." Harmless -- implementation vocabulary for a spec concept. |
| `planned` (experiment status) | Add Experiment procedure, Experiment schema | Not in spec. The spec defines no experiment-specific lifecycle. Infrastructure-invented. |
| `running` (experiment status) | Experiment schema | Not in spec. Same as above. |

The planned/running statuses are reasonable infrastructure additions, but the spec's silence on experiment lifecycle means there's no authoritative source for what these states mean or when transitions are valid.

### Schema coverage

| Procedure | Fields set | In schema? |
|-----------|-----------|------------|
| Start Investigation | type, status, question, criteria | All present |
| Complete Investigation | recommendation.statement, recommendation.confidence, open-questions, status | All present |
| Add Research | "frontmatter linking to parent topic" (underspecified) | Schema has type, topic, id -- procedure doesn't enumerate them |
| Add Experiment | hypothesis, status | Schema also has type, topic, id -- procedure omits them |
| Record a Decision | type, status, options, chosen, rationale, evidence, assumptions | Schema also has design, id -- procedure omits them |
| All documents | (maturity) | No schema includes a maturity field despite spec defining it |

The reverse direction is clean: no schema field exists that would be impossible to set by following procedures. The problems are all omissions from the procedures, not phantom schema fields.

### Summary of gaps

1. No maturity field in any frontmatter schema. Spec defines it; infrastructure never maps it.
2. No procedure for Design waiting → open transition.
3. Procedures don't enumerate all required frontmatter fields for Research, Experiment, and Decision creation.
4. Experiment `running` status has no trigger.

### Proposed minimal fixes

1. Add maturity to frontmatter schemas and data conventions table.
2. Add a "Resume a Design" procedure for waiting → open transition.
3. Enumerate all frontmatter fields in creation procedures.
4. Remove `running` from the Experiment schema.

**Bottom line**: Could execute a real design task with caveats. Investigation procedures are almost fully executable. Design procedures have a missing transition and underspecified creation steps. Maturity axis is defined but has nowhere to live.
