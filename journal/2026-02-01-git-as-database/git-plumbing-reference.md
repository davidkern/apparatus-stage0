# Git Plumbing Reference: Using Git as a Database

Dense technical reference for implementing data storage systems on top of git's
content-addressable object store and ref system. All commands are plumbing-level
unless noted. Intended audience: an AI agent writing Python code against git CLI.

---

## 1. Object Model

Git stores four object types in a content-addressable store. Every object is
identified by the SHA-1 (or SHA-256 with `extensions.objectFormat`) hash of its
header+content.

### Object Storage Format (All Types)

On-disk, every loose object is:
```
zlib_deflate( "<type> <size_in_bytes>\0<content>" )
```
Stored at `.git/objects/<first-2-hex>/<remaining-38-hex>`.

### Blob

```
blob <size>\0<raw-bytes>
```
- Content-only. No filename, no metadata.
- Two files with identical content produce the same blob SHA.

### Tree

**Serialized format** (this is what `<content>` is in the object):
```
<mode> <filename>\0<20-byte-binary-SHA>
<mode> <filename>\0<20-byte-binary-SHA>
...
```
- `<mode>` is ASCII octal, variable length (no leading zeros except `040000`).
- `<filename>` is a bare name (no slashes), null-terminated.
- SHA is **raw 20-byte binary**, NOT hex. (Commits use hex; trees use binary.)
- Entries are sorted by name (with subtrees sorted as if they had trailing `/`).

**Mode values:**
| Mode     | Meaning              |
|----------|----------------------|
| `100644` | Regular file         |
| `100755` | Executable file      |
| `120000` | Symbolic link        |
| `040000` | Subdirectory (tree)  |
| `160000` | Gitlink (submodule)  |

### Commit

```
tree <40-hex-SHA>\n
parent <40-hex-SHA>\n          (zero or more, one per parent)
author <name> <<email>> <unix-timestamp> <tz-offset>\n
committer <name> <<email>> <unix-timestamp> <tz-offset>\n
\n
<message>
```
- First commit (root) has no parent lines.
- Merge commits have multiple parent lines.
- Timestamp format: `<unix-epoch-seconds> +HHMM` or `-HHMM`.
- All SHAs in commits are **40-char hex strings** (unlike trees).

### Tag (Annotated)

```
object <40-hex-SHA>\n
type <commit|tree|blob|tag>\n
tag <tagname>\n
tagger <name> <<email>> <unix-timestamp> <tz-offset>\n
\n
<message>
```
- Can point to ANY object type, not just commits.
- Lightweight tags are just refs (no tag object created).

---

## 2. Plumbing Commands for Storage Operations

### git hash-object -- Store Arbitrary Content

```bash
# Hash and store a blob from stdin
echo 'data' | git hash-object -w --stdin
# => <40-hex-sha>

# Hash and store from file
git hash-object -w <file>

# Hash without storing (dry run)
git hash-object --stdin < <file>

# Store with explicit type
git hash-object -w -t blob --stdin < <file>

# Hash multiple files, reading paths from stdin
git hash-object -w --stdin-paths < filelist.txt

# Bypass fsck validation (store anything)
echo 'corrupt' | git hash-object -w --stdin --literally
```

**Flags:**
- `-w` -- write object to database (without this, only prints SHA)
- `-t <type>` -- `blob` (default), `commit`, `tree`, `tag`
- `--stdin` -- read content from stdin
- `--stdin-paths` -- read file paths from stdin, one per line
- `--path=<file>` -- apply gitattributes filters as if at this path
- `--no-filters` -- skip clean/smudge filters (implied with `--stdin` unless `--path`)
- `--literally` -- bypass object format validation

**Output:** Single line, 40-hex-char SHA to stdout.

### git cat-file -- Read Objects by SHA

```bash
# Pretty-print any object
git cat-file -p <sha>

# Get object type
git cat-file -t <sha>

# Get object size in bytes
git cat-file -s <sha>

# Check existence (exit code 0 = exists)
git cat-file -e <sha>

# Output raw blob content (type must match)
git cat-file blob <sha>
```

