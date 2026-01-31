# 2026-01-31: Module reusability and researcher process

## Module reusability: CLAUDE.md ownership

Reviewed the devenv module before committing to apparatus main. Identified that generating `.claude/CLAUDE.md` from the module is wrong for a reusable component -- it claims the project's instruction file, preventing consumers from having their own content.

The hint ("use nix-shell -p for one-off packages") is important but belongs elsewhere:

- **Moved to SessionStart hook** in settings.json. Always-visible context at session start without file ownership conflict.
- **Added to SKILL.md** body under "Missing command or package" section. Available when the skill is loaded.

This is a known compromise. The SessionStart hook pays a context tax on every session regardless of relevance. We hypothesize that a better approach exists (e.g., a PostToolUse hook that detects command-not-found and injects targeted guidance) but this requires experimentation we can't prioritize now. Noted as future work in status.md.

### Skill triggering bias

Observed that Claude has a tendency to change strategy rather than load a skill when encountering a missing command. Hypothesis: there is a strong negative bias in the model's cost function that assigns tool-loading as more expensive than pivoting. The SessionStart hook is partly a workaround for this -- it puts the nix-shell hint in context before the decision point. The deeper problem (making the skill trigger reliably for ephemeral usage) is deferred.

## Researcher process: journal decision

Identified a gap in how we track our own work. Two kinds of activity in this project:

1. **Practitioner experiments** -- formal, tracked in `experiments/` with plan/log/evaluation structure
2. **Researcher work** -- architecture, tooling, decisions. Previously tracked only in git commits and the living `status.md`

`status.md` captures current state but overwrites history. Git captures what changed but not why. Neither supports reconstructing the reasoning for write-up.

Decision: `journal/` directory at repo root. One date-prefixed markdown file per day of work. Optional same-named directory beside it for artifacts. No internal structure prescribed. Append-only. Organization and discoverability are a problem for our future selves.

This is deliberately low-ceremony. The recursive trap is real: we are building a system for structured design decisions, and the temptation to use it on itself before it's ready is the bootstrap problem. Concrete signal for graduation: when the Apparatus reaches minimal maturity, we adopt it into this repo and rename from "apparatus-stage0" to "apparatus-research" or similar. Until then, the journal is sufficient.
