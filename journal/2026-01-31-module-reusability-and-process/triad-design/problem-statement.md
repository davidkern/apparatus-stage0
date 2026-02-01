# Problem statement: project triad relationships

## Hypothesis

Defining the relationships between the three projects (apparatus, apparatus-stage0,
gregarious) resolves several open tensions identified in the cross-perspective
synthesis — specifically the circular evaluation problem, the wrong-loop problem,
and the isolation from external signal.

## Context

The cross-perspective synthesis identified that:

1. The apparatus has been formalizing the decision-tracking loop (the inner loop)
   rather than the research/investigation loop (the outer loop that actually
   generates value).
2. The apparatus is entirely isolated from gregarious, which is both the origin of
   the project and the only source of real-world validation signal.
3. The evaluation of the apparatus is circular — we assess it using the judgment
   that designed it, with no external feedback.
4. The system boundary lacks permeability — nothing from outside the research space
   influences the apparatus's development, and nothing from the apparatus's
   development flows back to real usage.

These are not four separate problems. They compound: because we picked the inner
loop, we don't need gregarious. Because we don't have gregarious, we can't tell we
picked the wrong loop. Because we can't tell, the evaluation appears successful.

## The triad

Three repositories, each with a distinct role:

- **apparatus** — The artifact under development. Currently: a devenv module with
  Claude integration (environment management, PreToolUse hook, devenv skill, file
  generation pipeline). The apparatus.md process document has been set aside — it
  formalizes the wrong loop (decision-tracking rather than research-enablement).
  Last appeared on main at `d1404919`. Working branch for this design: `triad`.
- **apparatus-stage0** (this repo) — The research space. Where understanding is
  generated, experiments are run, and the design of the apparatus is worked out.
  Has its own structures (journal, status, experiments, research-guide) that are
  themselves proto-apparatus.
- **gregarious** — An ambitious VR/XR project that needs the apparatus. The origin
  of the investigation skill that proved the broader loop works. The only available
  source of real-world validation signal.

## What's missing

The relationships between these three are undefined. Specifically:

1. **What flows from the research space into the apparatus?** Currently: manual
   edits to apparatus.md and devenv.nix. Should be: formalized practice — things
   we've found work in the research space, encoded into the apparatus so they're
   reusable.
2. **What flows from the apparatus into gregarious?** Currently: nothing (the
   apparatus is not installed there). Should be: a minimal but functional system
   that provides value and can be observed.
3. **What flows from gregarious back to the research space?** Currently: nothing
   (the projects are isolated). Should be: signal about whether the apparatus helps,
   what the agent attempts that isn't supported, where the system is worked around
   rather than worked through.
4. **What flows from gregarious into the apparatus directly?** Unclear. The
   investigation skill originated there. Other patterns may too.

## Concepts carried forward from apparatus.md

The document is set aside but specific concepts validated through experiments 001-003
are retained as inputs:

- **Evidence rules.** "An experiment must be executed, not merely analyzed." Validated
  by experiment 002 where the agent fabricated experiments without this constraint.
- **Assumption tracking.** Decisions rest on assumptions that can be invalidated,
  triggering re-evaluation. Sound as bookkeeping within a research process; wrong
  as the primary structure.
- **Proportionality.** Depth of investigation matches importance of decision. Survives
  any reframing.
- **Agent behavioral data.** Three experiments of observations: agents are good workers
  and bad self-regulators. They fabricate experiments, reason past review gates, and
  produce compliant-looking output that may lack insight. This shapes how much
  autonomy any loop can give the agent.

## What we're designing

A concrete definition of these relationships — what connects to what, what flows
in which direction, and what the minimal implementation looks like — such that:

- The apparatus can be installed in both the research space and gregarious
- Real usage generates observable signal
- That signal feeds back into research decisions
- The formalization direction is inward from practice, not outward from specification

## What this should resolve

If the hypothesis holds, defining these relationships should:

- Break the circular evaluation (gregarious provides external signal)
- Correct the loop problem (formalize what works in practice, not a theoretical
  process)
- Establish permeability (bidirectional flow between the system and its environment)
- Give the exit velocity question a concrete answer: is the apparatus useful in
  gregarious?
