---
apparatus:
  type: design
  status: specified
---

# Apparatus Infrastructure

This document maps each abstract concept from the [Apparatus specification](spec.md) to its current technical realization. It is an honest inventory: what works, what is designed but not built, and what has not been designed at all.

This snapshot was created during the stage 0 bootstrap. It will drift as infrastructure is built. The [bootstrap record](bootstrap.md) describes the iteration plan.

## Terminology

| Term | Meaning |
|------|---------|
| Apparatus | The abstract knowledge management system (see [spec](spec.md)) |
| Infrastructure | This layer: technical realization of the Apparatus |
| Repository | The git repository containing all Apparatus documents |

## Storage

All Apparatus artifacts are plain Markdown files (`.md`) stored in a git repository. Documents use YAML frontmatter in an `apparatus:` namespace for machine-readable metadata. Git provides versioning, change tracking, and collaboration. GitHub provides rendering (including Mermaid diagrams) and review workflows.

There is no CLI tooling, no rendering pipeline, and no schema validation. All operations are manual. This is deliberate for stage 0: the system must be usable before any automation exists.

## Knowledge Kind Mapping

For each knowledge kind defined by the Apparatus, this section describes how it is currently represented.

### Investigation

| Aspect | Current State | Status |
|--------|---------------|--------|
| Data storage | YAML frontmatter in `.md` files | Designed |
| Directory structure | `investigations/<topic>/` with `research/` and `experiments/` subdirectories | Designed |
| Lifecycle management | Manual (see [Manual Procedures](#investigation-procedures)) | Manual |
| Body content | Hand-written prose; no templating or generation | Manual |
| Rendered output | GitHub Markdown rendering | Working |

**Frontmatter schema**:

```yaml
apparatus:
  type: investigation
  status: researching | experimenting | complete | abandoned
  question: "The question being investigated"
  criteria:
    - "Criterion 1: what a successful answer looks like"
    - "Criterion 2: ..."
  recommendation:
    statement: "What to do (only when status: complete)"
    confidence: high | medium | low
  open-questions:
    - "Question surfaced but not in scope"
```

**Structural components mapped**:

- **Evaluation Criteria**: `apparatus.criteria` list in frontmatter. Set at creation. The recommendation must address all of them.
- **Recommendation**: `apparatus.recommendation` object in frontmatter. Written only when transitioning to `complete`. Contains `statement` and `confidence`.
- **Open Questions**: `apparatus.open-questions` list in frontmatter. Accumulated during work. Do not block completion.

### Research

| Aspect | Current State | Status |
|--------|---------------|--------|
| Data storage | YAML frontmatter in `research/NNN-<name>.md` | Designed |
| Creation | Manual file creation | Manual |
| Rendered output | GitHub Markdown rendering | Working |

Research documents are children of an Investigation. Their frontmatter links back to the parent:

```yaml
apparatus:
  type: research
  topic: "<parent-investigation-name>"
  id: NNN
```

### Experiment

| Aspect | Current State | Status |
|--------|---------------|--------|
| Data storage | YAML frontmatter in `experiments/NNN-<name>/index.md` | Designed |
| Creation | Manual file creation | Manual |
| Code isolation | Standalone project in experiment subdirectory | Designed |
| Rendered output | GitHub Markdown rendering | Working |

Experiment frontmatter:

```yaml
apparatus:
  type: experiment
  topic: "<parent-investigation-name>"
  id: NNN
  hypothesis: "The testable claim"
  status: planned | running | passed | failed | blocked
  result: "What was observed (when status is terminal)"
```

Experiment code lives alongside the experiment document. Each experiment is self-contained and does not depend on other experiments or shared infrastructure.

### Design

| Aspect | Current State | Status |
|--------|---------------|--------|
| Data storage | YAML frontmatter in `designs/<name>/index.md` | Designed |
| Directory structure | `designs/<name>/` with `decisions/` subdirectory | Designed |
| Lifecycle management | Manual (see [Manual Procedures](#design-procedures)) | Manual |

Design frontmatter:

```yaml
apparatus:
  type: design
  status: open | waiting | complete
  scope: "What is being designed and what is excluded"
  open-questions:
    - question: "A question requiring investigation or deferral"
      disposition: investigate | defer
      rationale: "Why this disposition (required for defer)"
      investigation: "<topic-name> (when disposition: investigate)"
```

**Structural components mapped**:

- **Scope Statement**: `apparatus.scope` field in frontmatter. Set at creation.
- **Open Questions**: `apparatus.open-questions` list in frontmatter. Each entry has a `disposition` (investigate or defer) and supporting fields.
- **Assumptions**: Documented on each Decision (see Decision mapping below).

### Decision

| Aspect | Current State | Status |
|--------|---------------|--------|
| Data storage | YAML frontmatter in `decisions/NNN-<name>.md` | Designed |
| Assumption tracking | Structured in frontmatter | Designed |
| Lifecycle management | Manual (see [Manual Procedures](#design-procedures)) | Manual |

Decision frontmatter:

```yaml
apparatus:
  type: decision
  design: "<parent-design-name>"
  id: NNN
  status: open | decided | superseded
  superseded-by: "NNN (when status: superseded)"
  options:
    - name: "Option A"
      description: "What this option entails"
    - name: "Option B"
      description: "What this option entails"
  chosen: "Option A (when status: decided)"
  rationale: "Why this option was chosen"
  evidence:
    - type: investigation | research | experiment | trivial | external
      ref: "<path-or-description>"
  assumptions:
    - assumption: "Statement believed to be true"
      invalidation: "Observable condition that would make it false"
      impact: "What depends on this being true"
```

**Structural components mapped**:

- **Assumptions**: `apparatus.assumptions` list on each Decision. Each entry has the three required parts: statement, invalidation condition, downstream impact. This resolves the infrastructure gap for assumption storage (stage 0 finding F4).

### Trace Link

| Aspect | Current State | Status |
|--------|---------------|--------|
| Reference format | `@trace decision:<design>/<id>` in code comments | Designed |
| Traceability index | Not designed | Not built |
| Impact analysis | Not designed | Not built |
| Coverage checking | Not designed | Not built |

Trace Links have no infrastructure beyond the reference format convention. This is appropriate: there are no decided Designs to trace to yet. Trace Link infrastructure is deferred until Designs with Decisions exist.

## Cross-Cutting Infrastructure

### Document format

| Component | Current State | Status |
|-----------|---------------|--------|
| File format | Plain Markdown (`.md`) with YAML frontmatter | Working |
| Diagrams | Mermaid blocks rendered by GitHub | Working |
| Status visibility | Exists only in frontmatter (not rendered as banners) | Not built |
| Cross-document references | Plain Markdown links | Working |

### Data conventions

| Convention | Current State | Status |
|------------|---------------|--------|
| `apparatus:` frontmatter namespace | Used by all documents | Working |
| Document type field (`apparatus.type`) | Standardized across all kinds | Working |
| Status vocabulary | Defined per knowledge kind in spec | Working |
| Schema validation | None -- correctness is manual | Not built |

### Automation

None. All operations are manual. This is the stage 0 baseline.

## Manual Procedures

This section describes how to perform each Apparatus activity using only the current infrastructure. These procedures resolve stage 0 finding F6.

### Investigation Procedures

#### Start an Investigation

1. Create directory: `investigations/<topic>/`
2. Create `investigations/<topic>/index.md` with frontmatter:
   - Set `apparatus.type: investigation`
   - Set `apparatus.status: researching`
   - Write `apparatus.question` -- the question being investigated
   - Write `apparatus.criteria` -- what a successful answer looks like
3. Write the body: restate the question and criteria in prose. This is the Investigation's initial document.
4. Create subdirectories: `research/` and `experiments/`

#### Add Research

1. Determine the next ID: count existing files in `research/`, add 1.
2. Create `research/NNN-<descriptive-name>.md` with frontmatter linking to the parent topic.
3. Write findings in the body. Cite sources.

#### Add an Experiment

1. Determine the next ID: count existing files in `experiments/`, add 1.
2. Create `experiments/NNN-<descriptive-name>/index.md` with frontmatter:
   - Set `apparatus.hypothesis` -- the testable claim
   - Set `apparatus.status: planned`
3. Write the experiment setup in the body.
4. Place any experiment code in the same directory.

#### Run an Experiment

1. Execute the experiment code or procedure described in the experiment document.
2. Update `apparatus.status` to `passed`, `failed`, or `blocked`.
3. Write `apparatus.result` -- what was actually observed.
4. If the Investigation was in `researching`, update it to `experimenting`.

#### Complete an Investigation

1. Verify all evaluation criteria can be addressed by the evidence gathered.
2. Add `apparatus.recommendation` to the Investigation frontmatter:
   - `statement`: what to do
   - `confidence`: high (experiment passed), medium (experiment blocked), or low (research only)
3. Add any `apparatus.open-questions` surfaced during work.
4. Update `apparatus.status` to `complete`.
5. Write the recommendation in the body, addressing each criterion.

#### Abandon an Investigation

1. Update `apparatus.status` to `abandoned`.
2. Document the reason in the body (question no longer relevant, not answerable, etc.).

### Design Procedures

#### Start a Design

1. Create directory: `designs/<name>/`
2. Create `designs/<name>/index.md` with frontmatter:
   - Set `apparatus.type: design`
   - Set `apparatus.status: open`
   - Write `apparatus.scope` -- what is being designed and what is excluded
3. Write the body: scope statement, initial outline, and any immediately apparent open questions.
4. Create subdirectory: `decisions/`

#### Identify Open Questions

1. As questions arise during design work, add them to `apparatus.open-questions` in the Design frontmatter.
2. For each question, assign a disposition:
   - `investigate`: the answer is unknown and the decision it informs is non-trivial. Record the investigation topic name.
   - `defer`: the answer is not needed for this Design to be complete. Record the rationale.
3. If any question has disposition `investigate`, create an Investigation for it (see Investigation Procedures).
4. If an Investigation is spawned, update the Design's `apparatus.status` to `waiting`.

#### Record a Decision

1. Determine the next ID: count existing files in `decisions/`, add 1.
2. Create `decisions/NNN-<descriptive-name>.md` with frontmatter:
   - Set `apparatus.type: decision`
   - Set `apparatus.status: open`
   - List at least two `apparatus.options`
3. When ready to decide:
   - Set `apparatus.chosen` and `apparatus.rationale`
   - Set `apparatus.evidence` -- what informed this decision
   - Document `apparatus.assumptions` with all three parts (statement, invalidation condition, downstream impact)
   - Update `apparatus.status` to `decided`
4. Write the decision rationale in the body, explaining why the chosen option was selected over alternatives.

#### Complete a Design

1. Verify all Decisions are `decided` (or `superseded` with replacement).
2. Verify all open questions have a Decision or explicit deferral.
3. Verify all assumptions are documented with invalidation conditions.
4. Update `apparatus.status` to `complete`.

#### Supersede a Decision

1. Create a new Decision document explaining the replacement.
2. Update the old Decision's `apparatus.status` to `superseded`.
3. Set `apparatus.superseded-by` to the new Decision's ID.

### Assumption Monitoring

There is no automated monitoring. To check assumptions manually:

1. Read through the `apparatus.assumptions` on each Decision in active Designs.
2. For each assumption, evaluate whether the invalidation condition has occurred.
3. If an assumption is invalidated, follow the Invalidation Workflow in the spec:
   - Identify affected Decisions
   - Trace downstream impact
   - Assess whether conclusions change
   - Create new Decisions or document why the invalidation doesn't affect conclusions
   - Update Trace Links (when they exist)

### Trace Link Procedures

No procedures yet. Trace Links require decided Designs to trace to. Deferred until Designs with Decisions exist.

## Gap Analysis

Ordered by priority for unblocking the next iteration of the Apparatus's own design.

### Tier 1: Enables practical use

1. **First real Design** -- The apparatus has never processed an actual design task. Until it does, the manual procedures are untested theory. Stage 1 addresses this.

### Tier 2: Reduces friction

2. **Status rendering** -- Documents carry status only in frontmatter, invisible without opening the file. Some mechanism to surface status visually would reduce friction when navigating multiple documents.

3. **Schema validation** -- No automated checking that frontmatter conforms to type-specific schemas. Correctness depends entirely on the person creating documents following the conventions.

### Tier 3: Enables traceability

4. **Trace Link infrastructure** -- Reference format is designed but nothing else: no index, no impact analysis, no coverage checking. Blocked on having decided Designs to trace to.

### Tier 4: Enables scale

5. **Automation** -- CLI tooling for creating artifacts, managing lifecycle transitions, validating schemas. Not needed until manual procedures become a bottleneck.
