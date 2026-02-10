---
apparatus:
  type: research
  topic: semantic-presentation
  id: 10
---

# Auditory Forms for Technical Communication

## Context

Technical systems increasingly need to communicate with users through speech. A research assistant might narrate findings while someone works with their hands. A monitoring system might speak status updates. A documentation system might explain concepts to someone who cannot look at a screen. These scenarios share a common challenge: how do you structure complex information for ears rather than eyes?

Spoken communication has its own deep tradition of organizing complex content. Oral cultures developed mnemonic structures — ring composition, formulaic phrases, rhythmic patterns — that allowed transmission of detailed knowledge across generations without writing. Classical rhetoric formalized techniques for organizing argument and evidence in memorable spoken form. Radio journalism invented forms for conveying complex stories purely through sound. Podcasts continue developing techniques for explaining technical subjects to listeners.

But most software systems treat speech as a thin channel — text read aloud, perhaps with some prosodic hints. We lack a systematic understanding of what structural vocabulary exists for spoken technical communication, how different spoken media vary in expressive capability, and how listeners parse complex audio content. This research aims to understand the forms and structures that make spoken communication effective, so that technical systems can speak well.

## Research Questions

### Forms and Structures

- What structural patterns do oral traditions use to organize complex information (ring composition, parallelism, formulaic elements)?
- How does classical rhetoric structure spoken argument differently from written argument?
- What forms has radio journalism developed for conveying complex information (the package, the feature, the documentary)?
- How do technical podcasts structure explanations — what recurring patterns exist?

### Organizational Techniques

- How do speakers signal structure without visual hierarchy (headings, bullets, whitespace)?
- What prosodic markers indicate transitions, emphasis, enumeration, parenthetical content?
- How is complex nested structure conveyed when listeners cannot see indentation?
- What techniques manage cognitive load across extended spoken content?

### Structural Vocabulary

- What vocabulary exists for describing the structure of speech (beyond words like "paragraph" borrowed from text)?
- Are there speech-native structural units — the equivalent of "section" or "figure" for audio?
- How do radio and podcast production describe the structures they create?
- What terminology captures the relationship between content structure and prosodic realization?

### Capability Tiers

- What structures can a skilled human narrator convey that text-to-speech cannot?
- What do expressive synthesis systems (SSML, modern neural TTS) enable beyond basic reading?
- What can simple tones and notification sounds convey — and what structures do they support?
- How does structural capability degrade gracefully across these tiers?

### Listener Cognition

- How do listeners parse structure in audio without visual anchors?
- What makes spoken content memorable or forgettable?
- How does working memory limit the complexity of audio structure?
- What listener expectations shape how spoken structure must be designed?

## Systems to Examine

### Oral Tradition Scholarship

Work on formulaic composition (Parry-Lord tradition). Ring composition in ancient texts. Mnemonic techniques in preliterate knowledge transmission. Ethnographic studies of oral cultures.

### Classical Rhetoric

Arrangement (dispositio) as a structural discipline. Memory (memoria) and its relationship to structure. Prosodic and delivery (actio/pronuntiatio) conventions.

### Radio Journalism and Documentary

NPR style guides and production conventions. BBC documentary techniques. Radiolab and other narrative journalism forms. Public radio training materials.

### Podcast Structures

Technical explanation podcasts (how do they organize?). Narrative podcasts and their structural vocabulary. Podcast production guides and conventions. Interview versus scripted format structures.

### Speech Synthesis Capabilities

SSML structural elements and their semantic meaning. Neural TTS systems and their prosodic control. Text preprocessing for spoken output. Accessibility guidelines for audio content.

### Cognitive Research

Working memory and auditory processing. Comprehension of spoken versus written discourse. Prosodic parsing in listeners. Attention and cognitive load in audio.

## Approach

### Phase 1: Survey Existing Vocabulary

Examine oral tradition scholarship, rhetoric, radio production, and podcast guides for structural terminology. What words do practitioners use to describe the organization of spoken content? Build a preliminary vocabulary of auditory structural terms.

### Phase 2: Analyze Structural Patterns

Study examples across media — recorded speeches, radio documentaries, technical podcasts — for recurring structural patterns. How is complex information actually organized? What forms appear repeatedly? Document concrete structures with examples.

### Phase 3: Map Capability Tiers

Examine what structures each capability tier can realize. What does a skilled narrator do that basic TTS cannot? What does SSML enable? Where do simple tones fit? Build a mapping from structural forms to capability requirements.

### Phase 4: Synthesize Design Vocabulary

Develop a vocabulary of auditory forms suitable for technical communication systems. Define structural primitives, their semantic meaning, and their realization across capability tiers. Identify gaps where no good forms exist.

## Working Directory

All research notes should be recorded in:
`/work/apparatus/investigations/semantic-presentation/research/010-auditory-forms/`

Create subdirectories:
- `sources/` — notes on primary and secondary sources
- `specimens/` — annotated examples of spoken structure
- `vocabulary/` — emerging terminology and definitions
- `synthesis/` — integration documents

## Expected Outputs

1. **Vocabulary of structural terms** — for spoken content, with definitions and examples
2. **Catalog of auditory forms** — patterns from atomic to composite
3. **Capability tier analysis** — mapping forms to realization requirements
4. **Design guidelines** — for structuring technical content for speech
5. **Annotated bibliography** — of key sources

## Non-Goals

- Speech synthesis implementation details (SSML encoding, TTS APIs)
- Natural language generation (how to choose words)
- Conversation and dialogue systems (back-and-forth interaction)
- Music and non-speech audio design
- Accessibility compliance checklists (though accessibility research informs this work)

## Findings

*To be completed during research.*
