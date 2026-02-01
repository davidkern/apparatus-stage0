# Triad design plan

## Task list

### Done (this session)

- [x] Determine how gregarious references the apparatus module → `git+file:`
      for local dev; `github:owner/apparatus` for production
- [x] Add composable settings support to apparatus module (extraHooks,
      allowedTools, deniedTools, extraSettings)
- [x] Integrate apparatus module into gregarious devenv.nix
- [x] Verify: devenv skill, PreToolUse hook, settings merge all work
- [x] Remove Quarto from gregarious, convert all .qmd to .md (baseline for
      investigation skill generalization)

### Next session

- [ ] Create `apparatus.store/journal/` in all three repos
- [ ] Migrate research space journal into `apparatus.store/journal/`
- [ ] Migrate research space experiments into `apparatus.store/` (structure TBD
      based on protocol catalog decisions)
- [ ] Move investigation skill into apparatus (as `apparatus` uber-skill)
- [ ] Move Python CLI into apparatus repo
- [ ] Install apparatus skill in gregarious via module
- [ ] Install apparatus skill in research space via module
- [ ] Migrate gregarious `docs/investigation/gpu-structure/` to
      `apparatus.store/investigation/gpu-structure/` (frontmatter: gregarious → apparatus)

### Future sessions

- [ ] Integrate apparatus devenv module into research space
- [ ] Test removing `claude-code-overlay` input from gregarious when apparatus
      switches to `github:` reference
- [ ] Define feedback signal: what we observe in gregarious, how it flows back
- [ ] Implement design/ and decision/ structures (big loop)
- [ ] Revise research-guide.md to reflect big-loop framing
- [ ] Finalize protocol catalog naming and implement remaining protocol types

## Design principles

- Apparatus is an opinionated framework — no configuration unless an external
  factor forces it
- `apparatus:` frontmatter namespace everywhere; unnamespaced things in the
  gregarious implementation should be namespaced
- Where conventions conflict across the triad, decide a shared convention and
  migrate all three repos
- The investigation skill from gregarious is the more general system and
  subsumes the research space's experiment support — take the larger system,
  conform the research space to it. All nodes use the same machinery.
- No Taskfile in apparatus — devenv scripts replace everything we need
- Skill name: `apparatus` — uber-skill exposing all functionality as
  sub-commands. Eventually an `apparatus` CLI command too.
- Existing experiment/investigation data in gregarious and research space is
  not precious — useful for validation only. Will be regenerated when the
  improved system is in place.
- Journal is critical infrastructure — implement first.

## Naming conventions (settled)

| Concept | Name | Location |
|---------|------|----------|
| Data root directory | `apparatus.store/` | `<repo-root>/apparatus.store/` in all three repos |
| Frontmatter namespace | `apparatus:` | All metadata fields |
| Directory naming | singular | SQL table convention (design/, not designs/) |
| Architecture work | design | `apparatus.store/design/<name>/` |
| Tracked choices | decision | `apparatus.store/design/<name>/decision/` |
| Bounded inquiry | investigation | `apparatus.store/investigation/<topic>/` |
| Reasoning record | journal | `apparatus.store/journal/` |
| Skill trigger | `apparatus` | Sub-commands for all functionality |

## Naming conventions (open, for next session)

### Protocol catalog directories

The third level inside an investigation. Each protocol type is a directory
kind. Naming convention: `<category>-<specifier>` (singular).

Known protocol types from existing work:

| Protocol | What it does | Where it exists today |
|----------|-------------|----------------------|
| `experiment-code` | Write code, run it, observe results | gregarious experiments, gpu-structure investigation |
| `experiment-agent` | Give agent a procedure, observe behavior | apparatus experiments 001-003 |

Known informally (not yet defined):

| Protocol | What it does | Examples |
|----------|-------------|----------|
| `experiment-agent-elicitation` | Structured prompting to extract understanding | interviews, retrospective |
| `verify-*` / `check-*` | Integration testing, composition verification | triad module integration |
| `analysis-*` | Directed synthesis of existing evidence | gpu-structure research entries (agent sessions producing structured analysis) |

### Term status

| Term | Status | Meaning |
|------|--------|---------|
| "research" | **umbrella activity** | Describes the full class of investigative work; no structural home needed |
| "experiment" | **survives as protocol category prefix** | `experiment-code`, `experiment-agent`, etc. |
| "investigation" | **settled** | Bounded inquiry: question → evidence → recommendation |
| "design" | **settled** | Scoped architecture work with tracked decisions |
| "decision" | **settled** | A choice with rationale, evidence, and assumptions |
| "journal" | **settled** | Append-only reasoning record |

### Open naming questions

- Exact names for protocol types beyond `experiment-code` and `experiment-agent`
- Sub-command naming for the `apparatus` skill (e.g., `apparatus investigation init`
  vs `apparatus investigate` vs something shorter)

## System framing

The apparatus is a **design system**, not a research system. Research is one
activity within the full cycle:

**Implementation → Design → Investigation → Design → Implementation**

