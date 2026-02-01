# Side B: Fine-grained entry model

## Core argument

The Apparatus should model structures as collections of small, typed, independently identifiable objects. Per-topic journal entries. Investigation findings, assumptions, and evidence items as first-class objects with their own identity and lifecycle. Design decisions as independent objects containing their own rationale and assumption links. Relationships between structures expressed as explicit typed links between specific objects.

The reason: the Apparatus exists to support traceable reasoning. Traceability operates at the granularity of individual claims, findings, and decisions -- not at the granularity of documents. When a design decision cites "investigation X," the traceability chain is broken at precisely the point it matters most. Which finding in investigation X? What was the finding's exact content? What assumptions did that finding rest on? Coarse granularity forces the answer into prose: "see section 3.2 of the investigation document." Fine granularity makes it structural: "this decision cites finding F-17, which rests on assumptions A-4 and A-9."

The identity synthesis gave us assigned identifiers and (assigned-id, SHA) citation pairs precisely to enable this kind of structural traceability. Refusing to create fine-grained objects wastes the identity infrastructure the system has already committed to building.

## Position on each tension point

### 1. Journal entry scope: per-topic

A journal entry should correspond to a unit of intellectual work, not to an arbitrary calendar boundary. A researcher who spends a morning on investigation X and an afternoon on a design review produces two entries, not one. Each entry carries its topic, its investigation or design reference, and its own metadata.

The objection that this "fragments the narrative" confuses the storage model with the presentation model. The identity synthesis established that the derived index is a separate concern from storage layout. The CLI can present per-topic entries as a daily digest -- "On 2026-02-01 you wrote about: investigation X (morning), design review Y (afternoon)" -- without requiring that they be stored as a single blob. Storage granularity and display granularity are independent, and the system should optimize storage for traceability while optimizing display for readability.

Per-topic entries also solve the dual-write problem structurally. A journal entry about investigation work carries a typed link to the investigation. The system can answer "show me all journal entries related to investigation X" as an index query, not a text search. Under one-per-day granularity, this query requires parsing the day's entry to find mentions of investigation X -- fragile, and dependent on prose conventions rather than structural data.

The mutability model for per-topic entries is straightforward: an entry is mutable until the researcher explicitly closes it or starts the next entry on the same topic. The "implicit freeze on next entry creation" pattern from the mutability synthesis applies unchanged; it just operates on topic scope rather than calendar scope.

### 2. Investigation entries: storage-level types

Research entries and experiment entries are not just metadata variants. They have different structural requirements:

- A **research entry** produces findings -- discrete claims supported by evidence. Each finding is a citable unit. When a design decision says "based on our research," it should cite a specific finding, not an entire research entry.
- An **experiment entry** produces results -- measured outcomes of a controlled test. Results have parameters, measurements, and conclusions. The conclusion may generate a finding (promoting it to a citable claim), but the raw result data is a different kind of object.
- An **evidence entry** captures a piece of external information (a paper, a benchmark, an observation) that supports or challenges existing findings.

These are not the same schema with different tags. They have different internal structure, different relationships to other objects, and different roles in the traceability chain. Modeling them as uniform entries with a type tag means the system cannot enforce structural constraints -- it cannot require that an experiment entry has parameters and measurements, or that a research entry produces at least one finding.

More importantly, the finding within a research entry needs its own identity. The identity synthesis says "every logical object gets an assigned identifier." A finding is a logical object: it is cited by design decisions, it rests on assumptions, it can be invalidated. It is the natural atom of the traceability chain. Hiding it inside a research entry as unstructured content breaks the chain at the most important link.

### 3. Dual-write: structural bidirectional links

When a researcher does investigation work and records it in both the journal and the investigation, the two records should be explicitly linked. The journal entry carries a `relates-to: investigation-X/session-2026-02-01-am` link. The investigation session entry carries a `journal-ref: journal-entry-J-42` link.

This is not over-engineering. It is the minimum structure needed for the system to answer basic questions: "What journal entries relate to this investigation?" "What investigation work was done on this day?" Under coarse granularity with prose-only correlation, these questions require either text search (fragile) or temporal coincidence (imprecise -- the researcher might have written the journal entry a day later).

The cost of maintaining these links is one metadata field per entry. The CLI can automate their creation: when the researcher starts an investigation session, the CLI creates the journal entry and the investigation entry simultaneously with bidirectional links already populated.

### 4. Design-investigation relationship: object-level citation

A design decision should cite a specific finding, not an investigation as a whole. The identity synthesis designed citations as (assigned-id, SHA) pairs precisely for this purpose. The assigned-id is the finding's identifier. The SHA is the finding's content state at the time of citation. Staleness detection is per-finding: "has finding F-17 changed since I cited it?" This is a precise, actionable signal.

Under coarse granularity, the citation is (investigation-id, investigation-SHA). Staleness detection tells you "the investigation has changed since you cited it." Changed how? Any edit to any part of the investigation -- a new entry, a metadata update, a typo fix -- changes the SHA. The staleness signal is noisy to the point of uselessness. The researcher must re-read the entire investigation to determine whether the change is relevant to their decision. This is the practical cost of coarse granularity applied to cross-structural traceability.

Fine granularity with finding-level citation makes staleness actionable. If finding F-17's SHA has not changed, the design decision's evidence base is intact regardless of what else happened in the investigation. If it has changed, the researcher knows exactly which finding to re-examine.

### 5. Artifacts: independent objects

Artifacts should be independent objects associated with entries but not embedded in them. The reasons:

- **Reuse.** A dataset collected during investigation X may be relevant to investigation Y. Under composition with artifact independence, the artifact has its own identity and can be cited from both contexts. Under embedded artifacts, investigation Y must either duplicate the data or cite the entire entry from investigation X that happens to contain it.
- **Size management.** Artifacts can be large (datasets, images, model outputs). Embedding them in entries means every entry read loads all artifacts. Independent artifacts are loaded on demand.
- **Independent lifecycle.** A raw dataset might be refined through multiple processing stages, each producing a new artifact version. The entry that initiated the data collection does not need to be modified each time the data is reprocessed.

The per-object cost (identifier, status) is real but modest. Artifacts have a simple lifecycle (created, then frozen when their parent entry freezes) and their identity cost is a single UUID embedded in the object's content.

## Addressing the object count concern

The coarse-grained position's central worry is object proliferation. This concern is overstated for three reasons:

First, the per-object cost under the resolved Wave 1 design is minimal. An assigned identifier is a field in the object's content. A status is another field. The derived index adds one entry. Git stores it as a blob. The cost is measured in bytes and microseconds, not in architectural complexity.

Second, the alternative to fine-grained objects is unstructured text with prose conventions. When the coarse position says "cite section 3.2 of the investigation document," it is embedding structural references in prose because it refused to make them structural in the data model. This trades machine-readable traceability for human-readable narrative -- the opposite of what the Apparatus is for.

Third, object count scales with the researcher's actual output, not with system overhead. An investigation with ten findings has ten finding objects. That is ten things the researcher actually discovered and might cite. Not creating objects for them does not make them go away; it just makes them invisible to the system.

## Summary

Fine granularity is the natural completion of the Wave 1 decisions. The identity model gave us cheap, stable identifiers for logical objects. The mutability model gave us per-object lifecycle management. The design question is not whether to pay the per-object cost -- that decision is already made. The question is what objects to create. The answer should follow the traceability requirement: every citable unit of reasoning is an object. Findings, decisions, assumptions, evidence, and artifacts are citable units. They should be objects.
