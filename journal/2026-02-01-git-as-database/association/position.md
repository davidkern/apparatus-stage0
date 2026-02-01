# Position statement: Association

## Core argument

The Apparatus is a system for managing structured knowledge across time. Its structures — journals, investigations, designs — are not isolated containers. They are lenses onto a shared body of evolving knowledge. The fundamental unit of the system is the knowledge artifact: an entry, a decision, a finding, an assumption. Structures give those artifacts *meaning in context*, but they do not give them *existence*. An entry exists because a researcher did work and recorded it. It participates in an investigation because that work is relevant evidence. It appears in a journal because it is part of the chronological record. These are two true statements about the same artifact, not two artifacts that happen to share a cause.

Association models this reality directly. Artifacts are first-class objects with independent identity. Structures are collections of references that impose scope, ordering, and interpretation on those artifacts. This is not a weaker relationship than ownership — it is a *more precise* one. Composition forces the system to pretend that context-of-use is identity, which is a category error that compounds over time as the knowledge base grows and cross-structural relationships multiply.

The strongest version of the argument is this: the Apparatus exists to trace how knowledge flows between contexts. A finding from an investigation becomes evidence for a design decision. A journal entry captures the reasoning that led to an experimental result. An assumption underlies decisions across multiple designs. These are not incidental cross-references — they are the primary value proposition of the system. A containment model that makes each structure a sealed container actively works against the system's purpose. Association makes knowledge flow a structural property of the data model rather than a bookkeeping exercise layered on top.

## Tension points

### 1. Journal/investigation overlap

A researcher does work within an investigation and writes about it in the journal. One act, two structures. This is the paradigm case for association.

Under association, the researcher produces one artifact. That artifact is referenced by the investigation (as evidence) and by the journal (as a chronological record). The artifact carries its own identity, creation time, and content. Each structure's reference can carry context-specific metadata: the journal reference carries the chronological position; the investigation reference carries the evidentiary role (research entry, experiment result).

This is not sharing for the sake of economy. It is *semantic accuracy*. The work happened once. The finding is one finding. If the researcher later corrects a factual error in the finding, that correction is visible in both contexts because it is the same object. Under composition, a correction to the investigation entry leaves the journal entry stale, or requires a coordination mechanism to propagate changes across duplicated objects — a mechanism that must be maintained, tested, and trusted to be complete.

The composition counterargument is that the journal entry and the investigation entry "serve different functions" — the journal records narrative, the investigation records evidence. This is sometimes true: a journal entry might include personal reflection that does not belong in an investigation's evidence chain. But when it is true, the researcher produces two genuinely different artifacts, and association handles this naturally — two distinct objects, each referenced from the appropriate structure. Association does not force sharing; it *permits* it when the artifact is genuinely the same. Composition forces separation even when the artifact is genuinely shared.

### 2. Design-to-investigation links

A design spawns an investigation. The investigation produces findings. The design uses those findings as evidence for decisions. Under the primer's own description, the investigation is a sibling structure, not a child of the design.

Association handles this without any special mechanism. The investigation's findings are artifacts. The design's decisions reference those artifacts as evidence. The reference is a direct link to a first-class object. There is no boundary to cross, no ownership to negotiate, no duplication to manage. The finding exists; the decision points to it.

Under composition, the investigation owns its findings. The design cannot reference them directly — it must reference the investigation and then navigate to the finding within it. This creates a coupling between the design's evidence chain and the investigation's internal structure. If the investigation reorganizes its entries, the design's references break. If the investigation is snapshotted into a different instantiation, the design's evidence chain now points to an object in a different scope.

More fundamentally, composition cannot express "this decision rests on this finding" without either (a) duplicating the finding into the design's scope, creating a copy that can drift from the original, or (b) creating a cross-container reference, which is association by another name. If you need association between sibling structures, you have association in your system whether you call it that or not. The question is whether you embrace it as a first-class design principle or bolt it on as an exception to a containment model.

