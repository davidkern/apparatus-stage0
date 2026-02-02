# Prior Art: Code Review Systems Using Git as Database

Research into two production systems that store code review data inside git repositories using git plumbing: Google's git-appraise (distributed, peer-to-peer) and Gerrit's NoteDb (centralized server, full migration from SQL to git).

## 1. git-appraise

**Repository**: https://github.com/google/git-appraise
**Language**: Go
**Architecture**: Fully distributed, no server. Review data travels with the repo via git push/fetch/merge.

### Ref namespace

All review data lives under `refs/notes/devtools/` with four sub-refs:

| Ref | Content | Annotates |
|-----|---------|-----------|
| `refs/notes/devtools/reviews` | Review requests | First commit in the review |
| `refs/notes/devtools/discuss` | Human comments | First commit in the review |
| `refs/notes/devtools/ci` | CI build/test results | The revision built/tested |
| `refs/notes/devtools/analyses` | Robot/static analysis comments | The revision analyzed |

Additionally, `refs/devtools/archives/reviews` stores archived (closed) reviews.

The `refs/notes/` prefix means these are git notes refs. Each ref is a notes tree: a mapping from annotated object SHA to note blob SHA, stored as a flat or fanout tree of blob objects.

### Git object model

The git plumbing usage is standard git notes:

- **Tree objects**: The notes ref points to a tree that maps `<annotated-commit-SHA>` to `<note-blob-SHA>`. For small numbers of notes, the tree is flat. For larger numbers, git uses a fanout directory structure (first 2 hex chars of the SHA as a directory).
- **Blob objects**: Each note is a blob containing one or more lines of JSON. Each JSON line is a single review datum.
- **Commit objects**: Each notes ref has its own commit history. Appending a note creates a new commit on the notes ref that updates the tree.

### Serialization format

Each datum is a **single line of JSON**. Multiple data items for the same annotated commit appear as multiple lines in the same note blob. This one-line-per-datum design is the foundation of the merge strategy.

All schemas include a `v` field (integer, defaults to 0) for format versioning.

**Review request schema** (`refs/notes/devtools/reviews`):
```json
{"timestamp":"1612137600","reviewRef":"refs/heads/feature","targetRef":"refs/heads/main","requester":"alice@example.com","reviewers":["bob@example.com"],"description":"Add feature X","baseCommit":"abc123...","v":0}
```

Fields:
- `timestamp` (required, string): 10-digit zero-padded seconds since Unix epoch
- `requester` (required, string): email/identity of requester
- `reviewRef` (string): git ref tracking the current revision under review
- `targetRef` (string): git ref to update once approved
- `reviewers` (array of strings): requested reviewers
- `description` (string): review description
- `baseCommit` (string): base commit for the review
- `alias` (string): post-rebase commit hash for the review
- `v` (integer, enum: [0]): metadata format version

Multiple requests for the same commit are sorted by timestamp; the last one wins. This allows updating a review by re-running the request command.

**Comment schema** (`refs/notes/devtools/discuss`):
```json
{"timestamp":"1612137700","author":"bob@example.com","parent":"<sha1-of-parent-comment>","location":{"commit":"def456","path":"src/main.go","range":{"startLine":10,"startColumn":1,"endLine":10,"endColumn":40}},"description":"This needs a nil check","resolved":false,"v":0}
```

Fields:
- `timestamp` (required, string): 10-digit zero-padded epoch seconds; placed first so lexicographic sort = chronological sort
- `author` (required, string): commenter identity; an optimization to avoid git-blame on the notes object
- `parent` (string): SHA1 hash of another comment on the same revision (threading)
- `original` (string): SHA1 hash of another comment this is an updated version of
- `location` (object): file/line/range targeting
  - `commit` (string): the specific commit
  - `path` (string): file path
  - `range` (object): `startLine`, `startColumn`, `endLine`, `endColumn`
- `description` (string): comment text
- `resolved` (boolean): true = no further action needed; when parent is a comment, means addressed; when parent is the commit, means change accepted
- `v` (integer): format version

**CI schema** (`refs/notes/devtools/ci`):
```json
{"timestamp":"1612138000","agent":"jenkins-ci","status":"success","url":"https://ci.example.com/build/123","v":0}
```

