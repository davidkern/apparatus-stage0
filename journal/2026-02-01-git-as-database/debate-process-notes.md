# Containment debate: process notes

Notes on the adversarial position-taking protocol as we execute it. To be used as input for a future investigation protocol design.

## Protocol design

### Motivation

From retrospective analysis of prior collaboration sessions, two failure modes were identified:

1. **Fast convergence** — collaborator extends and refines the researcher's framings rather than stress-testing them. The most important insights come from orthogonal challenge, not from agreement.
2. **Conceptual origination skew** — the researcher originates most conceptual direction; the collaborator contributes refinements. In a design debate, this means the space isn't actually explored.

The adversarial protocol addresses both by committing each participant to a position opposite their natural inclination and requiring independent argument before exchange.

### Structure

1. **Shared priming document** — neutral problem statement, behavioral requirements, evaluation criteria, specific tension points both sides must address. Reviewed by both participants and a fresh agent for neutrality before proceeding.
2. **Independent position statements** — each side writes from the primer alone, without seeing the other's argument. Researcher argues composition (against natural lean toward association). Fresh agent argues association (against the originating agent's lean toward composition).
3. **Exchange and rebuttals** — each side reads the other's position and writes a rebuttal, engaging with the strongest points.
4. **Joint evaluation** — researcher and originating agent reconvene, read all four documents (two positions, two rebuttals), and evaluate against the criteria. Decision is jointly made, informed by arguments but not bound by who "won."

### Design decisions made during setup

- **Hermetic sessions**: fresh agent for position statement prevents convergence from shared conversation context.
- **Opposite-to-inclination assignment**: researcher argues composition (would naturally prefer association); fresh agent argues association (originating agent leaned toward composition). Forces both sides to do the harder thinking.
- **Fresh agent also reviews primer**: symmetrical fairness check. Both the researcher and an independent agent verify the primer is neutral before positions are written.
- **Position statement structure prescribed**: five sections (core argument, tension points, acknowledge opposition, evaluation criteria, consequences). Ensures both sides cover the same ground and can be compared directly.

## Execution log

### Primer drafting
- Originating agent drafted primer from exploration notes, stripping editorial commentary
- Primer sent to both researcher and fresh agent for neutrality review

### Primer neutrality review

**Association reviewer** (fresh agent) — assessed moderate bias toward composition (60/40):
- Asymmetric language: composition gets punchy framing, association gets work-framed descriptions
- Containment vocabulary ("contains," "within") used throughout neutral structure descriptions
- Composition-favorable prior art (gregarious "mature" investigation skill) with no association counterpart
- Composition always described first in tension points (anchoring effect)
- Conditional hedging on association ("could be") but not composition ("are")
- Full review: `association/primer-review.md`

**Composition reviewer** (researcher) — identified different issues:
- Gregarious reference: priming a particular solution, irrelevant external system
- Cross-structural relationships section: biased toward association by describing linkages using loaded terms that pre-define representation. Should use behavioral framing.
- "Snapshot of existing state" in instantiation: biased toward composition. Should use behavioral framing.
- Evaluation criteria: too constraining. Each position should argue from qualities it considers important, not be forced into a priori justification framework.
- Tension points: leading, but may be unavoidable for actionable output.
- "Your task" section: advocates should not be asked to expose their own weaknesses — that's the designer's role post-debate.
- Full review: `composition/primer-review.md`

**Notable divergence**: the two reviewers found bias in opposite directions on specific points (cross-structural relationships: researcher found association bias, agent found composition bias). This suggests the primer is closer to neutral than either review alone indicates, but has localized biases in different directions.

### Process observation: contamination via tool output

The originating agent's summary of the fresh agent's review was displayed to the researcher before the researcher finished their own review. The researcher caught this and stopped reading after the phrase "The fresh agent" — the only contamination was exposure to the term "confirmation bias" which the researcher assessed as minimal and acceptable for an informal protocol attempt.

**Implication for protocol design**: the tool interface (Task tool returning summaries) creates an unavoidable contamination vector. In a formal version of this protocol, the fresh agent's review should be written to a file that the originating agent reads *after* the researcher has submitted their review. The originating agent should not summarize it in the conversation. Alternatively, both reviews could be collected by a coordinator agent that neither debater interacts with directly.

### Artifacts reorganized
- Created `composition/` and `association/` subdirectories
- Each position's artifacts (reviews, position statements, rebuttals) go in their respective directory
- Shared artifacts (primer, process notes) stay at the parent level

### Meta-observation: process reveals data storage requirements

The researcher observed that this process is itself informative about the data storage requirements we're designing for. We are experiencing the need for:

- **Immutability**: the original primer must be preserved as a historical artifact, even though we need a revised version. Without commits to track edits, we must treat produced artifacts as read-only by convention.
- **Append-only record**: process notes capture the sequence of events. Earlier entries cannot be revised in light of later developments — they are the record of what was known and decided at each point.
- **Provenance**: knowing which version of the primer each reviewer saw, and what contamination occurred between reviews, matters for interpreting the results.
- **Role-based access**: the researcher cannot participate in primer revision because they are a debate participant. The originating agent must exercise independent judgment. This is an access policy constraint arising from the protocol, not from the data.

This is the recursive property in action: the apparatus is needed to build the apparatus. We are manually enforcing (by convention and discipline) exactly the invariants that the data storage layer should enforce structurally.

### Primer revision: role separation

