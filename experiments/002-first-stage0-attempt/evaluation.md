# Evaluation: 002-first-stage0-attempt

*Predates formalized experiment procedure. Reconstructed from round 3 analysis.*

## Conditions

Apparatus at commit `88de6ea`: single `apparatus.md` (merged spec + infrastructure). No bootstrap document, no researcher notes visible to the agent. Agent given explicit scope statement and told to follow procedures literally.

## Structural success

The agent followed procedures and file structure correctly. 21 artifacts in the right places with correct frontmatter. All status transitions valid. The structural mechanics of apparatus.md work. The full forward flow executed: design → open questions → investigations → research/experiments → recommendations → decisions → complete.

## Critical failure: fabricated experiments

All three "experiments" are actually research. The Quarto frontmatter experiment claims "Python's frontmatter library successfully parsed a .qmd file" but the agent never ran Python. The JSON Schema experiment produced a schema but never validated anything against it. The manifest experiment designed a YAML file but never tested it in a real project.

Without the evidence rule "An Experiment must be executed, not merely analyzed," the agent couldn't distinguish experiments from research. The experiment/research distinction collapsed and the confidence scale became meaningless (three investigations got "high confidence" based on fabricated experiment results).

**This invalidates our assumption "Quality hypotheses can be deferred from stage 0."** At minimum, the experiment validity rule must be in the practitioner document.

## Over-scoping

The agent designed manifest files, JSON Schema with semantic versioning, and adoption mechanisms -- far beyond what the bootstrap needs. We had removed proportionality guidance ("depth of investigation should match importance of decision"). Without it, the agent treated all questions as equally worthy of full investigation.

## Procedure gaps confirmed

All five friction points reported by the agent are legitimate:

1. **Confidence scale assumes code execution** -- convention questions have no code to run, get penalized. The HDD-derived scale doesn't fit all question types.
2. **Multi-investigation tracking** -- procedure is technically correct but ambiguous about intermediate states.
3. **Open question propagation** -- no procedure for moving investigation open questions to the parent design.
4. **Reverse transition missing** -- experimenting → researching shown in state diagram but no procedure covers it.
5. **Cross-investigation coordination** -- no structural mechanism for overlapping territory.

## Researcher-only observations

- The agent completed all 4 investigations and all 5 decisions in a single pass. Real work involves back-and-forth. Procedures don't prevent this but don't guide iterative work.
- The agent created `research/` and `experiments/` subdirectories upfront for all investigations, even those that never got experiments. The procedure says to create both at investigation start, which creates empty structure.

## Changes for next attempt

**Must fix**:
- Add experiment validity rule to apparatus.md: "An Experiment must be executed, not merely analyzed."
- Add reverse transition procedure for experimenting → researching.
- Add procedure for propagating investigation open questions to parent design.

**Should consider**:
- Rethink confidence scale for non-experimental investigations.
- Add brief proportionality note.
- Create `experiments/` subdirectory only when needed, not at investigation start.

**Need more data**:
- Cross-investigation coordination. May be inherent to the model.
- Multi-investigation tracking. May just need a clarifying sentence.
