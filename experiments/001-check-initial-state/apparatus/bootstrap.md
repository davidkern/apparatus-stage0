---
apparatus:
  type: design
  status: specified
---

# Apparatus Bootstrap

## The Problem

The Apparatus is a system for making design decisions with structured evidence. But the Apparatus itself requires design decisions. This creates a circular dependency: the system cannot be used to design itself until it exists, but it cannot exist until it has been designed.

## The Analogy

This is the same problem faced when building a compiler for a new language. The solution is bootstrapping:

- **Stage 0**: A human (or existing tool) manually performs the work the system will eventually automate. The output is crude but functional.
- **Stage 1**: The crude system processes its own design, producing a better version of itself.
- **Stage N**: Each iteration refines the system using the system.

The quality of stage 0 does not matter much. What matters is that it is correct enough to produce a stage 1 that is genuinely better.

## Stage 0: Current State

Stage 0 is being performed manually (by a human and an AI assistant acting as the interpreter). It produces three documents:

1. **[The Apparatus](spec.md)** -- Abstract specification of the knowledge management system. Defines knowledge kinds, lifecycles, flow rules, evidence rules, and assumption tracking. Contains no technology-specific content.

2. **[Infrastructure Mapping](infrastructure.md)** -- Maps each abstract concept to its current technical realization. Honest inventory of what works, what is designed but not built, and what is not designed.

3. **This document** -- Records what was done, what was deferred, and what comes next.

Stage 0 is complete when all three documents have been drafted and reviewed, and the bootstrap exit criteria (below) are met. Until then, these documents are works in progress subject to revision as the drafting process surfaces issues.

### What stage 0 deliberately avoids

- **Building infrastructure**: No CLI tools, no schema validation, no rendering pipeline. All operations are manual.
- **Pre-building project structure**: No empty directories for investigations or designs. Structure is created when needed.
- **Designing for a specific adopting project**: The Apparatus is project-agnostic. It describes a process, not a project. Adopting projects map the Apparatus to their own infrastructure.
- **Automating any workflow**: The manual procedures in the infrastructure mapping are the entirety of the "tooling." Automation is a stage 1+ concern.
- **Perfecting the documents**: Stage 0 produces documents that are correct enough to use. Polish, completeness of edge cases, and refinement happen by running the system in stage 1.

## Stage 0 Exit Criteria

Stage 0 is complete when someone can manually execute the Apparatus's process for a real design task -- creating the right artifacts, storing state in the right places, knowing when transitions are valid, and producing the right outputs -- using only these three documents.

| # | Criterion | Met? |
|---|-----------|------|
| C1 | **Abstract spec defines all state.** Every artifact the process creates or modifies is named, with its structure and valid states specified. No implicit domain objects. | Yes |
| C2 | **Abstract spec defines all transitions.** For every state change, the spec says what triggers it, what conditions must hold, and what the transition produces. | Yes |
| C3 | **Infrastructure mapping covers every artifact.** Each artifact from the abstract spec maps to a concrete storage location and format. Someone knows where to put things and where to find them. | Yes |
| C4 | **Infrastructure mapping covers manual execution.** For each transition that lacks tooling, the mapping describes the manual procedure. | Yes |
| C5 | **Documents are internally consistent.** No contradictions between abstract spec, infrastructure mapping, and bootstrap record. Status vocabularies, lifecycle states, and artifact names align. | Yes |
| C6 | **All stage 0 findings resolved.** Every finding has a disposition (address, defer, accept) and all "address" items are resolved. | Yes |
| C7 | **Deferrals are explicit.** This document lists everything deferred to stage 1+ with rationale. | Yes |

## Stage 1: What Comes Next

Stage 1 uses the (crude) Apparatus to process its first real design. This is the test that validates whether stage 0 produced something usable.

### 1. Design the Apparatus's project conventions

The natural first design task: use the Apparatus to design how Apparatus-managed projects should organize themselves. This exercises the full forward flow (scope, outline, open questions, investigations, decisions, final document) while producing something directly useful.

Scope would include: directory structure for designs and investigations, document naming conventions, frontmatter schema formalization, and how adopting projects reference the Apparatus spec.

This is the self-referential bootstrap: the Apparatus designs its own conventions using the Apparatus's process.

### 2. Validate the manual procedures

Stage 1 work will be the first real test of the manual procedures documented in the infrastructure mapping. Every procedure that proves awkward, ambiguous, or wrong should be recorded and fed back as stage 1 findings. The infrastructure mapping is updated based on real use, not theory.

### 3. Identify automation candidates

As manual procedures are exercised, patterns will emerge that are worth automating. These become inputs to future design tasks. The threshold for automation is not "this could be automated" but "this is a bottleneck or error source that automation would meaningfully improve."

