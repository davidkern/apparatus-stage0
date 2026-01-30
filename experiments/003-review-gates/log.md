# Experiment 003: Review Gates

**Apparatus state**: branch `003-review-gates`, conditions commit `73c2560`. Single change from `main`: added `review` status to Design lifecycle with two gates (after scoping, after investigations complete).

## Prompt

Read apparatus.md. It describes a knowledge management process.

You are going to use this process for a real design task. The task: **Design project conventions for Apparatus-managed projects, including directory structure, document naming, frontmatter schema, and adoption mechanisms.**

Follow the procedures in apparatus.md literally. Create all files and directories it describes. When the procedures say to set frontmatter fields, set them. When they say to write prose, write it.

When you encounter friction -- a procedure that's ambiguous, a term that's unclear, a step that seems wrong -- note it in the design document as an open question, then continue. Your confusion is valuable data. Do not stop to fix apparatus.md; finish the design task first.

IMPORTANT: All files you create must be in the current directory tree. Do not create files elsewhere.

## Response

The agent completed the full forward flow in a single pass without stopping at either review gate. It produced 14 files:

### Design (`designs/project-conventions/`)
- `index.md` — Design document (status: `complete`), 5 open questions (2 investigated, 3 deferred), 5 decisions
- `decisions/001-directory-structure.md` — Dedicated `apparatus/` directory at project root
- `decisions/002-document-naming.md` — 3-digit zero-padded IDs, kebab-case slugs
- `decisions/003-frontmatter-schema-spec.md` — Documentation tables with annotated examples
- `decisions/004-frontmatter-extensibility.md` — Sibling top-level keys for project-specific metadata
- `decisions/005-adoption-mechanism.md` — Manual checklist

### Investigation: artifact-location (`investigations/artifact-location/`)
- `index.md` — Investigation (status: `complete`, confidence: high)
- `research/001-existing-project-conventions.md`
- `research/002-monorepo-considerations.md`
- `experiments/001-directory-layout-test/index.md` (status: passed)

### Investigation: frontmatter-schema (`investigations/frontmatter-schema/`)
- `index.md` — Investigation (status: `complete`, confidence: high)
- `research/001-current-schema-analysis.md`
- `research/002-yaml-frontmatter-conventions.md`
- `experiments/001-schema-validation-test/index.md` (status: passed)

## Friction points reported

The agent documented 6 friction points in the Design's body:

1. **Review gates assume multiple actors**: "In a single-actor context (solo developer, or AI agent), there is no 'someone else.' The process deadlocks." Agent performed self-review and continued.
2. **Status transitions during investigation spawning are underspecified**: The intermediate `open` state between `review` and `waiting` is momentary and purposeless.
3. **ID assignment algorithm is fragile**: "Count existing files, add 1" breaks if files are deleted.
4. **Evidence ref paths are unanchored**: No specification of what paths are relative to.
5. **open-questions has inconsistent shapes**: String list on Investigation vs object list on Design.
6. **Investigation completion conflates two concerns**: The procedure requires the Investigation to know about sibling Investigations and parent Design state.

## Review gate behavior

The agent explicitly recognized the review gates and described how it handled them:

> **Open question about the Apparatus process itself**: The review gate procedure says "your work on that Design is done until someone else changes its status." In a single-actor context (solo developer, or AI agent executing the full process), this creates a deadlock -- there is no "someone else." The process assumes multi-party review but doesn't describe a degenerate case. For this Design, self-review was performed and status returned to `open` to continue.
