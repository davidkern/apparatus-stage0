# Critique: What the research-guide captures and what it doesn't

Written at the end of a session that produced the research-guide.md rewrite, by the
same agent that co-developed the ideas the document attempts to express. The purpose
is to record what the document gets right, what it loses, and what the underlying
understanding is — so that a future researcher (human or AI) has material to work
with beyond the polished document.

## What the document captures well

The Purpose paragraph is the strongest distillation we've produced. "Compounding
mechanism for research capability" is precise. The sentence about informal methods
eliciting formal knowledge that becomes input to machinery that produces more capable
machinery — that's the core loop expressed without metaphor. Five fresh agents all
picked up the essential structure from this paragraph alone.

The research space taxonomy (five facilities, temporal orientations) successfully
externalizes a structural insight that emerged during the session: the research
environment isn't a collection of files; it's a set of facilities with different
temporal roles that together support the full cycle of research work. The table
makes this legible at a glance.

The experiment procedure is concrete and testable. A researcher can follow it without
ambiguity. This is the part of the document most ready for use.

## What the document loses

### The ceiling on autonomy

The document says "does not supplant the researcher" and "becomes the next layer."
Both true. But the discussion that produced these phrases arrived at something more
specific: the system is *somewhere between* passive infrastructure and autonomous
agent, and each iteration pushes it further from the former toward the latter. This
is a spectrum with a direction. The document states the direction but not the spectrum,
and critically, not the ceiling.

The ceiling matters because of what experiment 003 showed: the practitioner is a good
worker and a bad self-regulator. The system's autonomy is bounded not by our ambition
but by a structural property of the agent — it cannot reliably enforce constraints on
itself. The runner exists because of this ceiling. The phased architecture exists
because of this ceiling. The entire three-component design is shaped by the fact that
there *is* a ceiling on what the agent can self-manage.

The document doesn't connect these. The Purpose section describes what the system
becomes. The architecture section describes what the system looks like. The link
between them — that the architecture is *caused by* the ceiling on autonomy — is
absent. A reader could reasonably infer that the three-component architecture is a
design choice among alternatives, rather than what it actually is: a necessary
consequence of the agent's self-regulation limitation.

### The recursive identity

The document describes a process (the bootstrap) and a product (the Apparatus). What
it doesn't fully express is that the process *is* the product in a non-trivial sense.

The research environment's structures — journal, status, experiments, the procedures
we follow — are proto-Apparatus. They implement informal versions of the same patterns
the Apparatus formalizes: track decisions, record assumptions, maintain evidence,
reconstruct reasoning. When the Apparatus reaches minimal maturity, we adopt it into
this repo and use it to manage the research. At that point, the system that produces
design decisions is being used to make design decisions about itself.

This isn't a curiosity or a future concern. It's the fundamental character of the
project. Every structural choice we make in the research environment is simultaneously:
(a) a pragmatic decision about how to organize work, and (b) a data point about what
a design-decision management system needs to support. We can't separate building the
thing from learning what the thing should be, because building it *is* how we learn.

The document hints at this ("like a compiler that must compile itself") but treats it
as a problem to be solved (the bootstrap problem) rather than a permanent property of
the system. The compiler analogy is actually misleading in one important respect:
compiler bootstrapping terminates at a fixed point. This doesn't. There is no state
where the Apparatus, used to evaluate the Apparatus, produces no changes. The
recursive structure is not a bootstrap phase — it's the thing itself.

### The floor-raising framing

The document's stage exit criteria are operational: can the practitioner do X? This is
useful and testable. But the deeper framing we arrived at is that stage transitions
represent the floor rising — the point where the researcher can operate *through* the
system rather than *around* it.

Right now, we work around the system. The journal, the ad-hoc status reconciliation,
the manual reorganization we did today — none of these happen inside the Apparatus.
Stage 0 ends when they *could*. Not because the Apparatus does them for us, but
because it provides the structure to do them systematically.

This framing matters because it changes what "done" means. The operational criteria
ask "does the machinery work?" The floor-raising framing asks "can we stand on it?"
These aren't the same question. Machinery can work (the practitioner can execute the
forward flow) without being load-bearing (the researcher can't yet rely on it for
their own decisions). The exit criteria in the document test the former, not the
latter.

### The nature of iteration

The document describes stages (0, 1, N) as sequential. The underlying understanding
is more fluid: each iteration *lifts* the system rather than advancing it along a
track. The difference matters because "sequential stages" implies a roadmap — you know
what's next. "Lifting the floor" implies emergence — you discover what's next by
standing on what you just built and seeing further.

