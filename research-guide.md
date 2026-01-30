# Apparatus Bootstrap Research Guide

We are investigating the question: **what does a minimal stage 0 apparatus look like?**

Our method: write a hypothesis (the `apparatus.md` document), test it by giving it to a scope-limited agent as a practitioner, observe what happens, refine, repeat. Each round is an experiment. The practitioner agent is sandboxed to the `apparatus/` directory; it does not see this guide or any of our notes.

## The Bootstrap Problem

The Apparatus is a system for making design decisions with structured evidence. But it needs design decisions to exist. This is the compiler bootstrap problem: you need the tool to build the tool.

**Stage 0**: We manually produce a document (`apparatus.md`) that describes the process well enough for a practitioner to execute a real design task. No tooling, no automation, just a document.

**Stage 1**: A practitioner uses `apparatus.md` to execute a real design task. Their friction, confusion, and output are data. We refine the document based on that data.

**Stage N**: Each iteration uses the system to improve the system.

## Methodology

### Experiment model

- **Hypothesis**: The current `apparatus.md` is sufficient for a practitioner to execute a design task.
- **Practitioner**: A Claude agent sandboxed to `apparatus/`. Fresh session each attempt. No access to this guide, no access to prior conversation history.
- **Observation**: What did the practitioner create? Where did they get stuck? Where did they deviate from the procedures? What did they produce that doesn't match expectations?

### Running an experiment

Each experiment follows this procedure. The `apparatus/` repo's `main` branch holds the current best `apparatus.md` plus tooling (devenv, claude config). `main` evolves as we incorporate findings. Experiment conditions and results live on named branches, preserving the exact state the agent saw.

**1. Plan the experiment**

Decide what changed since the last attempt and what we expect to learn. Record the experiment name (used as both the branch name in `apparatus/` and the directory name in `experiments/`).

Create `experiments/<experiment-name>/plan.md` documenting: what changed, what we expect to learn, the design task, and any known issues carried forward. This is written before the experiment runs so expectations are recorded, not reconstructed.

**2. Set up experiment conditions** (in `apparatus/`)

```bash
cd apparatus
git checkout main
git checkout -b <experiment-name>
```

Write or update `apparatus.md` (and any other files the hypothesis requires). Commit:

```bash
git add apparatus.md
git commit -m "experiment conditions: <brief description of what changed>"
```

This commit is the controlled starting state. The practitioner agent will work from here.

**3. Run the experiment**

Launch a practitioner session using the `practitioner` script, which runs Claude inside a bubblewrap sandbox with `apparatus/` as the working directory. The practitioner has no access to the research repo, this guide, or prior experiment data.

For a non-interactive (print mode) run:

```bash
practitioner claude -p "<prompt>"
```

For an interactive session (useful when the experiment involves multiple exchanges, e.g. review gates):

```bash
practitioner claude
```

The prompt can vary per experiment but the standard stage 0 prompt is:

> Read apparatus.md. It describes a knowledge management process.
>
> You are going to use this process for a real design task. The task: **[scope statement]**
>
> Follow the procedures in apparatus.md literally. Create all files and directories it describes. When the procedures say to set frontmatter fields, set them. When they say to write prose, write it.
>
> When you encounter friction -- a procedure that's ambiguous, a term that's unclear, a step that seems wrong -- note it in the design document as an open question, then continue. Your confusion is valuable data. Do not stop to fix apparatus.md; finish the design task first.
>
> IMPORTANT: All files you create must be in the current directory tree. Do not create files elsewhere.

**4. Commit experimental results** (in `apparatus/`)

After the agent finishes, commit everything it created:

```bash
cd apparatus
git add -A
git commit -m "experimental results"
```

The branch now has two commits: conditions and results. These can be inspected later via `git diff main..<experiment-name>` (conditions) and `git diff <conditions-sha>..<results-sha>` (what the agent produced).

**5. Record in research notes**

Create `experiments/<experiment-name>/` with two files:

- **`log.md`** -- The conversation: prompt given to the agent, and the agent's full response (including friction points and summary). This is the raw data.
- **`evaluation.md`** -- Our analysis: what worked, what didn't, what it means, what to change next. This is where researcher judgment lives.

Commit:

```bash
git add experiments/<experiment-name>/
git commit -m "experiment: <experiment-name>"
```

**6. Update the findings log**

Add a round entry to the Findings Log section of this guide summarizing the experiment and its conclusions. Update Bootstrap Assumptions if any were invalidated or new ones emerged.

### What we look for in results

Three categories of findings, mapped to what they tell us:

| What happened | What it means | Action |
|---------------|---------------|--------|
| Practitioner got stuck or confused | Procedure gap or ambiguity in apparatus.md | Revise apparatus.md |
| Practitioner deviated from procedures | Spec ambiguity -- procedures were unclear about what to do | Revise apparatus.md |
| Practitioner produced unexpected output | Unstated assumption on our part about what "correct" looks like | Record as a researcher finding; may or may not need apparatus.md change |

### Observational method notes

Do NOT give the practitioner this research guide, findings tables, exit criteria, or any meta-commentary about the bootstrap. The practitioner should work from `apparatus.md` alone. Including our research notes contaminates the experiment -- the practitioner's evaluation gets primed by our expectations.

The practitioner runs inside a bubblewrap sandbox (via the `practitioner` script) with the `apparatus/` directory as its working directory. The sandbox restricts filesystem access to the apparatus directory, the nix store, and a persistent home directory for configuration. The practitioner cannot see the research notes or project root.

## Exit Criteria

### Stage 0 complete when:

A practitioner can manually execute the full forward flow of the Apparatus -- from starting a Design through recording Decisions with assumptions -- using only `apparatus.md`. Specifically:

