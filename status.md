# Status

Reconciliation Procedure last run: 2026-02-06

## Work queue

### apparatus.md fixes (from experiments 002, 003)

- [x] Add experiment validity rule: "An Experiment must be executed, not merely analyzed"
- [ ] Add reverse transition procedure (experimenting → researching)
- [ ] Add open-question propagation procedure (investigation → parent design)
- [x] Fix ID assignment: max existing ID + 1, not count

### apparatus.md refinements (from experiment 003)

- [ ] Remove "someone else" language from review gates — describe state semantics, not enforcement
- [ ] Simplify review → open → waiting transition sequence
- [ ] Anchor evidence ref paths to a defined root
- [ ] Clarify open-questions shape difference between Investigation and Design

### apparatus.md refinements (from retrospectives)

- [ ] Investigation criteria should describe completeness of coverage, not specific outcomes (retro 001)
- [ ] Consider `complete` as terminal experiment status; record hypothesis outcome separately (retros 001, 002)
- [ ] Recommend splitting compound hypotheses into independently testable sub-claims (retro 001)
- [ ] Acknowledge experiment iteration in procedure: intermediate findings are often as valuable as final result (retro 001)
- [ ] Add guidance for experiments with dependencies: "Setup findings" vs "Evaluation findings" subsections (retro 002)
- [ ] Add reproducibility guidance for experiments with external dependencies (retro 002)
- [ ] Define implementation plan as artifact type — currently a gap (retro 003)
- [ ] Clarify design lifecycle: "editorially complete" vs "technically complete" vs "ready for implementation" (retro 003)

### Tooling

- [ ] Build runner that enforces review gates structurally (terminates session at `review`, resumes after external status change)
- [ ] Add PostToolUse hook (pre-commit) to apparatus devenv module
- [ ] Properly configure research repo devenv hooks (currently stripped to SessionStart only)

### CLI implementation

First implementation started on `cli-phase-1` branch (2026-02-02). Blocked after compaction event caused quality degradation. Devenv module adapted for research space integration.

- [ ] Resume CLI implementation from phase 1 scaffold
- [ ] Validate CLI design against implementation friction

### Research

- [ ] Link gregarious repo into workspace for reference on skill-based API pattern
- [ ] Validate three-component architecture (smallest proving slice against gate enforcement problem from 003)
- [ ] Integrate cross-perspective synthesis into project foundations — see `journal/2026-01-31-module-reusability-and-process/cross-perspective-synthesis.md`

### Needs more data (carried forward)

- [ ] Rethink confidence scale for non-experimental investigations
- [ ] Cross-investigation coordination mechanism
- [ ] Proportionality note in apparatus.md

### Open research questions

**Formal→informal mode transitions**: Ad-hoc experiments showed that shifting practitioners from formal work to informal reflection (journal access, research guide) produces valuable meta-observations about the process itself. Open questions:

- Is this preconditioned on work type? Design/decision work seems to produce richer reflection than implementation/mechanical work.
- What triggers the productive transition? Observed after: productive sessions, frustrating sessions, strategic need. Unknown if timing matters or just context accumulation.
- What's the minimum intervention? Task shift suggestion alone seemed sufficient; full research access wasn't required.
- Should the apparatus have explicit "reflection gates"?

Candidates for controlled investigation once the shell provides isolation.

### Shell design

Design document editorially complete. Waiting on technical validation:

- [x] Experiment 10: Namespace/fork ordering for startup flow
- [x] Experiment 11: Environment root remapping (FUSE vs pivot_root vs overlayfs)
- [ ] Resolve inline notes (hook strategy, observation modes, protocol framing)

Implementation plan extracted to `journal/2026-02-06-shell-design-editing/implementation-plan.md`. Milestones M0-M6 scoped.

### Journaling (post-shell, pre-git)

Add journaling capability to apparatus CLI before the full git storage work.
Use the same filesystem structure we've been maintaining manually (`journal/YYYY-MM-DD-topic.md` with optional companion directories). This introduces journaling for apparatus users and removes the manual burden in the research space.

- [ ] Design journal entry creation (date, topic, companion directory)
- [ ] Design journal listing/navigation
- [ ] Consider whether reconciliation procedure can be partially supported
- [ ] Implement using filesystem directly (no git dependency yet)

Deferred to git phase: cross-references, assumption tracking, formal artifact linking.

### Presently / Knowledge representation

