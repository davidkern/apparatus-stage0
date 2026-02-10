# 010 Generation Attempt 1

## Prompt Used

```
You are helping draft a research problem statement for a software project called "apparatus."

## Context

Apparatus is a research tool that communicates with researchers entirely through audio. The system has a speaker and microphone as its only interface - there is no screen, no visual output at all. Everything the system needs to convey to the researcher (status, data, errors, tables, hierarchies, warnings) must be spoken or conveyed through sound.

## Your Task

Write a research problem statement exploring how technical content should be structured for this audio-only system. The research should explore:
- What forms exist for conveying technical information through speech/sound
- How systems like screen readers, speech synthesizers, podcasts, and lectures organize spoken content
- What vocabulary and structures exist in rhetoric, prosody, and oral traditions
- Whether there are layers or categories of auditory forms

## Structural Template

Use this structure (based on similar research documents in the project):

1. **Title** - Short, descriptive
2. **Context** (2-3 paragraphs) - Why this research matters, what problem we're solving
3. **Research Questions** - Organized into 3-5 categories, 2-4 questions each
4. **Systems to Examine** - Categories of sources to investigate
5. **Approach** - 3-4 phases of research
6. **Working Directory** - Where to store notes
7. **Expected Outputs** - What the research should produce
8. **Non-Goals** - What's out of scope

## Important Constraints

- Do NOT frame this in terms of "translating visual content to audio" or "what happens to tables/headings when spoken"
- Treat audio as the NATIVE and ONLY modality - not as a translation or accessibility accommodation
- The research should explore auditory forms on their own terms, as if visual presentation didn't exist
- Write from a position of genuine curiosity - we don't know what we'll find
- Don't assume hierarchy is the right organizational model - that's a question to explore

## Examples of the Tone

From a similar research document:
> "Documents — papers, reports, technical documentation, notebooks — are composed of textual and structural forms arranged to convey meaning. These forms exist at different levels of complexity... But is this the right decomposition?"

From another:
> "Research into the minimal set of structural primitives that should form the core vocabulary..."

Write with similar directness and genuine inquiry. The researcher reading this should feel free to explore and discover, not constrained to fit a predetermined model.

Output only the research document content (markdown format), nothing else.
```

## Output

See: `/work/apparatus/investigations/semantic-presentation/research/010-auditory-forms.md`

## Analysis

The output still contains visual bias despite explicit "do not" instructions:

1. **Contrast framing**: "We can name paragraphs, headings, tables, lists, and margins. What do we name in sound?"
2. **Negative definition**: "This is not a matter of translation"
3. **Seeking equivalents**: "Are there auditory equivalents to the visual distinction between content and container?"
4. **Accessibility framing in systems**: Screen readers listed alongside oral traditions

## Lessons

- "Do not" instructions prime the contrast they're trying to avoid (pink elephant problem)
- The prompt defined the problem by what it's NOT (no screen, not translation)
- Assistive technology framing inherently positions audio as derivative
- The agent's training on written text may make visual-centric vocabulary unavoidable

## Next Attempt

Try framing entirely from audio-native domains without mentioning visual at all. Don't say what it's not — just describe what it is.
