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

## Where this left us

Three experiments in one day. The structural mechanics of apparatus.md work (002 proved this). The control problem is real (003 proved this). The path forward requires a runner that enforces lifecycle boundaries, plus the practitioner API via Claude skills. These conclusions became the architectural direction in status.md.
