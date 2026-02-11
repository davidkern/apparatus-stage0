# Intents from Instructional Design Literature

This document explores communicative intents derived from instructional design
research, particularly Mayer's multimedia learning principles, Merrill's first
principles of instruction, and Gagne's nine events of instruction.

## Sources

Research drawn from:
- [Digital Learning Institute: Mayer's 12 Principles](https://www.digitallearninginstitute.com/blog/mayers-principles-multimedia-learning)
- [Water Bear Learning: Mayer's Principles with Examples](https://waterbearlearning.com/mayers-principles-multimedia-learning/)
- [eLearning Industry: Merrill's Principles Definitive Guide](https://elearningindustry.com/merrills-principles-instruction-definitive-guide)
- [Growth Engineering: Merrill's First Principles](https://www.growthengineering.co.uk/merrills-first-principles/)
- [NIU: Gagne's Nine Events](https://www.niu.edu/citl/resources/guides/instructional-guide/gagnes-nine-events-of-instruction.shtml)
- [Educational Technology: Gagne's Taxonomy](https://educationaltechnology.net/robert-gagnes-taxonomy-of-learning/)
- [Distance Learning Institute: Ausubel's Advance Organizers](https://distancelearning.institute/instructional-design/ausubel-advance-organizers-learning/)
- [Distance Learning Institute: Elaboration Theory](https://distancelearning.institute/instructional-design/elaboration-theory-macro-level-approach/)
- [eLearning Industry: ARCS Model](https://elearningindustry.com/arcs-model-of-motivation)
- [Nature Reviews Psychology: Spacing and Retrieval Practice](https://www.nature.com/articles/s44159-022-00089-1)

---

## New Intent Category: Activation

Instructional design literature emphasizes that learning requires connecting
new information to existing knowledge. This suggests intents focused on
preparing the learner's cognitive state before presenting new content.

### Intent: Prior-Knowledge-Activation

**Definition**: Explicitly connecting new content to what the learner already
knows, stimulating recall of relevant prior learning.

**Semantic Purpose**: The author wants the learner to retrieve and hold active
their existing relevant knowledge so new information can integrate with it.
This is Gagne's Event 3 ("Stimulate recall of prior learning") and central
to Ausubel's meaningful learning theory.

**Examples**:
- "Remember how we set up authentication in the previous module? We'll extend
  that pattern here."
- "Before we look at React hooks, think about how you currently manage component
  state with classes."
- "Recall the file permissions model from Chapter 2."
- Tutorial sections titled "What you should already know."

**Containment**:
- Contains: (reference to prior content)
- Contained by: Lesson, Procedure

**Relationship to Existing Categories**: Related to Framing (from Aristotle
discovery) but specifically backward-looking. Not about context or stakes,
but about cognitive preparation. Could be a specialized form of Transition.

---

### Intent: Advance-Organizer

**Definition**: Providing an abstract framework or schema before detailed
content, creating cognitive scaffolding for what follows.

**Semantic Purpose**: The author wants the learner to have a mental structure
in which to place upcoming details. From Ausubel: provides "ideational
scaffolding" at a higher level of abstraction than the content itself.

**Examples**:
- "This API has three main concepts: resources, actions, and relationships.
  We'll explore each in depth."
- A diagram showing system architecture before explaining individual components.
- "There are two types of errors you'll encounter: recoverable and fatal."
- Concept maps at the start of chapters.

**Containment**:
- Contains: Hierarchy (structural), Definition (preliminary)
- Contained by: Section, Lesson

**Relationship to Existing Categories**: Related to Framing but more structural.
Framing establishes why content matters; Advance-Organizer establishes what
content will include and how pieces relate. Could belong to a new "Preparation"
or "Orientation" category.

---

### Intent: Objective-Statement

**Definition**: Explicitly declaring what the learner will be able to do after
instruction.

**Semantic Purpose**: The author wants the learner to know the target behavior
or understanding, setting expectations and enabling self-monitoring. This is
Gagne's Event 2 ("Inform learners of objectives").

**Examples**:
- "By the end of this tutorial, you will be able to deploy a containerized
  application to Kubernetes."
- "Learning objectives: 1) Identify race conditions 2) Apply mutex patterns
  3) Debug deadlocks"
- "After this section, you'll understand how to configure CORS headers."
- README sections titled "What you'll learn."

**Containment**:
- Contains: (list of capabilities)
- Contained by: Section, Lesson, Procedure

**Relationship to Existing Categories**: No direct analog. Related to Summary
but prospective rather than retrospective. Related to Exhortation but
descriptive rather than persuasive.

---

## New Intent Category: Guidance

Instructional design reveals a cluster of intents focused on providing
learning support that can be gradually removed. These are not instructions
(what to do) but meta-level support for learning.

### Intent: Prompt

**Definition**: A question or cue that directs attention to relevant
information without providing the answer.

**Semantic Purpose**: The author wants to guide the learner's cognitive
processing toward productive paths, reducing unproductive search without
eliminating the learning value of active thinking.

**Examples**:
- "Look at line 47. What do you notice about the variable scope?"
- "Before running the command, ask yourself: what permissions does this need?"
- "Hint: Consider the edge case when the list is empty."
- Interactive tutorials with "Think about..." callouts.

**Containment**:
- Contains: (question or cue)
- Contained by: Worked-Example, Procedure, Elicitation

**Relationship to Existing Categories**: Related to Command (directs action)
but cognitive rather than behavioral. Related to Anticipation (addresses
learner thinking) but supportive rather than preemptive.

---

### Intent: Hint

**Definition**: Partial information that reduces difficulty while preserving
some challenge.

**Semantic Purpose**: The author wants to help the learner past an obstacle
while maintaining productive struggle. Graduated support that can be
progressively revealed.

**Examples**:
- "Hint 1: The error is in the loop condition."
- "If you're stuck, remember that arrays are zero-indexed."
- Progressive reveal systems in coding exercises.
- "Need help? The answer involves the `reduce` function."

**Containment**:
- Contains: (partial solution or direction)
- Contained by: Exercise, Problem, Elicitation

**Relationship to Existing Categories**: Related to Suggestion but for
learning rather than action. Related to Prompt but more directive/revealing.

---

### Intent: Worked-Example

**Definition**: A complete solution with explicit reasoning, meant to be
studied rather than performed.

**Semantic Purpose**: The author wants the learner to acquire problem-solving
schemas by observing expert performance, reducing cognitive load during
initial skill acquisition.

**Examples**:
- "Let's walk through solving this step by step..."
- Code samples with extensive comments explaining each decision.
- "Here's how I would approach debugging this error:"
- Mathematical proofs with annotations explaining each step.

**Containment**:
- Contains: Step (multiple), Example, Explanation
- Contained by: Lesson, Topic

**Relationship to Existing Categories**: Related to Procedure but meant for
observation, not execution. Related to Example but complete rather than
illustrative. Could be a specialized form of Instruction.

---

### Intent: Completion-Problem

**Definition**: A partially-completed task where the learner must fill in
specific gaps.

**Semantic Purpose**: The author wants to scaffold the transition from
observing worked examples to independent problem-solving. The "fading"
in faded worked examples.

**Examples**:
- Code with blanks to fill in: `for (let i = 0; i < ___; i++)`
- "Given the setup below, complete the error handling:"
- Cloze exercises in documentation.
- "The following solution is 80% complete. Add the validation logic."

**Containment**:
- Contains: Step (completed), Gap (to complete)
- Contained by: Exercise, Lesson

**Relationship to Existing Categories**: Hybrid of Procedure (structure) and
Elicitation (demands response). No direct analog in current taxonomy.

---

## New Intent Category: Elicitation

Instructional design emphasizes active learning where learners generate
responses rather than passively receive. This suggests intents that demand
learner output.

### Intent: Practice-Prompt

**Definition**: A task requiring the learner to apply newly presented
knowledge or skill.

**Semantic Purpose**: The author wants the learner to actively use what
they've learned, supporting encoding and revealing gaps. This is Gagne's
Event 6 ("Elicit performance/practice").

**Examples**:
- "Now try it yourself: Create a new branch and merge it."
- "Exercise: Refactor this function to use async/await."
- "Your turn: Write a test for the edge case we discussed."
- Interactive coding challenges after explanations.

**Containment**:
- Contains: Command or Task
- Contained by: Lesson, Procedure

**Relationship to Existing Categories**: Related to Command but learner-
directed rather than system-directed. The purpose is learning verification,
not task completion.

---

### Intent: Self-Test

**Definition**: An opportunity for learners to check their own understanding.

**Semantic Purpose**: The author wants learners to engage in retrieval
practice and metacognitive monitoring. Enables spacing and testing effects.

**Examples**:
- "Quick check: What are the three types of joins?"
- End-of-chapter review questions.
- "Before continuing, can you explain why we use immutable state?"
- Flashcard-style review sections.

**Containment**:
- Contains: Question (one or more)
- Contained by: Section, Lesson

**Relationship to Existing Categories**: Related to Confirmation (requests
response) but directed at the learner's own knowledge, not approval of
action. Could be in Elicitation category.

---

### Intent: Elaborative-Interrogation

**Definition**: A question that prompts the learner to generate explanations
for why something is true.

**Semantic Purpose**: The author wants the learner to actively integrate new
information with prior knowledge through self-explanation. Deep processing
strategy.

**Examples**:
- "Why do you think immutability matters for concurrent systems?"
- "Explain to yourself why this algorithm is O(n log n)."
- "What would happen if we removed this validation? Why?"
- "Consider: Why is this the default behavior?"

**Containment**:
- Contains: Question requiring explanation
- Contained by: Topic, Worked-Example

**Relationship to Existing Categories**: Related to Prompt but specifically
demands causal/explanatory reasoning. More than attention direction.

---

## New Intent Category: Feedback

Instructional design places central importance on feedback. The framework
currently has Status and Error but lacks the nuanced feedback vocabulary
of instructional design.

### Intent: Corrective-Feedback

**Definition**: Information that identifies an error and indicates the
correct response or approach.

**Semantic Purpose**: The author wants the learner to understand what was
wrong and what right looks like, enabling adjustment. Distinct from Error
(which identifies problems) because it also provides correction.

**Examples**:
- "Incorrect. The syntax is `git rebase`, not `git rebase -i`."
- "Not quite. Remember that array indices start at 0, not 1."
- Test failure messages that show expected vs. actual.
- "You used `==` but should use `===` for type-safe comparison."

**Containment**:
- Contains: Error (identification), Correct-Answer
- Contained by: Assessment, Self-Test

**Relationship to Existing Categories**: Extends Error by adding correction.
Could be in Emphasis category or new Feedback category.

---

### Intent: Explanatory-Feedback

**Definition**: Feedback that explains why an answer is correct or incorrect,
not just what the correct answer is.

**Semantic Purpose**: The author wants the learner to understand the
underlying principle, not just memorize the answer. Promotes transfer.

**Examples**:
- "Correct! This works because JavaScript hoists function declarations."
- "Incorrect. `const` prevents reassignment, not mutation. Objects declared
  with const can still have their properties modified."
- Detailed explanations in quiz review modes.

**Containment**:
- Contains: Correctness-Judgment, Explanation
- Contained by: Assessment, Self-Test

**Relationship to Existing Categories**: Combines Status (correct/incorrect)
with Explanation. Distinct intent requiring both.

---

### Intent: Progress-Feedback

**Definition**: Information about how far the learner has come and how much
remains.

**Semantic Purpose**: The author wants the learner to maintain motivation
and calibrate effort. Related to but distinct from Progress in the State
category because it's specifically about learning progress.

**Examples**:
- "You've completed 4 of 12 modules."
- "Great work! You've mastered basic selectors. Next: combinators."
- "You're 70% through this lesson."
- Skill trees showing unlocked and locked capabilities.

**Containment**:
- Contains: Progress, Encouragement (often)
- Contained by: Lesson, Course

**Relationship to Existing Categories**: Specialized form of Progress
(State category) with learning context.

---

## New Intent Category: Signaling

Mayer's principles reveal intents focused on directing attention and
reducing cognitive load through structural cues.

### Intent: Signal

**Definition**: A cue that highlights the organization or importance of
content without adding new information.

**Semantic Purpose**: The author wants to reduce extraneous processing by
making structure explicit. Mayer's Signaling Principle.

**Examples**:
- Bold keywords in definitions.
- "The three main points are:" followed by numbered list.
- Headings and subheadings that preview content.
- "Most importantly:" before crucial information.
- Arrows pointing to relevant parts of diagrams.

**Containment**:
- Contains: (the signal itself, e.g., emphasis, structure word)
- Contained by: Any explanatory content

**Relationship to Existing Categories**: Related to Emphasis but meta-level.
Not emphasizing importance but emphasizing structure. Could be a form of
Marker (Transition category).

---

### Intent: Coherence-Maintenance

**Definition**: Explicit exclusion of extraneous information that could
distract.

**Semantic Purpose**: The author wants to reduce cognitive load by keeping
content focused on essential material. Mayer's Coherence Principle.

**Examples**:
- "We won't cover X here; see Appendix B."
- Minimal documentation that omits edge cases irrelevant to the task.
- "For simplicity, we'll ignore error handling in this example."
- Scope statements at the beginning of tutorials.

**Containment**:
- Contains: Scope-Statement, Exclusion-Note
- Contained by: Topic, Lesson

**Relationship to Existing Categories**: Inverse of Elaboration. Could be
seen as a form of Framing that constrains rather than expands scope.

---

## New Intent Category: Motivation

Keller's ARCS model reveals intents focused on learner engagement beyond
pure information transfer.

### Intent: Relevance-Statement

**Definition**: Explicit connection between content and learner's goals,
interests, or real-world application.

**Semantic Purpose**: The author wants the learner to perceive the content
as worth learning. Answers "Why should I care?"

**Examples**:
- "You'll use this pattern in almost every production application."
- "Understanding this will save you hours of debugging."
- "This is one of the most common interview questions."
- Real-world case studies integrated into tutorials.

**Containment**:
- Contains: Application-Example, Benefit-Statement
- Contained by: Objective-Statement, Lesson

**Relationship to Existing Categories**: Related to Exhortation (persuades
toward action) but specific to learning motivation. Could be in Persuasive
or new Motivation category.

---

### Intent: Confidence-Building

**Definition**: Content or phrasing designed to increase learner's belief
in their ability to succeed.

**Semantic Purpose**: The author wants to reduce anxiety and increase
self-efficacy. From ARCS: the "C" in Confidence.

**Examples**:
- "If you understood the previous section, this will be easy."
- "Don't worry if this seems complex at first - it becomes intuitive."
- "This is a common point of confusion, so take your time."
- Graduated difficulty with early wins.

**Containment**:
- Contains: Reassurance, Normalization
- Contained by: Lesson, Topic

**Relationship to Existing Categories**: Related to Reassurance (Emotional
category from Aristotle discovery) but specific to learning self-efficacy.

---

### Intent: Attention-Capture

**Definition**: Content designed to gain and maintain learner engagement.

**Semantic Purpose**: The author wants to overcome learner inattention
through novelty, curiosity, or stakes. From ARCS: the "A" in Attention.

**Examples**:
- "What if I told you this single line of code could crash your server?"
- Counterintuitive facts at section openings.
- "Here's a bug that cost a company $100 million."
- Interactive elements that require engagement.

**Containment**:
- Contains: Hook, Surprising-Fact, Question
- Contained by: Section, Lesson

**Relationship to Existing Categories**: Already identified in Aristotle
discovery. Confirms as distinct intent.

---

## New Intent Category: Sequencing

Elaboration Theory and other frameworks reveal intents about how content
should be ordered, not just what it contains.

### Intent: Epitome

**Definition**: A simplified overview of an entire topic at the highest
level of abstraction before elaboration.

**Semantic Purpose**: The author wants to provide orientation by showing
the whole before the parts. From Reigeluth's Elaboration Theory: the
"wide-angle view" before zooming in.

**Examples**:
- "At its simplest, Git tracks changes. Everything else is elaboration."
- Executive summaries before detailed reports.
- "Authentication is about proving who you are. We'll see how shortly."
- Introductory paragraphs that capture essence without detail.

**Containment**:
- Contains: Core-Concept (simplified)
- Contained by: Topic, Section (at start)

**Relationship to Existing Categories**: Related to Summary but precedes
rather than follows content. Related to Advance-Organizer but less
structural, more conceptual.

---

### Intent: Synthesis

**Definition**: Explicit integration of multiple previously-learned concepts
showing their interrelationships.

**Semantic Purpose**: The author wants the learner to see connections and
build integrated knowledge structures. From Elaboration Theory: the
"synthesizing" step.

**Examples**:
- "Now let's see how authentication, authorization, and session management
  work together."
- Capstone projects that require combining skills.
- "Combining what we learned about selectors and specificity..."
- Integration diagrams showing how components interact.

**Containment**:
- Contains: Relationship (between concepts), Example (integrative)
- Contained by: Section, Course (at transitions)

**Relationship to Existing Categories**: Related to Grouping (Relational)
but active cognitive work rather than static classification. Related to
Summary but about connection, not condensation.

---

### Intent: Fading-Indication

**Definition**: Explicit signal that support is being reduced as competence
increases.

**Semantic Purpose**: The author wants the learner to understand that
increasing challenge reflects growing capability, not abandonment.

**Examples**:
- "From here on, I'll show less detail - you've got the pattern."
- "This time, try without the hints."
- "Now that you're comfortable, we'll remove the training wheels."
- Progressive removal of scaffolding with acknowledgment.

**Containment**:
- Contains: Transition-Marker, Confidence-Building
- Contained by: Lesson, Procedure

**Relationship to Existing Categories**: Related to Marker (Transition)
but specifically about learning support level. Unique to instructional
contexts.

---

## Intents for Learning Outcome Types

Gagne's taxonomy of learning outcomes suggests that different types of
knowledge require different communicative treatment.

### Intent: Discrimination-Presentation

**Definition**: Content designed to help learners distinguish between
similar items or categories.

**Semantic Purpose**: The author wants the learner to reliably differentiate
things that might be confused. One of Gagne's intellectual skills.

**Examples**:
- "`==` vs `===`: The difference matters."
- Side-by-side comparisons of similar concepts.
- "Here's how to tell a syntax error from a runtime error."
- Highlighting distinguishing features of confusable items.

**Containment**:
- Contains: Comparison, Feature-Highlight
- Contained by: Definition, Topic

**Relationship to Existing Categories**: Related to Diff/Comparative but
for conceptual learning rather than change detection. Could be specialized
form of Explanation.

---

### Intent: Concept-Exemplification

**Definition**: Presenting positive and negative examples to establish
concept boundaries.

**Semantic Purpose**: The author wants the learner to form accurate
categorical knowledge. Teaching defined concepts per Gagne.

**Examples**:
- "This is a pure function: [example]. This is not: [counterexample]."
- "Valid email addresses look like: ... Invalid ones might be: ..."
- "Here's a good commit message. Here's a problematic one."
- Example/non-example pairs in definitions.

**Containment**:
- Contains: Example, Non-Example
- Contained by: Definition

**Relationship to Existing Categories**: Extends Example (Explanation
category). The non-example is a distinct semantic element.

---

### Intent: Rule-Statement

**Definition**: Declarative presentation of a principle that governs a
class of situations.

**Semantic Purpose**: The author wants the learner to acquire a generalized
procedure or relationship that applies across instances.

**Examples**:
- "When X happens, always do Y."
- "If the input is null, the function returns early."
- "Variables declared with `let` are block-scoped."
- Best practices and coding guidelines.

**Containment**:
- Contains: Condition, Action/Consequence
- Contained by: Topic, Procedure

**Relationship to Existing Categories**: Related to Maxim (from Aristotle)
but more technical than aphoristic. Related to Definition but prescriptive.

---

### Intent: Attitude-Modeling

**Definition**: Presenting values, dispositions, or approaches to be adopted.

**Semantic Purpose**: The author wants the learner to adopt a particular
stance or way of thinking about the domain. Gagne's affective domain.

**Examples**:
- "Good engineers always consider failure modes."
- "When in doubt, favor readability over cleverness."
- "Security is everyone's responsibility."
- Cultural and value statements in coding guidelines.

**Containment**:
- Contains: Value-Statement, Exemplar-Reference
- Contained by: Topic, (cultural documents)

**Relationship to Existing Categories**: Related to Exhortation but about
disposition rather than action. Could be in Persuasive category.

---

## Summary: Proposed New Categories

Based on instructional design literature, the following new categories may
be warranted:

| Category | What it communicates | Distinct from existing? |
|----------|---------------------|------------------------|
| **Activation** | Preparing cognitive state for learning | Yes - metacognitive focus |
| **Guidance** | Graded support for learning | Yes - scaffolding concept |
| **Elicitation** | Demanding learner generation | Partially overlaps Instruction |
| **Feedback** | Learning-specific response | Extends Emphasis/State |
| **Signaling** | Structural attention direction | Could be Transition sub |
| **Motivation** | Engagement and self-efficacy | Overlaps Persuasive/Emotional |
| **Sequencing** | Order and integration signals | Could be Transition sub |

### Recommended Additions to Existing Categories

Some discovered intents fit existing categories:

| Intent | Recommended Category | Notes |
|--------|---------------------|-------|
| Worked-Example | Instruction or Explanation | Complete solution for study |
| Rule-Statement | Instruction | Generalized procedure |
| Signal | Transition or Emphasis | Structural cueing |
| Epitome | Transition | Opening summary |
| Synthesis | Transition | Closing integration |
| Discrimination-Presentation | Explanation | Comparative learning |
| Concept-Exemplification | Explanation | Extended Example intent |

### Intents Requiring New Categories or Substantial Expansion

| Intent | Proposed Category |
|--------|------------------|
| Prior-Knowledge-Activation | Activation |
| Advance-Organizer | Activation |
| Objective-Statement | Activation |
| Prompt | Guidance |
| Hint | Guidance |
| Completion-Problem | Guidance |
| Fading-Indication | Guidance |
| Practice-Prompt | Elicitation |
| Self-Test | Elicitation |
| Elaborative-Interrogation | Elicitation |
| Corrective-Feedback | Feedback |
| Explanatory-Feedback | Feedback |
| Progress-Feedback | Feedback (or State) |
| Relevance-Statement | Motivation |
| Confidence-Building | Motivation |
| Attitude-Modeling | Persuasive or Motivation |

---

## Open Questions

1. **Is Guidance a category or a mode?** Scaffolding applies across content
   types. Should guidance level be orthogonal to intent categories rather
   than a category itself?

2. **Relationship to Cognitive Load Theory**: Many intents here derive from
   managing cognitive load. Should "load management" be an explicit design
   dimension?

3. **Elicitation vs Instruction**: Practice-Prompt and Command both direct
   action. The distinction is purpose (learning vs doing). Is purpose a
   sufficient differentiator for separate categories?

4. **Feedback hierarchy**: Corrective > Explanatory > Progress suggests
   feedback has its own internal structure. How does this relate to the
   Error/Status intents already in the framework?

5. **Temporal markers in instructional sequences**: Intents like
   Advance-Organizer, Synthesis, and Fading-Indication are position-dependent
   (start, middle, end). Should position-in-sequence be an attribute of
   intents?

6. **Worked examples as composite**: A worked example contains Steps,
   Examples, and Explanations. Is it a container intent or a rendering mode
   for Procedure?

---

## Cross-Reference with Aristotle Discovery

Several intents appear in both investigations:

| Instructional Design | Aristotle Rhetoric | Notes |
|---------------------|-------------------|-------|
| Attention-Capture | Attention-Capture | Identical - high confidence |
| Relevance-Statement | Exhortation | Similar motivation, different mechanism |
| Confidence-Building | Reassurance | Same emotional purpose |
| Advance-Organizer | Framing | Related but different abstraction level |
| Synthesis | Recapitulation | Both integrate/summarize but at different positions |
| Prompt | (no analog) | Instructional-specific |
| Feedback types | (no analog) | Instructional-specific |

The convergence on Attention-Capture and Reassurance/Confidence-Building
suggests these are robust cross-domain intents worth prioritizing.