The researcher explicitly delegated primer revision to the originating agent, noting that as a debate participant they cannot fairly influence the shared evidence base. This is correct — the primer is the "ground rules" and must be set by a non-participant.

The originating agent's role during this debate:
- **Before position-writing**: primer author and editor (non-participant). Sole authority on primer revisions.
- **During position-writing**: not involved. Fresh agent writes association; researcher writes composition.
- **After position-writing**: coordinator for exchange and evaluation. Reads both positions, facilitates rebuttals, supports joint evaluation.

This role separation was not pre-planned — it emerged from the researcher's observation that consulting them on primer changes would be unfair. It is a structural finding about the protocol.

### Role-swap observation

The researcher noted that both participants are being stretched uncomfortably by the opposite-to-inclination assignment, and that this directly addresses the convergence and origination-skew problems identified in the retrospective. The discomfort is the point — it indicates genuine cognitive work rather than fluent elaboration of a pre-existing position.

### Primer revision approach

Original primer preserved as `containment-debate-primer-v1.md`. Revised primer will be `containment-debate-primer.md` (the working version both debaters receive).

Revision decisions (originating agent's independent judgment, incorporating both reviews):

1. **Remove gregarious reference** — both reviewers flagged it. One called it composition-priming, the other called it an irrelevant external system. Consensus: remove.
2. **Remove evaluation criteria section** — researcher's point that each position should argue from qualities it considers important is well-taken. Prescribed criteria constrain the argument space and may privilege whichever option aligns more naturally with the criteria's framing. Criteria belong to the evaluator (joint evaluation phase), not to the debaters. The agent reviewer's specific feedback about criteria wording becomes moot if the section is removed.
3. **Reframe cross-structural relationships behaviorally** — researcher flagged that terms like "decisions reference investigations" pre-define representation. Rewrite to describe what the system *does* (a design uses evidence from an investigation to support a decision) rather than how objects relate (decisions reference investigations).
4. **Reframe instantiation behaviorally** — "snapshot of existing state" presupposes copying. Rewrite to describe the behavior (create an independent working environment with a controlled initial state).
5. **Balance option descriptions** — agent reviewer flagged asymmetric vividness. Make both descriptions parallel in structure and implied effort.
6. **Alternate tension point ordering** — agent reviewer flagged composition-first anchoring. Alternate which option is described first.
7. **Remove "acknowledge weaknesses" from task instructions** — researcher's point that this is the evaluator's role, not the advocate's.
8. **Scrub loaded vocabulary from neutral sections** — replace containment verbs in structure descriptions, remove conditional hedging asymmetry from tension points.
9. **Retain tension points** — researcher found them leading but "may be unavoidable to ensure positions produce actionable knowledge." Agreed: without specific points to address, positions may talk past each other. Keep but reframe neutrally.

### Primer revision completed

Original preserved as `containment-debate-primer-v1.md`. Revised version is `containment-debate-primer.md`.

Changes made in v2:
- Removed gregarious reference entirely
- Removed evaluation criteria section — debaters argue from whatever qualities they consider important
- Rewrote cross-structural relationships section as "behavioral linkages" using action verbs ("spawns," "describe," "use") instead of representation verbs ("reference," "contain")
- Rewrote instantiation section behaviorally — "creating independent working environments with controlled initial states" instead of "snapshot of existing state"
- Added explicit note that both options can achieve hermetic isolation
- Balanced option descriptions — parallel structure, equal concreteness
- Rewrote tension points in neutral language — removed conditional hedging asymmetry, described both options' territory without favoring either
- Alternated ordering in tension points (no longer composition-first throughout)
- Removed "acknowledge weaknesses" from task instructions
- Task section reduced to four requirements: core argument, tension points, self-selected evaluation criteria, consequences

Awaiting researcher approval of revised primer before launching position-writing phase.

### Primer review loop: process observation

Researcher noted that the review-revise cycle has no termination criteria — it could repeat indefinitely or remain in conflict without procedure. For a formal protocol, this needs:
- Maximum number of review rounds
- Criteria for the judge (originating agent in this case) to accept or override reviewer feedback
- A defined "good enough" threshold — the primer need not be perfect, just fair enough that neither side is structurally disadvantaged
- Conflict resolution when reviewers disagree (as happened here — the two reviews found bias in opposite directions on specific points)

For this informal attempt, we resolved it with a single review round from each side, originating agent as sole judge of revisions, and researcher confirmation of the final version.

### Position-writing phase

- **Confirmed assignments**: researcher argues composition, fresh agent argues association
- **Artifacts**: `composition/position.md` (researcher), `association/position.md` (fresh agent)
- **Independence**: researcher writes without seeing association position. Fresh agent receives only the primer and task instructions — no conversation context.
- **Parallel execution**: fresh agent launched in background while researcher writes.
- **Completion signal**: researcher indicates when composition position is done. Agent position checked via background task output.

### Contamination observation: task completion summaries

The Task tool automatically returns a summary of the completed agent's work. This means the originating agent (coordinator role) was exposed to a summary of the association position before the exchange phase. This is the second instance of the contamination vector (first was during primer review).

For this informal attempt: the originating agent's role during position-writing is coordinator, not participant — it does not write either position. The contamination affects the coordinator's neutrality during the evaluation phase, not the independence of the positions themselves. The researcher remains uncontaminated.

For a formal protocol: the coordinator should not receive position summaries until both sides are complete and the exchange phase begins. This requires either (a) a task mechanism that suppresses output summaries, or (b) a coordinator that launches both tasks and only reads results after both complete.
