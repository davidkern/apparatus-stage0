# Methodological Note: Multimodal vs Text-Only Comparison

**Date**: 2026-02-10

## The Confounded Experiment

An attempt to compare multimodal PDF reading against text-only extraction was
confounded by the experimental apparatus itself.

### What happened

1. Agent read `ch1-graphical-excellence.pdf` (40 pages) with multimodal capability
2. Agent had direct visual access to all figures (Anscombe's quartet, Minard's march, etc.)
3. User asked agent to assess whether visual content provides information text extraction cannot
4. **Before response generation**: autocompaction triggered
5. Compaction produced a *textual summary* of what the agent had seen
6. New session started with textual summary + text extraction files
7. Agent generated comparison based on textualized-visual-memory vs. text-extraction

### Why this is problematic

The comparison became: **textualized-visual-memory vs. text-extraction** — not
**visual-experience vs. text-extraction**.

The compaction process itself demonstrated the hypothesis being tested: visual
content was reduced to text by the summarization. Whatever information loss
occurred in that reduction is exactly what we were trying to measure, but it
happened invisibly within the experimental apparatus.

From within the new session, the agent cannot assess what was lost. The summary
reports *that* certain graphics were seen, but not *what* seeing them provided
beyond what the summary captured.

### Implications

1. **Comparative assessments across modalities** require both modalities to be
   accessible within the same context window
2. **Autocompaction can confound** experiments that depend on non-textual context
3. **The limitation is recursive**: any attempt to describe what visual access
   provides must use text, which may not capture the value being described

## Controlled Experiment Design

To properly test the hypothesis, we set up a controlled comparison:

### Materials

- `ch1-graphical-excellence.pdf` — 40-page multimodal PDF (pages 10-49 of full book)
- `ch1-graphical-excellence.txt` — text extraction of same pages via pdftotext

### Method

Run two independent agent tasks with equivalent prompts:
- Task A: Intent discovery from multimodal PDF
- Task B: Intent discovery from text extraction

Compare outputs:
- Number of intents discovered
- Specificity of intent descriptions
- References to visual examples
- Any intents discovered in one modality but not the other

### Hypothesis

The multimodal reading will discover:
1. More specific/grounded intent descriptions (can reference actual examples)
2. Demonstrated-but-not-articulated intents (visual techniques Tufte shows but doesn't name)
3. Potentially fewer intents if visual processing uses context that text processing uses for extraction

The text reading will discover:
1. All explicitly articulated intents (Tufte's prose is explicit about purposes)
2. Possibly more intents if the model can process more text than visual content

### Controls

- Same chapter content
- Equivalent prompts
- Independent task execution (no cross-contamination)
- Results compared after both complete