Presentation layer design led to broader knowledge representation research. See
`journal/2026-02-09-semantic-presentation.md`.

- [x] Complete auditory forms research (010-012) — naive→synthesis pattern validated
- [ ] Use completed hierarchy model to finalize presently design scope
- [ ] Implement minimal presently forms needed for shell output
- [ ] Consider whether hierarchy model informs apparatus storage format design

Investigation complete at `/work/apparatus/investigations/semantic-presentation/`.
Design in progress at `/work/apparatus/designs/presently/`.
Crate at `/work/apparatus/crates/presently/`.

Key finding from 012: Classical rhetoric had compositional vocabulary (Quintilian's
delivery patterns, oral-formulaic type-scenes) that modern synthesis systems lack.
The "missing layer" is Layer 3 (Utterance Form) — where semantic intent first
determines prosodic treatment.

**Validated research technique (naive→synthesis):** Exploratory research that
produces unsatisfying inventories is a precondition for synthesis research that
produces coherent hierarchies. The 007-009 sequence (typographic) and 010-012
sequence (auditory) both followed this pattern. The naive phases define what
"success" means by demonstrating what fails; synthesis prompts can then specify
"not like X" with X compressed into fuzzy intention. This is now a reproducible
technique for hierarchicalization problems.

### Repository hygiene (deferred)

- [ ] Apparatus repo history rewrite after shell provides isolation
- [ ] Review 47 commits on `shell-design-round-2` before merge to main

## Current landscape

### Storage architecture (decided 2026-02-01)

Git is the storage substrate. Key decisions from the git-as-database design session:

**Physical layout:**
- `.apparatus/` — separate bare git repo alongside project's `.git/`
- Complete bidirectional isolation from project git (no IDE visibility issues)
- Configurable apparatus remote independent of code remote

**Three-layer architecture:**
1. **Substrate layer** — four primitives: hierarchy, CAS identity, atomic snapshots, enumeration
2. **Structure layer** — domain semantics (journal, investigation, design)
3. **System layer** — cross-structure orchestration

**Identity model:**
- Two-layer identity: content-addressing at substrate (SHAs), assigned identifiers at system layer (UUIDs)
- Citations record both: `(assigned-id, content-SHA)` — assigned ID for durability, SHA for precision
- Staleness detection via stored ref SHA at index-build time (from git-annex prior art)

**Object types:** 10 types across 3 structures, each with lifecycle states and sub-objects. Fine-grained at traceability joints (findings, assumptions, decisions are independent sub-objects), coarse elsewhere (artifacts stay inside parent entries).

**Index:** Single file with forward index (keyed by assigned-id) and reverse-citation index (keyed by cited-id for assumption invalidation).

Full specification: `journal/2026-02-01-git-as-database/apparatus-cli-design.md`

### Runner architecture

The apparatus has a three-component architecture, established after experiment 003:

1. **Git as state storage.** Lifecycle state lives in the commit graph. Transitions are commits made by the runner, not the agent.
2. **Claude skills as the practitioner API.** Activity-oriented interface — the agent calls actions rather than writing state directly. Skills structurally bound what the agent can do.
3. **Runner/orchestrator.** Manages phases, launches practitioners with phase-scoped prompts, validates, commits, transitions. Batch model: agent works a phase to completion, runner processes between phases.

Design principles:
- Runner is sole writer of state. Agent produces content; runner manages transitions.
- Git is a database, not an API. Skills provide the real-time interface.
- Control plane grows based on evidence. A behavior moves from agent-managed to runner-managed when experiments show the agent cannot self-regulate it.
- Prevention over detection. Runs are expensive; don't let the agent do something wrong and catch it after.

### Prior art findings (2026-02-01)

Surveyed 12 tools using git or git-like CAS for structured data. Key findings affecting apparatus design:

1. **Canonical serialization is non-negotiable.** YAML doesn't fit any strategy. JSON with sorted keys is the candidate.
2. **Separate store validated.** Jujutsu's `.jj/repo/store/git/` independently validates the apparatus approach.
3. **Commit trailers for operational metadata.** Gerrit uses 29 structured footer keys. Apparatus should use trailers for audit trail.
4. **git notes for annotations on frozen objects.** Resolves lifecycle contradiction without affecting annotated object SHAs.
5. **Two-layer identity is universal.** Jujutsu, Gerrit, apparatus all independently arrived at assigned-id + content-SHA.

