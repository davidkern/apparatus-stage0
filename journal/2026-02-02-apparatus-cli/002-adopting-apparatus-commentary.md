# Adopting the Apparatus Devenv Module: Unification Plan

## Goal

Unify the three repos (research, gregarious, apparatus) so that common Claude Code integration — the devenv skill, PreToolUse hook, SessionStart hook, and settings.json generation — is defined once in the apparatus devenv module and configured per-consumer via its options. Each repo retains its own isolation strategy during this work; unifying isolation is a later effort.

## Current state

Three repos, three independent realizations of the same conceptual space:

| Concern | Research | Gregarious | Apparatus |
|---------|----------|------------|-----------|
| Settings generation | `claude.code` devenv option | apparatus module (`files`) | apparatus module (`files`) |
| PreToolUse hook | Script exists, **not wired** | Module-provided, working | Module-provided, working |
| SessionStart | `cat research-guide.md` | Module default (devenv reminder) | Module default (devenv reminder) |
| PostToolUse | `pre-commit run` on Edit/Write | None | None |
| Devenv skill source | Hand-copied, uses `$DEVENV_BIN` | Module-generated, `$APPARATUS_DEVENV_BIN` | Module-generated, `$APPARATUS_DEVENV_BIN` |
| Isolation | None (runs as user) | bubblewrap + network control | Entered via practitioner bubble |
| Permissions | 111 ad-hoc rules (settings.local.json) | Static allow/deny via module | Minimal (practitioner template) |
| claude script | Direct exec (no isolation) | `BUBBLE_NETWORK=allow bubble claude` | N/A (entered via practitioner) |

Gregarious already imports the apparatus module and configures it via `apparatus.claude.*`. Research does not — it uses `claude.code` (a different devenv option) and hand-copied skill files. The apparatus repo self-hosts the module.

## Why the isolation strategies can coexist

The module operates at the **file layer** (settings.json, skill files, env vars). Isolation operates at the **process layer** (namespaces, bind mounts, network policy, bubble home templates). These compose without conflict:

- The module generates project-level settings; bubble templates provide user-level settings. Claude Code merges both.
- Research's `settings.local.json` (111 ad-hoc rules) coexists with module-generated `settings.json` — local overrides project.
- The PreToolUse hook wraps Bash in `devenv shell`. In unconfined research, this just adds the devenv PATH. Inside a bubble, devenv is available via bind-mounted nix store.
- When research claude calls `practitioner`, the outer devenv shell ensures `practitioner` is in PATH; the inner bubble runs through the apparatus devenv shell. Double-wrapping composes.

## Plan

### Step 1: Verify import mechanism

Determine how the research repo imports the apparatus module. Gregarious already does this — examine its `devenv.yaml` to understand the import pattern. The module references `inputs.claude-code-overlay` and `inputs.claude-code-overlay.packages` — the research repo needs this input available too.

### Step 2: Atomic settings swap (research repo)

In a single edit to `/work/devenv.nix`:

1. Import the apparatus module.
2. Remove the `claude.code` block (which generates settings.json its own way).
3. Add `apparatus.claude.extraHooks` for research-specific hooks:
   - `SessionStart`: `cat research-guide.md`
   - `PostToolUse`: `pre-commit run` on Write|Edit
4. Keep the `claude` and `practitioner` scripts as-is (isolation unchanged).
5. Keep `enterShell` with `DEVENV_BIN` — but note the module also sets `APPARATUS_DEVENV_BIN` (both will be available; the pretool script uses the latter).

The module's `files` option will generate `.claude/settings.json` and `.claude/skills/devenv/*`, replacing the hand-copied versions.

### Step 3: Remove stale hand-copied files (research repo)

Delete files that the module now generates:
- `.claude/scripts/devenv-pretool.sh`
- `.claude/skills/devenv/` (entire directory)

These were hand-copied from an earlier version of the apparatus skill and used `$DEVENV_BIN` instead of `$APPARATUS_DEVENV_BIN`.

### Step 4: Test research environment