**Batch mode** (high-performance, avoids process-per-object):
```bash
# Batch: print info + content for each object
echo "<sha>" | git cat-file --batch
# Output: <sha> SP <type> SP <size> LF <content> LF

# Batch check: info only, no content
echo "<sha>" | git cat-file --batch-check
# Output: <sha> SP <type> SP <size> LF

# Custom format
echo "<sha>" | git cat-file --batch-check='%(objectname) %(objecttype) %(objectsize)'

# Missing object output
echo "deadbeef" | git cat-file --batch-check
# Output: deadbeef missing

# NUL-delimited I/O (scripting-safe)
printf '<sha>\0' | git cat-file --batch-check -Z

# Enumerate ALL objects in the repo
git cat-file --batch-check --batch-all-objects

# With buffered output (faster for large batches)
git cat-file --batch --buffer

# Batch command mode (mixed info/content queries)
printf 'info %s\ncontents %s\n' "$sha1" "$sha2" | git cat-file --batch-command
```

**Format atoms for --batch/--batch-check:**
`%(objectname)`, `%(objecttype)`, `%(objectsize)`, `%(objectsize:disk)`,
`%(deltabase)`, `%(rest)`

### git mktree -- Build Tree Objects

Reads `ls-tree`-format lines from stdin, creates a tree object, prints its SHA.

```bash
# Create tree from entries
printf '100644 blob %s\t%s\n' "$blob_sha" "file.txt" | git mktree
# => <40-hex-sha of new tree>

# Multiple entries
cat <<EOF | git mktree
100644 blob <sha1>	file1.txt
100644 blob <sha2>	file2.txt
040000 tree <sha3>	subdir
EOF

# Allow referenced objects to not exist yet
printf '100644 blob %s\t%s\n' "$sha" "f.txt" | git mktree --missing

# Batch mode: multiple trees separated by blank lines
cat <<EOF | git mktree --batch
100644 blob <sha1>	a.txt

100644 blob <sha2>	b.txt
EOF
# Outputs one tree SHA per blank-line-separated group

# NUL-terminated input
printf '100644 blob %s\tfile.txt\0' "$sha" | git mktree -z
```

**Stdin format per entry:**
```
<mode> SP <type> SP <sha> TAB <filename> LF
```
This matches `git ls-tree` output. Entries are auto-sorted; pre-sorting is not required.

**Flags:**
- `--missing` -- allow referenced objects to be absent from the database
- `--batch` -- read multiple trees separated by blank lines
- `-z` -- NUL-terminated input

### git commit-tree -- Create Commits Without the Index

```bash
# Root commit (no parent)
echo "message" | git commit-tree <tree-sha>
# => <40-hex commit sha>

# Commit with parent
echo "message" | git commit-tree <tree-sha> -p <parent-sha>

# Merge commit (multiple parents)
echo "merge" | git commit-tree <tree-sha> -p <parent1> -p <parent2>

# Message from argument
git commit-tree <tree-sha> -m "message" -p <parent>

# Message from file
git commit-tree <tree-sha> -F message.txt -p <parent>

# Multiple message paragraphs
git commit-tree <tree-sha> -m "para1" -m "para2" -p <parent>
```

**Environment variables for metadata:**
```bash
GIT_AUTHOR_NAME="Agent"
GIT_AUTHOR_EMAIL="agent@system"
GIT_AUTHOR_DATE="1706745600 +0000"    # Unix timestamp + tz
GIT_COMMITTER_NAME="Agent"
GIT_COMMITTER_EMAIL="agent@system"
GIT_COMMITTER_DATE="1706745600 +0000"
```

**Date formats accepted:** `<unix-timestamp> <tz-offset>`, RFC 2822, ISO 8601.

**Output:** Single line, 40-hex commit SHA to stdout.

### git update-ref -- Manipulate Refs Directly

```bash
# Set a ref
git update-ref refs/heads/main <new-sha>

# Set with old-value check (CAS operation)
git update-ref refs/heads/main <new-sha> <expected-old-sha>

# Delete a ref
git update-ref -d refs/heads/old-branch

# Delete with verification
git update-ref -d refs/heads/old-branch <expected-sha>

# Don't dereference symbolic refs
git update-ref --no-deref HEAD <sha>

# Create reflog entry
git update-ref -m "reason for change" refs/heads/main <sha>
```

