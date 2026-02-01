# Triad design investigation notes

Time-boxed: ~1 hour starting now (about 9pm PT).

## What we know

### Current state of each project

**apparatus** (branch: triad, main at d1404919)
- Devenv module with Claude integration
- PreToolUse hook wraps Bash commands in devenv shell
- SessionStart hook with nix-shell hint
- Devenv skill: search packages, search options, show option values
- File generation pipeline: Nix generates .claude/ directory
- apparatus.md set aside (wrong loop)

**apparatus-stage0** (branch: triad)
- Research space with journal, status, experiments, research-guide
- Uses apparatus devenv module
- No investigation skill
- Structures are proto-apparatus (informal versions of what the apparatus should provide)

**gregarious** (branch: triad)
- Rust/Bevy 0.18 VR/XR project rendering Plasma game assets
- Own devenv.nix (does NOT use apparatus module): Rust 1.92, Python 3.12, cmake, Tracy, graphics stack
- Investigation skill with Python CLI helpers, Quarto format, status/confidence tracking
- developing-bevy skill (domain-specific)
- tmux skill (interactive debugging)
- Active investigation: gpu-structure
- Pre-commit hooks: clippy, rustfmt, ruff, shellcheck, headache

### Natural connection points

| Component | From | To | Status |
|---|---|---|---|
| devenv module | apparatus | gregarious | Not connected (gregarious has own setup) |
| devenv skill | apparatus | gregarious | Not connected |
| investigation skill | gregarious | apparatus | Not connected (skill only lives in gregarious) |
| investigation skill | apparatus | research space | Not connected |

### Key design decision pending

The investigation skill in gregarious uses Quarto format. The research space uses
GitHub-flavored markdown. The apparatus needs to support both (or be format-agnostic).
Need to understand how tightly coupled the skill is to Quarto before deciding how to
generalize.

## Exploration log

### Investigation skill in gregarious

Read the full SKILL.md (386 lines). Substantially more mature than expected.

**Generic core** (reusable):
- Research → Plan Experiment → Execute → Evaluate loop
- Problem statement + evaluation criteria framing
- Confidence levels based on evidence quality (high/medium/low)
- Status tracking (researching → experimenting → complete → abandoned)
- Blocking rules with validity constraints
- Proportionality principle (effort matches decision importance)
- Scope assessment (local/system/architectural × reversibility)
- Completion rules: min 1 research + 1 experiment, recommendation addresses criteria
- Evidence rules: experiments must be executed, not just analyzed (same rule we
  derived independently in our experiments)
- Output is recommendations, not implementations

**Gregarious-specific coupling**:
- File format: Quarto (.qmd), not Markdown
- Frontmatter namespace: `gregarious:` prefix on all metadata fields
- Directory location: hardcoded `docs/investigation/<topic>/`
- Tool permissions: cargo, python, task, rustc (project-specific)
- Experiment implementation: standalone Rust crates or Python scripts
- Lint checks: ruff for Python, cargo clippy for Rust
- References a "Design skill" that consumes investigation output
- Python CLI (`python -m investigate`) with subcommands: init, set-problem,
  add-criterion, add-research, add-experiment, record-finding, record-result,
  set-recommendation, add-question, complete, status, list

**Key observation**: The generic core is exactly what we independently derived
through our experiments on apparatus.md — evidence rules, proportionality,
experiment validity. We arrived at the same concepts from two directions.
The difference: gregarious's skill is oriented around the VERB (go investigate),
while apparatus.md was oriented around the NOUNS (decisions, assumptions).

### Module import mechanism

devenv.yaml supports several import patterns. For our case:

**Local development** (all repos side by side under /work/):
```yaml
# In gregarious/devenv.yaml
inputs:
  apparatus:
    url: path:../apparatus
    flake: false
imports:
  - apparatus
```

**Production** (separate repos):
```yaml
inputs:
  apparatus:
    url: github:owner/apparatus/branch-name
    flake: false
imports:
  - apparatus
```

Key detail: `flake: false` is required since apparatus is not a flake.

The apparatus module references `inputs.claude-code-overlay` for the claude-code
package. Gregarious already has this exact input name defined, so the reference
resolves correctly when the module is imported. No refactoring needed.