This is why the future-oriented facilities are the weakest part of the research
environment. We have strong systems for the past (journal, experiments) and the
present (status, apparatus). We have a work queue for tactical next steps. But we
have no structure for the kind of future that emerges from floor-raising: the
questions you can only ask once you've answered the current ones.

### The value question

The interviews surfaced a genuine blind spot: there is no mechanism for assessing
whether the bootstrap is producing value proportional to its cost. The exit criteria
say *when* to stop, but not *whether* to stop. A process can be self-consistent and
self-sustaining while producing nothing of external value. The Apparatus needs to be
useful for something beyond its own development, and the document doesn't address
when or how that's evaluated.

## What the underlying understanding actually is

If I had to state it in a form that resists summarization loss:

The Apparatus is machinery that accepts formalized knowledge about design decisions
and produces more capable machinery for managing design decisions. It is recursive by
nature, not by accident. The researcher provides judgment and direction; the system
provides structure and memory. Each iteration raises the floor the researcher stands
on, revealing new questions that couldn't have been asked before. The bootstrap ends
not at a fixed point but at the point where the system is load-bearing — where the
researcher can work through it rather than around it. The ceiling on the system's
autonomy is structural (agents cannot reliably self-regulate), which shapes the
architecture (runner as control plane, skills as bounded interface, git as state).
The value of the system is ultimately measured by whether it produces better design
decisions in real projects, not by whether it can sustain its own development.

---

# Latent space sampling protocol

## Purpose

During the session that produced research-guide.md, understanding developed
progressively. The final articulation necessarily collapsed intermediate states into
a single expression. Some of those intermediate states may have contained insights
or framings that the final version pruned.

The goal of these interviews is not to reconstruct the conversation's history, but
to sample the latent understanding at critical points — asking questions that might
shake out perspectives the conversation didn't follow. The resulting corpus of
responses, taken together with this critique, gives future researchers material for
re-expressing the program's philosophical foundations.

## Interview design principles

- Questions point at territory without dictating the shape of the answer
- Questions are self-contained (the interviewed agent has only conversation context
  up to the rewind point, not later refinements)
- We seek alternative formulations, not confirmation of the terminal understanding
- Incoherence is acceptable; diversity of perspective is the goal

## Rewind points and questions

### Point A: After the past/present/future taxonomy, before the recursive insight

*Context: The conversation has established that the research environment needs
facilities organized by temporal orientation. The agent has identified that "future"
is underserved. But the deeper observation — that the research environment's
structures are proto-Apparatus — has not yet surfaced.*

**Q-A1:** "We've identified that our research environment has facilities for past
and present but not future. But set aside the tactical question of where to put
work items. What does it mean that we had to build these facilities at all? What
does the existence of journal, status, and experiments tell us about the thing
we're trying to build?"

**Q-A2:** "You mentioned that status should be 'reconstructed not accumulated.'
That's a design principle for our research environment. Is it also a design
principle for the Apparatus? If so, what does that imply?"

### Point B: After "the act of building generates the knowledge" but before refinement

*Context: The key recursive insight has been stated but not yet channeled into the
turtles/floor-raising framing. The agent sees the recursion but hasn't committed
to a metaphor for what it means.*

**Q-B1:** "You've observed that building the system generates the knowledge the
system is designed to capture. Follow that thread further: what does that imply
about when the building is 'done'? Can it be?"

**Q-B2:** "Is the Apparatus a tool, a process, a body of knowledge, or something
else? If you had to place it in a category, where does it fit — and where does it
resist fitting?"

**Q-B3:** "We keep finding that our informal research methods are doing what the
Apparatus is supposed to formalize. Is the Apparatus descriptive (formalizing what
already happens) or prescriptive (defining what should happen)? What's the
consequence of each answer?"

### Point C: After the full discussion, before reading the new documents

*Context: The agent has the complete conceptual understanding from the conversation
but has not yet seen how it was rendered into research-guide.md. This is the
terminal understanding without the distortion of seeing its own imperfect summary.*

**Q-C1:** "If you had to explain what we're building to a researcher who will take
over this project tomorrow, in three sentences, what would you say? Now do it
again, differently. And again."

**Q-C2:** "What are we most wrong about? Where is our current understanding likely
to break or need revision?"

**Q-C3:** "What question should we be asking that we haven't thought to ask?"
