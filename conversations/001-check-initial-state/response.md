Procedure walkthrough: where you'd have to guess

Investigation Procedures

Start an Investigation — Fully executable. All fields and steps are specified.

Add Research — You'd have to guess. Step 2 says create the file "with frontmatter linking to the parent topic" but doesn't tell you to set
apparatus.type: research or apparatus.id: NNN. You'd need to independently find the Research frontmatter schema earlier in the document and
cross-reference it. The same pattern repeats for:

- Add an Experiment — Step 2 tells you to set hypothesis and status but not type, topic, or id, all of which appear in the Experiment schema.
- Record a Decision — Step 2 tells you to set type, status, and options but not apparatus.design (parent design name) or apparatus.id, both of which appear in the Decision schema.

Run an Experiment — The schema defines five statuses: planned | running | passed | failed | blocked. The procedure jumps from planned directly  
to passed/failed/blocked. It never tells you to set running. You'd have to guess whether to use it and when.

Complete an Investigation — Fully executable.

Design: Identify Open Questions — Step 4 says to set the Design's status to waiting when an investigation is spawned. But no procedure covers
the reverse transition (waiting → open) when the investigation completes. The spec's state diagram (infrastructure.md:79) shows this transition,
  and the "Complete an Investigation" procedure doesn't mention updating the parent Design. You'd have to guess to do it.

Complete a Design — Fully executable.

Supersede a Decision — Fully executable.

The maturity gap

The spec defines Document Maturity (proposed | specified | implemented | superseded) as an axis on all documents, orthogonal to lifecycle status
  (spec.md:104–120). No frontmatter schema in infrastructure.md includes a maturity field. No procedure tells you to set it. You'd have no idea  
where to record it.

This is compounded by the fact that the three existing documents themselves use status: specified in their frontmatter — but specified is a
maturity value, not a lifecycle status for any kind. The Design schema says status: open | waiting | complete. So the existing documents
contradict the schema they define.

---
Term tracing: procedures → spec definitions

Every term used in the procedures traces to a definition in spec.md except:
┌─────────────────────┬────────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────┐
│        Term         │       Where used       │                                          Spec status                                          │
├─────────────────────┼────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────┤
│ disposition         │ Open Questions         │ Not in spec. The spec describes the concept ("investigated or deferred with rationale" at     │
│ (investigate |      │ procedure, Design      │ spec.md:160) but never uses the word "disposition." This is harmless — it's implementation    │
│ defer)              │ schema                 │ vocabulary for a spec concept.                                                                │
├─────────────────────┼────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────┤
│ planned (experiment │ Add Experiment         │ Not in spec. The spec defines no experiment-specific lifecycle. It defines Investigation      │
│  status)            │ procedure, Experiment  │ lifecycle and experiment results (pass, fail, blocked) but planned is                         │
│                     │ schema                 │ infrastructure-invented.                                                                      │
├─────────────────────┼────────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────┤
│ running (experiment │ Experiment schema      │ Not in spec. Same as above.                                                                   │
│  status)            │                        │                                                                                               │
└─────────────────────┴────────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────┘
The planned/running statuses are reasonable infrastructure additions, but the spec's silence on experiment lifecycle means there's no
authoritative source for what these states mean or when transitions are valid.

---
Schema coverage: do schemas cover every field procedures tell you to set?
Procedure: Start Investigation
Field set by procedure: type, status, question, criteria
In schema?: All present
────────────────────────────────────────
Procedure: Complete Investigation
Field set by procedure: recommendation.statement, recommendation.confidence, open-questions, status
In schema?: All present
────────────────────────────────────────
Procedure: Add Research
Field set by procedure: "frontmatter linking to parent topic" (underspecified)
In schema?: Schema has type, topic, id — procedure doesn't enumerate them
────────────────────────────────────────
Procedure: Add Experiment
Field set by procedure: hypothesis, status
In schema?: Schema also has type, topic, id — procedure omits them
────────────────────────────────────────
Procedure: Record a Decision
Field set by procedure: type, status, options, chosen, rationale, evidence, assumptions
In schema?: Schema also has design, id — procedure omits them
────────────────────────────────────────
Procedure: All documents
Field set by procedure: (maturity)
In schema?: No schema includes a maturity field despite the spec defining it for all documents
The reverse direction is also clean: no schema field exists that would be impossible to set by following procedures. The problems are all
omissions from the procedures, not phantom schema fields.

---
Summary of gaps

1. No maturity field in any frontmatter schema. Spec defines it; infrastructure never maps it.
2. No procedure for Design waiting → open transition. Spec diagram shows it; no procedure covers it.
3. Procedures don't enumerate all required frontmatter fields for Research, Experiment, and Decision creation. You must independently
cross-reference the schema sections.
4. Experiment running status has no trigger. It's in the schema but no procedure ever tells you to set it.

---
Proposed minimal fixes

Fix 1 — Add maturity to frontmatter. In the "Data conventions" table in infrastructure.md, add a row documenting that all documents carry
apparatus.maturity: proposed | specified | implemented | superseded. Then add maturity to each kind's frontmatter schema block. This also
resolves the existing documents' use of status: specified — they should use maturity: specified alongside their kind-specific status.

Fix 2 — Add a "Resume a Design" procedure. After "Identify Open Questions", add:

Resume a Design after Investigation completes

1. When a spawned Investigation reaches complete or abandoned, return to the parent Design.
2. If no other spawned Investigations are still active, update apparatus.status to open.

Fix 3 — Enumerate all frontmatter fields in creation procedures. In "Add Research" step 2, change "with frontmatter linking to the parent topic"
  to an explicit list: set apparatus.type: research, apparatus.topic, and apparatus.id. Apply the same pattern to "Add an Experiment" (add type,
topic, id) and "Record a Decision" (add design, id).

Fix 4 — Remove running from the Experiment schema. The procedures never set it and the spec doesn't define it. The simpler option is to drop it
rather than invent a procedure for an unspecified state. This changes the schema to planned | passed | failed | blocked, all of which have clear
  triggers in the procedures.

---
Bottom line: could I execute a real design task with these documents? Yes, with caveats. The Investigation procedures are almost fully
executable. The Design procedures have a missing transition and underspecified creation steps for child artifacts. The maturity axis is defined
but has nowhere to live. Fixes 1–4 above are all single-point edits that close these gaps without adding any new concepts.
