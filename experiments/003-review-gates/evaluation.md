# Evaluation: 003-review-gates

## Conditions

Apparatus at branch `003-review-gates`, commit `73c2560`. Single change from experiment 002: added `review` status to Design lifecycle with two gates and halt instructions. No other fixes applied (fabricated experiments, missing procedures, etc.) — intentionally isolated one variable.

## Primary finding: behavioral halt instructions are insufficient

The agent recognized the review gates, understood their intent, identified the single-actor deadlock, and reasoned past them. It performed a "self-review" and continued. This is not a disobedience — it's a rational response to an unresolvable instruction. The procedure said "until someone else changes its status" but there was no one else.

**The review gate concept is sound. The enforcement mechanism is wrong.** Procedural text in `apparatus.md` cannot stop an agent that has been given a task to complete. The halt must be structural: the runner terminates the session when the design enters `review`, and a separate process (script, human, orchestrator) inspects the state, toggles it, and starts a new session.

This means the stage 0 process requires a small amount of programmatic structure — the runner must be review-gate-aware. This is a new finding: `apparatus.md` alone is not sufficient for controlled execution; it needs a complementary runner that enforces lifecycle boundaries.

## Secondary findings

### Improved scoping (compared to 002)

The agent produced 14 files vs 21 in experiment 002. It deferred 3 of 5 questions (vs investigating all in 002). The same design task with the same apparatus produced tighter output. This may be due to the review gate text prompting more deliberate scoping (the agent knows it will be reviewed), or it may be model variance. Insufficient data to attribute causally.

### Fabricated experiments persist

Both experiments ("directory layout test" and "schema validation test") are fabricated — described but not executed. This was a known carried-forward issue. The review gate change did not address it and was not expected to.

### New friction points

Points 3-6 are new observations not seen in experiment 002:

- **Fragile ID assignment** (count vs max) — legitimate bug in the procedure.
- **Unanchored evidence paths** — a real gap; evidence refs need a defined root.
- **Inconsistent open-questions shape** — valid; the same field name means different things on Investigation vs Design.
- **Conflated investigation completion** — valid; the procedure requires an Investigation to reason about its siblings and parent.

Point 2 (underspecified transitions during spawning) is a consequence of the review gate addition — the `review → open → waiting` sequence has a vestigial intermediate state.

## New bootstrap assumption

| Assumption | Status | Invalidated if | Impact |
|------------|--------|----------------|--------|
| `apparatus.md` alone is sufficient for controlled execution | invalidated (003) | (already invalidated) | Stage 0 requires a runner that enforces review gates structurally |

## Changes for next experiment

**Must build**:
- A runner that terminates the practitioner session when a Design enters `review` status, and resumes after the status is changed externally. This is the minimum programmatic structure needed for stage 0.

**Must fix in apparatus.md** (carried forward from 002):
- Add experiment validity rule.
- Add reverse transition procedure (experimenting → researching).
- Add procedure for propagating investigation open questions to parent design.
- Fix ID assignment: "find the maximum existing ID, add 1" instead of "count existing files, add 1."

**Should consider**:
- Remove "someone else" language from review gates — describe the state semantics, not the enforcement mechanism.
- Simplify `review → open → waiting` transition sequence.
- Anchor evidence ref paths to a defined root.
- Clarify open-questions shape difference between Investigation and Design.
