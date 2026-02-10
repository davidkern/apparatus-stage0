# Shell Implementation: Parallel Processes

First implementation session off the formalized shell design. Running two parallel
processes today:

## Process 1: Experimental track (researcher)

Observing how implementation-from-design works in practice. Two goals:

**Goal 1 — Scale resilience:** Test whether traceability from code back to decisions
can prevent the context collapse problem observed in gregarious. When implementation
grows past what one agent can hold in context, traces should enable targeted
understanding and incremental updates without full reimplementation.

**Goal 2 — Process capture:** Record what implementation process emerges informally.
This is the first implementation off the formalized design process; the patterns
that work become input to the knowledge store design.

The practitioner receives trace instructions but no visibility into these goals.
Observations recorded in `researcher-observations.md`.

## Process 2: Implementation track (practitioner)

Collaborative implementation of the shell, starting from the design document and
implementation plan. Both researcher and practitioner take notes, but focused on
the implementation itself — what's being built, decisions made, friction encountered.

Implementation notes in `implementation-notes.md`.

## Traceability approach

Using ZST (zero-sized type) anchors for decision tracing. The `decisions.rs` module
defines empty structs for each decision, compiled only during `cargo doc`. Implementation
code uses rustdoc intra-doc links:

```rust
/// Creates the namespace skeleton.
///
/// Implements [`decisions::D008FilesystemVirtualization`].
pub fn create_namespace() -> Result<Namespace> { ... }
```

Benefits:
- Compiler validates links exist (broken traces surface at doc build)
- Refactoring tools update references
- Standard rustdoc navigation
- Zero runtime cost

For implementation choices not covered by decisions:
```rust
// implementation choice: overlayfs over raw fuse for write layer
```

See `decisions.rs` for the full module and usage notes.

## Artifacts

| File | Purpose |
|------|---------|
| `researcher-observations.md` | Goal 1 & 2 observations, not shared with practitioner |
| `implementation-notes.md` | Collaborative implementation record |
| `decisions.rs` | ZST decision anchors for rustdoc traceability |

## References

Implementation repo (`/work/apparatus/`):

- Design document: `designs/shell/index.md`
- Decisions: `designs/shell/decisions/001-008`
- Investigation: `investigations/shell-design-assumptions/`

Research repo (this repo):

- [Implementation plan](./2026-02-06-shell-design-editing/implementation-plan.md)