### 3. Assumption impact analysis

The system must answer: "which decisions are affected when assumption X changes?" This query spans across designs and investigations. It is inherently a graph traversal.

Under association, this is a direct query over the reference graph. Assumptions are objects. Decisions reference assumptions. The query is: find all decision objects whose assumption references include X. This is a straightforward index lookup or graph traversal over first-class references.

Under composition, assumptions live inside designs. Decisions live inside (possibly different) designs. The query must open every design container, enumerate its decisions, inspect each decision's assumptions, and check for matches. If assumptions are shared across designs (which the primer's behavioral linkages section implies), composition must either duplicate each assumption into every design that uses it — making "assumption X changed" ambiguous (which copy changed?) — or maintain cross-container references to a canonical assumption, which is again association wearing a disguise.

Association makes assumption impact analysis a natural, efficient operation because the reference graph *is* the data model. You do not reconstruct the graph from container contents at query time; the graph is already there.

### 4. Selective provisioning

A researcher wants to create an isolated environment with specific structures: one investigation, three journal entries, no designs.

Under association, selective provisioning is explicit and precise. The researcher specifies the artifacts they want in the new environment. The system collects those artifacts and their outgoing references (or a controlled subset of them), and instantiates an environment containing exactly those objects. The reference graph within the new environment is a subgraph of the original — consistent by construction.

This is where association's independent-object model pays its largest dividend. Each artifact exists as a self-contained unit with its own identity. Selecting artifacts for inclusion is like selecting items from a catalog. There is no need to decompose a container, worry about orphaned children, or reconstruct containment hierarchies. You pick the objects you want and the references that should be live in the new scope.

Under composition, selective provisioning means disassembling containers. You want three journal entries — but the journal is a single container. You must extract entries from the container, construct a new partial container, and ensure the partial container is internally consistent. You want one investigation — you get the investigation and all its children, which may include artifacts you did not want. Selective provisioning under composition is always coarser-grained than the researcher intends, or it requires the same object-level selection that association provides natively, plus the overhead of reconstructing valid containers from the selected objects.

### 5. Future structure types

A new structure type is added later. Under association, the new structure type is a new collection of references to existing artifact types, plus potentially new artifact types. Existing artifacts can participate in the new structure without modification or duplication. The new structure is defined by its reference semantics — what kinds of artifacts it collects, what metadata it attaches to references, what lifecycle it imposes. No existing structure is affected.