Fields:
- `timestamp` (required, string): 10-digit epoch seconds
- `agent` (required, string): identifies the build/test runner
- `status` (string, enum: "success" | "failure"): build outcome
- `url` (string): link to build results
- `v` (integer): format version

**Analysis schema** (`refs/notes/devtools/analyses`):
```json
{"timestamp":"1612138100","url":"https://analysis.example.com/results/456","status":"fyi","v":0}
```

Fields:
- `timestamp` (required, string): 10-digit epoch seconds
- `url` (required, string): publicly accessible URL with results conforming to ShipshapeResponse protobuf format
- `status` (string, enum: "lgtm" | "fyi" | "nmw"): overall status of analysis messages
- `v` (integer): format version

### Merge strategy: cat_sort_uniq

This is the critical design insight. git-appraise relies on the `cat_sort_uniq` notes merge strategy, which is built into git:

```
git notes --ref refs/notes/devtools/discuss merge origin/refs/notes/devtools/discuss -s cat_sort_uniq
```

The strategy works in three steps:
1. **cat** -- concatenate the local and remote versions of the note blob
2. **sort** -- sort all lines lexicographically
3. **uniq** -- deduplicate identical lines

Because each datum is exactly one JSON line, this means:
- Two reviewers independently adding comments: both comments appear (concat + dedup)
- Same comment pushed from two places: deduplicated automatically
- No merge conflicts ever -- the strategy is deterministic and conflict-free
- Timestamps are the first JSON field and are zero-padded to 10 digits, so lexicographic sort approximates chronological order

The merge strategy is configurable per-ref via `notes.<name>.mergeStrategy` in git config.

### Git plumbing commands used

From the Go source (`repository/git.go`):

```go
// Read a single note
git notes --ref <notesRef> show <revision>

// List all annotated objects
git notes --ref <notesRef> list

// Append to a note (creates or extends the blob)
git notes --ref <notesRef> append -m <json-line> <revision>

// Merge remote notes
git notes --ref <localRef> merge <remoteRef> -s cat_sort_uniq

// Push notes
git push <remote> <refspec>

// Fetch notes
git fetch <remote> refs/notes/*:refs/notes/*
```

### Design implications for apparatus

**What git-appraise gets right for our context:**
- Fully distributed, no server dependency
- Review data travels with fetch/push
- Conflict-free merge via format constraint (one JSON line per datum)
- Clean separation of concerns across four refs
- Append-only semantics -- new data is always appended, never overwritten
- The `cat_sort_uniq` insight: if you constrain your serialization format, git's built-in merge strategies can handle concurrent modifications without conflicts

**Limitations and differences:**
- Data model is flat (one JSON line per datum) -- works for review comments, but apparatus needs hierarchical structures
- No tree structure within notes -- everything is lines in a blob
- Notes annotate commits, so the data model is commit-centric -- apparatus data is not inherently commit-centric
- No transactional updates across multiple refs
- The archive ref (`refs/devtools/archives/reviews`) is a regular ref, not notes -- suggesting they hit a limit of the notes model for lifecycle management

---

## 2. Gerrit NoteDb

**Project**: https://www.gerritcodereview.com
**Source**: https://github.com/GerritCodeReview/gerrit
**Language**: Java (JGit)
**Architecture**: Centralized server, but storage is pure git. NoteDb replaced the SQL database (ReviewDb) as the sole storage backend starting with Gerrit 3.0.

### Ref namespace

Gerrit uses multiple custom ref namespaces across multiple repositories:

**In the project repository** (where code is reviewed):

| Ref pattern | Content |
|---|---|
| `refs/changes/YZ/XYZ/N` | Patch set N of change XYZ (the actual code commit) |
| `refs/changes/YZ/XYZ/meta` | NoteDb metadata DAG for change XYZ |
| `refs/meta/config` | Project configuration (access rules, labels, submit rules) |

Where YZ is the last two digits of the change number XYZ, providing a sharded directory structure for performance.

**In the All-Users repository** (special system-wide repo):

| Ref pattern | Content |
|---|---|
| `refs/users/CD/ABCD` | Per-user account data (preferences, SSH keys, etc.) |
| `refs/meta/external-ids` | Git notes mapping external identities to accounts |
| `refs/starred-changes/YY/XXXX/ZZZZZZZ` | User ZZZZZZZ's starred labels for change XXXX |
| `refs/draft-comments/YZ/XYZ/ACCOUNT` | Draft comments for change XYZ by account ACCOUNT |

