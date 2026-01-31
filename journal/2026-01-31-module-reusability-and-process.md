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

## Reconstructing the timeline

With the journal structure in place, we did an archaeological pass to extract all historical narrative from `research-guide.md` and `status.md` into retroactive journal entries.

**From research-guide.md**: extracted the Findings Log (experiment summaries for 001-003), the "Next experiment: planned changes" block, and the Bootstrap Assumptions table. These went into `journal/2026-01-29-bootstrap-begins.md`. Research-guide.md now contains only instruction manual content: bootstrap problem definition, methodology, exit criteria, quality hypotheses, provenance.

**From status.md**: extracted the post-003 architecture discussion (three-component separation, design principles, tensions, next steps) into `journal/2026-01-30-devenv-skill.md` (renamed to "Architecture and devenv skill" to reflect both topics from that day). The apparatus.md fixes and path leakage fix were already covered in the Jan 29 entry. The devenv triggering future work was already in today's entry. With everything dispersed, `status.md` was deleted — to be reconstructed fresh from a journal read-through.

**Moved `study/create-devenv-skill/scripts/`** to `journal/2026-01-30-devenv-skill/scripts/` — test artifacts from the skill development work, now co-located with their journal entry.

### Incidental finding: devenv's built-in Claude support

While removing stale hooks from the research repo's `devenv.nix`, discovered that devenv's `claude.code` module generates a PostToolUse hook (pre-commit on Edit/Write) that we didn't configure. This is built-in behavior from the devenv claude module. Our apparatus devenv module doesn't include this — we should add it. Not addressed now to stay focused on the reorg.