- **Big loop**: the full design-with-traceability cycle. Design spawns
  questions, investigations answer them, recommendations inform decisions,
  decisions track assumptions, implementation happens, assumptions get
  invalidated, new investigations spawn. apparatus.md describes this structure.
- **Little loop**: a single investigation — question → evidence →
  recommendation. The gregarious investigation skill implements this.
  The protocol catalog refines its internals.

The little loop is the right first piece to build. The big loop orchestrates it.

### Protocol catalog

Instead of generic "research" and "experiment" phases (which were too
open-ended and led to agents conducting "experiments" by imagination), the
investigation uses a catalog of named protocols. Each protocol defines:
- What "doing it" means (structural constraint on the agent)
- What outputs it produces
- What tool permissions it needs

Apparatus provides core protocols. Projects can add domain-specific protocols
(e.g., a Bevy-specific code experiment in gregarious). Tool permissions bind
to protocols, not to the skill or project level.

### Journal

The journal is the first structure to implement because:
- It's proven its value in the research space (critical for preserving reasoning)
- It has no dependencies on unresolved naming questions (protocol catalog, etc.)
- It's the same in all three repos: `apparatus.store/journal/`, date-prefixed
  markdown files, optional same-named artifact directories
- It absorbs anything that becomes homeless during migration

**Integrity rules** (enforced by the apparatus skill):

- Journal log files are **append-only** — the skill must not allow mutation of
  existing content, only appending new entries. This is a structural constraint,
  not just convention.
- Log files support **frontmatter** (programmatically manipulated by the skill —
  e.g., status, tags, or other metadata the apparatus needs to track).
- Each log file has an optional **same-named asset directory** for artifacts.
  Asset directories are mutable while the log is the most recent chronological
  entry. Once a newer log is created, the previous log's asset directory is
  **closed** — no further mutation allowed.
- This creates a natural "current working entry" that's open for both appending
  and artifact creation, with everything older becoming immutable record.

### Future: git plumbing as storage layer

All apparatus consumers are git repos. Git's porcelain presents a
file-and-directory abstraction, but underneath it's a content-addressable
store and database (git plumbing). There may be significant utility in
using git more directly rather than treating `apparatus.store/` as a
conventional directory tree.

Potential capabilities:
- **Structural enforcement at the storage layer** — append-only semantics,
  immutability of closed entries, and mutation rules become properties of
  how data is committed, not just skill-level rules an agent is told to follow
- **Worktrees for constrained views** — present exactly the right files and
  directories for a given activity (e.g., a `/journal` worktree that commits
  to the right ref and knows what day it is), enforcing structure through
  what's visible rather than what's permitted
- **CAS properties** — content-addressable storage gives deduplication,
  integrity verification, and precise references between artifacts for free
- **Cross-repo references** — git's native object model may enable cleaner
  cross-triad references than file paths

This is a research topic for the next session. The directory-based
`apparatus.store/` plan serves dual purpose: it's the baseline implementation
we can ship immediately, and it's the requirements specification for what a
git-native approach would need to replace. Having the structure written down
in conventional terms guides the investigation of whether git plumbing can
do it better.

### Meta: research-guide.md framing limitation

`research-guide.md` is scoped to the little loop (investigation/experiment
cycle) and is injected into every session via system context. This biases
agents toward little-loop thinking, creating friction when work needs to
operate at the big-loop level. The guide was correct for stage 0 but the
project has outgrown its framing. Needs revision — but the revision depends
on the naming and structural decisions being finalized first.

## Completed work (this session)

### Task 1: Composable settings in apparatus module

The module now accepts consumer configuration via Nix options:
- `apparatus.claude.extraHooks` — merged with apparatus hooks per event type
- `apparatus.claude.allowedTools` / `deniedTools` — permissions in settings.json
- `apparatus.claude.extraSettings` — escape hatch for anything else

Skills coexistence confirmed: Nix-generated `.claude/skills/devenv/` lives
alongside git-tracked skills without conflict.

### Task 2: Integrate apparatus module into gregarious

- Gregarious imports apparatus via `git+file:///work/apparatus?ref=triad`
- Module provides claude-code, PreToolUse hook, SessionStart hook, devenv skill
- Gregarious passes permissions and plugin config via module options
- `claude-code-overlay` remains in gregarious's inputs (module references it
  from the importing project's inputs; TODO test removing when using `github:`)
- `.claude/settings.json` and `.claude/skills/devenv` added to .gitignore

### Task 3: Remove Quarto, convert .qmd to .md

- 44 .qmd files renamed to .md across all of gregarious
- One Quarto callout replaced with blockquote
- Quarto config files removed (_quarto.yml)
- Quarto and chromium removed from devenv.nix
- Quarto task commands removed from Taskfile.yml
- Investigation skill updated: CLI, templates, SKILL.md all reference .md
- Mermaid diagrams preserved as code blocks (rendered by IDE/GitHub natively)

This removes the format coupling that would have blocked investigation skill
generalization. Remaining coupling points: `gregarious:` frontmatter namespace,
`docs/investigation/` hardcoded path, project-specific tool permissions.
