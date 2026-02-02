# Implementation notes

Running commentary on the first dev-quality apparatus CLI build. For context on the design decisions and scope, see:

- `journal/2026-02-01-git-as-database/design/006 - design.md` — full specification (12 sections, 16 unresolved questions)
- `journal/2026-02-01-git-as-database/design/006 - notes.md` — revision commentary (16 items, including two breaking changes identified post-design)
- `journal/2026-02-01-git-as-database/design/007 - implementation scope.md` — phased build plan with simplifying assumptions
- `journal/2026-02-01-git-as-database/design/008 - reflection.md` — end-of-day reflection on the design process and observations about corpus structure

## Strategy

We're using a delegated implementation model: this notes file tracks the researcher's running commentary and meta-observations, while the plan document (`001-implementation-plan.md`) is self-contained enough for fresh agents to pick up and execute implementation work. This separation is itself an informal experiment in whether we can decompose implementation into plannable, delegatable units — a pattern the apparatus should eventually formalize.

## Key simplifying assumptions (from 007)

Repeated here for quick reference — these are assumptions we know are wrong but accept to reduce scope:

1. **Single writer.** No concurrent mutations. Bare `update-ref` instead of CAS with `verify`.
2. **Low object count.** Hundreds, not 300k. JSON index with sequential scan.
3. **Error on conflict.** `sync push` fails on non-fast-forward. No merge, no fork detection.
4. **Canonical JSON (RFC 8785).** `serde_json_canonicalizer` — compact, sorted keys, normalized numbers.

The design accommodates removing all four without reworking existing features.

## Notes

### Session start

Setting up the implementation plan. The phased dependency graph from 007 gives us a clear build order — Phase 1 (foundation) through Phase 5 (design + citations) is the critical path, with Phases 6-8 as independent extensions.

The first question to resolve for the plan document: how much of the 006 specification to inline vs. reference. Fresh agents need enough context to implement correctly but shouldn't need to read 600 lines of design spec. The plan should distill the specification into implementation-ready instructions per phase. **Resolved**: inlined data model, function signatures, and acceptance criteria per phase into the plan document.

### Devenv setup

Added Rust toolchain and development infrastructure to `apparatus/devenv.nix`:

- **Rust 1.92.0** (stable) via `languages.rust` — required adding `rust-overlay` input to `devenv.yaml`
- **Git hooks**: clippy + rustfmt (pre-commit) alongside existing nixfmt
- **Build deps for git2 crate**: cmake, pkg-config, openssl, zlib, libssh2 (vendored libgit2 compilation)
- **Dev utilities**: tree (added), coreutils (explicit), jq and git (already present)
- **CARGO_TARGET_DIR**: set to `.devenv/state/apparatus/target` to keep build artifacts out of source tree (matches gregarious pattern)

Verified through both `devenv shell` and `practitioner` sandbox. ~~Note: `CARGO_TARGET_DIR` is empty in the practitioner sandbox (enterShell doesn't run), so sandboxed agents will use default `target/`.~~ **Resolved**: practitioner now runs through `devenv shell`, so `CARGO_TARGET_DIR` is set correctly.

### Canonical JSON serialization

Chose `serde_json_canonicalizer` (RFC 8785) over `canonical_json`. RFC 8785 is an actual standard, the crate was recently updated (v0.3.1), and has a clean drop-in API matching `serde_json`. Compact output; pipe through `jq` for human reading. `canonical_json` pulls in `regex` and `hex` for unclear reasons.

### Git tree inspection patterns

Added a section to the plan documenting how to use standard unix tools against the bare git repo store. Five patterns: `ls-tree`, `git show` + `jq`, `git archive` materialization, `for-each-ref`, and `git diff`. This primes implementation agents toward using these tools for debugging and validation, and reduces the pressure to add pretty-printing to the CLI itself early on.

### Process: using `practitioner` for apparatus repo operations

From the research repo context, run apparatus repo commands via `practitioner <command>` rather than `cd /work/apparatus && ...`. The practitioner script runs commands inside the apparatus directory through a bubblewrap sandbox with the apparatus devenv shell. This avoids wrong-directory mistakes (shell state doesn't persist between tool calls) and ensures the command gets the apparatus devenv environment (Rust toolchain, etc.). Example: `practitioner git status`, `practitioner cargo build`.

### Git hooks: compiler version mismatch — resolved

The devenv `git-hooks.hooks` (clippy, rustfmt) run via pre-commit, which generates a `.pre-commit-config.yaml` with hardcoded nix store paths to tool binaries. These defaulted to system Rust (1.91.1, from `pkgs.clippy`/`pkgs.rustfmt`) rather than the rust-overlay toolchain (1.92.0). The cached `CARGO_TARGET_DIR` artifacts from 1.92.0 builds were then unreadable by the 1.91.1 hooks.

**Fix**: `packageOverrides` on the clippy and rustfmt hooks, pointing at `config.languages.rust.toolchainPackage` (the monolithic derivation with sysroot). Using the individual `toolchain.clippy`/`toolchain.cargo` attributes failed with "can't find crate for `std`" — the sysroot isn't included when components are referenced individually. The aggregate `toolchainPackage` includes everything. Commit `3f12d82`.

### Practitioner script fix — resolved

Identified that the practitioner script was using a stale devenv profile (resolved at bubble construction time from `.devenv/profile` symlink). Fixed by wrapping commands in `devenv shell -q` inside the bubble, matching the pretool hook pattern. Now changes to `devenv.nix` are picked up immediately. Commit `480f887` in research repo.

### apparatus.md — the tension

The process document (`apparatus.md`) in the apparatus repo is the aspirational specification from bootstrap experiments. It specifies the wrong thing in important ways (process-as-document rather than process-as-tool), but it also sets the pattern of having design decisions and experiments alongside implementation. We're keeping it for now — it's not blocking, and we need to grow into a version of it rather than remove the aspiration. The Rust CLI is the beginning of that growth. Open question: at what point does the CLI's behavior become the authoritative specification, making apparatus.md either redundant or in need of rewriting as the CLI's own design documentation?
