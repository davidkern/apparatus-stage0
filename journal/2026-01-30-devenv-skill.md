# 2026-01-30: Devenv Claude skill

## Context

After experiment 003 confirmed that review gates need structural enforcement, we pivoted to building the runner infrastructure. That requires the practitioner to run inside a controlled environment (bubblewrap sandbox + devenv shell). Claude Code needs to work inside that environment without manual setup.

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