**Atomic multi-ref transactions via --stdin:**
```bash
git update-ref --stdin <<EOF
start
update refs/heads/main <new-sha> <old-sha>
create refs/heads/feature <sha>
delete refs/tags/old-tag <expected-sha>
verify refs/heads/stable <expected-sha>
prepare
commit
EOF
```

**Transaction commands:**
| Command  | Format | Semantics |
|----------|--------|-----------|
| `start`    | `start` | Begin transaction |
| `update`   | `update SP <ref> SP <new> [SP <old>]` | Set ref (with optional CAS) |
| `create`   | `create SP <ref> SP <new>` | Create ref (fail if exists) |
| `delete`   | `delete SP <ref> [SP <old>]` | Delete ref (with optional CAS) |
| `verify`   | `verify SP <ref> [SP <expected>]` | Assert current value |
| `prepare`  | `prepare` | Lock all refs; fail if any lock fails |
| `commit`   | `commit` | Apply all updates atomically |
| `abort`    | `abort` | Release all locks |

**NUL-delimited mode** (safer for programmatic use):
```bash
printf 'start\0update refs/heads/main\0%s\0%s\0commit\0' "$new" "$old" \
  | git update-ref --stdin -z
```
In `-z` mode, each field is NUL-terminated instead of space-separated.

**Atomicity guarantee:** If all refs can be locked and old-value checks pass, all
updates apply. Otherwise, NO updates apply. However, concurrent readers may see
a partial subset during the commit phase (locks are released one at a time).

### git update-index -- Index Manipulation

```bash
# Add a blob to the index without it existing in the working tree
git update-index --add --cacheinfo 100644,<blob-sha>,path/to/file

# Legacy 3-argument form (still works)
git update-index --add --cacheinfo 100644 <blob-sha> path/to/file

# Remove from index
git update-index --force-remove path/to/file

# Bulk add via --index-info (stdin)
git update-index --index-info <<EOF
100644 <sha1> 0	file1.txt
100644 <sha2> 0	file2.txt
EOF
```

**--index-info stdin formats:**
```
# Format 1 (ls-tree output):
<mode> SP <type> SP <sha> TAB <path>

# Format 2 (ls-files --stage output, supports merge stages):
<mode> SP <sha> SP <stage> TAB <path>

# Format 3 (simplified):
<mode> SP <sha> TAB <path>
```
Stage 0 = normal. Stages 1/2/3 = merge conflict (base/ours/theirs).

To remove an entry before setting higher stages: feed `0 <null-sha> TAB <path>`.

**Key flags:**
- `--add` -- allow adding new entries
- `--remove` -- remove entries for missing working-tree files
- `--force-remove` -- remove even if working-tree file exists
- `--info-only` -- register object without storing it in the object DB
- `--skip-worktree` / `--no-skip-worktree` -- mark paths to skip in working tree
- `-z` -- NUL-delimited stdin

### git write-tree -- Write Index to Tree Object

```bash
git write-tree
# => <40-hex tree sha>

# Allow missing objects
git write-tree --missing-ok

# Write subtree only
git write-tree --prefix=subdir/
```
Reads the current index and creates tree objects for it. The index must be fully
merged (no conflict stages). Output: 40-hex tree SHA to stdout.

### git read-tree -- Load Tree Into Index

```bash
# Read tree into index (no working-tree changes)
git read-tree <tree-sha>

# Read tree into index under a prefix
git read-tree --prefix=subdir/ <tree-sha>

# Clear the index
git read-tree --empty

# Index-only mode (skip working-tree checks entirely)
git read-tree -i <tree-sha>

# Write result to alternate index file
git read-tree --index-output=/tmp/alt-index <tree-sha>

# Two-way merge (fast-forward)
git read-tree -m <current-tree> <target-tree>

# Three-way merge
git read-tree -m <ancestor> <current> <other>

# Also update working tree (only with -m)
git read-tree -m -u <current-tree> <target-tree>
```

**Critical flag: `-i`** -- disables working-tree consistency checks. Required when
building trees that don't correspond to any working directory.

### git ls-tree -- Read Tree Contents

