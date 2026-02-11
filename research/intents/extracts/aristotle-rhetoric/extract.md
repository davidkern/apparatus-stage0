# Intents from Aristotle's Rhetoric

This document explores communicative intents derived from Aristotle's *Rhetoric*,
focusing on purposes that extend beyond the provisional categories in our framework.

## Sources

Research drawn from:
- [Stanford Encyclopedia of Philosophy: Aristotle's Rhetoric](https://plato.stanford.edu/entries/aristotle-rhetoric/)
- [Wikipedia: Modes of Persuasion](https://en.wikipedia.org/wiki/Modes_of_persuasion)
- [Wikipedia: Rhetoric (Aristotle)](https://en.wikipedia.org/wiki/Rhetoric_(Aristotle))
- [Purdue OWL: Classical Argument](https://owl.purdue.edu/owl/general_writing/academic_writing/historical_perspectives_on_argumentation/classical_argument.html)
- [BYU Rhetoric: Branches of Oratory](https://rhetoric.byu.edu/Branches%20of%20Oratory/Branches%20of%20Oratory.htm)

---

## New Intent Category: Persuasive

Aristotle's framework reveals a category missing from our taxonomy: intents
whose purpose is to move the audience toward a position, action, or emotional
state. While "Instruction" tells what to do, **Persuasive** intents aim to
change belief or disposition.

### Intent: Exhortation

**Definition**: Urging the audience toward a future action by presenting it
as advantageous, beneficial, or good.

**Semantic Purpose**: The author wants the audience to commit to doing
something. Unlike Command (immediate imperative) or Suggestion (soft
recommendation), Exhortation argues for why the action serves the
audience's interests.

**Examples**:
- "You should adopt this architecture because it will reduce your maintenance
  burden and improve reliability."
- "Consider switching to the new API before the deprecation deadline."
- Political speeches urging citizens to vote, volunteer, or support a cause.

**Containment**:
- Contains: Claim+Evidence (often includes reasons)
- Contained by: Deliberative discourse

**Relationship to Existing Categories**: Related to Instruction/Suggestion
but distinct. Suggestion presents an option; Exhortation argues for it.

---

### Intent: Dissuasion

**Definition**: Urging the audience away from a future action by presenting
it as harmful, disadvantageous, or imprudent.

**Semantic Purpose**: The author wants the audience to refrain from or
abandon a course of action.

**Examples**:
- "Avoid using mutable global state in this module—it will create race
  conditions."
- "Don't upgrade to the beta version in production environments."
- Security warnings about risky configurations.

**Containment**:
- Contains: Warning (often), Claim+Evidence
- Contained by: Deliberative discourse

**Relationship to Existing Categories**: Overlaps with Warning but is broader.
Warning alerts to danger; Dissuasion argues against a course of action
(which may or may not involve danger).

---

### Intent: Accusation

**Definition**: Attributing wrongdoing, fault, or responsibility for a past
harmful event.

**Semantic Purpose**: The author wants the audience to understand that
someone or something is responsible for a negative outcome.

**Examples**:
- "This commit introduced the regression."
- "The memory leak originated in the caching layer."
- Error messages that identify the source of a problem.
- Git blame output showing who changed what.

**Containment**:
- Contains: Claim+Evidence, Provenance
- Contained by: Forensic discourse, Error Handling

**Relationship to Existing Categories**: Related to Error and Provenance
but focused on attribution of responsibility.

---

### Intent: Defense

**Definition**: Refuting an accusation or justifying a past action as
correct, necessary, or excusable.

**Semantic Purpose**: The author wants the audience to understand that an
action was appropriate despite apparent problems.

**Examples**:
- "The breaking change was necessary to fix the security vulnerability."
- "The performance regression is acceptable given the new functionality."
- Code comments explaining why a seemingly problematic pattern was chosen.
- Commit messages justifying non-obvious decisions.

**Containment**:
- Contains: Claim+Evidence, Causation
- Contained by: Forensic discourse

**Relationship to Existing Categories**: Related to Explanation but focused
on justification rather than understanding.

---

### Intent: Praise

**Definition**: Attributing positive qualities, excellence, or virtue to a
subject.

**Semantic Purpose**: The author wants the audience to view the subject
favorably, to recognize its value or excellence.

**Examples**:
- "This implementation elegantly handles all edge cases."
- "The test coverage is exemplary."
- Code review comments highlighting good patterns.
- Documentation celebrating library features.

**Containment**:
- Contains: Example (often), Claim+Evidence
- Contained by: Epideictic discourse

**Relationship to Existing Categories**: No direct analog in current taxonomy.

---

### Intent: Blame

**Definition**: Attributing negative qualities, failure, or vice to a subject.

**Semantic Purpose**: The author wants the audience to view the subject
unfavorably, to recognize its flaws or problems.

**Examples**:
- "This code is unmaintainable due to its circular dependencies."
- "The API design violates separation of concerns."
- Linter warnings about anti-patterns.
- Code review comments identifying problems.

**Containment**:
- Contains: Warning (often), Claim+Evidence
- Contained by: Epideictic discourse

**Relationship to Existing Categories**: Related to Warning and Error but
evaluative rather than alerting.

---

## New Intent Category: Credibility

Aristotle's ethos describes how speakers establish trustworthiness. This
suggests intents focused on establishing the reliability of information.

### Intent: Credential

**Definition**: Establishing authority or qualification to make a claim.

**Semantic Purpose**: The author wants the audience to trust subsequent
claims because of demonstrated expertise or position.

**Examples**:
- "According to the maintainers of the library..."
- Version numbers and author attribution in documentation.
- "This recommendation comes from Google's SRE handbook."
- API documentation citing RFC specifications.

**Containment**:
- Contains: Provenance
- Contained by: Claim+Evidence

**Relationship to Existing Categories**: Related to Provenance but focused
on authority rather than origin.

---

### Intent: Concession

**Definition**: Acknowledging a point that favors an opposing view while
maintaining one's position.

**Semantic Purpose**: The author wants to appear fair-minded and thorough
by acknowledging limitations or counterpoints.

**Examples**:
- "While this approach does have higher memory usage, the performance
  benefits outweigh the cost."
- "Admittedly, the error messages could be more descriptive."
- Documentation sections on "Limitations" or "Trade-offs."

**Containment**:
- Contains: Alternative (acknowledges), Claim+Evidence (for main position)
- Contained by: Comparative discourse

**Relationship to Existing Categories**: Related to Alternative but includes
acknowledgment rather than neutral presentation.

---

## New Intent Category: Emotional

Aristotle's pathos describes how speakers evoke emotions to affect judgment.
This suggests intents that aim to create specific emotional responses.

### Intent: Reassurance

**Definition**: Alleviating fear or anxiety about a situation.

**Semantic Purpose**: The author wants the audience to feel confident that
a concerning situation is under control or not as bad as feared.

**Examples**:
- "Don't worry—this error is cosmetic and doesn't affect functionality."
- "The migration is fully reversible if problems occur."
- Progress indicators that show work is proceeding.
- "Your data is safe" messages after concerning operations.

**Containment**:
- Contains: Status, Confidence
- Contained by: Error Handling

**Relationship to Existing Categories**: Related to Status but with
emotional purpose. Distinct from Acknowledgement (which confirms receipt,
not safety).

---

### Intent: Urgency

**Definition**: Creating a sense that immediate action is required.

**Semantic Purpose**: The author wants the audience to act now rather than
defer.

**Examples**:
- "Critical security patch—update immediately."
- "This API will be deprecated in 7 days."
- Countdown timers and deadline indicators.
- "Action required" headers in notifications.

**Containment**:
- Contains: Duration (often), Warning (often)
- Contained by: Exhortation

**Relationship to Existing Categories**: Related to Warning but focused on
timing rather than harm. Could be seen as intensifier for other intents.

---

### Intent: Empathy

**Definition**: Expressing understanding of the audience's situation or
frustration.

**Semantic Purpose**: The author wants the audience to feel understood and
supported.

**Examples**:
- "We know this error is frustrating. Here's what's happening..."
- "Debugging race conditions is notoriously difficult."
- User-facing error messages that acknowledge difficulty.
- Documentation that validates common struggles.

**Containment**:
- Contains: Acknowledgement
- Contained by: Error Handling, Explanation

**Relationship to Existing Categories**: No direct analog. Related to
Acknowledgement but focused on emotional state rather than input receipt.

---

## Structural Intents from Classical Arrangement

Aristotle identified parts of speech with distinct purposes.

### Intent: Attention-Capture

**Definition**: Rendering the audience receptive and attentive to what
follows.

**Semantic Purpose**: The author wants the audience to engage with the
content that follows. (The classical exordium.)

**Examples**:
- "Here's something that might save you hours of debugging."
- Hook statements at the start of documentation.
- "Did you know?" callouts.
- Intriguing error messages that invite investigation.

**Containment**:
- Contains: (varies)
- Contained by: Section (at start)

**Relationship to Existing Categories**: Related to Greeting/Marker but
focused on engagement rather than boundary signaling.

---

### Intent: Framing

**Definition**: Establishing the context and stakes before presenting
substance.

**Semantic Purpose**: The author wants the audience to understand why the
following content matters and how to interpret it. (The classical narratio.)

**Examples**:
- "Before we look at the solution, here's the problem we're solving."
- Background sections in documentation.
- "Context" sections in issue descriptions.
- The "what" and "why" before the "how."

**Containment**:
- Contains: Status (often), Causation (often)
- Contained by: Explanation, Procedure

**Relationship to Existing Categories**: Related to Elaboration but
precedes rather than follows the main point.

---

### Intent: Recapitulation

**Definition**: Restating key points to reinforce memory and understanding.

**Semantic Purpose**: The author wants the audience to retain the essential
information by hearing it again in condensed form. (The classical peroration.)

**Examples**:
- "To summarize: check the config, restart the service, verify the logs."
- "Key takeaways" sections.
- TL;DR blocks.
- Final bullet points after detailed explanation.

**Containment**:
- Contains: Summary
- Contained by: Section (at end), Procedure (at end)

**Relationship to Existing Categories**: Very close to Summary. May be
identical or Summary could be seen as the content and Recapitulation as
the intent.

---

## Argumentative Intents

Aristotle's treatment of enthymemes and examples suggests intents for
logical structure.

### Intent: Analogy

**Definition**: Explaining the unfamiliar through comparison to the familiar.

**Semantic Purpose**: The author wants the audience to understand something
new by mapping it to something known. (Aristotle's paradigm/example.)

**Examples**:
- "Think of a mutex like a bathroom key—only one person can have it."
- "Git branches are like parallel timelines."
- Metaphorical explanations in documentation.

**Containment**:
- Contains: (the two things compared)
- Contained by: Explanation, Definition

**Relationship to Existing Categories**: Related to Example but involves
cross-domain mapping rather than same-domain illustration.

---

### Intent: Anticipation

**Definition**: Raising and answering likely objections before the audience
raises them.

**Semantic Purpose**: The author wants to address doubts preemptively,
preventing them from undermining the main point. (The classical prolepsis/
procatalepsis.)

**Examples**:
- "You might wonder why we don't just use X. Here's why..."
- FAQ sections in documentation.
- "But wait—" patterns in explanations.
- Addressing edge cases before they're asked about.

**Containment**:
- Contains: Defense (often), Claim+Evidence
- Contained by: Explanation, Exhortation

**Relationship to Existing Categories**: Related to Alternative but includes
refutation rather than neutral presentation.

---

### Intent: Maxim

**Definition**: Stating a general principle or rule of thumb that guides
action.

**Semantic Purpose**: The author wants the audience to adopt a heuristic
for future decisions.

**Examples**:
- "Never trust user input."
- "Prefer composition over inheritance."
- "Explicit is better than implicit."
- Coding guidelines and best practices.

**Containment**:
- Contains: (typically standalone)
- Contained by: Exhortation, Instruction

**Relationship to Existing Categories**: Related to Command but general
rather than specific. Related to Definition but prescriptive rather than
descriptive.

---

### Intent: Refutation

**Definition**: Dismantling a specific contrary position or misconception.

**Semantic Purpose**: The author wants to eliminate a false belief the
audience may hold.

**Examples**:
- "Contrary to popular belief, garbage collection is not free."
- "This is not a race condition—here's what's actually happening."
- Myth-busting sections in documentation.
- Error messages that correct common misdiagnoses.

**Containment**:
- Contains: Claim+Evidence (counter-evidence)
- Contained by: Defense, Explanation

**Relationship to Existing Categories**: No direct analog. Related to
Explanation but confrontational rather than constructive.

---

## Timing Intent from Kairos

### Intent: Timeliness

**Definition**: Indicating that information or action is relevant to a
specific moment or window.

**Semantic Purpose**: The author wants the audience to understand the
temporal relevance of the content.

**Examples**:
- "As of version 3.2, this behavior has changed."
- "During the migration window (March 1-15)..."
- Deprecation notices with dates.
- "Now that you've completed step 3..."

**Containment**:
- Contains: Duration, Sequence
- Contained by: Warning, Exhortation

**Relationship to Existing Categories**: Related to Temporal/Duration but
focused on relevance window rather than elapsed time.

---

## Summary: Proposed New Categories

Based on Aristotle's Rhetoric, the following new categories may be warranted:

| Category | What it communicates | Distinct from existing? |
|----------|---------------------|------------------------|
| **Persuasive** | Movement toward position/action | Yes—distinct from Instruction |
| **Credibility** | Trustworthiness of claims | Partially overlaps Evidential |
| **Emotional** | Specific emotional states | Yes—new dimension |
| **Argumentative** | Logical moves in discourse | Partially overlaps Evidential |

### Recommended Additions to Existing Categories

Some discovered intents fit existing categories:

| Intent | Recommended Category | Notes |
|--------|---------------------|-------|
| Framing | Transition or Explanation | Precedes main content |
| Recapitulation | Transition | Follows main content |
| Timeliness | Temporal | Specific temporal relevance |
| Analogy | Explanation | Cross-domain comparison |

### Intents Requiring New Categories

| Intent | Proposed Category |
|--------|------------------|
| Exhortation | Persuasive |
| Dissuasion | Persuasive |
| Accusation | Persuasive (Forensic) |
| Defense | Persuasive (Forensic) |
| Praise | Persuasive (Epideictic) |
| Blame | Persuasive (Epideictic) |
| Credential | Credibility |
| Concession | Credibility or Argumentative |
| Reassurance | Emotional |
| Urgency | Emotional or Emphasis |
| Empathy | Emotional |
| Attention-Capture | Transition or new "Engagement" |
| Anticipation | Argumentative |
| Maxim | Instruction or Argumentative |
| Refutation | Argumentative |

---

## Open Questions

1. **Should Persuasive be a category or a mode?** Aristotle treats rhetoric
   as the art of persuasion—should persuasive purpose be orthogonal to
   content categories rather than parallel to them?

2. **Where does Emotional fit?** Emotions in Aristotle serve persuasion.
   Should emotional intents be modifiers on other intents rather than
   standalone?

3. **Audience-specificity**: Aristotle emphasizes adapting to audience
   (young/old, wealthy/poor). Should the framework include audience-relative
   intents or audience as a separate dimension?

4. **The three genera**: Deliberative (future action), forensic (past
   judgment), and epideictic (present evaluation) map to temporal orientation.
   Is this orthogonal to our categories or contained within them?
