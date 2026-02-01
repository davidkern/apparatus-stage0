# Triad design plan

## Task list

- [x] Determine how gregarious references the apparatus module → `git+file:` for local dev; `github:owner/apparatus` for production. `path:` doesn't work (not copied to store). Relative `../` doesn't work (can't import outside git repo).
- [x] Add composable settings support to apparatus module (extraHooks, allowedTools, deniedTools, extraSettings)
- [x] Integrate apparatus module into gregarious devenv.nix
- [x] Verify: devenv skill, PreToolUse hook, settings merge all work in gregarious
- [ ] (deferred) Integrate apparatus module into research space

## Task 1: Composable settings in apparatus module

### Problem

The apparatus module generates a complete `.claude/settings.json` containing
only its own hooks. Consuming projects need to add their own configuration:

- **Gregarious** has permission rules (allowed/denied gh commands, plugins)
  and will have project-specific hooks
- The Nix `files` attribute replaces the entire file — no merge

### Approach (Option B)

The module accepts additional configuration as Nix options and merges
everything into a single generated settings.json. This is standard Nix
module composition.

New options needed:
```nix
apparatus.claude.extraHooks       # additional hook entries (SessionStart, PreToolUse, etc.)
apparatus.claude.permissions      # allowedTools, deniedTools, etc.
apparatus.claude.extraSettings    # escape hatch for anything else
```

The module deep-merges its own hooks with extraHooks, adds permissions,
and generates the final file.

Skills coexistence: the module generates `.claude/skills/devenv/` via Nix
files. Gregarious's skills (investigate, developing-bevy, tmux) are regular
git-tracked files in `.claude/skills/`. These are separate directories so
they should coexist — but need to verify devenv's `files` attribute doesn't
claim the parent directory.

## Task 2: Integrate apparatus module into gregarious

### Prerequisite

Task 1 (composable settings) and the module reference question.

### What this means concretely

Gregarious's devenv.nix currently:
- Installs claude-code directly from the overlay
- Has no devenv management skill
- Has no PreToolUse hook for automatic devenv shell wrapping
- Manages all Claude configuration manually

After integration:
- Gregarious imports the apparatus devenv module
- The module provides claude-code, the PreToolUse hook, the devenv skill
- Gregarious retains full control of everything else (Rust, Python, graphics
  stack, domain skills, pre-commit hooks, etc.)
- Gregarious passes its permissions and any extra hooks via the new options
- The module composes with gregarious's existing configuration rather than
  replacing it

### Open questions

- Does the apparatus module's claude-code package conflict with gregarious's
  direct import of the overlay? Probably needs the module to be the sole
  provider, and gregarious removes its direct reference.
- Gregarious has three skills (investigate, developing-bevy, tmux) that are
  NOT managed by the apparatus module. The module's file generation must not
  clobber them.

### Not in scope

- Moving the investigation skill into apparatus (future task)
- Integrating apparatus module into the research space (deferred until we
  validate the gregarious integration)
- Any changes to the investigation skill itself
