# Apparatus CLI: Implementation Plan

## Goal

Build a dev-quality CLI (`apparatus`) in Rust that implements Phases 1-2 of the apparatus storage system — enough to `init` a store and use a research journal. Phases 3+ are subsequent work; this plan covers what's needed to start daily use.

## Where this lives

The implementation goes in `apparatus/` (the nested git repository in this research workspace). The apparatus repo currently contains `apparatus.md` (the process document from bootstrap experiments), `devenv.nix`, and a `skills/` directory. The CLI source will be a new Rust project alongside these.

## Design references

The full specification is at `journal/2026-02-01-git-as-database/design/006 - design.md`. The implementation scope and simplifying assumptions are at `journal/2026-02-01-git-as-database/design/007 - implementation scope.md`. This plan distills what an implementer needs to know without requiring those documents.

## Simplifying assumptions

These are deliberate shortcuts for the first build. The design accommodates their removal later.

1. **Single writer.** No concurrent mutations. Use bare `update-ref` instead of CAS with `verify`. Adding CAS later is one function signature change.
2. **Low object count.** Hundreds, not 300k. JSON index with sequential scan. Migrating to SQLite changes the index implementation only.
3. **Panic on conflict.** Sync operations fail on non-fast-forward. No merge, no divergence handling.
4. **Canonical JSON (RFC 8785).** Use `serde_json_canonicalizer` crate — compact, sorted keys, normalized numbers. Deterministic byte output for content-addressing. Compact format is fine; pipe through `jq` when human-reading is needed.

## Architecture (three layers)

```
System layer      — CLI, boot sequence, index, cross-structure operations
Structure layer   — Journal, Investigation, Design (domain logic, lifecycles)
Substrate layer   — Thin wrapper over git2 (4 write primitives + 3 read primitives)
```

Strict direction: system calls structure, structure calls substrate. Substrate has no knowledge of structures. Structures have no knowledge of each other.

## Data model

### Store location

`.git/apparatus/` is the state directory. `.git/apparatus/store/` is the bare git repo. `.git/apparatus/index.json` is the derived index. The CLI discovers the store by walking up from the current directory looking for `.git/`.

### The five contract fields

Every object carries these fields:

| Field | Type | Notes |
|-------|------|-------|
| `id` | string | Assigned identifier (UUID v7). Generated at creation, never changes. |
| `type` | string | Discriminator (`journal-entry`, `investigation`, `finding`, etc.) |
| `status` | string | Lifecycle state. Valid values defined per type. |
| `schema-version` | integer | Version of this type's schema. Currently 1. |
| `created-at` | ISO 8601 string | Immutable after creation. |

### Ref namespace

| Structure | Ref pattern |
|-----------|-------------|
| Journal | `refs/apparatus/journal/<topic-slug>` |
| Investigation | `refs/apparatus/investigation/<id>` |
| Design | `refs/apparatus/design/<id>` |
| Meta | `refs/apparatus/meta` (singleton) |

Each ref points to the head commit of that structure's commit chain. Each commit is a state transition.

### Blob format

