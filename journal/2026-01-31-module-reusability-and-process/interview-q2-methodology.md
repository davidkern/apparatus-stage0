# Interview Q2: Methodology rationale

## Prompt

Read /work/research-guide.md in full. Then answer this single question in 2-3 paragraphs:

**Why does this project test its document by giving it to sandboxed AI agents rather than just refining it through direct human iteration?**

Reason from what you've read. What does this methodology accomplish that alternatives would not?

## Response

Based on the research guide, this project tests its document by giving it to sandboxed AI agents rather than just refining it through direct human iteration because **it needs to separate the researcher's knowledge from what the artifact itself communicates**. The whole point of the Apparatus is to create a self-contained process document that any practitioner—human or AI, on their first day or their hundredth—can execute without prior context. By sandboxing the AI practitioner with access only to `apparatus.md` and explicitly excluding "this guide, findings, exit criteria, or any meta-commentary about the bootstrap," the researchers ensure they're testing what the document actually says, not what they think it says or hope it implies. The guide explicitly warns that "including researcher notes contaminates the experiment by priming the practitioner's evaluation with our expectations." This methodology prevents the common failure mode where creators assume their implicit knowledge is obvious, when in reality critical steps or clarifications are missing from the written artifact.

This approach accomplishes something that direct human iteration fundamentally cannot: **it provides unbiased empirical data about procedural completeness**. When the guide states "Your confusion is valuable data," it reveals the core insight—the practitioner's friction points, deviations, and misunderstandings are not failures but signals indicating precisely where `apparatus.md` has gaps, ambiguities, or unstated assumptions. A human researcher refining the document directly would unconsciously fill in gaps with their own understanding, never discovering that those gaps exist for a fresh reader. The sandboxed AI, lacking context and unable to make informed assumptions, will either get stuck (revealing a procedural gap), deviate from intended procedures (revealing ambiguity), or produce unexpected output (revealing unstated assumptions about correctness). These three categories of findings map directly to actionable improvements, creating a tight feedback loop that converges toward a document that is genuinely self-contained rather than one that merely seems clear to its authors.

Furthermore, this methodology aligns with the project's ultimate goal: **building a system that compounds research capability through formalized, machine-executable processes**. If the Apparatus is meant to be "machinery that produces more capable machinery as output," then the process document must eventually be precise enough for automated agents to execute reliably. Testing with sandboxed AI practitioners is not just a validation technique—it's validating the right property (machine-executability) rather than the wrong one (human readability to someone already familiar with the domain). The bootstrap problem requires building a compiler that can compile itself; you can't achieve that by having the compiler's author manually translate source code forever.
