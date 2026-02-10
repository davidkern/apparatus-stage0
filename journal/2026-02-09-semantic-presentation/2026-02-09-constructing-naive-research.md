# Reflections on Constructing Naive Research Statements

Date: 2026-02-09
Participants: Human researcher, Claude (Opus 4.5)

## The Task

We set out to construct a research problem statement (010) for exploring auditory forms in technical communication. The goal was to create a "naive" research statement — one that would elicit exploratory, potentially diffuse results similar to earlier research (004, 007) that preceded successful synthesis work (006, 009). The intention was that this preliminary research would teach us what the correct framing should be, by failing in instructive ways.

## What We Discovered

### 1. The Difficulty of Intentional Naivety

It proved remarkably difficult to construct a research statement that was genuinely naive about auditory forms. Every attempt carried implicit assumptions, biases, or framings that would shape the research outcome. Constructing "wrong" research is as hard as constructing "right" research — perhaps harder, because you must avoid both solving the problem correctly AND avoid being so wrong that the research produces nothing useful.

### 2. The Pervasiveness of Visual Bias

The most striking discovery was how deeply visual-centric framing pervades our vocabulary for discussing structure, organization, and communication. Even when explicitly trying to avoid visual references, they appeared:

- Seeking "auditory equivalents" to visual forms
- Defining auditory by what it lacks ("without visual anchors")
- Framing speech as translation of text ("text read aloud")
- Using visual vocabulary as the reference point ("the equivalent of 'section' for audio")

This bias appeared in my outputs, in the subagent's outputs, and even in prompts explicitly designed to avoid it. The "pink elephant" problem was real — saying "don't think about visual" still centers visual.

### 3. "Do Nots" Prime What They Prohibit

Our first attempts used negative constraints: "Do NOT frame this in terms of translating visual content." These constraints backfired. The agent produced text that explicitly rejected visual framing — which still centered visual as the thing being rejected. The solution was to remove all "do nots" and frame entirely from audio-native traditions (oral poetry, rhetoric, radio, podcasts) without mentioning what we were avoiding.

### 4. Quality vs. Mechanism as a Reframing Principle

A consistent principle emerged for removing bias: describe the quality of the experience rather than the mechanism that produced it.

- "text read aloud" → "flat, undifferentiated delivery"
- "beyond basic reading" → "beyond monotone delivery"
- "cannot look at a screen" → "on the move"

This shift from mechanism to quality proved reliable. It describes what the listener experiences without implying what process created that experience.

### 5. The Training Data Problem

We observed that the bias may be partly inherent to language models trained primarily on written text. The model's conceptual vocabulary for "structure" and "organization" was developed from written sources. Even the research literature on audio (screen readers, accessibility) is framed as accommodating visual content for non-visual consumption. The bias isn't just in our prompts — it may be in the substrate of the model's knowledge.

### 6. Iterative Refinement Worked

Three iterations were required:
1. First attempt: Explicit "do nots" → produced contrast framing
2. Second attempt: Positive framing from audio traditions → much better, but still had visual references
3. Third attempt: Added capability tiers (expressibility dimension) → close enough for manual refinement

Each iteration taught us something about where bias enters. The final version required manual surgery to remove ~11 specific phrases, plus addition of scoping qualifiers to replace the scope that visual references had been providing.

### 7. Scoping Serves a Purpose Beyond Bias

Some of the visual references we removed were serving a scoping function — keeping the research focused on macro-structure rather than phonemes. When we removed "without visual hierarchy (headings, bullets, whitespace)" the question "How do speakers signal structure?" became too broad. We had to add back neutral scoping: "at the discourse level," "above the sentence level," "for organizing extended content."

This taught us that biased language often smuggles in useful constraints. Removing bias requires identifying what work the biased phrase was doing and finding neutral language to do that work.

## Meta-Observations

### On the Research Process Itself

The process of constructing this research statement became itself a research activity. We were studying how to study auditory forms by observing our failures to frame the question properly. This recursive quality — research about how to pose research questions — seems characteristic of foundational work.

### On Human-AI Collaboration

The iterative process benefited from complementary perspectives:
- I could generate candidate text quickly and identify patterns across attempts
- The human researcher could detect subtle biases I was blind to
- Together we could name principles ("quality vs. mechanism") that neither might have articulated alone

The human's observation that the bias might be in my training data was particularly valuable — it reframed the problem from "how do we prompt correctly" to "what are the limits of what prompting can achieve."

### On the Value of Documented Failure

We preserved each attempt (010-attempt-01.md, 010-attempt-02.md, 010-attempt-03.md) with the prompts that generated them. This documentation of the refinement process may prove as valuable as the final research statement. It shows how bias enters, how it was detected, and what strategies removed it.

## Open Questions

1. **Is complete bias removal possible?** Or is some residual visual framing inevitable given how language and concepts developed historically?

2. **Will the research succeed in being "naively wrong"?** We designed it to produce diffuse, exploratory results that teach us the correct framing. Will it actually fail in instructive ways, or have we inadvertently made it too good?

3. **Does the capability tier framing (human narrator → expressive TTS → basic TTS → tones) implicitly assume a hierarchy?** We added it to include accessibility considerations positively, but it may have introduced structure we didn't intend.

4. **What would a truly audio-native researcher write?** Someone who grew up in an oral culture, or a blind researcher who experiences the world primarily through sound — would their framing be fundamentally different, or would they face similar challenges articulating structure in language that evolved alongside writing?

## Conclusion

The difficulty of constructing this research statement revealed something important: our conceptual vocabulary for organization, structure, and communication is deeply entangled with visual/written metaphors. Escaping this entanglement required not just careful word choice but a shift in framing strategy — from "what is audio's equivalent of X" to "what does audio do, described in terms of what listeners experience."

Whether research 010 will fail in the instructive ways we hope remains to be seen. But the process of constructing it has already taught us something about the relationship between language, bias, and the framing of research questions.