Rebuild devenv and verify:
- [ ] `devenv shell` succeeds (module imports resolve)
- [ ] `.claude/settings.json` exists and contains PreToolUse hook
- [ ] `.claude/skills/devenv/` exists with module-generated files
- [ ] `APPARATUS_DEVENV_BIN` is set in shell
- [ ] `practitioner echo hello` still works (isolation not broken)
- [ ] Session restart picks up new settings (pretool hook active, research-guide.md loads)

### Step 5: Test gregarious compatibility (gregarious branch)

Update gregarious to point at the modified apparatus module (if the import mechanism uses a pinned ref, update it). Verify:
- [ ] `devenv shell` succeeds
- [ ] The git-hooks merge works (module's clippy/rustfmt packageOverrides vs gregarious's own clippy/rustfmt)
- [ ] `bubble echo hello` still works
- [ ] `claude` script still launches inside bubble

### Step 6: Commit and merge

Once all three repos are stable on `apparatus-unification` branches, merge to main.

## Open questions

### 1. Import mechanism — resolved

Gregarious imports apparatus via `devenv.yaml`:

```yaml
inputs:
  apparatus:
    url: git+file:///work/apparatus?ref=triad
    flake: false
imports:
  - apparatus
```

The `flake: false` input points at the apparatus git repo (a specific ref). `imports: [apparatus]` tells devenv to load `devenv.nix` from that input as a module. The ref pin (`?ref=triad`) controls which version of apparatus the consumer uses.

For the research repo, the same pattern applies:

```yaml
inputs:
  apparatus:
    url: git+file:///work/apparatus?ref=apparatus-unification
    flake: false
imports:
  - apparatus
```

### 2. Input sharing — resolved

