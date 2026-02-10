# Researcher Observations

Observations on the experimental track. Not shared with practitioner.

## Goals

1. **Scale resilience**: Can traceability prevent context collapse as implementation grows?
2. **Process capture**: What implementation-from-design process emerges?

## Observation template

```
### [timestamp or commit]

**Context**: What practitioner was doing

**Trace behavior**:
- Did they add traces? Where? What granularity?
- Did they hit "no decision covers this"?
- Accuracy: Do I agree with their trace assignments?

**Process friction**:
- Where did they not know what to do?
- What did the design not tell them?

**Surprising effectiveness**:
- What worked better than expected?

**Notes**:
```

## Recommendations

### Observation priorities

- Note the first time they add a trace unprompted vs. after reminder — tells you how natural it feels
- Watch granularity: do they trace at module level, function level, or finer?
- The "implementation choice" comments are particularly valuable — each one signals a potential decision gap

### Resist early intervention

- When you see friction, note it before fixing it
- Let them make trace assignment errors if they happen — accuracy data is useful
- If they forget to trace entirely for a stretch, that's data too

### Checkpoint moments

- Natural pause points (commit, milestone, stuck) are good for quick retrospective prompts
- "What decision was hardest to trace to?" can surface gaps

  Your observation log

- Timestamp entries so you can correlate with commits
- A quick note is better than a perfect note — you can elaborate later

---

## Observations

(Entries below as session progresses)
