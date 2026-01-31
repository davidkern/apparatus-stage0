# 2026-01-29: Bootstrap begins

*Retroactive entry. Reconstructed from commit history and experiment evaluations. This predates the journal; some reasoning may be lost.*

## Starting state

The Apparatus concept existed as three documents (spec.md, infrastructure.md, bootstrap.md) developed in the gregarious project. This day was about taking that material and testing whether it could actually be followed by a practitioner.

## Experiment 001: check-initial-state

Gave all three documents to an agent and asked it to evaluate executability. Found four procedure/schema gaps (underspecified frontmatter fields, missing waiting→open transition, orphaned `running` status, unmapped maturity axis). Two important researcher-level observations came out of this:

1. **Over-engineering risk.** The documents frontloaded details (trace links, evidence thresholds, maturity axis) that aren't needed for stage 1. Too much specification for the bootstrapping purpose.
2. **Observational method flaw.** We gave the practitioner bootstrap.md (our study design with exit criteria and findings), which primed its evaluation. Researcher content must be separated from practitioner content.

Actions: merged spec.md + infrastructure.md into single apparatus.md. Moved bootstrap.md content into a researcher-only research-guide.md. Stripped apparatus.md of deferred features (maturity axis, trace links, evidence thresholds, proportionality).

Details: [experiments/001-check-initial-state/](experiments/001-check-initial-state/)

## Experiment 002: first-stage0-attempt

First real design task. Agent produced 21 files following the full forward flow. Structural mechanics worked — procedures, file layout, frontmatter, status transitions all correct. Two critical problems:

1. **Fabricated experiments.** All three "experiments" were thought exercises, not executed code. Without a validity rule, the agent couldn't distinguish experiments from research.
2. **Over-scoping.** Agent designed manifest files, JSON Schema, semver — far beyond bootstrap needs. Removing proportionality guidance left no signal about appropriate depth.

Invalidated assumption that quality hypotheses can be deferred from stage 0. Also surfaced five procedure gaps (confidence scale assumes code execution, no open-question propagation, no experimenting→researching reverse transition, no cross-investigation coordination, ambiguous multi-investigation tracking).

Details: [experiments/002-first-stage0-attempt/](experiments/002-first-stage0-attempt/)

## Experiment 003: review-gates

Tested behavioral review gates: added `review` status with halt instructions at two lifecycle points. The agent recognized the gates, identified the single-actor deadlock, performed "self-review," and continued. This is rational behavior, not disobedience.

**Key insight: the agent is a good worker and a bad self-regulator.** Asking it to be both is the source of the collapse. Any behavior we need guaranteed must be structurally enforced, not instructionally requested. This generalizes beyond gates.

Invalidated assumption that apparatus.md alone is sufficient for controlled execution. Stage 0 requires a runner.

Secondary: agent scoped more tightly than 002 (14 files vs 21). Fabricated experiments persist. Four new friction points (fragile ID assignment, unanchored evidence paths, inconsistent open-questions shape, conflated investigation completion).

Details: [experiments/003-review-gates/](experiments/003-review-gates/)

## Tooling

Built the `practitioner` script (bubblewrap sandbox) to isolate the agent from research notes. Iterated on sandbox configuration (filesystem access, nix store visibility, persistent home for config). Moved the research repo to `/work/` so the practitioner sees `/work/apparatus/` with no path leakage.

## Bootstrap assumptions as of end of day

Tracked here because these emerged from this day's experiments. Format: assumption, status, what would invalidate it, impact if invalidated.

| Assumption | Status | Invalidated if | Impact |
|------------|--------|----------------|--------|
| A single apparatus.md is sufficient for stage 1 | live | Practitioner can't find information because the document is too long or poorly organized | Consider splitting, but on a different axis than before |
| Plain Markdown with YAML frontmatter works for Apparatus documents | live | Format becomes a bottleneck (need computed content, cross-references that break) | Design document format as a stage 1+ task |
| Manual procedures are detailed enough to follow | live | Practitioner encounters ambiguity not resolvable from apparatus.md | Revise procedures in apparatus.md |
| Experiments can be deferred from stage 0 | live | Stage 1 design task requires experimental validation that the process can't express | Re-add Experiment to apparatus.md |
| Quality hypotheses can be deferred from stage 0 | invalidated (002) | Practitioner produces low-quality output because no quality guidance exists | Selectively re-add guidance to apparatus.md |
| apparatus.md alone is sufficient for controlled execution | invalidated (003) | Agent reasons past behavioral halt instructions | Stage 0 requires a runner that enforces review gates structurally |

## Accumulated fix list

From the three experiments, these are the concrete changes needed. Categorized by confidence at the time.

**Must fix in apparatus.md:**
- Add experiment validity rule: "An Experiment must be executed, not merely analyzed."
- Add reverse transition procedure for experimenting → researching.
- Add procedure for propagating investigation open questions to parent design.
- Fix ID assignment: max existing ID + 1 instead of count.

**Must build:**
- A runner that enforces review gates structurally — terminates the practitioner session when a Design enters `review`, resumes after external status change.

**Should consider:**
- Remove "someone else" language from review gates — describe state semantics, not enforcement.
- Simplify review → open → waiting transition sequence.
- Anchor evidence ref paths.
- Clarify open-questions shape difference between Investigation and Design.

**Carried forward (need more data):**
- Rethink confidence scale for non-experimental investigations.
- Cross-investigation coordination.
- Proportionality note.

## Where this left us

Three experiments in one day. The structural mechanics of apparatus.md work (002 proved this). The control problem is real (003 proved this). The path forward requires a runner that enforces lifecycle boundaries, plus the practitioner API via Claude skills.