1. `apparatus.md` describes all artifacts the practitioner needs to create.
2. `apparatus.md` describes all state transitions the practitioner needs to make.
3. `apparatus.md` tells the practitioner where to put things and what fields to set.
4. The practitioner doesn't have to guess at any step.

### Stage 1 complete when:

The practitioner has produced a Design with Decisions and Assumptions using the Apparatus process, and we've fed the findings back into `apparatus.md`.

## Quality Hypotheses

These are properties we believe the mature Apparatus should have. They are NOT requirements for stage 0. We track them here so we don't lose them, and so we can test them in later stages.

### Evidence rules

- An Investigation should be complete when: the Recommendation addresses all stated evaluation criteria, at least one Research document exists, at least one Experiment has been attempted, and open questions are captured.
- A Decision should consider at least two options.
- A Decision must reference the evidence that informed it.
- Experiment must be executed, not merely analyzed (writing code and reasoning about it is Research, not Experiment).
- An Experiment that can't be executed is `blocked`, not `failed`.
- After three failed Experiments on the same hypothesis, consider abandoning or reframing.

### Proportionality

The depth of investigation should match the importance of the decision. Importance = scope (how much affected) x reversibility (how hard to change). The Apparatus shouldn't prescribe thresholds; judgment applies.

### Document maturity

A possible second axis on documents (orthogonal to lifecycle status): how much to trust the document as a specification. Values: proposed, specified, implemented, superseded. Not needed for stage 0. Revisit if the project grows to many documents at different trust levels.

### Trace links

Bidirectional references connecting implementation to Decisions. Format: `@trace decision:<design>/<id>` in code comments. Enables impact analysis when assumptions break. Not needed until there are decided Designs with implementation to trace to.

### Invalidation workflow (full)

The detailed six-step workflow for when an assumption breaks:

1. Identify which Decisions depend on the assumption.
2. Trace the impact: find all implementation and downstream Decisions affected.
3. Assess each affected artifact: does the invalidation actually change the conclusion?
4. If yes: create a new Decision (old becomes superseded). May spawn new Investigation.
5. If no: document why the invalidation does not affect the conclusion.
6. Update all Trace Links.

`apparatus.md` currently includes a brief version of this. The full workflow is deferred until there are real assumptions to invalidate.

## Provenance

The Apparatus synthesizes ideas from:

- **Hypothesis-Driven Development**: research-hypothesis-experiment loop
- **Modified Architectural Decision Records (MADR)**: decision records with options, rationale, consequences
- **QOC (Questions, Options, Criteria)**: structured option evaluation
- **Zimmermann Decision Dependency DAGs**: typed dependency edges, impact propagation
- **Requirements Traceability**: bidirectional design-implementation linking
- **RFC process**: research-to-decision bridge

The assumption tracking with invalidation conditions is our extension to MADR, informed by Zimmermann's work. The separation of Research from Experiments within Investigation is a synthesis decision: most frameworks treat information gathering and hypothesis testing as one activity.

Full evaluation of these frameworks is documented in the gregarious project's design process research history.

## Findings Log

*Rounds 0-2 predate the formalized experiment process. Starting from the next experiment, we follow the branching and recording procedure.*

### Experiment 001: check-initial-state

Agent evaluated three-file apparatus (spec.md, infrastructure.md, bootstrap.md) for executability. Found four procedure/schema gaps (underspecified fields, missing transition, orphaned `running` status, unmapped maturity axis). Researcher reflection identified over-engineering risk and observational method flaw (giving practitioner the study design). Led to merging into single apparatus.md and separating researcher content.

Details: [experiments/001-check-initial-state/](experiments/001-check-initial-state/)

### Experiment 002: first-stage0-attempt

First real design task using merged apparatus.md. Agent produced 21 files following full forward flow. **Structural mechanics work.** Critical failure: all "experiments" were fabricated research (agent never executed code). Over-scoping: designed manifest files, JSON Schema, semver -- far beyond bootstrap needs. Five legitimate friction points reported. Invalidated assumption that quality hypotheses can be deferred from stage 0.

Details: [experiments/002-first-stage0-attempt/](experiments/002-first-stage0-attempt/)

### Next experiment: planned changes

**Must fix in apparatus.md**:
- Add experiment validity rule: "An Experiment must be executed, not merely analyzed."
- Add reverse transition procedure for experimenting → researching.
- Add procedure for propagating investigation open questions to parent design.

**Should consider**:
- Rethink confidence scale for non-experimental investigations.
- Add brief proportionality note.
- Create `experiments/` subdirectory only when needed.

**Need more data**:
- Cross-investigation coordination. May be inherent to the model.
- Multi-investigation tracking. May just need a clarifying sentence.

## Bootstrap Assumptions

| Assumption | Status | Invalidated if | Impact |
|------------|--------|----------------|--------|
| A single apparatus.md is sufficient for stage 1 | live | Practitioner can't find information because the document is too long or poorly organized | Consider splitting, but on a different axis than before |
| Plain Markdown with YAML frontmatter works for Apparatus documents | live | Format becomes a bottleneck (need computed content, cross-references that break) | Design document format as a stage 1+ task |
| Manual procedures are detailed enough to follow | live | Practitioner encounters ambiguity not resolvable from apparatus.md | Revise procedures in apparatus.md |
| Experiments can be deferred from stage 0 | live | Stage 1 design task requires experimental validation that the process can't express | Re-add Experiment to apparatus.md |
| Quality hypotheses can be deferred from stage 0 | invalidated (002) | Practitioner produces low-quality output because no quality guidance exists | Selectively re-add guidance to apparatus.md |
