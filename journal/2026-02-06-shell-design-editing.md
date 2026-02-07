# Shell Design Document Editing

Completed editorial restructuring of the shell design document with
Claude (Opus 4.5) as design draft editor. This was session 5 of the
editing process, following sessions 1-4 which restructured Background,
Problem Statement, Architecture, Inputs, and Structure.

## Work completed

### Mechanism section restructuring

The original Mechanisms section was an "overview that defers" anti-pattern:
brief introductions ending with "see X section for details." Dissolved it
into dedicated peer sections:

- **Supervisor** — startup sequence, socket introduction, protocol overview,
  namespace detection. Added experiment placeholders (10, 11) for technical
  questions about namespace/fork ordering and environment root remapping.

- **FUSE Layer** — path routing with flowchart, store filtering, overlay
  semantics, observation capabilities. Expanded the observation story.

### Section deletions

- **Mechanisms** — dissolved into Supervisor and FUSE Layer
- **Control Protocol** — redundant with Supervisor and new Protocol
  Specification appendix

### New appendix

- **Appendix E: Protocol Specification** — message catalog and handshake.
  Intentionally lean; implementation fills structural details.

### Cleanup passes

- Added goal connections to Environment Propagation, Nesting, Persistent State
- Fixed terminology throughout: "agent" → "inner process"
- Fixed broken section references after deletions
- Verified Commands section alignment with new structure
- Cross-checked Invariants against Requirements (good coverage)

### Process artifacts

- Added editorial guidelines to `CLAUDE.md` under Design Documents section
- Created retrospective: `retrospectives/003-shell-design-editing.md`

## Commits

```
d4ed2a3 shell design: replace Mechanisms with dedicated mechanism sections
7ec70d1 shell design: cleanup passes on remaining sections
b54f4b0 shell design: verification fixes and editorial guidelines
```

## Remaining work

### Technical investigation needed

Experiments 10-11 in Appendix C require completion before Supervisor
startup sequence is finalized:

- **Experiment 10**: Namespace/fork ordering for startup flow
- **Experiment 11**: Environment root remapping (FUSE vs pivot_root vs overlayfs)

### Inline notes to resolve

Several `> **Note:**` blocks flag thin areas:

- Inputs: hook strategy specification
- FUSE Layer: observation modes not specified
- Protocol Specification: framing research, event messages

### Appendix surgery (in progress)

Non-design appendices need extraction:

- **Appendix D: Implementation** — milestones, crate foundation, system
  requirements. Should become informal implementation planning document.
- **Appendix C: Investigations** — references external investigation, could
  remain or link out.
- **Appendix A, B** — protocol selection rationale and previous approaches.
  Design context, may stay.

## References

- Design document: `apparatus/designs/shell/index.md`
- Decisions: `apparatus/designs/shell/decisions/001-008`
- Investigation: `apparatus/investigations/shell-design-assumptions/`
- Retrospective: `apparatus/retrospectives/003-shell-design-editing.md`
