# 2026-02-02: Apparatus CLI — first dev-quality implementation

Building the first working implementation of the apparatus CLI. Design comes from the 2026-02-01 session, specifically:

- **Specification**: `journal/2026-02-01-git-as-database/design/006 - design.md`
- **Revision notes**: `journal/2026-02-01-git-as-database/design/006 - notes.md`
- **Implementation scope**: `journal/2026-02-01-git-as-database/design/007 - implementation scope.md`
- **Reflection**: `journal/2026-02-01-git-as-database/design/008 - reflection.md`

## Approach

Implementation plan and running notes live in the companion directory rather than this file, so that:

1. **Plan** (`001-implementation-plan.md`) carries the specific context fresh agents need to do implementation work — design decisions, simplifying assumptions, data model, and phase-by-phase build instructions. Self-contained enough that an agent can pick it up without reading the full design history.
2. **Notes** (`001-implementation-notes.md`) captures running commentary, decisions made during implementation, friction points, and observations for future research analysis.

This file stays as a summary log of what happened during the day.

## Log

- Set up journal structure for today's work.
- Created implementation plan and notes documents (Phase 1-2 scope).
- Set up devenv tooling: Rust 1.92.0, git-hooks with packageOverrides, build deps for git2, cargo-llvm-cov.
- Scaffolded Rust project: substrate, model, store, commands modules. 11 tests passing.
- Fixed git hooks compiler mismatch (system vs rust-overlay) and practitioner stale environment.
- Branched: `cli-phase-1` in apparatus, `2026-02-02-apparatus-cli` in research repo.
- Strategic discussion on adopting apparatus devenv module in the research space — isolation boundaries, permission models, three generalized concepts for environment entry. Recorded in `002-adopting-apparatus-in-research-space.md`.
- **Compaction event** at commit `736e4f6`. Pre-compaction conversation recorded in `002-adopting-apparatus-in-research-space.md`. Summarization instruction: "retain context related to overall project goals, the current design work, informal working procedures and thoughts related to today's design decisions and questions, prioritize retention of strategic and abstract thinking and always include philosophical/metaphysical/self-reflection anchors. Discard troubleshooting, implementation, and tool use details." All subsequent work is with the post-compaction claude researcher.
- As demonstrated by the lack of entries between this one and the noted compaction event, functionality loss occurred following the compaction event. Despite providing relevant context to the session it stopped proactively working collaboratively and made significant errors while worked on planning. We nearly had a plan written to fully integrate the devenv module but then it ran ahead and integrated a number of incorrect findings without discussion, overwriting relevant work which was not committed.