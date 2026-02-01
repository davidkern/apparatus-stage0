# Experiment: Hermetic instantiation from git

## Context

We are designing a data storage layer for a system that manages structured knowledge artifacts (journals, investigations, designs). The storage will be built on top of git's object store within existing project repositories. A CLI tool will mediate all access.

A critical requirement is **instantiation**: the ability to create an independent, hermetically isolated copy of a subset of the data. The primary use case is running experiments where a practitioner operates inside what appears to be a real data environment but is actually a controlled sandbox. The practitioner must not be able to discover or access data outside the sandbox boundary — including through git tooling, the `.git` directory, ref enumeration, object enumeration, or any other mechanism.

## What we need to learn

1. **Can we create a hermetically isolated git repo from a subset of another repo's data?** The new repo must contain only the specified objects. No path, ref, alternates link, or object enumeration should reveal the source repo.

2. **What is the cheapest way to do this?** Options include: fresh `git init` + object injection, `git bundle` + unbundle, `git clone` with filtering, or something else. We need to understand the performance and isolation tradeoffs.

3. **Can we use custom ref namespaces** (`refs/apparatus/...`) to store apparatus data alongside project data without polluting the project's branch/tag namespace? Do standard git tools (log, status, branch, tag) ignore custom refs? Does `git gc` preserve objects only reachable from custom refs?

4. **Can we atomically update multiple refs?** The storage model may need to update several refs as a single operation (e.g., advancing the journal head and updating an investigation status in one commit). `git update-ref --stdin` supports transactions — does this work in practice?

## Your working environment

- **Sandbox directory**: `/work/sandbox/exp-001/` — create all git repos here
- **Language**: Python 3.13 (available as `python3`)
- **Git**: version 2.51.2
- **Git plumbing reference**: read `/work/journal/2026-02-01-git-as-database/git-plumbing-reference.md` for detailed command syntax and internals

## What to do

Work through each question below by writing Python code that exercises the git operations. Create small, focused scripts for each test. Document what you find — both what works and what doesn't.

### Test 1: Custom ref namespaces

Create a git repo with both normal branches and custom refs under `refs/apparatus/`. Verify:
- `git branch` and `git tag` do not show apparatus refs
- `git log --all` does or does not include apparatus ref commits (this matters)
- `git for-each-ref refs/apparatus/` can enumerate them
- `git gc` preserves objects only reachable from apparatus refs (create objects reachable ONLY from apparatus refs, run gc, verify they survive)
- Standard porcelain commands (status, diff, log) are unaffected

### Test 2: Apparatus data model on custom refs

Build a minimal apparatus data structure using only git plumbing:
- Create a "journal" as a chain of commits on `refs/apparatus/journal/main`
- Each commit's tree contains one or more entry blobs with YAML frontmatter + markdown content
- Each commit represents one journal entry being appended (the tree grows with each commit)
- Add structured metadata as a separate blob in the tree (e.g., `_meta.yaml`)
- Verify you can enumerate entries, read specific entries, and read metadata using only plumbing commands

### Test 3: Hermetic instantiation

Starting from the repo created in tests 1 and 2:
- Create a NEW, independent git repo in a different directory
- Populate it with ONLY the apparatus data (the journal commits and their objects) — no project branches, no other refs
- Verify hermetic isolation: from inside the new repo, there is NO way to discover or access the source repo (no alternates, no remote, no refs pointing outside)
- Verify the apparatus data is fully functional in the new repo (can enumerate entries, read content, read metadata)
- Measure the cost: how many objects were copied, how long did it take?

### Test 4: Atomic multi-ref updates

Using `git update-ref --stdin`:
- Create a transaction that updates two apparatus refs atomically
- Verify both succeed or both fail (test the failure case too — e.g., CAS mismatch on one ref)
- Determine if this is reliable enough for the CLI to depend on

### Test 5: Selective instantiation

Starting from a repo with multiple apparatus structures (journal with several entries, a second ref namespace for an "investigation"):
- Create a new repo containing only the investigation, not the journal
- Verify the journal data is completely absent from the new repo (not just unreferenced — the objects should not exist)
- Verify the investigation data is complete and functional

## What to write

Create a `results.md` file in `/work/sandbox/exp-001/` summarizing:
- For each test: what you did, what happened, what it means
- Any surprising behavior or limitations discovered
- Your assessment: is git viable as the storage substrate for this system? What are the constraints?
- Keep all Python scripts in the sandbox directory so we can inspect and rerun them
