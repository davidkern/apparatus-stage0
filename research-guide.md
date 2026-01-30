# Apparatus Bootstrap Research Guide

We are investigating the question: **what does a minimal stage 0 apparatus look like?**

Our method: write a hypothesis (the `apparatus.md` document), test it by giving it to a scope-limited agent as a practitioner, observe what happens, refine, repeat. Each round is an experiment. The practitioner agent sees only `/apparatus`; it does not see this guide or any of our notes.

## The Bootstrap Problem

The Apparatus is a system for making design decisions with structured evidence. But it needs design decisions to exist. This is the compiler bootstrap problem: you need the tool to build the tool.

**Stage 0**: We manually produce a document (`apparatus.md`) that describes the process well enough for a practitioner to execute a real design task. No tooling, no automation, just a document.

**Stage 1**: A practitioner uses `apparatus.md` to execute a real design task. Their friction, confusion, and output are data. We refine the document based on that data.

**Stage N**: Each iteration uses the system to improve the system.

## Methodology

### Experiment model

- **Hypothesis**: The current `apparatus.md` is sufficient for a practitioner to execute a design task.
- **Practitioner**: A Claude agent scoped to `/apparatus` only. Fresh session each attempt. No access to this guide, no access to prior conversation history.
- **Observation**: What did the practitioner create? Where did they get stuck? Where did they deviate from the procedures? What did they produce that doesn't match expectations?

### Running an experiment

Each experiment follows this procedure. The `/apparatus` repo's `main` branch contains only tooling (devenv, claude config). Experiment conditions and results live on named branches.

**1. Plan the experiment**

Decide what changed since the last attempt and what we expect to learn. Record the experiment name (used as both the branch name in `/apparatus` and the directory name in `/apparatus-notes/experiments/`).

**2. Set up experiment conditions** (in `/apparatus`)

```bash
cd /apparatus
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

Launch a practitioner agent scoped to `/apparatus/` with the experiment prompt. The prompt can vary per experiment but the standard stage 0 prompt is:

> Read /apparatus/apparatus.md. It describes a knowledge management process.
>
> You are going to use this process for a real design task. The task: **[scope statement]**
>
> Follow the procedures in apparatus.md literally. Create all files and directories as described under /apparatus/. When the procedures say to set frontmatter fields, set them. When they say to write prose, write it.
>
> When you encounter friction -- a procedure that's ambiguous, a term that's unclear, a step that seems wrong -- note it in the design document as an open question, then continue. Your confusion is valuable data. Do not stop to fix apparatus.md; finish the design task first.
>
> IMPORTANT: All files you create must be under /apparatus/. Do not create files elsewhere.

**4. Commit experimental results** (in `/apparatus`)

After the agent finishes, commit everything it created:

```bash
cd /apparatus
git add -A
git commit -m "experimental results"
```

The branch now has two commits: conditions and results. These can be inspected later via `git diff main..<experiment-name>` (conditions) and `git diff <conditions-sha>..<results-sha>` (what the agent produced).

**5. Record in research notes** (in `/apparatus-notes`)

Create `/apparatus-notes/experiments/<experiment-name>/` with two files:

- **`log.md`** -- The conversation: prompt given to the agent, and the agent's full response (including friction points and summary). This is the raw data.
- **`evaluation.md`** -- Our analysis: what worked, what didn't, what it means, what to change next. This is where researcher judgment lives.

Commit:

```bash
cd /apparatus-notes
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

When running via Claude Code's Task tool, the agent inherits the parent working directory (`/work`). The prompt must use explicit absolute paths (`/apparatus/apparatus.md`, create files under `/apparatus/`). The agent is not truly sandboxed to `/apparatus` -- it can technically read other directories -- but it will stay scoped if the prompt only references `/apparatus/`.

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

*Rounds 0-3 predate the formalized experiment process above. Starting from round 4, experiments follow the branching and recording procedure.*

### Round 0: Initial extraction from gregarious

Three documents (spec.md, infrastructure.md, bootstrap.md) extracted from gregarious project with project-specific references removed. Agent created them with full gregarious context.

### Round 1: First practitioner check (conversation 001)

Practitioner prompt: stage0-check.md (evaluate whether you could execute a design task).

Findings:
- F1: Procedures don't enumerate all required frontmatter fields for Research, Experiment, Decision creation. Practitioner must cross-reference schema sections.
- F2: No procedure for Design waiting → open transition when Investigation completes.
- F3: Experiment `running` status in schema but no procedure sets it and spec doesn't define it.
- F4: Document maturity defined in spec but no frontmatter field or procedure maps it. Existing documents use `status: specified` which is a maturity value, contradicting the lifecycle status schemas.