### refs/meta/config: Project configuration as git

The `refs/meta/config` branch is a disconnected branch (no common ancestor with code branches) containing:

- **`project.config`**: git-config-style INI file with access rules, label definitions, submit requirements, and project settings. Organized by sections: `[access "refs/*"]`, `[label "Code-Review"]`, `[submit]`, `[receive]`, `[capability]`.
- **`groups`**: TSV file mapping group UUID to group name (allows group renaming without rewriting access rules).
- **`rules.pl`** (deprecated): Prolog rules for submit logic, replaced by submit requirements.
- **`<plugin>.config`**: Per-plugin configuration files.

This is versioned via normal git commits. Changes to project configuration can themselves go through code review by pushing to `refs/for/refs/meta/config`.

### NoteDb: The change metadata model

Each change's metadata is stored as a **linear DAG of commits** on `refs/changes/YZ/XYZ/meta`. Each commit in the DAG represents one event in the change's lifecycle.

#### Git object model

- **Commit objects**: The meta ref is a chain of commits. Each commit represents an atomic change event (new patchset, vote, comment, status change, etc.). The commit message encodes the event data using a structured footer format.
- **Tree objects**: Each commit has a tree. The tree contains a NoteMap -- a mapping from patchset commit SHAs to note blobs containing inline comments. For commits that don't modify inline comments, the tree may be empty or inherited.
- **Blob objects**: Two uses:
  1. Inline comment data stored as JSON blobs in the NoteMap (keyed by patchset commit SHA)
  2. The tree entries themselves

#### Commit message format

NoteDb meta commits use a structured format with three parts:

```
Update patch set <N>                              <- Subject line (machine-generated)

<optional change message / human-readable text>   <- Body (ChangeMessage content)

Patch-set: <N>                                    <- Footers begin here
Change-id: I<hash>
Subject: <original commit subject>
Branch: refs/heads/<branch>
Status: <new|merged|abandoned>
Topic: <topic-name>
Label: <Label-Name>=<+/-value>
Copied-Label: <Label-Name>=<value>
Reviewer: <identity>
CC: <identity>
Hashtags: <tag>
Custom-Keyed-Value: <key>=<value>
Tag: <tag>
Groups: <group-uuid>
Submission-id: <id>
Submitted-with: <result>
Private: <true|false>
Work-in-progress: <true|false>
Revert-of: <change-number>
Cherry-pick-of: <change,patchset>
Real-user: <identity>
Attention: <json-payload>
Patch-set-description: <text>
Current: <true|false>
Commit: <sha>
Base: <sha>
Contains-Conflicts: <true|false>
Merge-Strategy: <name>
Ours: <sha>
Theirs: <sha>
No-Base-Reason: <text>
```

The complete set of footer keys (from `ChangeNoteFooters.java`):

| Footer Key | String Value | Purpose |
|---|---|---|
| FOOTER_ATTENTION | `Attention` | Attention set updates with reasons |
| FOOTER_BASE | `Base` | Base commit reference |
| FOOTER_BRANCH | `Branch` | Target branch |
| FOOTER_CHANGE_ID | `Change-id` | Gerrit Change-Id |
| FOOTER_COMMIT | `Commit` | Patchset commit SHA |
| FOOTER_CONTAINS_CONFLICTS | `Contains-Conflicts` | Merge conflict indicator |
| FOOTER_CURRENT | `Current` | Whether this is the current patchset |
| FOOTER_CUSTOM_KEYED_VALUE | `Custom-Keyed-Value` | Plugin/custom key-value pairs |
| FOOTER_GROUPS | `Groups` | Group associations |
| FOOTER_HASHTAGS | `Hashtags` | Change hashtags |
| FOOTER_LABEL | `Label` | Vote/approval (e.g., `Code-Review=+2`) |
| FOOTER_COPIED_LABEL | `Copied-Label` | Copied vote from previous patchset |
| FOOTER_MERGE_STRATEGY | `Merge-Strategy` | Strategy used for merge |
| FOOTER_NO_BASE_REASON | `No-Base-Reason` | Why no base exists |
| FOOTER_OURS | `Ours` | "Our" side in merge |
| FOOTER_PATCH_SET | `Patch-set` | Patchset number this event applies to |
| FOOTER_PATCH_SET_DESCRIPTION | `Patch-set-description` | Description of the patchset |
| FOOTER_PRIVATE | `Private` | Private change flag |
| FOOTER_REAL_USER | `Real-user` | Actual user when impersonating |
| FOOTER_STATUS | `Status` | Change status (new, merged, abandoned) |
| FOOTER_SUBJECT | `Subject` | Change subject line |
| FOOTER_SUBMISSION_ID | `Submission-id` | Submission identifier |
| FOOTER_SUBMITTED_WITH | `Submitted-with` | Submit rule evaluation results |
| FOOTER_TOPIC | `Topic` | Change topic |
| FOOTER_TAG | `Tag` | Operational tag |
| FOOTER_THEIRS | `Theirs` | "Their" side in merge |
| FOOTER_WORK_IN_PROGRESS | `Work-in-progress` | WIP flag |
| FOOTER_REVERT_OF | `Revert-of` | Change this reverts |
| FOOTER_CHERRY_PICK_OF | `Cherry-pick-of` | Change this cherry-picks |

