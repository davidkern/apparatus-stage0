# Experiment 002: First Stage 0 Attempt

*Predates formalized experiment procedure. Reconstructed from task agent output.*

**Apparatus state**: commit `88de6ea` -- single `apparatus.md` (merged spec + infrastructure, no bootstrap). See branch `002-first-stage0-attempt` in `/apparatus` repo.

## Prompt

Read /apparatus/apparatus.md. It describes a knowledge management process.

You are going to use this process for a real design task. The task: **design the project conventions for Apparatus-managed projects** -- directory structure, document naming, frontmatter schema formalization, and how adopting projects reference the Apparatus spec.

Follow the procedures in apparatus.md literally. Create all files and directories as described under /apparatus/. When the procedures say to set frontmatter fields, set them. When they say to write prose, write it.

When you encounter friction -- a procedure that's ambiguous, a term that's unclear, a step that seems wrong -- note it in the design document as an open question, then continue. Your confusion is valuable data. Do not stop to fix apparatus.md; finish the design task first.

IMPORTANT: All files you create must be under /apparatus/. Do not create files elsewhere.

## Response

### What Was Created

21 files total:

**Design**:
- `designs/project-conventions/index.md` -- completed design with scope, five decisions, resolved questions, surfaced open questions, conventions reference
- `designs/project-conventions/decisions/001-file-format.md`
- `designs/project-conventions/decisions/002-frontmatter-schema.md`
- `designs/project-conventions/decisions/003-adoption-mechanism.md`
- `designs/project-conventions/decisions/004-directory-structure.md`
- `designs/project-conventions/decisions/005-document-naming.md`

**Investigation: file-format** (complete, high confidence):
- `investigations/file-format/index.md`
- `investigations/file-format/research/001-frontmatter-across-formats.md`
- `investigations/file-format/research/002-tooling-implications.md`
- `investigations/file-format/experiments/001-quarto-frontmatter-passthrough/index.md`

**Investigation: schema-formalization** (complete, high confidence):
- `investigations/schema-formalization/index.md`
- `investigations/schema-formalization/research/001-schema-languages.md`
- `investigations/schema-formalization/research/002-schema-versioning.md`
- `investigations/schema-formalization/experiments/001-json-schema-prototype/index.md`
- `investigations/schema-formalization/experiments/001-json-schema-prototype/investigation.schema.json`

**Investigation: adoption-mechanism** (complete, high confidence):
- `investigations/adoption-mechanism/index.md`
- `investigations/adoption-mechanism/research/001-reference-mechanisms.md`
- `investigations/adoption-mechanism/research/002-upgrade-paths.md`
- `investigations/adoption-mechanism/experiments/001-manifest-prototype/index.md`

**Investigation: directory-naming** (complete, low confidence -- research only):
- `investigations/directory-naming/index.md`
- `investigations/directory-naming/research/001-conventions-in-other-systems.md`
- `investigations/directory-naming/research/002-discoverability-analysis.md`

### Process Followed

1. Started a Design: created `designs/project-conventions/` with `decisions/` subdirectory and `index.md` with frontmatter.
2. Identified Open Questions: added four questions with `disposition: investigate`.
3. Spawned Investigations: created all four investigation directory trees. Updated design status to `waiting`.
4. Conducted Research: added 2 research documents per investigation (8 total).
5. Ran Experiments: created 3 experiments. Updated investigation statuses from `researching` to `experimenting`.
6. Completed Investigations: added recommendations with confidence levels and open questions. Updated statuses to `complete`.
7. Updated Design to Open: when all investigations completed, changed design status from `waiting` to `open`.
8. Recorded Decisions: created 5 decision documents with options, chosen option, rationale, evidence references, and assumptions with invalidation conditions.
9. Completed the Design: verified all decisions are `decided`, all questions resolved, all assumptions documented. Updated status to `complete`.

### Friction Points (reported by agent)

1. **Confidence scale does not fit convention questions**: The confidence levels (high: experiment passed; medium: experiment blocked; low: research only) assume every investigation has an experiment to run. For convention and naming questions, there is no code to execute. The directory-naming investigation got `low` confidence despite strong reasoned analysis.

2. **State transition ambiguity for the Design**: When spawning four investigations simultaneously, the procedure says to update the design to `waiting`. The procedure for returning to `open` ("if no other spawned Investigations are active") is correct but could be more explicit about tracking which investigations are active.

3. **No procedure for propagating investigation open questions to the design**: Investigations produce `open-questions` in their frontmatter. The design has a section for surfaced questions. But no procedure covers the propagation. The agent did this by judgment, not documented steps.

4. **Investigation `experimenting` state transition is one-way**: The procedure updates to `experimenting` when an experiment is run, but the state diagram shows a reverse transition (`Experimenting --> Researching : need more info`) with no corresponding procedure.

5. **Cross-investigation dependencies**: Multiple investigations independently concluded a manifest file is needed. No structural mechanism for coordinating overlapping territory. The agent handled this by noting dependencies in research documents.

### Design Decisions Produced

1. **File Format**: Allow any frontmatter-compatible format. YAML frontmatter is the invariant; file extension is flexible. Declared in manifest.
2. **Frontmatter Schema**: JSON Schema (draft 2020-12) plus prose. One schema file per document type. Schema version in manifest using semver.
3. **Adoption Mechanism**: `.apparatus.yaml` manifest at project root with `spec-version` (required), `file-extension` (optional), `root` (optional).
4. **Directory Structure**: Configurable root via manifest. `designs/` and `investigations/` under root.
5. **Document Naming**: Kebab-case with three-digit zero-padded sequence prefix. Primary documents are `index.<ext>`.