This is not merely "low rework." It is the difference between an extensible architecture and one that requires migration. Under composition, a new structure type that needs to use artifacts from existing structures must either duplicate those artifacts (creating consistency obligations) or introduce cross-container references (breaking the containment model's invariants). Every new structure type that has cross-structural relationships — and the primer's behavioral linkages section suggests this is the norm, not the exception — forces the same choice: duplicate or reference. Association makes that choice once, up front, and every future structure inherits the answer.

## Evaluation

The qualities I consider most important for this design decision, in order:

**Semantic fidelity.** Does the data model accurately represent the domain? The Apparatus manages knowledge artifacts that participate in multiple contexts. A finding is used as evidence in a design decision and recorded in a journal and produced within an investigation. This is one thing in three contexts, not three things. Association represents this truthfully. Composition represents it as three independent copies that happen to share content, which is a falsehood the system must then work to maintain — synchronizing updates, detecting drift, or accepting silent inconsistency.

**Cross-structural query efficiency.** The system's most distinctive capability is tracing how knowledge flows across structures: assumption impact analysis, evidence provenance, finding reuse. These are graph queries. Association stores the graph explicitly. Composition stores containers and requires the graph to be reconstructed at query time by opening containers, following cross-container references (if they exist), and deduplicating shared content. The graph is the point of the system. Store the graph.

**Provisioning precision.** Selective provisioning is a stated requirement. Association provides object-level granularity by default. Composition provides container-level granularity by default and must be decomposed to achieve finer control. The more demanding the provisioning scenario — and the primer describes scenarios where a practitioner operates inside a controlled environment that must appear real — the more granular control matters.

**Evolutionary capacity.** The system is explicitly designed to be extended. New structure types, new behavioral linkages, new cross-structural queries. Association accommodates these through new reference types and new collection semantics, without modifying existing structures or migrating existing data. Composition accommodates them through duplication or by relaxing the containment invariant — both of which increase complexity over time.

**Implementation clarity.** Composition's apparent simplicity — "copy the container" — is real but narrow. It applies cleanly to the snapshotting operation and to nothing else. For every other operation the system must perform (cross-structural queries, selective provisioning, assumption tracking, evidence chains), composition either requires supplementary mechanisms that reintroduce association's complexity, or it accepts limitations that reduce the system's value. Association's complexity is uniform: there is a reference graph, and every operation is a graph operation. This uniformity is easier to reason about, test, and extend than a hybrid model where some relationships are containment and others are references.

## Consequences

### What becomes easier

**Cross-structural operations become first-class.** Evidence chains, assumption impact analysis, knowledge provenance — all are direct queries over the reference graph. No container traversal, no cross-container reference resolution, no deduplication.

**Selective provisioning is granular and precise.** Object-level selection for isolated environments. The researcher gets exactly what they specify, no more and no less.

**Extension is additive.** New structure types compose with existing artifacts through new references. No migration, no duplication, no modification of existing structures.

**Single source of truth for shared knowledge.** A finding, assumption, or entry exists once. All structures that use it reference the same object. Updates propagate by identity, not by synchronization.

**The CLI's query layer is straightforward.** The data model *is* the query model. Indexes over the reference graph support all cross-structural queries directly. The CLI does not need to reconstruct relationships from container internals.

### What becomes harder

**Whole-structure snapshotting requires reference traversal.** To snapshot an investigation, the system must walk the investigation's references and collect the referenced artifacts. This is a graph traversal, not a container copy. The cost is proportional to the number of references, not the size of the content. For typical investigation sizes (tens of entries, not thousands), this is a non-issue in practice. For very large structures, an index or materialized view can amortize the cost.

**Dangling reference management.** If an artifact is deleted (or excluded from a provisioned environment), references to it become dangling. The system needs a reference-integrity mechanism — either preventing deletion of referenced objects, or handling missing references gracefully at read time. This is a real cost, but it is a well-understood problem with well-known solutions. The CLI, as the sole access interface, is the natural enforcement point.

**The data model is a graph, not a tree.** Graphs are harder to visualize, harder to serialize naively, and harder to reason about informally than trees. Engineers debugging the storage layer must think in terms of nodes and edges rather than directories and files. This is a genuine cognitive cost — but it is also the accurate mental model for the system's domain. A tree model would be simpler but wrong, and "simpler but wrong" is a description of technical debt.

### What risks emerge

**Reference sprawl.** Without discipline, the reference graph can become dense and tangled, making it hard to understand which artifacts are relevant to which structures. Mitigation: the CLI enforces structure-type-specific reference semantics (an investigation can reference entries and artifacts; it cannot reference designs). The schema constrains the graph's shape.

**Garbage collection ambiguity.** When is an artifact safe to remove? In composition, the answer is clear: when its container is removed. In association, an artifact is safe to remove only when no structure references it. This requires either reference counting or reachability analysis. Again, the CLI is the enforcement point, and this is standard graph-database territory.

**Perceived complexity at introduction.** A developer encountering the system for the first time may find the graph model less immediately intuitive than a tree model. This front-loaded complexity cost is real. But it is paid once, at onboarding, whereas composition's hidden complexity — the cross-container references, the duplication management, the query-time graph reconstruction — is paid continuously during development and operation.

The core bet of association is that the Apparatus is fundamentally a system about relationships between knowledge artifacts, and that a data model which represents those relationships explicitly will be simpler, more capable, and more maintainable than one which hides them inside containers and reconstructs them on demand.