**Current state**: Neither the research space nor gregarious imports the apparatus
module. The apparatus devenv.nix both defines and self-enables the module. This
will be the first real external integration.

**Note**: the research space also does NOT currently use the apparatus module
via devenv import — it has its own independent devenv.nix. Apparatus is a nested
git repo within the research space but the devenv environments are separate.

**Resolved**: `path:` scheme doesn't work for imports (not copied to Nix store,
string interpolation fails). Relative `../` doesn't work (devenv blocks imports
outside the git repo boundary). `git+file:///path?ref=branch` works — it fetches
from the local git repo into the Nix store. For production: `github:owner/repo`.

**Note**: `git+file:` fetches committed state. Changes to the apparatus module
must be committed on the referenced branch before the consumer sees them.

### Gregarious integration results

Integration successful. Key findings:

- Apparatus module composes with gregarious's complex devenv.nix without conflict
- Settings.json correctly merges: apparatus hooks + gregarious permissions + plugins
- PreToolUse hook path correctly resolves to gregarious's root (`config.devenv.root`)
- Devenv skill files (Nix-generated symlinks) coexist with git-tracked skills
  (bevy, investigate, tmux) in `.claude/skills/`
- `claude-code-overlay` input must remain in consumer's devenv.yaml (module uses
  `inputs.claude-code-overlay` which resolves from the importing project's inputs).
  Apparatus can't carry this dependency via `git+file:` import — the consumer
  provides it. This is acceptable; the dependency is explicit and both projects
  already have it.
- Consumer must gitignore `.claude/settings.json` and `.claude/skills/devenv`
  (Nix-generated, conflicts with git-tracked files)
- Existing `.claude/settings.json` must be removed from disk before devenv can
  generate its replacement (conflict detection)

### Investigation skill format coupling analysis

Deep read of the entire Python module (7 files), 3 Jinja2 templates, SKILL.md,
and the active gpu-structure investigation.

**The skill is 95% format-agnostic.** The only real Quarto dependency is a single
callout syntax (`:::{.callout-note}`) in `index_body.qmd.j2`. Everything else
is standard Markdown with YAML frontmatter.

**What would change to switch from .qmd to .md:**

Code changes (string replacements):
- `cli.py`: 3 lines — hardcoded `.qmd` extensions for research and experiment files
- `core.py`: 2 lines — `index.qmd` path references
- `templates.py`: 3 lines — template filename references
- `test_core.py`: 2 lines — test file extensions

Template changes:
- Rename 3 template files: `*.qmd.j2` → `*.md.j2`
- Replace callout syntax in `index_body` template with blockquote or bold
- Update `.qmd` in link paths within templates (2 lines)

Documentation:
- SKILL.md: ~15-20 `.qmd` references to update

Existing investigations:
- Rename ~5 files in `docs/investigation/gpu-structure/`

**What does NOT change:**
- YAML frontmatter (format-agnostic)
- `gregarious:` namespace (custom metadata, not Quarto)
- All standard Markdown content (tables, headers, lists, code blocks)
- Python Path logic (works with any extension)
- Jinja2 rendering (works with any file extension)
- Frontmatter parsing library (format-agnostic)

**The `gregarious:` frontmatter namespace** is the other coupling point for
generalization. It's used in every investigation file's frontmatter. To make
the skill project-agnostic, this would need to become configurable (e.g.,
`apparatus:` or project-specific).

**`docs/investigation/` path** is hardcoded in `core.py` via
`get_investigation_path()`. Would need to be configurable for projects that
want investigations elsewhere.

**Tool permissions** in SKILL.md (cargo, python, task, rustc) are
gregarious-specific. A generic skill would need project-configurable
tool permissions.

**Risk assessment: switching gregarious from .qmd to .md**
- Low technical risk — changes are mechanical string replacements
- One design decision: how to replace the callout syntax (blockquote is simplest)
- The active gpu-structure investigation needs its files renamed
- Gregarious uses Quarto for OTHER docs (design docs, roadmap) — those stay .qmd
- Only investigation files switch to .md
