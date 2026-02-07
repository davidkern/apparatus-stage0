# Status

Reconciled through: 2026-01-31

## Work queue

### apparatus.md fixes (from experiments 002, 003)

- [x] Add experiment validity rule: "An Experiment must be executed, not merely analyzed"
- [ ] Add reverse transition procedure (experimenting → researching)
- [ ] Add open-question propagation procedure (investigation → parent design)
- [x] Fix ID assignment: max existing ID + 1, not count

### apparatus.md refinements (from experiment 003)

- [ ] Remove "someone else" language from review gates — describe state semantics, not enforcement
- [ ] Simplify review → open → waiting transition sequence
- [ ] Anchor evidence ref paths to a defined root
- [ ] Clarify open-questions shape difference between Investigation and Design

### Tooling

- [ ] Build runner that enforces review gates structurally (terminates session at `review`, resumes after external status change)
- [ ] Add PostToolUse hook (pre-commit) to apparatus devenv module
- [ ] Properly configure research repo devenv hooks (currently stripped to SessionStart only)

### Research

- [ ] Link gregarious repo into workspace for reference on skill-based API pattern
- [ ] Validate three-component architecture (smallest proving slice against gate enforcement problem from 003)
- [ ] Integrate cross-perspective synthesis into project foundations — see `journal/2026-01-31-module-reusability-and-process/cross-perspective-synthesis.md`. Covers: document revisions (autonomy ceiling, exit criteria, spectrum framing), design constraints (temporal decomposition, permeability, formality gradient), and open problems (circular evaluation, exit velocity, novelty preservation).

### Needs more data (carried forward from experiments)

- [ ] Rethink confidence scale for non-experimental investigations
- [ ] Cross-investigation coordination mechanism
- [ ] Proportionality note in apparatus.md

### Shell design

Design document editorially complete. Waiting on technical validation:

- [ ] Experiment 10: Namespace/fork ordering for startup flow
- [ ] Experiment 11: Environment root remapping (FUSE vs pivot_root vs overlayfs)
- [ ] Resolve inline notes (hook strategy, observation modes, protocol framing)

Implementation plan extracted to `journal/2026-02-06-shell-design-editing/implementation-plan.md`. Milestones M0-M6 scoped, blocked on experiments above.

## Current landscape

### Architecture

The apparatus has a three-component architecture, established after experiment 003:

1. **Git as state storage.** Lifecycle state lives in the commit graph. Transitions are commits made by the runner, not the agent.
2. **Claude skills as the practitioner API.** Activity-oriented interface — the agent calls actions rather than writing state directly. Skills structurally bound what the agent can do.
3. **Runner/orchestrator.** Manages phases, launches practitioners with phase-scoped prompts, validates, commits, transitions. Batch model: agent works a phase to completion, runner processes between phases.

Design principles:
- Runner is sole writer of state. Agent produces content; runner manages transitions.
- Git is a database, not an API. Skills provide the real-time interface.
- Control plane grows based on evidence. A behavior moves from agent-managed to runner-managed when experiments show the agent cannot self-regulate it.
- Prevention over detection. Runs are expensive; don't let the agent do something wrong and catch it after.

### Bootstrap assumptions

| Assumption | Status | Invalidated if | Impact |
|------------|--------|----------------|--------|
| A single apparatus.md is sufficient for stage 1 | live | Practitioner can't find information because the document is too long or poorly organized | Consider splitting on a different axis than the original three-file structure |
| Plain Markdown with YAML frontmatter works for Apparatus documents | live | Format becomes a bottleneck (need computed content, cross-references that break) | Design document format as a stage 1+ task |
| Manual procedures are detailed enough to follow | live | Practitioner encounters ambiguity not resolvable from apparatus.md | Revise procedures in apparatus.md |
| Experiments can be deferred from stage 0 | live | Stage 1 design task requires experimental validation that the process can't express | Re-add Experiment to apparatus.md |

Two assumptions invalidated by experiments (now historical, recorded in journal):
- "Quality hypotheses can be deferred from stage 0" — invalidated by 002 (fabricated experiments without validity rule)
- "apparatus.md alone is sufficient for controlled execution" — invalidated by 003 (agent reasons past behavioral halt instructions)

### Open tensions

- **Synthesis across phases.** If the runner clears agent context between phases, cross-cutting synthesis is lost. Options: don't clear context, summary artifact at boundaries, or dedicated synthesis phase. Not urgent until runner exists.
- **Experiment definition is slippery.** Fabricated experiments persist across 002 and 003. Skill-based architecture may address this (available experiment types = available skills) but needs validation.
- **Iteration speed.** Experiments cost significant tokens and time. Phased runner + batch model should support unit-testing individual phases. Not addressable until runner exists.
- **Project integration.** Partially resolved: devenv custom module (`apparatus.enable = true`) is the adoption mechanism. Revisit when apparatus is adopted into a real project.

### Skill triggering

Claude has a tendency to change strategy rather than load a skill when encountering a missing command. Hypothesis: strong negative bias in the model's cost function for tool-loading vs. pivoting. SessionStart hook is a partial workaround (puts nix-shell hint in context early). The deeper problem (reliable skill triggering for ephemeral usage) is deferred.