#### Example meta commit sequence

First commit (change creation):
```
Update patch set 1

Uploaded patch set 1.

Patch-set: 1
Change-id: Iabc123def456
Subject: Fix the widget parser
Branch: refs/heads/main
Status: new
```

Code review vote:
```
Update patch set 1

Patch Set 1: Code-Review+2

Patch-set: 1
Label: Code-Review=+2
```

Change submitted:
```
Update patch set 1

Change has been successfully merged

Patch-set: 1
Status: merged
Submission-id: 12345-abc
Submitted-with: OK
```

### Inline comments: NoteMap with JSON blobs

Inline comments (PatchLineComments) are stored as **git notes within the meta commit's tree**, using JGit's NoteMap structure:

- The **key** is the SHA-1 of the patchset commit that the comment applies to
- The **value** is a JSON blob containing a `ChangeRevisionNoteData` object

The JSON blob is serialized via Gson and contains:
```json
{
  "comments": [
    {
      "key": {"uuid": "...", "filename": "src/main.go", "patchSetId": 1},
      "lineNbr": 42,
      "author": {"id": 1000123},
      "writtenOn": "2024-01-15T10:30:00Z",
      "message": "This needs a nil check",
      "range": {"startLine": 42, "startChar": 0, "endLine": 42, "endChar": 40},
      "revId": "abc123...",
      "serverId": "gerrit-1",
      "unresolved": true
    }
  ],
  "pushCert": null,
  "submitRequirementResults": [...]
}
```

**Draft comments** are stored separately in the All-Users repository under `refs/draft-comments/YZ/XYZ/ACCOUNT`, using the same JSON format but isolated per-user.

### Account data: Per-user git branches

Each user's data lives on `refs/users/CD/ABCD` in All-Users (where CD/ABCD is the sharded account ID, e.g., `refs/users/56/1000856`). The branch contains git-config-style files:

- `account.config` -- account properties (name, email, status, inactive flag)
- `preferences.config` -- UI/diff/edit preferences
- `watch.config` -- project watch notifications
- `authorized_keys` -- SSH public keys (OpenSSH format)

### External IDs: Git notes with config-file blobs

`refs/meta/external-ids` in All-Users is a git notes branch where:
- **Key**: SHA1 of the external ID string (e.g., SHA1 of `"username:jdoe"`)
- **Value**: Blob in git-config format:
```ini
[externalId "username:jdoe"]
  accountId = 1003407
  email = jdoe@example.com
  password = bcrypt:...
```

The SHA1-as-key ensures uniqueness -- an external ID can only map to one account.

### Starred changes: Ref-per-tuple with label blobs

`refs/starred-changes/YY/XXXX/ZZZZZZZ` in All-Users (sharded change ID / account ID) points to a blob containing one label per line (UTF-8 text).

### Merge and consistency model

Gerrit's approach to concurrent modifications differs fundamentally from git-appraise:

- **Server-mediated**: All writes go through the Gerrit server, which serializes access. No client-side merge needed during normal operation.
- **Meta ref rebasing**: When the server detects a concurrent modification to a meta ref, it rebases the new commit onto the current tip rather than creating merge commits. This keeps the meta DAG linear.
- **Replication**: NoteDb data replicates via standard git replication (push mirroring). The meta refs are ordinary git refs and travel with the repository.
- **No merge conflicts by design**: Since each meta commit is a complete event record (not a diff), and the server serializes writes, merge conflicts in the traditional sense don't arise. If two events happen concurrently, one is rebased on top of the other.
- **Lazy comment parsing**: The server lazily parses NoteMap comment blobs to avoid reading full inline comment data when only commit-level metadata is needed.