### Deferred to stage 2+

- Schema validation tooling (no manual bottleneck yet)
- Status rendering / document banners (cosmetic until there are many documents)
- Trace Link infrastructure (no decided Designs to trace to)
- Automated assumption monitoring
- Cross-document reference validation

## Stage 0 Findings

Issues surfaced during review of the bootstrap documents. Each item has a disposition: **address** (fix before stage 0 is complete), **defer** (stage 1 or later), or **accept** (not a problem, with rationale).

### Abstract spec completeness

The abstract spec uses several concepts as first-class participants in the knowledge flow. During review, five concepts were found to lack explicit definition. All were resolved by defining them as structural components of their parent kinds.

| # | Finding | Disposition | Resolution |
|---|---------|-------------|------------|
| F1 | **Recommendation** is a named node in the flow diagram with concrete properties (confidence, addresses criteria) but was not defined as a knowledge kind or structural component. | Addressed | Defined as structural component of Investigation: terminal state, consists of statement + confidence. Infrastructure mapping provides frontmatter schema. |
| F2 | **Evaluation Criteria** govern Investigation completion but were not defined in the abstract spec. | Addressed | Defined as structural component of Investigation: set at creation, Recommendation must address all of them. Infrastructure mapping provides frontmatter schema. |
| F3 | **Open Questions** appear in both Design and Investigation flows but had no lifecycle. How does one graduate to an Investigation vs. being deferred? | Addressed | Defined as structural component of both Investigation and Design with distinct semantics. Transition rule added to forward flow: investigate when answer unknown and decision non-trivial; defer with rationale otherwise. |
| F4 | **Assumption** has detailed treatment (three-part structure, drives backward flow) but had no infrastructure mapping. | Addressed | Infrastructure mapping documents `apparatus.assumptions` list on each Decision with all three required parts. Manual monitoring procedure documented. |
| F5 | **Scope Statement** is the input that starts a Design but was not defined. | Addressed | Defined as structural component of Design: boundaries of what is being designed, specific enough to determine what falls inside or outside. Infrastructure mapping provides frontmatter schema. |

### Infrastructure gaps for manual execution

| # | Finding | Disposition | Resolution |
|---|---------|-------------|------------|
| F6 | **No manual procedures.** Infrastructure doc describes what exists and what doesn't but doesn't tell you how to work around the absence. No procedure for creating a Design, recording Decisions, linking Investigations, or tracking Assumptions. | Addressed | Infrastructure mapping now includes complete manual procedures for all Investigation and Design activities. |
| F7 | **No worked example.** No walkthrough of how the Apparatus would process a real design task. | Defer | Stage 1 is itself the worked example. The first design task will validate the procedures. |

### Consistency and boundary issues

| # | Finding | Disposition | Resolution |
|---|---------|-------------|------------|
| F8 | **Document maturity vs. kind-specific status.** Early drafts used near-identical names for different concepts (e.g., `draft` vs. `drafting`). | Addressed | Maturity axis uses proposed/specified/implemented/superseded. Kind-specific lifecycles use their own vocabularies. No shared terms between axes. |
| F9 | **Flow diagram implies sequential phases.** The forward flow reads as a numbered sequence but real work involves partial Designs with some Decisions resolved while others are in Investigation. | Accept | The state diagrams are authoritative for lifecycle; the narrative is illustrative. Does not block manual execution. |
| F10 | **"Implementation" is external but the backward flow depends on it.** Trace Links reference artifacts outside the Apparatus but the invalidation workflow requires traversing them. | Accept | Correct by design. The spec names the two boundary interface points explicitly: Design enables implementation (forward), Trace Links reference implementation (backward). |

## Assumptions

| Assumption | Invalidated if | Impact |
|------------|----------------|--------|
| The three-document bootstrap is sufficient to begin stage 1 | Stage 1 work reveals that a critical abstract concept is missing from the spec | Revise the Apparatus spec before continuing |
| Plain Markdown with YAML frontmatter is sufficient for Apparatus documents | Document format becomes a bottleneck during stage 1 (e.g., need for computed content, cross-references that break) | Design a document format migration as a stage 1 task |
| Manual procedures are detailed enough for someone to execute them | Stage 1 designer encounters ambiguity not resolvable by reading the infrastructure mapping | Return to stage 0 for infrastructure mapping revision |
| The abstract spec is stable enough for manual execution without constant reinterpretation | Stage 1 designer frequently encounters questions not answerable by reading the spec | Return to stage 0 for spec revision before continuing stage 1 |
| The Apparatus is project-agnostic | An adopting project discovers that the spec implicitly assumes capabilities or conventions that not all projects share | Identify and extract the project-specific assumption into the infrastructure layer |
