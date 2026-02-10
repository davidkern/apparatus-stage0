//! Decision anchors for implementation traceability.
//!
//! This module provides zero-sized types representing design decisions.
//! Use rustdoc intra-doc links to trace implementation back to decisions:
//!
//! ```rust,ignore
//! /// Creates the namespace skeleton.
//! ///
//! /// Implements [`D008FilesystemVirtualization`].
//! pub fn create_namespace() -> Result<Namespace> {
//!     // ...
//! }
//! ```
//!
//! Each type links to the full decision document. The types only exist
//! during doc builds (`#[cfg(doc)]`) and have no runtime presence.
//!
//! For implementation choices not covered by decisions:
//!
//! ```rust,ignore
//! // implementation choice: overlayfs over raw fuse for write layer
//! ```
//!
//! ## Link paths
//!
//! Links assume this file lives at `src/decisions.rs` in the apparatus crate.
//! Decision documents are at `designs/shell/decisions/` in the repo root.

#![cfg(doc)]

/// D001: Toolchain provisioning via baked artifacts.
///
/// Apparatus provides fixed toolchains as build-time artifacts rather than
/// evaluating Nix expressions at runtime.
///
/// **Chosen**: Baked toolchains (Rust, Python+uv, C/C++ build tools, core utilities)
///
/// See [full decision](../designs/shell/decisions/001-toolchain-provisioning.md).
pub struct D001ToolchainProvisioning;

/// D002: Explicit environment rebuild.
///
/// Rebuilding the environment requires explicit user action
/// (`apparatus env rebuild`). No automatic re-evaluation on config changes.
///
/// **Chosen**: Explicit rebuild (agent safety: prevents self-sabotage via bad config)
///
/// See [full decision](../designs/shell/decisions/002-environment-rebuild.md).
pub struct D002EnvironmentRebuild;

/// D003: Store isolation (superseded by [`D008FilesystemVirtualization`]).
///
/// Original decision on how to filter the Nix store to prevent context leakage.
/// Superseded when scope expanded to include work directory virtualization.
///
/// See [full decision](../designs/shell/decisions/003-store-isolation.md).
#[deprecated(note = "superseded by D008FilesystemVirtualization")]
pub struct D003StoreIsolation;

/// D004: Package resolution via shelling out to Nix.
///
/// Apparatus requires Nix on the host. Package resolution shells out to
/// `nix build`. Store paths land in host store.
///
/// **Chosen**: Shell out to Nix (outsources evaluation complexity)
///
/// See [full decision](../designs/shell/decisions/004-package-resolution.md).
pub struct D004PackageResolution;

/// D005: Apparatus-native configuration scope.
///
/// Projects configure via `apparatus.toml` covering common needs. Baked
/// toolchains handle the base case. Extension via `--env` for full Nix power.
///
/// **Chosen**: Apparatus-native configuration (not full devenv compatibility)
///
/// See [full decision](../designs/shell/decisions/005-configuration-scope.md).
pub struct D005ConfigurationScope;

/// D006: Separate binary and environment distribution.
///
/// Apparatus binary is standalone Rust. Environments are Nix derivations in
/// a separate repo. Binary discovers environment at runtime via `nix build`.
///
/// **Chosen**: Separate binary and environments (catalog, dev ergonomics)
///
/// See [full decision](../designs/shell/decisions/006-environment-distribution.md).
pub struct D006EnvironmentDistribution;

/// D007: Work directories mounted at /work.
///
/// Work directories are remapped to `/work`, hiding host path structure.
/// Single work at `/work`, multiple at `/work/<dirname>`.
///
/// **Chosen**: Mount at /work (path isolation, practitioner/researcher separation)
///
/// See [full decision](../designs/shell/decisions/007-work-directories.md).
pub struct D007WorkDirectories;

/// D008: FUSE filesystem virtualization.
///
/// A FUSE layer virtualizes all filesystem access. Provides:
/// - Work directory strategies (passthrough, copy-on-write, hook)
/// - Store filtering to environment closure
/// - Observation capability (access patterns, overlay diffs)
///
/// **Chosen**: FUSE virtualization (solves concurrent experiment problem)
///
/// Supersedes [`D003StoreIsolation`].
///
/// See [full decision](../designs/shell/decisions/008-filesystem-virtualization.md).
pub struct D008FilesystemVirtualization;

// --- Implementation choice anchors ---
//
// For choices not covered by formal decisions, use inline comments:
//
//   // implementation choice: <brief reason>
//
// These are discoverable via grep and signal gaps in decision coverage.