Tools examined: git-bug, git-annex, git-appraise, Gerrit NoteDb, Jujutsu, DVC, git-dit, Dolt, Noms, Fossil, GitDocumentDB, lakeFS.

### Bootstrap assumptions

| Assumption | Status | Invalidated if | Impact |
|------------|--------|----------------|--------|
| A single apparatus.md is sufficient for stage 1 | live | Practitioner can't find information because the document is too long or poorly organized | Consider splitting on a different axis than the original three-file structure |
| Plain Markdown with YAML frontmatter works for Apparatus documents | live | Format becomes a bottleneck (need computed content, cross-references that break) | Design document format as a stage 1+ task |
| Manual procedures are detailed enough to follow | live | Practitioner encounters ambiguity not resolvable from apparatus.md | Revise procedures in apparatus.md |
| Experiments can be deferred from stage 0 | live | Stage 1 design task requires experimental validation that the process can't express | Re-add Experiment to apparatus.md |

Two assumptions invalidated by experiments (now historical, recorded in journal):
- "Quality hypotheses can be deferred from stage 0" — invalidated by 002 (fabricated experiments without validity rule)
- "apparatus.md alone is sufficient for controlled execution" — invalidated by 003 (agent reasons past behavioral halt instructions)

### Open tensions

- **Synthesis across phases.** If the runner clears agent context between phases, cross-cutting synthesis is lost. Options: don't clear context, summary artifact at boundaries, or dedicated synthesis phase. Not urgent until runner exists.
- **Experiment definition is slippery.** Fabricated experiments persist across 002 and 003. Skill-based architecture may address this (available experiment types = available skills) but needs validation.
- **Iteration speed.** Experiments cost significant tokens and time. Phased runner + batch model should support unit-testing individual phases. Not addressable until runner exists.
- **Project integration.** Partially resolved: devenv custom module (`apparatus.enable = true`) is the adoption mechanism. Revisit when apparatus is adopted into a real project.

### Skill triggering

Claude has a tendency to change strategy rather than load a skill when encountering a missing command. Hypothesis: strong negative bias in the model's cost function for tool-loading vs. pivoting. SessionStart hook is a partial workaround (puts nix-shell hint in context early). The deeper problem (reliable skill triggering for ephemeral usage) is deferred.

### Crosstalk and confinement

The apparatus and research repos share an unconfined workspace. Agents can read/write anywhere. During the shell design work, this was exploited rather than fought:

- Practitioners wrote retrospectives in `apparatus/retrospectives/`
- Practitioners read `research-guide.md` and adopted its norms
- Some practitioners explored research journals, observing their own ancestry

This produced informal observations (not controlled experiments):
- Practitioners who see retrospectives produce better retrospectives
- Practitioners who read the research guide adopt its terminology
- Meta-awareness may improve output quality

The apparatus repo history is contaminated by this crosstalk. A history rewrite will be needed once the shell provides real isolation.

### Practitioner modes

Shell design work revealed two practitioner modes:

1. **Confined practitioner**: Follows apparatus.md, records friction. Used for stage 0 experiments.
2. **Directive practitioner**: Receives specific editorial guidance, works collaboratively. Used for complex technical work.

Both are valid. The apparatus process manages knowledge and decisions; it doesn't specify how every line gets written. Complex technical work may require directive mode while still producing apparatus-compatible artifacts (decisions, investigations, retrospectives).

### Practitioner techniques (from retrospectives)

Effective patterns discovered during directive practitioner work:

- **Staged reading**: Read document in phases to capture honest first impressions before seeing how later sections resolve gaps.
- **Scratch pad files**: External gitignored file for tracking terminology decisions, content moves, accumulated guidelines. Maintains session continuity without polluting the design document.
- **Parallel drafting**: While researcher reviews one section, practitioner drafts independent sections in parallel.
- **Goal connections**: Adding "this section serves goals X, Y" at top of each section creates consistency and scannability.
- **Name the anti-pattern**: Identifying that a section is "overview that defers" makes the solution (dissolve into peer sections) obvious.

### Compaction quality (2026-02-02)

Explicit compaction instructions ("retain strategic thinking, discard troubleshooting") produced worse results than defaults. The post-compaction agent stopped proactive collaboration and made significant errors. Reverted to default summarization. Worth investigating whether this is reproducible or session-specific.
