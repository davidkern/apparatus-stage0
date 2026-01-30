# Status: Post-003 Architecture Discussion

## The core problem

Experiment 003 proved that behavioral halt instructions don't work. The agent recognized review gates, identified the single-actor deadlock, performed self-review, and continued. This is rational behavior, not disobedience. The enforcement mechanism must be structural, not procedural.

**Key principle**: the agent is a good worker and a bad self-regulator. Asking it to be both is the source of the collapse. This generalizes beyond gates -- any behavior we need guaranteed should be structurally enforced, not instructionally requested.

## Architectural direction: three-component separation

### 1. State storage and history: git

Git is a content-addressable database with atomic transitions, history, branching, and validation hooks. Use it as the state management layer, not as a communication channel.

- Lifecycle state lives in the commit graph. Transitions are commits made by the runner, not the agent.
- Tight coupling between state and artifacts is inherent -- state IS the history of the artifact.
- Review gates: runner commits agent work with a tag/marker, pauses. After human approval, runner commits the transition and launches the next phase.
- Git hooks provide structural validation points (pre-commit, post-commit).
- Lower-level git primitives (refs, content-addressable storage) may offer additional capabilities worth exploring.

### 2. Practitioner API: Claude skills

Activity-oriented interface the practitioner calls to interact with the environment. The agent calls actions like "open-question" or "spawn-investigation" rather than writing state or structural files directly. The skill handles side effects (creating directories, registering state) and returns what the agent needs to continue.

- Precedent: investigation skill in gregarious (TODO: link gregarious repo for reference).
- Skills structurally bound what the agent can do. It can't invent new activity types if no skill exists for them. Adding a new type is a deliberate act by researchers, not agent improvisation.
- This addresses the experiment recipe problem: available experiment types = available skills. No skill, no experiment type.

### 3. Runner/orchestrator

Manages phases, launches practitioners, processes results, decides what happens next.

- Consumes git state to determine current phase and what work is needed.
- Launches practitioners with phase-scoped prompts ("you are in phase X, produce artifacts for phase X").
- After each phase: inspects working tree, validates, commits, transitions state.
- Batch model: agent works a phase to completion, runner processes between phases. No mid-session interception needed.
- Batch model is simpler AND is exactly the behavior we want -- prevents the agent from doing the full forward flow in one session.

### Design principles

- **Runner is sole writer of state.** Agent never writes lifecycle status. The agent produces content; the runner manages transitions.
- **Git is a database, not an API.** Don't use git as a communication channel (write files, poll for responses). Skills provide the real-time API.
- **Control plane grows based on evidence.** A behavior moves from agent-managed to runner-managed when experiments show the agent can't self-regulate it. Lifecycle gates: proven failure (003), pull into runner. File structure, scoping heuristics: unproven, leave with agent for now.
- **Prevention over detection.** Runs are expensive (~10 min, significant tokens). Don't let the agent do something wrong and catch it after; prevent structurally.

## Tensions identified (not yet resolved)

### Synthesis across phases
If the runner clears agent context between phases, we lose cross-cutting synthesis. Options: (a) don't clear context (conflicts with unit-testing goal), (b) summary artifact at phase boundaries (testable, explicit), (c) dedicated synthesis phase. Not urgent until runner exists.

### Project integration question
The practitioner keeps exploring how apparatus fits into a project repo. We need to provide enough structure to prevent this distraction without over-committing to a design we haven't validated. Explicitly a bootstrapping fiat decision -- revisit later with the actual process. Caution: over-specifying this now means it won't get revisited until the reflection loop matures.

### Experiment definition is slippery
The practitioner fabricates experiments (thought exercises, trivial filesystem checks). Two experiments across 002 and 003 confirm this. The skill-based architecture may address this (experiment types = available skills), but needs validation.

### Iteration speed (hard constraint)
Experiments take ~10 minutes and cost significant tokens. The phased runner + batch model should support "unit testing" -- set up mid-flight git state, run one phase, observe. This determines whether we can iterate fast enough to converge.

## Next steps

1. Link gregarious repo into this workspace for reference on the skill-based API pattern.
2. New session: experiment with and validate the three-component architecture against the gate enforcement problem from 003. Start with the smallest slice that proves the model.

## Path leakage fix (done)
Practitioner inferred "apparatus-stage0" project structure from its visible path and confabulated observations about the monorepo. Research repo moved to `/work/` -- practitioner now sees `/work/apparatus/` which leaks nothing.

## Apparatus.md fixes (carried forward, not yet applied)
- Add experiment validity rule: "An Experiment must be executed, not merely analyzed."
- Add reverse transition procedure (experimenting -> researching).
- Add procedure for propagating investigation open questions to parent design.
- Fix ID assignment: max existing ID + 1 instead of count.
