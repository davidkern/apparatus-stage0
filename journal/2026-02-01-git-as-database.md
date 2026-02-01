# 2026-02-01: Git as a database for apparatus storage

Picking up the triad design work from yesterday. The plan (`journal/2026-01-31-module-reusability-and-process/triad-design/plan.md`) identified "git plumbing as storage layer" as a research topic for today's session, with the framing:

> All apparatus consumers are git repos. Git's porcelain presents a file-and-directory abstraction, but underneath it's a content-addressable store and database (git plumbing). There may be significant utility in using git more directly rather than treating `apparatus.store/` as a conventional directory tree.

The specific capabilities to investigate:

- **Structural enforcement at the storage layer** — append-only semantics, immutability of closed entries, and mutation rules as properties of how data is committed, not skill-level rules an agent is told to follow
- **Worktrees for constrained views** — present exactly the right files for a given activity, enforcing structure through visibility rather than permission
- **CAS properties** — content-addressable storage gives deduplication, integrity verification, and precise references between artifacts
- **Cross-repo references** — git's native object model for cleaner cross-triad references than file paths

The directory-based `apparatus.store/` plan from yesterday serves dual purpose: it's the baseline implementation we can ship immediately, and it's the requirements specification for what a git-native approach would need to replace.

Exploration notes: `journal/2026-02-01-git-as-database/git-exploration-notes.md`
