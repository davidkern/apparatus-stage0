# Shell Implementation Plan

Informal implementation planning extracted from the shell design document.
This is a working document, not a formal apparatus artifact.

## Technical foundation

### Crate dependencies

| Crate | Purpose |
|-------|---------|
| `nix` | Safe wrappers for `unshare()`, `clone()`, `setns()`, `pivot_root()` |
| `sys-mount` | Ergonomic mount operations, `MountFlags::BIND`, auto-unmount on drop |
| `fuser` | FUSE filesystem implementation (to be evaluated) |
| `postcard` | Binary serialization for socket protocol |
| `postcard-schema` | Schema derivation for self-describing protocol |

### Reference patterns

The `unshare` crate ([github.com/tailhook/unshare](https://github.com/tailhook/unshare))
provides patterns for `Command` + namespace + UID mapping. Unmaintained but
MIT/Apache-2.0 licensed; patterns are extractable.

### System requirements

| Requirement | Minimum | Reason | Source |
|-------------|---------|--------|--------|
| Linux kernel | 5.12 | `mount_setattr(2)` required for read-only bind mount enforcement in user namespaces | [experiment 004](../../../apparatus/investigations/shell-design-assumptions/experiments/004-pivot-root/index.md) |

## Milestones

Each milestone produces a testable artifact. Later milestones build on
earlier ones.

### M0: Namespace skeleton

Minimal `apparatus shell` that creates a user + mount namespace with
a default-deny mount table and runs bash inside. No environment
resolution, no control socket, no state.

**Scope:**
- User + mount namespace via `unshare(CLONE_NEWUSER | CLONE_NEWNS)`
- UID/GID identity mapping via `/proc/<pid>/uid_map`
- Mount table: `/nix/store` (read-only), `/dev`, `/proc`, minimal `/etc`,
  current directory at `/work`

**Tests:**
- [ ] Process inside can read `/nix/store`
- [ ] Process inside can write to `/work`
- [ ] Process inside cannot see host paths outside mount table
- [ ] Process outside (parent) can observe child
- [ ] Verify on target systems from investigation 1

**Blocked by:** Experiments 10, 11 (namespace/fork ordering, root remapping)

### M1: Environment resolution

Supervisor resolves environment via `nix build`.

**Scope:**
- `--env <ref>` flag accepting flake reference
- Default environment: `github:apparatus/environments#default`
- Closure computation via `nix-store --query --requisites`

**Tests:**
- [ ] `apparatus shell --env .#test` builds and uses local environment
- [ ] Default environment fetches from remote
- [ ] Invalid environment reference produces clear error

### M2: Supervisor and control socket

Supervisor process managing the namespace with control socket.

**Scope:**
- Supervisor process outside namespace
- Control socket at `/run/apparatus/control.sock`
- Apparatus binary bind-mounted at FHS paths (`/bin/sh`, `/usr/bin/env`)
- `argv[0]` dispatch mechanism
- Protocol handshake with schema exchange

**Tests:**
- [ ] Child can query supervisor for environment state
- [ ] FHS shim dispatch resolves tools correctly
- [ ] Profile symlink points to correct store path

### M3: FUSE virtualization

FUSE layer providing filtered store view and virtualized work directories.

**Scope:**
- Store filtering by closure membership
- Work directory write strategies (passthrough, copy-on-write)
- `--work` and `--write-strategy` flags

**Tests:**
- [ ] Store paths outside closure are not visible
- [ ] Copy-on-write captures changes in state
- [ ] Passthrough writes directly to host
- [ ] Multiple `--work` directories appear under `/work/<dirname>`

### M4: State management

Full three-input model with ephemeral and persistent state.

**Scope:**
- Ephemeral state (tmpdir-backed, default)
- Named persistent state (`--state <name>`)
- State directory layout: `overlay/`, `data/`
- Home directory initialization in overlay
- `--config` flag for `apparatus.toml`

**Tests:**
- [ ] Ephemeral state destroyed on exit
- [ ] Named state persists across sessions
- [ ] Home directory appears at `/home/user`
- [ ] Config modulates environment (additional packages)

### M5: Environment rebuild

Dynamic environment updates without exiting namespace.

**Scope:**
- `apparatus env rebuild` command
- `RebuildRequest`/`RebuildResponse` protocol messages
- Profile symlink update
- Generation counter increment
- Environment propagation via dispatch mechanism

**Tests:**
- [ ] Modify `apparatus.toml`, rebuild, verify new packages available
- [ ] Generation counter increments
- [ ] New shell gets updated environment

### M6: Nesting

Nested namespaces with supervisor chain.

**Scope:**
- Child namespace creation inside parent
- Supervisor B proxies through supervisor A
- Independent inputs, socket, state per level
- Fd inheritance for supervisor chain

**Tests:**
- [ ] Two levels of nesting work
- [ ] Inner process cannot see outer process's home or state
- [ ] Inner rebuild request propagates through supervisor chain
- [ ] Inner namespace cannot reach outer supervisor's socket

### Future milestones

Not scoped for initial implementation:

- `apparatus state` management commands (create, list, rm)
- `apparatus env add` convenience command
- Observation tooling (overlay diffs, access pattern analysis)
- `/dev` policy: minimal devtmpfs with selective device enablement
- Network isolation (`CLONE_NEWNET`) and HTTP proxy policy
- Resource limits per namespace

## Open technical questions

These need resolution before or during implementation:

1. **Namespace/fork ordering** (Experiment 10) — What is the correct
   ordering of namespace creation, FUSE setup, and fork?

2. **Environment root remapping** (Experiment 11) — How does the
   environment store path get remapped to appear as `/` inside?

3. **FUSE mount strategy** — Single mount at `/` vs. multiple focused
   mounts at `/nix/store`, `/work`, etc.?

4. **Observation modes** — Overlay diff, access log, or event stream?
   Implementation can defer, but architecture should support all.

## References

- Design document: `apparatus/designs/shell/index.md`
- Decisions: `apparatus/designs/shell/decisions/`
- Investigation: `apparatus/investigations/shell-design-assumptions/`
