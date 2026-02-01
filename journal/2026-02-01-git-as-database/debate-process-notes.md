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

### Drafting process asymmetry

The researcher used an agent-assisted process for their composition position: wrote initial thoughts, had an agent read them, then guided the agent through edits and clarifications. This is a legitimate approach — the goal is the strongest argument, not a writing test — but it reveals a protocol asymmetry.

- **Association**: single-shot agent, primer only, no iteration or human steering
- **Composition**: iterative human-agent collaboration with multiple rounds of refinement

The composition argument may be stronger due to drafting process quality rather than position strength. In a formal protocol, both sides should use the same drafting method, or the asymmetry should be explicitly accepted and noted when evaluating results.

This also surfaces a broader question for the protocol design: what is the role of the human in a machine-argued position? If the human steers the argument, it's their argument in the agent's prose — which is the intended use. But if the other side has no equivalent steering, the playing field is uneven in a way that isn't about the merits of the positions.

### Protocol terminated early

Researcher called termination after position-writing, before exchange and rebuttal. Reasoning: time-consuming process, diminishing returns, positions capture the core arguments. The positions are the most valuable output — they force each side to construct a coherent argument. Rebuttals sharpen edges but the core is on paper.

This is a data point for protocol design: the full four-phase protocol (positions → exchange → rebuttals → evaluation) may be too heavyweight for an informal design debate. A lighter variant: positions only, followed by joint evaluation, with rebuttals available as an optional escalation if the positions don't resolve the question.

### Position writing completed

Both positions written and saved:
- `composition/position.md` — researcher-directed, agent-assisted
- `association/position.md` — single-shot fresh agent from primer only

Coordinator (originating agent) now reads both and facilitates joint evaluation with researcher.

### Rebuttal phase (added back, lighter variant)

After initial evaluation of positions, researcher noted they started coming around to composition while writing the opposing argument — the opposite-to-inclination assignment produced genuine perspective shift, which is evidence the protocol works.

Both sides had strong arguments the other hadn't fully addressed. Rather than skip rebuttals entirely, we opted for a lighter variant: two fresh agents run in parallel, each receiving only the primer + their position + opponent's position. No human steering, no iteration. Symmetric process this time (both single-shot agents from the same materials).

Artifacts: `composition/rebuttal.md`, `association/rebuttal.md`

Both rebuttals completed. Key development: the rebuttals converged on identifying the disagreement as ontological rather than technical. Composition's rebuttal frames it explicitly: "Do knowledge artifacts have intrinsic identity independent of context, or is context constitutive of identity?" Both sides agree that the technical consequences (versioning, provisioning, queries) follow from this ontological choice.

Notable rebuttal moves:
- **Composition** introduced the data-model/query-model separation as a structural critique of association's "the data model is the query model" claim. Argues for a system-layer index as a necessary companion to composition, not an afterthought.
- **Composition** reframed cross-container references as "citations" — data owned by the citing structure, not live pointers — arguing this is neither duplication nor association.
- **Association** conceded the four-primitive substrate is compatible with both models, then argued this undermines composition's claim to substrate stability as a differentiator.
- **Association** attacked the investigation-inside-design move as "redefinition not resolution" — even granting it, the journal-to-investigation cross-structural relationship remains.
- **Association** argued that composition's assumption-context argument undermines itself: if assumptions are independent copies with no shared identity, the system cannot help locate all copies when the underlying fact changes.

### Researcher observation: perspective shift during position-writing

The researcher reported being initially opposed to composition but coming around to it while constructing the argument. This is a key finding about the protocol: arguing a position forces engagement with its internal logic in a way that evaluating it from outside does not. The opposite-to-inclination assignment isn't just about fairness — it's an epistemic tool that generates understanding the evaluator wouldn't otherwise have.

## Process findings

What we learned about the adversarial position-taking protocol as a methodology, independent of the design content.

### What worked

1. **Opposite-to-inclination assignment produces perspective shift.** The researcher came around to composition while arguing it — the position they initially opposed. This is the protocol's primary epistemic contribution: forcing engagement with a position's internal logic generates understanding that evaluating from outside does not. The discomfort is productive.