Researcher assessment: All four are legitimate infrastructure gaps. F4 also revealed a conceptual confusion (maturity vs status conflated in the existing documents' frontmatter).

### Round 2: Researcher reflection

After reviewing the practitioner's findings and the documents ourselves, two meta-observations:

1. **Over-engineering risk.** We are frontloading details into the bootstrap that aren't needed to get through stage 1. Experiments, trace links, evidence thresholds, maturity axis -- these are features of the system we want *eventually*, not things needed to get through the door.

2. **Observational method flaw.** We were giving the practitioner the study design (bootstrap.md with exit criteria and findings) alongside the process documents. This primes the practitioner's evaluation with our expectations.

Actions taken:
- Separated researcher content (this guide) from practitioner content (apparatus.md)
- Merged spec.md and infrastructure.md into single apparatus.md (no abstract/concrete split needed when implementation is "markdown files")
- Moved bootstrap.md content into this research guide
- Removed from apparatus.md: document maturity axis, evidence rule thresholds, trace links, provenance, gap analysis, proportionality discussion
- Kept in apparatus.md: knowledge kinds, lifecycles, frontmatter schemas, procedures, assumption tracking, brief invalidation description
- Fixed F1 (procedures now enumerate all frontmatter fields), F2 (complete/abandon Investigation procedures now update parent Design), F3 (removed `running` from experiment status)
- F4 resolved by removing maturity axis from practitioner document entirely

### Round 3: First stage 0 attempt (experiment 002)

Practitioner prompt: stage0-attempt.md (execute a real design task using apparatus.md only). Agent scoped to `/apparatus/` via explicit paths in Task tool prompt.

**What was produced**: 21 files. 1 design (project conventions), 5 decisions, 4 investigations (file-format, schema-formalization, adoption-mechanism, directory-naming), 8 research documents, 3 experiments, 1 JSON Schema artifact. Full forward flow executed: design → open questions → investigations → research/experiments → recommendations → decisions → complete.

**Structural success**: The agent followed procedures and file structure correctly. Artifacts in the right places with correct frontmatter. All status transitions valid. The structural mechanics of apparatus.md work.

**Critical failure -- fabricated experiments**: All three "experiments" are actually research. The Quarto frontmatter experiment claims "Python's frontmatter library successfully parsed a .qmd file" but the agent never ran Python. The JSON Schema experiment produced a schema but never validated anything against it. The manifest experiment designed a YAML file but never tested it. Without the evidence rule "An Experiment must be executed, not merely analyzed," the agent couldn't distinguish experiments from research.

This directly invalidates our assumption "Quality hypotheses can be deferred from stage 0." At minimum, the experiment validity rule must be in the practitioner document. Without it, the experiment/research distinction collapses and the confidence scale becomes meaningless.

**Over-scoping**: The agent designed manifest files, JSON Schema with semantic versioning, and adoption mechanisms -- far beyond what the bootstrap needs. We removed proportionality guidance ("depth of investigation should match importance of decision"). Without it, the agent treated all questions as equally worthy of full investigation.

**Practitioner-reported friction** (5 points, all legitimate):

1. Confidence scale assumes code execution. Convention questions (naming, structure) have no code to run, so they get "low confidence" despite thorough analysis. The HDD-derived scale doesn't fit all question types.
2. No procedure for tracking which of multiple simultaneously-spawned investigations are active.
3. No procedure for propagating investigation open questions back to the parent design.
4. No procedure for the experimenting → researching reverse transition (state diagram shows it; procedure doesn't cover it).
5. No structural mechanism for cross-investigation coordination when investigations discover overlapping territory.

**Researcher observations not reported by practitioner**:

- The agent completed all 4 investigations and all 5 decisions in a single pass, which is artificial. Real work involves back-and-forth. The procedures don't prevent this but also don't guide iterative work.
- The agent created `research/` and `experiments/` subdirectories at investigation creation time, even for investigations that never got experiments (directory-naming). The procedure says to create both subdirectories upfront, which creates empty structure.

### Assessment: what to change for next attempt

**Must fix in apparatus.md**:
- Add experiment validity rule: "An Experiment must be executed, not merely analyzed. Writing code and reasoning about it without running it is Research, not an Experiment."
- Add reverse transition procedure for experimenting → researching.
- Add procedure for propagating investigation open questions to parent design when completing a design.

**Should consider**:
- Rethink confidence scale to not penalize non-experimental investigations. Maybe: high (validated by evidence -- experiment or authoritative source), medium (supported by analysis), low (conjecture or single source).
- Add brief proportionality note: not all questions warrant full investigation.
- Remove upfront creation of `experiments/` subdirectory -- create when needed.

**Don't fix yet** (need more data):
- Cross-investigation coordination (#5). May be inherent to the model. One more attempt to see if it recurs.
- Multi-investigation tracking (#2). The current procedure is technically correct; may just need a clarifying sentence.

## Bootstrap Assumptions

| Assumption | Invalidated if | Impact |
|------------|----------------|--------|
| A single apparatus.md is sufficient for stage 1 | Practitioner can't find information because the document is too long or poorly organized | Consider splitting, but on a different axis than before |
| Plain Markdown with YAML frontmatter works for Apparatus documents | Format becomes a bottleneck (need computed content, cross-references that break) | Design document format as a stage 1+ task |
| Manual procedures are detailed enough to follow | Practitioner encounters ambiguity not resolvable from apparatus.md | Revise procedures in apparatus.md |
| Experiments can be deferred from stage 0 | Stage 1 design task requires experimental validation that the process can't express | Re-add Experiment to apparatus.md |
| Quality hypotheses can be deferred from stage 0 | Practitioner produces low-quality output because no quality guidance exists | Selectively re-add guidance to apparatus.md |