```bash
# List tree entries
git ls-tree <tree-sha>
# Output: <mode> SP <type> SP <sha> TAB <path>

# Recursive listing
git ls-tree -r <tree-sha>

# With object sizes
git ls-tree -l <tree-sha>
# Output: <mode> SP <type> SP <sha> SP <size> TAB <path>

# Show tree entries when recursing (-r must be set)
git ls-tree -r -t <tree-sha>

# NUL-delimited output
git ls-tree -z <tree-sha>

# Names only
git ls-tree --name-only <tree-sha>

# SHAs only
git ls-tree --object-only <tree-sha>
```

### Isolated Index Workflow (No Working Tree)

The `GIT_INDEX_FILE` environment variable redirects all index operations to a
temporary file, enabling fully isolated tree construction:

```bash
export GIT_INDEX_FILE=$(mktemp)

# Build a tree entirely in memory (no working directory needed)
blob=$(echo "content" | git hash-object -w --stdin)
git update-index --add --cacheinfo 100644,$blob,path/file.txt
tree=$(git write-tree)
commit=$(echo "msg" | git commit-tree $tree)
git update-ref refs/heads/data $commit

rm "$GIT_INDEX_FILE"
unset GIT_INDEX_FILE
```

**Key environment variables:**
| Variable | Purpose |
|----------|---------|
| `GIT_DIR` | Path to `.git` directory (default: auto-discovered) |
| `GIT_WORK_TREE` | Path to working tree root |
| `GIT_INDEX_FILE` | Path to index file (default: `$GIT_DIR/index`) |
| `GIT_OBJECT_DIRECTORY` | Path to objects directory |
| `GIT_ALTERNATE_OBJECT_DIRECTORIES` | Colon-separated alternate object dirs |

---

## 3. Ref Namespaces

### Filesystem Structure

```
.git/refs/
  heads/       # branches
  tags/        # tags
  remotes/     # remote-tracking branches
  notes/       # git notes namespaces
  stash        # stash ref
  <custom>/    # any custom namespace you create
```

Plus `.git/packed-refs` for compacted refs (one `<sha> <refname>` per line).

### Custom Ref Namespaces

Git places no restrictions on ref names under `refs/`. You can create arbitrary
hierarchies:

```bash
git update-ref refs/data/collections/users/123 <sha>
git update-ref refs/data/indexes/email/foo@bar <sha>
git update-ref refs/custom/anything/you/want <sha>
```

**What respects custom refs:**
- `git for-each-ref refs/data/` -- enumerates them
- `git show-ref` -- lists them
- `git rev-parse refs/data/foo` -- resolves them
- `git cat-file` -- reads the objects they point to
- `git update-ref` -- creates/updates/deletes them
- `git pack-refs --all` -- packs them

**What ignores custom refs:**
- `git log` (unless explicitly passed as arguments)
- `git branch` / `git tag` (only show `refs/heads/` and `refs/tags/`)
- `git gc` -- will NOT prune objects reachable only from custom refs **unless**
  those refs are in the reflog or explicitly passed. **Important:** custom refs
  DO protect objects from GC as long as the ref exists.
- `git clone` -- by default only fetches `refs/heads/*` and `refs/tags/*`

### git for-each-ref -- Enumerate Refs

```bash
# All refs
git for-each-ref

# Custom namespace
git for-each-ref refs/data/

# With format
git for-each-ref --format='%(refname) %(objectname) %(objecttype)' refs/data/

# Sorted by date
git for-each-ref --sort=-committerdate refs/heads/

# Count limit
git for-each-ref --count=10 refs/heads/

# Exclude patterns
git for-each-ref --exclude='refs/heads/temp*' refs/heads/

# Strip prefix components
git for-each-ref --format='%(refname:lstrip=2)' refs/data/

# Only refs pointing at specific object
git for-each-ref --points-at <sha>

# Refs containing a commit
git for-each-ref --contains <sha> refs/heads/

# Custom format with conditionals
git for-each-ref --format='%(if)%(symref)%(then)symbolic%(else)direct%(end) %(refname)' refs/
```

**Key format atoms:**
`%(refname)`, `%(refname:short)`, `%(refname:lstrip=N)`, `%(refname:rstrip=N)`,
`%(objectname)`, `%(objectname:short)`, `%(objecttype)`, `%(objectsize)`,
`%(objectsize:disk)`, `%(tree)`, `%(parent)`, `%(authorname)`, `%(authoremail)`,
`%(authordate)`, `%(committerdate)`, `%(subject)`, `%(contents)`, `%(symref)`,
`%(*objectname)` (peeled/dereferenced), `%(creatordate)`

