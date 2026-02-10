# Implementation Notes

Collaborative record of shell implementation work. Focused on the implementation
itself — what's being built, decisions encountered, friction points.

## Starting point

Implementation repo (`/work/apparatus/`):

- Design: `designs/shell/index.md` (editorially complete)
- Decisions: `designs/shell/decisions/001-008`
- Key experiments: 010 (namespace/fork ordering — partial, fd closure required), 011 (root remapping — confirmed)

Research repo:

- [Implementation plan](../2026-02-06-shell-design-editing/implementation-plan.md)

## Traceability

Using ZST decision anchors via rustdoc intra-doc links. The `decisions` module
provides empty structs for each design decision:

```rust
mod decisions;

/// Creates the namespace skeleton.
///
/// Implements [`decisions::D008FilesystemVirtualization`].
pub fn create_namespace() -> Result<Namespace> {
    // ...
}
```

The module is `#[cfg(doc)]` — only exists during doc builds, zero runtime cost.
Rustdoc validates that referenced decisions exist.

For choices not covered by formal decisions:
```rust
// implementation choice: <brief reason>
```

Decision anchors are in `decisions.rs` (copy to `src/decisions.rs` in implementation).

---

## Session log

(Entries below as implementation progresses)