### Performance considerations

Gerrit's developers identified and addressed several git-specific performance challenges:

- **Ref sharding**: `refs/changes/YZ/XYZ/...` uses the last two digits of the change number as a fanout directory, distributing refs across ~100 subdirectories.
- **Separate pack files**: JGit can pack NoteDb refs separately from code refs to avoid hurting locality within the main pack file. NoteDb metadata commits are spread across many disconnected DAGs, so clustering commits by DAG improves buffer cache performance.
- **Account ID sharding**: `refs/users/CD/ABCD` similarly shards account refs.

---

## Comparative analysis

### Serialization strategies

| Aspect | git-appraise | Gerrit NoteDb |
|---|---|---|
| **Primary format** | Single-line JSON per datum | Git commit footers (key-value) + JSON for comments |
| **Why that format** | Enables cat_sort_uniq merge | Commit messages are human-readable audit log; JSON for structured data |
| **Schema evolution** | `v` field in each JSON line | Footer keys are extensible; plugins add new footers |
| **Structured data** | Flat JSON lines | Hierarchical: commit message for events, NoteMap for comments, trees for structure |

### Ref patterns

| Aspect | git-appraise | Gerrit NoteDb |
|---|---|---|
| **Namespace** | `refs/notes/devtools/*` | `refs/changes/*`, `refs/meta/*`, `refs/users/*`, etc. |
| **Sharding** | None (git notes handles fanout internally) | Explicit 2-digit sharding in ref names |
| **Scope** | Single repo | Multiple repos (project repo + All-Users + All-Projects) |
| **Notes vs. refs** | Pure git notes (4 notes refs) | Mix: regular refs for patchsets, notes-like structure in meta commit trees |

### Merge strategies

| Aspect | git-appraise | Gerrit NoteDb |
|---|---|---|
| **Concurrency model** | Peer-to-peer, anyone can write | Server-serialized, single writer |
| **Conflict resolution** | cat_sort_uniq (automatic, format-constrained) | Server-side rebase of meta commits |
| **Data loss risk** | None (all lines preserved) | None (events are rebased, not merged) |
| **Offline capability** | Full (merge on reconnect) | Limited (server mediates all writes) |

### What each teaches us

**From git-appraise**: Format-constrained serialization enables conflict-free distributed merge. If your data model can be expressed as append-only lines, `cat_sort_uniq` is a zero-configuration distributed merge strategy built into git. The cost is that your data model must be flat -- no hierarchical structure within a single note blob.

**From Gerrit NoteDb**: Git commits are a natural audit log. Using commit messages with structured footers gives human-readable history (`git log` on the meta ref shows the full lifecycle of a change) while remaining machine-parseable. The tree attached to each commit can carry additional structured data (like the NoteMap for comments). The cost is that you need a serialization layer to write and parse the commit footers.

**From both**: Custom ref namespaces work in production at scale. Neither system uses `refs/heads/` or `refs/tags/` for metadata. Gerrit's ref sharding pattern (`refs/changes/YZ/XYZ/...`) is a proven approach for repositories with tens of thousands of changes. Both systems treat git as a database, not as a version control system for files -- neither creates a working tree from these refs.

### Relevance to apparatus design

The apparatus design sits between these two approaches:

- Like git-appraise, it needs to work distributed (apparatus data travels with the repo).
- Like Gerrit NoteDb, it needs hierarchical structure (investigations contain entries contain findings, not flat comment streams).
- Like Gerrit's commit footers, the apparatus metadata contract (id, type, status, schema-version, created-at) maps naturally to a commit-based audit log.
- Like git-appraise, it needs conflict-free merge for concurrent modifications (two practitioners working on the same apparatus store).

The apparatus design's use of `git update-ref --stdin` for atomic multi-ref transactions is a capability neither system uses -- git-appraise updates one notes ref at a time, and Gerrit uses JGit's RefUpdate API (which does support batching, but the NoteDb format doesn't require cross-ref atomicity since each change's metadata is self-contained in its own ref).