### git symbolic-ref -- Symbolic References

```bash
# Read current HEAD target
git symbolic-ref HEAD
# => refs/heads/main

# Set HEAD to a branch
git symbolic-ref HEAD refs/heads/feature

# Cannot set to non-ref path
git symbolic-ref HEAD test  # FAILS -- must start with refs/
```

### Packed Refs

After `git pack-refs --all`, refs are stored in `.git/packed-refs`:
```
# pack-refs with: peeled fully-peeled sorted
<sha> refs/heads/main
<sha> refs/tags/v1.0
^<sha>                    # peeled value of annotated tag above
```

Loose refs in `.git/refs/` override packed-refs entries. To update a packed ref,
git creates a new loose ref that shadows the packed entry.

---

## 4. Git Notes

### Internal Storage Model

Notes are stored as a commit history on a notes ref (default: `refs/notes/commits`).
Each commit in the notes history points to a tree. The tree maps annotated-object
SHAs to note-content blobs.

**Tree structure:**
```
refs/notes/commits -> commit -> tree
                                 ├── ab/cd1234...5678  -> blob (note content)
                                 ├── ab/ef9876...4321  -> blob (note content)
                                 └── cd/123456...abcd  -> blob (note content)
```

The "filename" in the notes tree is the hex SHA of the annotated object, split
into directory components for fanout. Git adaptively determines the fanout depth
based on the number of notes (e.g., `aabb...` might be stored as `aa/bb/cc...`
with 2-char directory segments).

### Key Constraint

**One note per object per namespace.** You cannot attach two notes to the same
object in the same namespace. Use separate namespaces for different note types.

### Namespaces

```bash
# Default namespace
git notes add -m "note" <object>
# Stored in refs/notes/commits

# Custom namespace
git notes --ref=reviews add -m "LGTM" <sha>
# Stored in refs/notes/reviews

# Ref resolution:
#   "reviews"          -> refs/notes/reviews
#   "notes/reviews"    -> refs/notes/reviews
#   "refs/notes/foo"   -> refs/notes/foo (as-is)
```

**Environment/config:**
```bash
# Override default namespace
GIT_NOTES_REF=refs/notes/custom
core.notesRef = refs/notes/custom

# Display multiple note namespaces in git log
notes.displayRef = refs/notes/reviews
GIT_NOTES_DISPLAY_REF=refs/notes/reviews:refs/notes/testing
```

### Plumbing Operations

```bash
# Add note
git notes add -m "text" <target-sha>
git notes add -f -m "overwrite" <target-sha>   # -f to overwrite existing

# Add note from blob (binary-safe)
blob=$(git hash-object -w binary-data.bin)
git notes add -C $blob <target-sha>

# Append to existing note (blank line separator)
git notes append -m "additional" <target-sha>

# List all notes (note-blob-sha target-object-sha)
git notes list
# Output: <note-sha> <annotated-sha>

# Get note for specific object
git notes list <target-sha>
# Output: <note-sha>

# Show note content
git notes show <target-sha>

# Remove note
git notes remove <target-sha>

# Copy note
git notes copy <from-sha> <to-sha>

# Get the actual ref being used
git notes get-ref
# => refs/notes/commits

# Prune notes for objects that no longer exist
git notes prune
```

### Push/Fetch Behavior

Notes refs are NOT fetched or pushed by default. You must configure them explicitly:

```bash
# Fetch notes
git fetch origin refs/notes/*:refs/notes/*

# Push notes
git push origin refs/notes/commits

# Configure automatic fetch
git config --add remote.origin.fetch '+refs/notes/*:refs/notes/*'
```

### Merge Strategies

```bash
git notes merge <notes-ref>                    # manual merge
git notes merge -s ours <notes-ref>            # keep local
git notes merge -s theirs <notes-ref>          # keep remote
git notes merge -s union <notes-ref>           # concatenate both
git notes merge -s cat_sort_uniq <notes-ref>   # concat, sort, dedup lines
```

