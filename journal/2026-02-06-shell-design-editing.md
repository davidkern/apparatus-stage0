# Shell Design Editing

Final editorial session on the shell design document. The practitioner
(Opus 4.5) completed restructuring of the Mechanisms section and various
cleanup passes. See `practitioner-summary.md` for their work report.

## Working outside the bootstrap

The shell design is the first major artifact produced outside the normal
apparatus.md-driven process. The complexity of the technical work — Linux
namespaces, FUSE, environment resolution — required a more directive style.
Instead of having a practitioner follow apparatus.md and recording friction,
I worked hands-on with practitioners who received direct editorial guidance.

This is fine. The apparatus is for managing knowledge and decisions, not
for specifying how every line gets written. But it means the shell design
work has been informal. The decisions exist (8 of them), the investigations
exist (9 experiments), but the session-by-session practitioner work has not
been recorded as controlled experiments.

## Intentional crosstalk

The apparatus repo and research repo currently share an unconfined workspace.
Agents can read and write anywhere. The shell exists precisely to fix this —
but building the shell requires the very isolation it provides.

Rather than fight this, I exploited it:

1. **Retrospectives.** After editing sessions, I had practitioners write
   retrospectives directly in the apparatus repo (`retrospectives/`). These
   capture the practitioner's observations about what worked and what didn't.

2. **Research guide exposure.** I had the shell design editor read
   `research-guide.md` and then write a journal entry. The editor didn't
   just summarize their work — they tried to follow research norms after
   seeing what those norms are. (This revealed a bug in our reconciliation
   procedure — they advanced the reconciliation date without reading prior
   journals. Fixed today.)

3. **Journal exploration.** Some agents have been given permission to explore
   the research repo journals. They observe their own ancestry: earlier
   practitioner sessions, researcher notes about what went wrong, the
   evolution of apparatus.md.

## Observations from watching

The pattern of giving practitioners visibility into the research process
produces interesting behavior:

- Practitioners who see retrospectives produce better retrospectives
- Practitioners who read the research guide adopt its terminology
- The implementation plan draft follows research guide patterns without
  explicit instruction to do so

This is not rigorous evidence — these are ad-hoc observations, not controlled
experiments. But it suggests that practitioner meta-awareness may improve
output quality. Worth investigating once the shell provides real isolation.

## Git history implications

The crosstalk means the apparatus repo commit history is contaminated. Commits
made by unconfined agents may reference paths outside the apparatus repo, may
assume context from the research repo, or may include changes that don't belong.
A history rewrite will be needed once the shell and knowledge store are in place.

The `shell-design-round-2` branch has 47 commits ahead of `main`. These will
need review before any merge.

## Artifacts

| Artifact | Location | Status |
|----------|----------|--------|
| Shell design document | `apparatus/designs/shell/index.md` | Draft complete, experiments pending |
| Decisions 001-008 | `apparatus/designs/shell/decisions/` | Decided |
| Investigation experiments 1-9 | `apparatus/investigations/shell-design-assumptions/` | Complete |
| Investigation experiments 10-11 | (planned) | Blocked on technical investigation |
| Implementation plan | `implementation-plan.md` | First draft |
| Practitioner summary | `practitioner-summary.md` | Complete |
| Retrospective | `apparatus/retrospectives/003-shell-design-editing.md` | Complete |

The implementation plan is an informal document living in the research journal,
not a formal apparatus artifact. It will be refined and fed back into the
apparatus repo after experiments 10-11 resolve the blocking technical questions.

## References

- Design document: `apparatus/designs/shell/index.md`
- Decisions: `apparatus/designs/shell/decisions/001-008`
- Investigation: `apparatus/investigations/shell-design-assumptions/`
- Retrospective: `apparatus/retrospectives/003-shell-design-editing.md`