JSON (not YAML — the design spec says YAML but revision item #2 invalidated that). Five contract fields first, then type-specific fields. Filename convention: `_meta.json` for container/entry metadata, `content.md` for markdown bodies.

### Tree structure (example: journal topic ref)

```
.
├── _meta.json              # Journal topic metadata
├── entries/
│   ├── entry-001/
│   │   ├── _meta.json      # Entry metadata (id, type, status, ...)
│   │   └── content.md      # Entry body
│   └── entry-002/
│       ├── _meta.json
│       └── content.md
```

### Meta ref

`refs/apparatus/meta` points to a commit whose tree contains a single blob:

```
_meta.json: { "format": 1 }
```

Using a commit (not a bare blob) so it participates in the same commit-based model as everything else and can be included in bundles without special handling.

## Phase 1: Foundation

### Deliverable

`apparatus init` creates a working store. The substrate layer is complete. Nothing else is usable yet.

### Crate setup

- Single crate (not a workspace). Binary target `apparatus`.
- Dependencies: `git2`, `clap` (derive), `serde` + `serde_json` + `serde_json_canonicalizer`, `uuid` (v7), `chrono` (ISO 8601), `anyhow` (error handling).
- Source layout:
  ```
  src/
  ├── main.rs          # CLI entry point, clap App
  ├── substrate.rs     # Git plumbing wrapper
  ├── store.rs         # Store discovery, boot sequence
  ├── model.rs         # Contract fields, serialization traits
  └── commands/
      └── init.rs      # apparatus init
  ```

### Substrate layer (`substrate.rs`)

Thin wrapper over `git2`. Seven functions:

```rust
// Write primitives
fn hash_blob(repo: &Repository, data: &[u8]) -> Result<Oid>;
fn build_tree(repo: &Repository, entries: &[TreeEntry]) -> Result<Oid>;
fn create_commit(repo: &Repository, tree: Oid, parent: Option<Oid>, message: &str) -> Result<Oid>;
fn update_ref(repo: &Repository, refname: &str, oid: Oid) -> Result<()>;

// Read primitives
fn read_blob(repo: &Repository, oid: Oid) -> Result<Vec<u8>>;
fn read_tree(repo: &Repository, oid: Oid) -> Result<Vec<TreeEntry>>;
fn list_refs(repo: &Repository, pattern: &str) -> Result<Vec<(String, Oid)>>;
```

`TreeEntry` is `{ name: String, oid: Oid, mode: FileMode }` where `FileMode` is `Blob` or `Tree`.

The `create_commit` function creates an orphan commit when `parent` is `None` (for initial commits on new refs). Commit author/committer: hardcode `"apparatus" <apparatus@local>` with current timestamp.

### Object model (`model.rs`)

```rust
#[derive(Serialize, Deserialize)]
struct ContractFields {
    id: String,
    #[serde(rename = "type")]
    object_type: String,
    status: String,
    #[serde(rename = "schema-version")]
    schema_version: u32,
    #[serde(rename = "created-at")]
    created_at: String,  // ISO 8601
}
```

Serialization helper: `fn to_canonical_json<T: Serialize>(value: &T) -> Result<Vec<u8>>` using `serde_json_canonicalizer::to_vec()` (RFC 8785 — sorted keys, normalized numbers, compact). Use `serde_json` for deserialization (canonical form is valid JSON, any JSON parser reads it).

ID generation: `fn new_id() -> String` using UUID v7.

### Store discovery (`store.rs`)

```rust
fn find_store() -> Result<PathBuf>
```

Walk up from current directory looking for `.git/`. Return `.git/apparatus/store/` path. Error if no `.git/` found.

```rust
fn open_store() -> Result<Repository>
```

Open the bare repo at the store path. Verify meta ref exists and format version is supported.

### `apparatus init` (`commands/init.rs`)

1. Find `.git/` by walking up.
2. Create `.git/apparatus/` directory.
3. `git2::Repository::init_bare(".git/apparatus/store/")`.
4. Write meta blob: `{ "format": 1 }`.
5. Build tree containing the meta blob as `_meta.json`.
6. Create initial commit on the tree with message `"init: format 1"`.
7. Point `refs/apparatus/meta` at the commit.
8. Write empty `index.json` to `.git/apparatus/index.json`: `{ "objects": {}, "reverse_citations": {}, "ref_shas": {} }`.
9. Print confirmation.

### Acceptance criteria

- `apparatus init` in a git repo creates the store structure.
- `apparatus init` outside a git repo prints an error.
- `apparatus init` in an already-initialized repo prints an error.
- The bare repo at `.git/apparatus/store/` contains the meta ref.
- The meta ref points to a commit whose tree has `_meta.json` containing `{ "format": 1 }`.

## Phase 2: Journal

### Deliverable

A working research journal. `apparatus journal add`, `apparatus journal list`, `apparatus journal show`. Daily use can begin.

### Journal entry schema

```json
{
    "id": "<uuid-v7>",
    "type": "journal-entry",
    "status": "open",
    "schema-version": 1,
    "created-at": "<ISO 8601>",
    "topic": "<topic string>"
}
```

Status lifecycle: `open` -> `closed`. Transition is implicit: creating a new entry on the same topic ref closes the previous entry.

### Topic slug and git ref validity

Each topic gets its own ref at `refs/apparatus/journal/<topic-slug>`. The slug is derived from the topic string and must be a valid git ref component. Git ref restrictions: no `..`, no ASCII control chars, no `~^:?*[\`, no trailing `.lock`, no leading or trailing `.`, no consecutive dots, no leading `-`, no trailing `/`, no whitespace.

**OPEN DESIGN QUESTION:** What slug generation rules produce valid, readable, collision-resistant ref components? Current strawman: lowercase, replace whitespace/underscores with hyphens, strip anything not `[a-z0-9-]`, collapse consecutive hyphens, trim leading/trailing hyphens. This is conservative but may be too lossy for topics with meaningful punctuation. Needs a decision before implementation.

The ref points to the latest commit. Each commit's tree:

```
_meta.json              # Topic-level metadata (optional, could just be the slug)
entries/
├── 001/
│   ├── _meta.json      # Entry contract fields + topic
│   └── content.md      # Entry body (markdown)
├── 002/
│   ├── _meta.json
│   └── content.md
```

Entry numbering: sequential within the topic (001, 002, ...). The number is a path component, not an identity — the `id` field in `_meta.json` is the real identifier.

### Source layout addition

```
src/
├── ...
├── journal.rs           # Journal structure layer
└── commands/
    ├── init.rs
    └── journal.rs       # journal add/list/show subcommands
```

### `apparatus journal add --topic <topic> [--file <path> | --message <text>]`

1. Open store, verify format.
2. Compute topic slug.
3. Check if topic ref exists (`refs/apparatus/journal/<slug>`).
4. If ref exists:
   a. Read current tree.
   b. Find the latest entry (highest numbered directory in `entries/`).
   c. If its status is `open`, rewrite its `_meta.json` with `"status": "closed"`.
5. Generate new entry ID (UUID v7).
6. Determine new entry number (max existing + 1, or 001 if first).
7. Read content from `--file` or `--message` (if neither provided, read from stdin).
8. Build entry tree: `_meta.json` + `content.md`.
9. Build new `entries/` tree incorporating the new entry (and the rewritten previous entry if applicable).
10. Build root tree.
11. Create commit (parent = current ref target if exists, None if new topic).
12. Update ref.
13. Print: entry ID, topic, entry number.

### `apparatus journal list [--topic <topic>]`

1. Open store.
2. If `--topic`: read that topic's ref, walk entries, print each.
3. If no topic: `list_refs("refs/apparatus/journal/*")`, for each ref walk entries.
4. Output per entry: entry number, topic, status, created-at, first line of content (as summary).
5. Sort by created-at descending.

For this phase, read directly from git objects (no index dependency). Phase 3 adds the index.

### `apparatus journal show <topic> [<entry-number>]`

1. Open store.
2. Resolve topic to ref.
3. If entry-number given: read that specific entry's `_meta.json` and `content.md`.
4. If no entry-number: show the latest entry.
5. Print metadata header + full content.

### Acceptance criteria

- Adding an entry to a new topic creates the topic ref and first entry.
- Adding an entry to an existing topic closes the previous entry and creates the new one.
- `journal list` shows all entries across topics, sorted by date.
- `journal list --topic X` shows only entries for that topic.
- `journal show topic 1` displays the first entry on a topic.
- `journal show topic` (no number) shows the latest entry.
- Content can be provided via `--file`, `--message`, or stdin.

## Inspecting the store with standard tools

The store is a bare git repo. Git trees are designed to map to filesystem trees, so standard unix tools work well for inspection during development. Set `GIT_DIR` to the store path and use git plumbing directly.

### See the tree structure of a ref

```bash
GIT_DIR=.git/apparatus/store git ls-tree -r --name-only refs/apparatus/journal/some-topic
```

### Read a specific blob (pipe through jq for readability)

```bash
GIT_DIR=.git/apparatus/store git show refs/apparatus/journal/some-topic:entries/001/_meta.json | jq .
```

### Materialize a ref's tree into a directory for browsing

```bash
dir=$(mktemp -d)
GIT_DIR=.git/apparatus/store git archive refs/apparatus/journal/some-topic | tar -C "$dir" -x
ls "$dir"/entries/
cat "$dir"/entries/001/content.md
```

### List all apparatus refs

```bash
GIT_DIR=.git/apparatus/store git for-each-ref refs/apparatus/ --format='%(refname) %(objectname:short)'
```

### Diff between two commits on a ref

```bash
GIT_DIR=.git/apparatus/store git diff <commit1> <commit2>
```

## Open questions for implementation

These should be resolved during implementation and recorded in the notes file:

1. **Entry content workflow.** For Phase 2, `--file` and `--message` flags plus stdin. Editor integration (`$EDITOR`) is a Phase 2+ nicety.
2. **Error messages.** Should be actionable. "No apparatus store found — run `apparatus init` in a git repository" rather than "file not found."
3. **Tree building with git2.** The `git2` crate's `TreeBuilder` API vs. building from scratch. Need to understand how to compose nested trees.