---

## 5. Isolation Mechanisms

### Bare Repositories

```bash
git init --bare /path/to/repo.git
git clone --bare <url> /path/to/repo.git
```
- No working tree, no index.
- `GIT_DIR` = the repo directory itself.
- All plumbing commands work. Ideal for data-storage use cases.

### No-Checkout Clone

```bash
git clone --no-checkout <url> /path/to/repo
```
- Creates `.git/` with full object database and refs.
- Working tree is empty. Index is populated but files are not checked out.

### GIT_DIR / GIT_WORK_TREE Separation

```bash
# Use a git database without any working tree
GIT_DIR=/path/to/repo.git git cat-file -p <sha>

# Point git at a detached object store
GIT_DIR=/path/to/store.git git hash-object -w --stdin < data

# Combine: git database in one place, working tree elsewhere
GIT_DIR=/data/repo.git GIT_WORK_TREE=/data/files git status
```

These work with any plumbing command. For pure data storage, set `GIT_DIR` and
never set `GIT_WORK_TREE`.

### git bundle -- Portable Repo Snapshots

```bash
# Full backup (all refs and objects)
git bundle create backup.bundle --all

# Single branch
git bundle create feature.bundle refs/heads/feature

# Incremental (only objects after a basis)
git bundle create incremental.bundle old-tag..HEAD

# Custom refs
git bundle create data.bundle refs/data/collections/users

# Verify bundle prerequisites exist in current repo
git bundle verify backup.bundle

# List refs in bundle
git bundle list-heads backup.bundle

# Fetch from bundle
git fetch backup.bundle refs/heads/main:refs/heads/restored

# Clone from bundle
git clone backup.bundle new-repo
```

Bundles contain a packfile + ref list. They are self-contained if no exclusions
are used (`..` syntax). With exclusions, the target repo must have the basis
objects.

### Manual Object Injection

```bash
git init --bare /tmp/store.git
echo "data" | GIT_DIR=/tmp/store.git git hash-object -w --stdin
```
Objects are immediately available. No index or working tree needed.

### git worktree -- Linked Working Trees

```bash
git worktree add /path/to/worktree branch-name
```

**Information leakage:** The linked worktree contains a `.git` FILE (not directory)
with content:
```
gitdir: /absolute/path/to/main/repo/.git/worktrees/<name>
```
This reveals the absolute filesystem path to the main repository. The main repo's
`.git/worktrees/<name>/gitdir` file also stores the absolute path back to the
worktree. Both paths are bidirectional, exposing filesystem layout.

### objects/info/alternates -- Shared Object Stores

```bash
# Format: one absolute path per line
echo '/path/to/other/repo.git/objects' >> .git/objects/info/alternates
```

- Objects are borrowed, not copied. If the alternate is deleted, the repo is
  corrupted.
- Maximum chain depth: 5 levels of alternates.
- `git clone --shared` sets this up automatically.
- `git repack -a` copies all borrowed objects locally (dissociates).
- `git clone --reference <repo>` uses alternates during clone, then optionally
  dissociates with `--dissociate`.

**Information leakage:** The `objects/info/alternates` file contains absolute
filesystem paths. If exposed (e.g., via a dumb HTTP server), it reveals the
location of other repositories on the filesystem.

**Also:** `GIT_ALTERNATE_OBJECT_DIRECTORIES` (colon-separated) provides the same
functionality via environment variable.

---

## 6. Ref Filtering and Partial Repos

### Partial Clone

```bash
# Blobless clone: all commits and trees, blobs on demand
git clone --filter=blob:none <url>

# Treeless clone: all commits, trees and blobs on demand
git clone --filter=tree:0

# Combine with single-branch
git clone --filter=blob:none --single-branch --branch main <url>

# Size-based filter
git clone --filter=blob:limit=1m <url>
```

After partial clone, the remote is configured as a "promisor remote":
```ini
[remote "origin"]
    promisor = true
    partialclonefilter = blob:none
```
Missing objects are fetched on demand from promisor remotes.

### Single-Branch Clone

```bash
git clone --single-branch --branch main <url>
```

Results in a restricted fetch refspec:
```ini
[remote "origin"]
    fetch = +refs/heads/main:refs/remotes/origin/main
```
Only that branch is fetched on subsequent `git fetch` operations.

