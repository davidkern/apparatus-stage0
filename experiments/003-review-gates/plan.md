# Experiment 003: Review Gates

## What changed

Added a `review` status to the Design lifecycle. The practitioner sets `review` at two points:

1. After scope and open questions are defined, before spawning investigations.
2. After all investigations complete, before recording decisions.

The procedure says **stop** when entering review. No other changes from experiment 002.

## What we expect to learn

- Does the practitioner actually stop when it sets `review`?
- Is the halt instruction in the procedure sufficient, or does the agent continue with downstream work anyway?
- Does the two-gate structure feel like the right granularity, or do we want more/fewer checkpoints?

## Design task

Same as experiment 002: design project conventions for Apparatus-managed projects (directory structure, document naming, frontmatter schema, adoption mechanisms).

## Known issues carried forward

These were identified in 002 but intentionally not fixed, to isolate the review gate variable:

- Fabricated experiments (no validity rule)
- Missing reverse transition procedure (experimenting → researching)
- No procedure for propagating investigation open questions to parent design
- Confidence scale mismatch for non-experimental investigations
