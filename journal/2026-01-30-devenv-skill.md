# 2026-01-30: Architecture and devenv skill

## Post-003 architecture discussion

After three experiments in one evening, we stepped back to synthesize. Experiment 003's review gate failure generalized into a principle: **the agent is a good worker and a bad self-regulator.** Asking it to be both is the source of the collapse. Any behavior we need guaranteed must be structurally enforced, not instructionally requested.

This led to a three-component architecture:

1. **Git as state storage.** Lifecycle state lives in the commit graph. Transitions are commits made by the runner, not the agent. Review gates become: runner commits agent work, pauses; after human approval, runner commits the transition and launches the next phase.

2. **Claude skills as the practitioner API.** Activity-oriented interface — the agent calls actions like "open-question" or "spawn-investigation" rather than writing state or structural files directly. Skills structurally bound what the agent can do. It can't invent activity types if no skill exists. This also addresses the fabricated experiments problem: available experiment types = available skills.

3. **Runner/orchestrator.** Manages phases, launches practitioners with phase-scoped prompts, inspects results, validates, commits, transitions. Batch model: agent works a phase to completion, runner processes between phases. Simpler than mid-session interception and is exactly the behavior we want.

Design principles established:
- **Runner is sole writer of state.** Agent produces content; runner manages transitions.
- **Git is a database, not an API.** Don't use git as a communication channel. Skills provide the real-time API.
- **Control plane grows based on evidence.** A behavior moves from agent-managed to runner-managed when experiments show the agent can't self-regulate it.
- **Prevention over detection.** Runs are expensive. Don't let the agent do something wrong and catch it after.

### Open tensions from this discussion

- **Synthesis across phases.** If the runner clears agent context between phases, we lose cross-cutting synthesis. Options: don't clear context (conflicts with unit-testing), summary artifact at boundaries (testable, explicit), or dedicated synthesis phase. Not urgent until runner exists.
- **Project integration.** The practitioner keeps exploring how apparatus fits into a project repo. Need enough structure to prevent this distraction without over-committing. Bootstrapping fiat decision — revisit with the actual process later.
- **Experiment definition is slippery.** Fabricated experiments confirmed across 002 and 003. Skill-based architecture may address this but needs validation.
- **Iteration speed.** Experiments cost ~10 min and significant tokens. Phased runner + batch model should support "unit testing" — set up mid-flight git state, run one phase, observe.

### Next steps as of this discussion

1. Link gregarious repo into workspace for reference on the skill-based API pattern.
2. Experiment with and validate the three-component architecture against the gate enforcement problem from 003. Start with the smallest slice that proves the model.

## Devenv skill

After the architecture discussion, we pivoted to building the first concrete piece: the practitioner's development environment. The runner infrastructure requires the practitioner to run inside a controlled environment (bubblewrap sandbox + devenv shell). Claude Code needs to work inside that environment without manual setup.

## What happened

Built a devenv module (`apparatus.enable = true`) that provides Claude Code integration as a reusable Nix module. The module:

- Installs claude-code, git, jq
- Generates `.claude/settings.json` with a PreToolUse hook that wraps all Bash commands in `devenv shell`
- Ships a Claude skill (`skills/devenv/`) with scripts for package search, option search, and option inspection
- Generates `.claude/CLAUDE.md` with environment hints (later moved to a SessionStart hook; see 2026-01-31)

The PreToolUse hook went through several iterations. Key challenge: safely quoting arbitrary shell commands for wrapping. Started with bash string manipulation, landed on `jq`'s `@sh` filter which handles all edge cases. Commits `eaa04c0` through `df6872a` trace this arc.

The skill description was iterated several times (`7ec56ea`, `54d13e5`, `9eb709b`) to optimize triggering. The description needs to match Claude's internal cost model for when to load a tool vs. change strategy. Arrived at: "devenv (Nix) manages all packages, services, and toolchains. Load for: missing commands, package install/search, language/service config, editing devenv.nix."

## Key decisions

- **Devenv custom module as the adoption mechanism for Apparatus.** A project enables `apparatus.enable = true` in its `devenv.nix` and gets the full practitioner environment. This resolves (or begins to resolve) the "project integration question" from status.md.
- **PreToolUse hook for transparent devenv wrapping** rather than requiring the agent to remember to prefix commands. Structural enforcement of the same principle from experiment 003: don't ask the agent to self-regulate, make the environment enforce it.
- **Skills as the practitioner API surface.** The devenv skill is the first instance of the pattern described in status.md. The agent calls scripts; it doesn't write structural files directly.

## What we learned

- `jq` is the right tool for hook scripts. JSON in, JSON out, with proper quoting primitives.
- Skill description wording matters a lot for triggering. There appears to be a model bias toward changing strategy rather than loading a tool. This needs more investigation but is not blocking.
- The `files` attribute in devenv modules creates nix-store symlinks, which means generated files are read-only and reproducible. Good for settings.json and skill scripts; problematic for files the project might want to own (like CLAUDE.md).