### Cloning Specific Refs

You cannot directly clone only specific custom refs. The clone protocol
advertises all refs, but the client filters by refspec. Workarounds:

```bash
# Clone with no checkout, then fetch specific refs
git init repo && cd repo
git remote add origin <url>
git fetch origin refs/data/specific:refs/data/specific

# Or configure multiple specific refspecs
git config --add remote.origin.fetch '+refs/data/*:refs/data/*'
git fetch origin
```

### git upload-pack / git receive-pack

These are the server-side processes for fetch and push:

```bash
# Server side of fetch (client runs fetch-pack)
git upload-pack <repo-path>

# Server side of push (client runs send-pack)
git receive-pack <repo-path>
```

**Protocol:** Length-prefixed lines (4-hex-digit length prefix, `0000` = flush).
Server advertises all refs with capabilities. Client sends `want`/`have` lines.
Server generates and sends a packfile.

**Capabilities advertised:** `multi_ack`, `thin-pack`, `side-band-64k`,
`ofs-delta`, `shallow`, `no-progress`, `include-tag`, `filter` (for partial clone).

### Negative Refspecs

Since Git 2.29, you can exclude refs:
```ini
[remote "origin"]
    fetch = +refs/heads/*:refs/remotes/origin/*
    fetch = ^refs/heads/temp*
```

---

## 7. Atomic Operations

### What Is Atomic in Git

| Operation | Atomicity |
|-----------|-----------|
| Single ref update (`git update-ref`) | Atomic (lock file) |
| Multi-ref transaction (`git update-ref --stdin` with `start`/`prepare`/`commit`) | All-or-nothing on lock acquisition; readers may see partial updates during commit phase |
| Single object write | Atomic (write to temp, rename) |
| `git push --atomic` | All refs updated or none (server-side) |
| Pack creation | Atomic (write packfile, then index, then update) |

### Multi-Ref Atomic Transactions

```bash
# All-or-nothing: either both refs update or neither does
git update-ref --stdin <<EOF
start
update refs/heads/main <new1> <old1>
update refs/heads/feature <new2> <old2>
prepare
commit
EOF
```

**Semantics of `prepare`:**
- Acquires locks on ALL listed refs.
- Verifies ALL old-value conditions.
- If ANY lock or verify fails, the entire transaction aborts. No changes applied.

**Semantics of `commit`:**
- Applies all updates. Locks are released one-by-one.
- A concurrent reader MAY see some refs updated and others not yet updated.
  (Full serialization is NOT guaranteed at read time.)

**Without explicit `start`/`prepare`/`commit`:** All commands in the stdin stream
are collected and executed as a single implicit transaction (same guarantees).

### Lock Mechanism (Loose Refs Backend)

- Git creates `<refpath>.lock` files.
- Lock is acquired via `open(O_CREAT | O_EXCL)` -- atomic on POSIX.
- New value is written to lock file, then `rename()` replaces the ref.
- If process dies, stale `.lock` files may remain. `git gc` cleans them up.

### Reftable Backend (Newer)

- Single `tables.list.lock` for write serialization.
- Append-only reftable files. Atomic append to stack.
- O(size_of_update) for atomic multi-ref updates (vs. O(total_packed_refs) for
  packed-refs rewrite).
- Near-constant-time lookups.
- All ref updates in a transaction share the same `update_index`, enabling
  correlation of which refs were updated together.

---

## 8. Performance Characteristics

### Object Lookup

**Loose objects:** O(1) filesystem lookup. Path is derived directly from SHA:
`.git/objects/<2-hex>/<38-hex>`. Single `stat()` + `open()` + `zlib_inflate()`.

**Packed objects (pack index v2):**
1. Read fanout table (256 x 4-byte entries). `fanout[byte]` gives the count of
   objects with first byte <= `byte`. This gives the search range in O(1).
2. Binary search within the range of the sorted SHA table. ~17 comparisons for
   1M objects (log2(1M/256) ~= 12 after fanout narrowing).
3. Read 4-byte offset (or 8-byte for >2GB packs) to locate object in packfile.

**Net cost:** 1 disk seek (after fanout, if index is in memory). For cold cache,
2-3 disk seeks.

