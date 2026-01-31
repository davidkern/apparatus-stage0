# Research Guide

## Purpose

The Apparatus is a compounding mechanism for research capability. It formalizes the cycle of making design decisions with structured evidence — hypotheses, investigations, experiments, decisions with traced assumptions — so that each iteration raises the floor the researcher stands on. The researcher follows informal methods that elicit formal knowledge. That formal knowledge becomes input to machinery that produces more capable machinery as output. The system does not supplant the researcher; it becomes the next layer, freeing the researcher to think in terms of larger abstractions.

This research program bootstraps the Apparatus into existence. The bootstrap problem: the Apparatus is a system for making design decisions, but it needs design decisions to exist. Like a compiler that must compile itself, we need the tool to build the tool.

This document is the methodology and procedures for the research. It tells a researcher — human or AI, on their first day or their hundredth — how we work, what the facilities are, and how to run experiments.

## Research space

The research environment has five facilities. Each has a temporal orientation and a distinct role.

| Facility | Orientation | Purpose |
|----------|-------------|---------|
| `research-guide.md` | Reference | Methodology, procedures, evaluation criteria |
| `status.md` | Present | Current state snapshot: work queue and landscape |
| `journal/` | Past | Append-only researcher narrative |
| `experiments/` | Past | Structured practitioner experiment records |
| `apparatus/` | Present | The artifact under development (nested git repository) |

### Status

`status.md` is the current state of the research program. It has two sections:

- **Work queue**: Concrete actionable items as checkboxes. Each item is something a researcher can pick up and do.
- **Current landscape**: Architecture, assumptions, tensions, open questions. The shape of the problem space as currently understood.

The file carries a single **"Reconciled through"** date at the top. This is the date through which all journal entries have been incorporated. To reconcile: read all journal entries after the reconciliation date, update both sections to reflect the current state, advance the date. Delete completed items. Remove stale assumptions. Add new items.

Status is a derived view of the journal. If status and journal conflict, the journal is authoritative. Status exists for quick orientation; the journal holds the reasoning.

### Journal

`journal/` contains one file per day of researcher work, named `YYYY-MM-DD-topic.md`. A journal entry may have a companion directory with the same stem (e.g., `2026-01-30-devenv-skill/`) for associated artifacts like scripts, data, or screenshots.

Journal entries are append-only. There is no prescribed internal structure — entries range from brief notes to extended narrative depending on the day's work. The journal records what happened and why: decisions made, experiments run, architecture discussed, findings observed. It is the primary record of the research program's history.

### Experiments

`experiments/` contains structured records of practitioner experiments. Each experiment is a directory named `<NNN>-<descriptive-name>/` (e.g., `003-review-gates/`) containing:

- **`plan.md`** — Written before the experiment runs. Documents: what changed from the previous experiment, what we expect to learn, the design task, and known issues carried forward. Records expectations so they are not reconstructed after the fact.
- **`log.md`** — The raw data. The prompt given to the practitioner and the practitioner's full response, including friction points and summary.
- **`evaluation.md`** — Researcher analysis. What worked, what did not, what it means, what to change next. This is where researcher judgment lives, separate from the practitioner's output.

### Apparatus

`apparatus/` is a nested git repository containing the artifact under development: `apparatus.md` (the process document) plus its development environment (devenv configuration, Claude skills). The `main` branch holds the current best version. Experiment conditions and results live on named branches (one per experiment), preserving the exact state each practitioner saw.

### Running an experiment

Each experiment follows this procedure:

**1. Plan the experiment.**
Decide what changed since the last attempt and what we expect to learn. Choose an experiment name (used as both the branch name in `apparatus/` and the directory name in `experiments/`). Create `experiments/<experiment-name>/plan.md` documenting: what changed, what we expect to learn, the design task, and known issues carried forward.

**2. Set up experiment conditions** (in `apparatus/`).

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

This commit is the controlled starting state.

**3. Run the experiment.**
Launch a practitioner session using the `practitioner` script, which runs Claude inside a bubblewrap sandbox with `apparatus/` as the working directory. The practitioner has no access to the research repo, this guide, or prior experiment data. Do not give the practitioner this research guide, findings, exit criteria, or any meta-commentary about the bootstrap. The practitioner works from `apparatus.md` alone. Including researcher notes contaminates the experiment by priming the practitioner's evaluation with our expectations.

For a non-interactive (print mode) run:

```bash
practitioner claude -p "<prompt>"
```

For an interactive session (useful when the experiment involves multiple exchanges, e.g. review gates):

```bash
practitioner claude
```

The prompt varies per experiment but the standard stage 0 prompt is:

> Read apparatus.md. It describes a knowledge management process.
>
> You are going to use this process for a real design task. The task: **[scope statement]**
>
> Follow the procedures in apparatus.md literally. Create all files and directories it describes. When the procedures say to set frontmatter fields, set them. When they say to write prose, write it.
>
> When you encounter friction -- a procedure that's ambiguous, a term that's unclear, a step that seems wrong -- note it in the design document as an open question, then continue. Your confusion is valuable data. Do not stop to fix apparatus.md; finish the design task first.
>
> IMPORTANT: All files you create must be in the current directory tree. Do not create files elsewhere.

**4. Commit experimental results** (in `apparatus/`).

After the practitioner finishes, commit everything it created:

```bash
cd apparatus
git add -A
git commit -m "experimental results"
```

The branch now has two commits: conditions and results. Inspect via `git diff main..<experiment-name>` (conditions) and `git diff <conditions-sha>..<results-sha>` (what the practitioner produced).

**5. Record in research notes.**
Create `experiments/<experiment-name>/` with `log.md` and `evaluation.md` (described above). Commit in the research repo.

**6. Update status and journal.**
Record findings in the journal. Update `status.md`: add new work queue items, update the landscape, advance the reconciliation date.

### What we look for in results

Three categories of findings:

| What happened | What it means | Action |
|---------------|---------------|--------|
| Practitioner got stuck or confused | Procedure gap or ambiguity in apparatus.md | Revise apparatus.md |
| Practitioner deviated from procedures | Spec ambiguity — procedures were unclear about what to do | Revise apparatus.md |
| Practitioner produced unexpected output | Unstated assumption about what "correct" looks like | Record as a researcher finding; may or may not need apparatus.md change |

## Scope

### The bootstrap problem

**Stage 0**: Manually produce a document (`apparatus.md`) that describes the process well enough for a practitioner to execute a real design task. No tooling, no automation, just a document.

**Stage 1**: A practitioner uses `apparatus.md` to execute a real design task. Their friction, confusion, and output are data. We refine the document based on that data.

**Stage N**: Each iteration uses the system to improve the system.

### Stage 0 exit criteria

A practitioner can manually execute the full forward flow of the Apparatus — from starting a Design through recording Decisions with assumptions — using only `apparatus.md`. Specifically:

1. `apparatus.md` describes all artifacts the practitioner needs to create.
2. `apparatus.md` describes all state transitions the practitioner needs to make.
3. `apparatus.md` tells the practitioner where to put things and what fields to set.
4. The practitioner does not have to guess at any step.

### Stage 1 exit criteria

The practitioner has produced a Design with Decisions and Assumptions using the Apparatus process, and findings have been fed back into `apparatus.md`.

## Evaluation criteria

These are standards applied when evaluating experiment results and assessing apparatus quality. They are not all required for stage 0 — some apply to the mature system. Each is labeled with when it becomes relevant.

### Evidence rules (stage 0+)

- An Investigation is complete when: the Recommendation addresses all stated evaluation criteria, at least one Research document exists, at least one Experiment has been attempted, and open questions are captured.
- A Decision considers at least two options.
- A Decision references the evidence that informed it.
- An Experiment must be executed, not merely analyzed. Writing code and reasoning about it is Research, not Experiment.
- An Experiment that cannot be executed is `blocked`, not `failed`.
- After three failed Experiments on the same hypothesis, consider abandoning or reframing.

### Proportionality (stage 0+)

The depth of investigation matches the importance of the decision. Importance = scope (how much is affected) × reversibility (how hard to change). The Apparatus does not prescribe thresholds; judgment applies.

### Document maturity (stage 1+)

A possible second axis on documents (orthogonal to lifecycle status): how much to trust the document as a specification. Values: proposed, specified, implemented, superseded. Revisit if the project grows to many documents at different trust levels.

### Trace links (post-stage 1)

Bidirectional references connecting implementation to Decisions. Format: `@trace decision:<design>/<id>` in code comments. Enables impact analysis when assumptions break. Relevant when there are decided Designs with implementation to trace to.

### Invalidation workflow (post-stage 1)

The detailed workflow for when an assumption breaks:

1. Identify which Decisions depend on the assumption.
2. Trace the impact: find all implementation and downstream Decisions affected.
3. Assess each affected artifact: does the invalidation actually change the conclusion?
4. If yes: create a new Decision (old becomes superseded). May spawn new Investigation.
5. If no: document why the invalidation does not affect the conclusion.
6. Update all Trace Links.

`apparatus.md` includes a brief version of this. The full workflow applies when there are real assumptions to invalidate.

---

The Apparatus synthesizes ideas from Hypothesis-Driven Development, Modified Architectural Decision Records (MADR), QOC (Questions, Options, Criteria), Zimmermann Decision Dependency DAGs, Requirements Traceability, and the RFC process. Full evaluation is documented in the gregarious project's design process research history.