Inputs do **not** propagate through `flake: false` imports. The consumer must redeclare any inputs the module references. This is a devenv/flake limitation (see devenv issue #1611). The `follows` mechanism doesn't help — it still requires listing each input name, and needs `flake: true` which requires a proper `flake.nix` that devenv doesn't generate.

The principled fix is to eliminate leaked dependencies from the module interface entirely:

- **`claude-code-overlay`**: Vendor into apparatus. The overlay is a thin wrapper — `package.nix` + `sources.json` (URLs and sha256 checksums per platform). Inline the derivation in the module. Consumers no longer need this input. This also eliminates the `allowUnfree` requirement that the overlay forced on consumers.
- **`rust-overlay`**: Drop it. The version pin (1.92.0) was not a hard requirement — Bevy 0.18 MSRV is 1.89.0, devenv-nixpkgs rolling ships 1.91.1. The module uses `languages.rust.enable = true` without a version pin, tracking latest stable from nixpkgs.
- **Python**: Same approach — `languages.python.enable = true`, tracking latest Python 3 from devenv-nixpkgs. No overlay needed.

After these changes, the consumer interface is clean:

```yaml
inputs:
  apparatus:
    url: git+file:///work/apparatus
    flake: false
imports:
  - apparatus
```

No leaked dependencies. No `allowUnfree`. No overlays.

### 3. Relationship between apparatus module and devenv's `claude.code.*` — resolved

Devenv provides built-in `claude.code.*` options (hooks, settings, permissions, mcpServers) as a thin opinionated wrapper. The apparatus module deliberately replaces this — it disables `claude.code` and generates `.claude/settings.json` directly via the `files` option. This is not a workaround; it's a design decision to own the full settings surface.

Adopting the apparatus module means not using `claude.code.*` at all. The research repo currently uses `claude.code.hooks` for its SessionStart hook — this must be removed and replaced with `apparatus.claude.extraHooks`.

**Action item:** The devenv skill's `reference.md` documents `claude.code.*` options as available, and `SKILL.md` attributes settings.json generation to `claude.code.settings`. Both should be updated to reflect that the apparatus module owns settings generation. Consumers configure via `apparatus.claude.*`, not `claude.code.*`.

### 4. git-hooks ownership — resolved

The apparatus module takes responsibility for both Rust and Python as the two supported implementation languages. The module provides all standard hooks for both:

| Hook | Purpose | Currently in module |
|------|---------|-------------------|
| nixfmt | Format nix | Yes |
| clippy | Lint rust | Yes (with packageOverrides) |
| rustfmt | Format rust | Yes (with packageOverrides) |
| shellcheck | Lint shell | **Add** |
| ruff | Lint python | **Add** |
| ruff-format | Format python | **Add** |

The module must also enable `languages.python` alongside the existing `languages.rust`.

**Not in module:** `headache` (license headers) stays in gregarious only — it's project-specific, not language-level.

After this change, gregarious removes its own clippy/rustfmt/shellcheck/ruff/ruff-format hook definitions and relies on the module. Gregarious retains only headache.

**Excludes convention:** All repos adopt `external/` as the standard directory for cloned repos, vendored code, and other content excluded from git and git-hooks. The module provides `excludes = ["^external/"]` on all hooks. No override mechanism — this is a convention, not a configuration point.

- **Gregarious**: already uses `external/` for vendored libhsplasma. Remove per-hook excludes from its devenv.nix (module provides them).
- **Research**: move `reference/`, `gregarious/`, and `apparatus/` into `external/`. Update `.gitignore` accordingly.
- **Apparatus**: no external content currently, but the exclude is harmless.

### 5. enterShell concatenation / CARGO_TARGET_DIR — resolved

`CARGO_TARGET_DIR` is now set via `.cargo/config.toml` in each repo (Cargo-native mechanism) rather than enterShell env vars. This eliminates the concatenation ordering problem entirely — each repo owns its config file, no module conflict.

Convention: `.cargo/config.toml` with `target-dir` pointing to `.devenv/state/<project>/target`. The module's enterShell drops the `CARGO_TARGET_DIR` line. Gregarious should adopt the same pattern.

The module's enterShell retains only `APPARATUS_DEVENV_BIN` (needed by the pretool hook).

### 6. CLAUDE.md and SessionStart — resolved

The module does not generate CLAUDE.md — it was incorrectly listed as module-generated in earlier analysis. The `.claude/CLAUDE.md` in the apparatus repo is a regular committed file.

Project-specific startup context should go through SessionStart hooks, which are composable via `extraHooks`. Each consumer adds its own. CLAUDE.md files in individual repos are a separate concern managed by the repo, not the module.

### 7. Module capability gaps vs devenv `claude.code.*` — resolved

The apparatus module deliberately replaces devenv's `claude.code.*`. Gap disposition:

- **MCP servers**: Deliberately unsupported. MCP is context-inefficient; use SKILLS instead.
- **Hook typing**: The module uses `listOf anything` for hook entries. Adopting typed entries (command + optional matcher) from devenv's approach would catch structural errors at eval time. **Action: improve module hook typing.**
- **Hook merging with defaults**: Already implemented — the module's SessionStart (devenv reminder) and PreToolUse (devenv-pretool.sh) are defaults that merge with consumer `extraHooks`.
- **Permissions**: The allowedTools/deniedTools split will evolve into an isolation profile facility in the future. Adequate for now.
- **CLAUDE.md**: Not module-managed (see question 6). Project startup context goes through SessionStart hooks.

### 8. Permissions — resolved

The module's generated `settings.json` grants baseline permissions: `Read`, `Write`, `WebSearch`, `WebFetch`. The PreToolUse hook handles Bash (wraps in devenv shell, which implicitly approves it). Consumers can add project-specific permissions via `apparatus.claude.allowedTools`/`deniedTools`.

Research's `settings.local.json` (111 ad-hoc rules) is deleted as part of this work. Outer isolation (bubble) is handled manually by the user until the module supports it in a future phase.

## Out of scope

- **Isolation unification.** Making the module aware of bubbles, the claude/shell/enter script concepts, permission templates. This is a subsequent effort.
- **CLI implementation.** Phases 1-2 of the apparatus CLI. We return to this after merging the unification branches.

## Context

Conversation history prior to this plan is in `002-adopting-apparatus-in-research-space.md` (committed at `736e4f6`). The broader CLI implementation context is in `001-implementation-plan.md` and `001-implementation-notes.md`.