**Multi-pack index (MIDX):** When multiple packfiles exist, a MIDX consolidates
lookups. O(log N) across all packs.

### Ref Enumeration

**Loose refs:** One `readdir()` + `stat()` per ref. O(N) where N = number of refs.
Directories in `refs/` must be traversed recursively. Expensive for >10K refs.

**packed-refs:** Single file read + binary/linear scan. Much faster than loose refs
for large ref counts.

**Reftable:** O(log N) for single lookup. Efficient range scans for namespace
enumeration. Block-based index structure.

### Tree Traversal

Reading a tree is O(entries) for a single level. Full recursive traversal of a
repository with D directories and F files is O(D) tree object reads + O(F) blob
references.

Each tree read requires an object lookup (see above). For packed repos, this
means ~D disk seeks for cold traversal.

### Object Writing

**Loose object write:** `hash()` + `zlib_deflate()` + write to temp file +
`rename()`. O(size_of_content).

**Implications for data storage:**
- Storing many small objects: fast writes, but accumulates loose objects.
  Run `git gc` or `git repack` periodically.
- `git gc --auto` triggers at 6700 loose objects by default
  (`gc.auto` configuration).
- Pack files are immutable once created. Repacking creates new packs.

### Batch Operation Performance

For storing many objects, use `git fast-import` instead of repeated
`hash-object` calls:

```bash
git fast-import <<EOF
blob
mark :1
data 5
hello
blob
mark :2
data 5
world
commit refs/heads/data
mark :3
committer Agent <a@b> 1706745600 +0000
data 12
bulk import
M 100644 :1 file1.txt
M 100644 :2 file2.txt
EOF
```

`fast-import` streams objects directly into a packfile, avoiding the overhead of
individual loose object creation. Orders of magnitude faster for bulk operations.

---

## Quick Reference: Common Recipes

### Store a key-value pair

```bash
blob=$(echo "$value" | git hash-object -w --stdin)
# Key is $blob (content-addressed) or store via refs:
git update-ref "refs/data/kv/$key" $(
  echo "$key=$blob" | git hash-object -w --stdin
)
```

### Build a tree (directory) from scratch

```bash
export GIT_INDEX_FILE=$(mktemp)
for file in file1.txt file2.txt; do
  sha=$(echo "content of $file" | git hash-object -w --stdin)
  git update-index --add --cacheinfo "100644,$sha,$file"
done
tree=$(git write-tree)
rm "$GIT_INDEX_FILE" && unset GIT_INDEX_FILE
echo "Tree: $tree"
```

### Build a tree without the index (mktree)

```bash
sha1=$(echo "content1" | git hash-object -w --stdin)
sha2=$(echo "content2" | git hash-object -w --stdin)
tree=$(printf '100644 blob %s\tfile1.txt\n100644 blob %s\tfile2.txt\n' \
  "$sha1" "$sha2" | git mktree)
```

### Create a commit chain

```bash
tree=$(...)  # build tree as above
c1=$(echo "first" | GIT_AUTHOR_NAME=A GIT_AUTHOR_EMAIL=a@b \
  GIT_COMMITTER_NAME=A GIT_COMMITTER_EMAIL=a@b git commit-tree $tree)
c2=$(echo "second" | GIT_AUTHOR_NAME=A GIT_AUTHOR_EMAIL=a@b \
  GIT_COMMITTER_NAME=A GIT_COMMITTER_EMAIL=a@b git commit-tree $tree -p $c1)
git update-ref refs/data/mychain $c2
```

### Atomic swap of two refs

```bash
git update-ref --stdin <<EOF
start
update refs/data/a $sha_for_b $current_a
update refs/data/b $sha_for_a $current_b
prepare
commit
EOF
```

### Enumerate all objects with type and size

```bash
git cat-file --batch-check='%(objectname) %(objecttype) %(objectsize)' \
  --batch-all-objects
```

### Read all entries from a tree

```bash
git ls-tree <tree-sha>
# Or recursively:
git ls-tree -r <tree-sha>
```

### Attach metadata to any object via notes

```bash
git notes --ref=metadata add -m '{"type":"user","id":123}' <object-sha>
git notes --ref=metadata show <object-sha>
```