2. **Fresh agents produce genuinely independent arguments.** The association position and rebuttal introduced concepts (semantic fidelity, "you have association whether you call it that or not," graph-as-domain-model) that were not in the originating conversation. Hermetic sessions prevent convergence and produce orthogonal challenge — directly addressing the retrospective's identified failure modes.

3. **The primer review round caught real bias.** Two independent reviewers found different issues, some in opposite directions. The revision produced a meaningfully more neutral document. Without the review, the association side would have been structurally disadvantaged.

4. **Structured tension points prevented talking past.** Both sides had to address the same concrete scenarios, making the positions directly comparable. The researcher flagged these as "leading" but accepted them as necessary for actionable output. This tradeoff is correct.

5. **The protocol produced design findings independent of resolution.** The three-layer architecture, data/query separation, and citation mechanism emerged from the debate itself and are valuable regardless of which side wins. The protocol generates knowledge even when it doesn't produce a decision.

### What didn't work

1. **The full protocol is too heavyweight for informal use.** Four phases (positions → exchange → rebuttals → evaluation) consumed significant time. Rebuttals were nearly cut entirely. For informal design debates, positions + joint evaluation may be sufficient, with rebuttals as optional escalation.

2. **Tool interface creates contamination vectors.** The Task tool returns summaries automatically. The originating agent was exposed to the association position summary before the exchange phase, and the researcher was nearly exposed to it during the primer review. In a formal protocol, the coordinator must not receive outputs until all sides are complete. This requires either suppressed summaries or a collection mechanism that buffers outputs.

3. **Drafting process asymmetry.** The researcher used iterative human-agent collaboration; the association side was single-shot. The composition argument may be stronger due to process quality rather than position strength. A formal protocol should either standardize the drafting method or explicitly accept the asymmetry.

4. **No termination criteria for review cycles.** The primer review could have iterated indefinitely. We resolved this informally (single round, originating agent judges). A formal protocol needs: max review rounds, judge criteria, "good enough" threshold, conflict resolution procedure.

5. **Coordinator neutrality is compromised by exposure.** The originating agent participated in the pre-debate discussion (where both sides' intuitions were expressed), then read both positions and summaries. True coordinator neutrality would require a fresh agent for evaluation, but this adds cost.

### What we would do differently

1. **Lighter default, heavier escalation.** Default protocol: primer → positions → joint evaluation. Escalate to rebuttals only if positions don't resolve or the evaluator identifies specific unaddressed arguments.

2. **Symmetric drafting.** Either both sides use single-shot agents, or both use iterative human-agent collaboration. The choice depends on whether the protocol's goal is to test position strength or to produce the strongest arguments.

3. **Buffered output collection.** The coordinator launches both position agents and only reads results after both signal completion. No summaries in the conversation until the exchange phase.

4. **Separate coordinator from facilitator.** The facilitator (originating agent in this case) manages logistics. A fresh coordinator agent reads all artifacts cold and facilitates evaluation. This addresses the neutrality problem.

5. **Explicit "experiment indicated" exit.** When a debate reduces to an undecidable modeling choice (as this one did), the protocol should have a named exit: "this question is not resolvable by argument; experimental resolution indicated." This prevents additional rounds of increasingly refined but ultimately circular argumentation.

### Protocol as investigation protocol type

This exercise informally prototyped a new investigation protocol type. In the apparatus protocol catalog naming from the triad design plan, this would be something like `experiment-debate` or `experiment-adversarial`:

- **What "doing it" means**: two agents argue committed positions from shared evidence, with structured exchange
- **What outputs it produces**: position statements, rebuttals, and a set of findings (both domain findings and unresolved tensions suitable for experimental follow-up)
- **What tool permissions it needs**: file read/write for artifacts, agent launching for hermetic sessions
- **When to use it**: when a design question has a small number of options with deep implications, and argument can surface the structure of the disagreement even if it can't resolve it
- **When not to use it**: when the question is empirically testable without first needing to understand the shape of the tradeoff space (just run the experiment directly)

The protocol's distinctive value is that it generates understanding of *why* a question is hard, not just *which answer is better*. The containment debate produced the ontological framing (identity vs. context) and the three-layer architecture — neither of which would have emerged from direct experimentation.
