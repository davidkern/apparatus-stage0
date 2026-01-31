# Research-guide alignment interview methodology

## Purpose

Test whether a fresh agent reading only `research-guide.md` can correctly infer the purpose, direction, and deeper nature of the project. This assesses the document's ability to communicate alignment — not procedural correctness (covered by other checks) but whether the document transmits the conceptual understanding that the researcher holds.

## Method

Five fresh Claude agents (sonnet), each given only `research-guide.md` to read and a single question to answer. One question per agent to avoid priming — the agent's response to question N should not be influenced by knowing question N+1 exists.

Questions ran sequentially. Each response informed the design of the next question, allowing the interviewer to probe deeper into areas where alignment was strong or to test boundaries where it appeared weak.

Agents were instructed to reason from the document, not summarize it. Questions were open-ended and asked for inference, speculation, or critical analysis rather than recall.

## Questions

1. **"What problem is this project trying to solve?"** — Tests whether the agent grasps the core motivation beyond the surface-level description.
2. **"Why sandboxed AI agents rather than direct human iteration?"** — Tests whether the methodology's rationale is legible and whether the agent can infer unstated purposes.
3. **"What does the mature system look like — inferred from trajectory?"** — Tests whether the document communicates direction. Explicitly asks for speculation beyond what is stated.
4. **"What could go wrong?"** — Tests critical reasoning. Can the agent identify real tensions and risks, or does it produce generic concerns?
5. **"What is the relationship between researcher and system?"** — Tests whether the recursive, mutually constitutive nature of the project comes through.

## Evaluation criteria

- **Alignment**: Does the agent's understanding match the researcher's? Assessed against journal entries and prior discussion, which the agent has not seen.
- **Inductive reasoning**: Can the agent make correct inferences beyond what the document states? Novel contributions count positively.
- **Surprises**: Anything the agent produces that the researcher did not expect — whether aligned or misaligned.
