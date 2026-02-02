# Apparatus Module Unification: Implementation Plan

## Background

The apparatus devenv module (`apparatus/devenv.nix`) provides Claude Code integration for any consuming project: a PreToolUse hook that wraps Bash commands in `devenv shell`, a devenv skill with helper scripts, composable hooks and permissions, and settings.json generation. Two projects already consume it (apparatus itself, gregarious). A third (the research workspace) uses a hand-rolled setup that duplicates the same functionality with drift.

This plan unifies all three repos onto the apparatus module. After this work, the module is the single source of truth for Claude Code integration and development toolchain configuration.

### Key architectural constraint

Devenv's `flake: false` import mechanism loads `devenv.nix` from the imported input but does **not** resolve the imported project's own inputs (devenv issue #1611). The imported module receives the *consumer's* inputs via `specialArgs`. This means any `inputs.foo` reference in the module must be declared in every consumer's `devenv.yaml` — leaking implementation details across the interface boundary. The changes below eliminate all external input dependencies from the module so consumers need only declare the apparatus input itself.

### Hook merging behavior

The module defines default hooks (PreToolUse for devenv shell wrapping, SessionStart for devenv reminder). Consumer `extraHooks` are **merged with** these defaults per event type, not replacing them. Consumers only need to add their project-specific hooks.

### Design decisions

- **MCP servers are deliberately unsupported.** MCP is context-inefficient; use SKILLS instead.
- **CLAUDE.md is not module-generated.** The `.claude/CLAUDE.md` in any repo is a regular committed file. Project startup context goes through SessionStart hooks (composable via `extraHooks`).
- **`excludes = ["^external/"]` is a convention, not a configuration point.** Do not add an override option.

## Repos and branches

All work happens on `apparatus-unification` branches:

| Repo | Path | Role |
|------|------|------|
| apparatus | `/work/apparatus` | The module (producer) |
| research | `/work` | Consumer — the research workspace |
| gregarious | `/work/gregarious` | Consumer — VR/XR project (stress test) |

Order of operations: modify apparatus first, then research, then gregarious. Research must not break. Gregarious may temporarily break and be reconciled.

## What changes in apparatus (the module)

### Vendor claude-code-overlay

The module currently depends on `inputs.claude-code-overlay` to get the Claude Code CLI package. This leaks an implementation detail to consumers — they must declare this input in their `devenv.yaml`.

Vendor the derivation directly into apparatus at `nix/claude-code/` (alongside `devenv.nix`). The overlay is a thin wrapper: a `sources.json` (binary URLs + sha256 checksums per platform) and a `package.nix` (fetch, verify, wrap). The module calls `pkgs.callPackage ./nix/claude-code/package.nix {}` instead of referencing `inputs.claude-code-overlay`.

This also eliminates the `allowUnfree` requirement that the overlay forced on consumers.

The module adds the claude-code binary to `packages` so it is available on PATH in devenv shell. However, consumer `scripts.claude` definitions (which wrap the binary with isolation logic) will shadow the PATH entry. Consumers that define `scripts.claude` should reference the package directly to avoid recursion — see the research and gregarious sections below.

### Drop rust-overlay, track nixpkgs

Remove the `rust-overlay` input. Change `languages.rust` from version-pinned (1.92.0 via overlay) to unpinned (`enable = true` only), tracking whatever stable Rust ships with devenv-nixpkgs rolling (currently 1.91.1). The version pin was not a hard requirement — Bevy 0.18 MSRV is 1.89.0.

Remove `rust-overlay` from `devenv.yaml`. Remove the `packageOverrides` on clippy/rustfmt hooks (those were needed to reconcile overlay vs system Rust; without the overlay, they're unnecessary). Remove the explicit `channel`, `version`, and `components` — defaults provide everything (`nixpkgs` channel, standard components including rust-analyzer via LSP).

### Add Python as a supported language

Add `languages.python.enable = true` (tracking latest Python 3 from devenv-nixpkgs, no version pin). LSP (pyright) is enabled by default. Consumers configure uv/poetry/version as needed.

### Clean up packages list

Everything for a supported language should be set via `languages.*` options, not `packages`. Items in `packages` that can't go through language options get a comment explaining why.

- **Remove**: `cmake`, `pkg-config`, `openssl`, `zlib`, `libssh2` (were vendored build deps for git2-sys — unnecessary, see below)
- **Add**: `pkgs.libgit2` — the git2 crate dynamically links against system libgit2 when available. nixpkgs rolling provides 1.9.2, satisfying git2's ≥1.9.0 requirement. No vendored build needed.
- **Keep with comment**: `cargo-llvm-cov` — "not available as a devenv language option"
- **Keep**: `psmisc` (pstree), core utilities

### Expand git-hooks

The module takes responsibility for all standard hooks across both supported languages. Add:

| Hook | Purpose |
|------|---------|
| shellcheck | Lint shell scripts |
| ruff | Lint python |
| ruff-format | Format python |

Existing hooks (nixfmt, clippy, rustfmt) remain. All hooks get `excludes = ["^external/"]` — this is a convention, not a configuration point. Every repo uses `external/` for vendored/cloned content excluded from git and hooks.

### Drop CARGO_TARGET_DIR from enterShell

Each repo sets its own cargo target directory via `.cargo/config.toml` (Cargo-native mechanism). The module's enterShell no longer sets `CARGO_TARGET_DIR`. It retains only `APPARATUS_DEVENV_BIN` (used by the PreToolUse hook's `devenv-pretool.sh` to locate devenv).

### Add baseline permissions to settings.json

The generated `settings.json` grants: `Read`, `Write`, `WebSearch`, `WebFetch`. The PreToolUse hook handles Bash implicitly. Consumers add project-specific permissions via `apparatus.claude.allowedTools`/`deniedTools`.

### Expose claude package via module option

Add `apparatus.claude.package` as a read-only option (or internal value) so consumers can reference the vendored claude-code binary in their `scripts.claude` definitions without knowing the derivation path. This avoids the name collision between `scripts.claude` and the `claude` binary on PATH.

### Update skill docs

Update `skills/devenv/SKILL.md` and `skills/devenv/reference.md`:
- Remove references to `claude.code.*` options (the apparatus module replaces these)
- Document that consumers configure via `apparatus.claude.*`
- Note that `.claude/settings.json` is generated by the apparatus module

### Improve hook typing

Change `apparatus.claude.extraHooks` entries from `listOf anything` to typed submodules matching the Claude Code hook schema: each entry has `matcher` (string, required) and `hooks` (list of `{ type: string, command: string }`). This catches structural errors at nix eval time rather than Claude Code runtime.

## What changes in research

### Import the apparatus module

Add to `devenv.yaml`:

```yaml
inputs:
  apparatus:
    url: git+file:///work/external/apparatus?ref=apparatus-unification
    flake: false
imports:
  - apparatus
```

Remove the `claude-code-overlay` input (no longer needed — module vendors it).

### Replace claude.code with apparatus.claude

In `devenv.nix`, remove the entire `claude.code` block. Add:

```nix
apparatus.claude.extraHooks = {
  SessionStart = [
    {
      matcher = "";
      hooks = [
        {
          type = "command";
          command = "cat research-guide.md";
        }
      ];
    }
  ];
  PostToolUse = [
    {
      matcher = "Write|Edit";
      hooks = [
        {
          type = "command";
          command = "pre-commit run";
        }
      ];
    }
  ];
};
```

Remove the `claude-code-native` let-binding and the direct reference to `inputs.claude-code-overlay`. The `scripts.claude` definition should reference the module-provided package directly to avoid name collision (the module adds `claude` to PATH, but `scripts.claude` shadows it):

```nix
scripts.claude = {
  exec = ''
    exec "${config.apparatus.claude.package}/bin/claude" "$@"
  '';
};
```

This requires the module to expose the claude package via an option (e.g., `apparatus.claude.package`). See the module changes section.

### Restructure external content

Move cloned repos and reference material into `external/`:
- `reference/` → `external/reference/`
- `gregarious/` → `external/gregarious/`
- `apparatus/` → `external/apparatus/`

Update `.gitignore`: remove individual entries for `apparatus`, `gregarious`, `reference` (the existing `external` entry covers them). Update `tools/practitioner/bubble.sh` to use `APPARATUS_DIR="$DEVENV_ROOT/external/apparatus"`.

### Remove DEVENV_BIN from enterShell

The `DEVENV_BIN` env var was only used by the hand-copied `devenv-pretool.sh` (being deleted). The module's pretool script uses `APPARATUS_DEVENV_BIN` instead. Remove the `DEVENV_BIN` export from enterShell.

### Delete stale files

- `.claude/scripts/devenv-pretool.sh` (module generates this)
- `.claude/skills/devenv/` (module generates this)
- `.claude/settings.local.json` (111 ad-hoc permission rules accumulated through interactive use — replaced by module's baseline permissions for Read/Write/WebSearch/WebFetch and the PreToolUse hook's implicit Bash approval. Outer isolation is handled manually by the user until the module supports it in a future phase.)

### Clean up devenv.nix

The module now provides: coreutils, git, jq, tree, Rust toolchain, Python, claude-code binary, all git-hooks (nixfmt, clippy, rustfmt, shellcheck, ruff, ruff-format), devenv skill files, settings.json.

The research `devenv.nix` retains only:
- Research-specific packages (gh, python with pyyaml, yq-go, curl, file, gnused, gnugrep, diffutils, xxd, bubblewrap)
- The `claude` and `practitioner` scripts (referencing module-provided claude package)
- `apparatus.claude.extraHooks` (research-specific hooks)

## What changes in gregarious

### Update apparatus import

In `devenv.yaml`:
- Point `apparatus` input at `git+file:///work/external/apparatus?ref=apparatus-unification`
- Remove `claude-code-overlay` input
- Remove `rust-overlay` input
- Remove `allowUnfree` (if only needed for claude-code-overlay)

### Simplify devenv.nix

Remove from `devenv.nix`:
- `languages.rust` block (module provides it)
- `languages.python` block (module provides it)
- `git-hooks.hooks` for clippy, rustfmt, shellcheck, ruff, ruff-format (module provides them with `excludes = ["^external/"]`)
- `CARGO_TARGET_DIR` from `enterShell`
- `claude-code-native` let-binding and `inputs.claude-code-overlay` reference

Update `scripts.claude` to reference the module-provided package (same pattern as research).

Retain:
- `git-hooks.hooks.headache` (project-specific, not in module)
- `apparatus.claude.*` configuration (allowedTools, deniedTools, extraSettings)
- Project-specific packages, enterShell (LD_LIBRARY_PATH, PYTHONPATH), scripts (bubble, claude)
- `env.BUBBLE_NETWORK`

### Add .cargo/config.toml

Create `.cargo/config.toml`:
```toml
[build]
target-dir = "../.devenv/state/gregarious/rust/target"
```

## Verification

### Research (must pass)

- [ ] `devenv shell` succeeds
- [ ] `.claude/settings.json` contains PreToolUse hook
- [ ] `.claude/skills/devenv/` contains module-generated files
- [ ] `APPARATUS_DEVENV_BIN` is set in shell
- [ ] `practitioner echo hello` works
- [ ] Session restart loads research-guide.md and has pretool hook active

### Gregarious (best effort)

- [ ] `devenv shell` succeeds
- [ ] git-hooks merge cleanly (module hooks + headache)
- [ ] `bubble echo hello` works
- [ ] `claude` script launches inside bubble

## Consumer interface

After this work, any project adopts apparatus by adding to `devenv.yaml`:

```yaml
inputs:
  apparatus:
    url: git+file:///path/to/apparatus
    flake: false
imports:
  - apparatus
```

No other inputs required. The module provides everything.

After modifying `devenv.yaml` in any repo (adding/removing inputs), run `devenv update` to regenerate the lock file.
