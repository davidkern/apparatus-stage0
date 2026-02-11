# Tufte Intent Consolidation

## Statistics
- Input: 312 entries across 24 files
- After dedup: 47 unique intents
- After quality filter: 31 catalog-ready intents
- Filtered out: 16 (meta-qualities, anti-patterns, vague principles)

---

## Consolidated Intents by Category

### Evidential

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Reveal What Statistics Conceal** | Use graphics to expose patterns, outliers, and relationships that summary statistics would hide or miss entirely | ch1a-text-only, ch1a-multimodal |
| **Preserve Data Integrity** | Represent data accurately without visual manipulation that would misrepresent the underlying quantities (includes proportional encoding, baseline integrity, magnitude preservation) | ch1a-text-only, ch2a-text-only, ch2a-multimodal, ch2b-text-only, ch2b-multimodal |
| **Support Causal Investigation** | Enable viewers to generate and test hypotheses about causes by revealing correlations and spatial/temporal associations | ch1a-text-only, ch1a-multimodal, ch1b-multimodal |
| **Warn About Data Limitations** | Acknowledge and communicate the limitations, uncertainties, and potential artifacts in the data or visualization | ch1a-text-only |
| **Confront Theory with Evidence** | Use graphical display to test whether theoretical predictions match empirical observations | ch1b-multimodal, ch3-4a-multimodal |
| **Establish Credibility Through Completeness** | Use comprehensive data display to establish trust and transparency, as sparse displays raise suspicions about omissions | ch8-9a-text-only, ch8-9a-multimodal |

### Comparative

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Enable Comparison** | Design graphics that invite the viewer to compare different pieces of data, enabling pattern detection through visual juxtaposition | ch1a-text-only, ch1a-multimodal |
| **Show Deviation from Expected** | Display how actual values deviate from baseline, expected, or normal values | ch1a-multimodal, ch1b-text-only |
| **Small Multiples** | Use repeated identical graphical structures to allow viewers to focus on data changes rather than design interpretation across many cases | ch1b-text-only, ch1b-multimodal, ch8-9a-text-only, ch8-9a-multimodal |
| **Show Before-After State Change** | Contrast the state of a system before and after a significant event or intervention, making the change visually evident | ch1b-text-only, ch1b-multimodal |
| **Contextual Comparison** | Place data within meaningful reference frame by comparing values to relevant benchmarks or adjacent data | ch2a-text-only, ch2a-multimodal, ch2b-text-only |
| **Rank Change Display** | Show how ordinal positions shift over time or between conditions, revealing both absolute values and relative movement | ch7b-multimodal |

### Temporal

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Tell a Story Over Time** | Use the natural ordering of temporal data to create narrative coherence, showing change, cycles, and trends | ch1a-text-only, ch1a-multimodal, ch8-9a-text-only |
| **Show Movement and Direction** | Represent flow, direction, and motion through graphic encoding | ch1a-text-only, ch1a-multimodal |
| **Narrate Across Space and Time** | Tell a story that unfolds across both geographic space and temporal sequence, integrating movement, location, and chronology | ch1b-text-only, ch1b-multimodal |
| **Enable Cyclical Continuity** | For cyclical or periodic data, extend display beyond one complete cycle so viewers can track patterns continuously | ch3-4b-text-only, ch3-4b-multimodal |
| **Annotate with Contextual Events** | Integrate external events or milestones directly into the data display, connecting quantitative patterns to historical context | ch7a-text-only, ch7a-multimodal |

### Distributional

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Show the Data** | Present the underlying quantitative information directly, making the data itself visible rather than obscuring it | ch1a-text-only, ch1a-multimodal, ch3-4a-text-only, ch3-4b-text-only |
| **Enable Multi-Level Reading** | Allow the viewer to engage with data at multiple scales simultaneously - from broad overview to fine-grained detail | ch1a-text-only, ch1a-multimodal, ch7b-text-only |
| **Display Distribution Summary** | Communicate the shape and spread of data through compact visual summaries (quartiles, median, range, outliers) | ch5-6a-text-only, ch5-6a-multimodal, ch5-6b-text-only, ch5-6b-multimodal |
| **Range-Frame** | Use axis endpoints to communicate actual data extent rather than arbitrary round numbers, making range explicit | ch5-6b-text-only, ch5-6b-multimodal, ch7a-text-only |
| **Show Marginal Distributions** | Display the marginal frequency distribution of each variable alongside the bivariate distribution (dot-dash-plot) | ch5-6b-text-only, ch5-6b-multimodal, ch7a-multimodal |
| **Identify Outliers** | Make exceptional observations visually salient so they can be examined or investigated | ch1a-multimodal, ch7a-text-only, ch7a-multimodal |

### Relational

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Locate Data in Geographic Space** | Use geographic position as an organizing dimension, enabling spatial pattern detection and regional comparison | ch1a-text-only, ch1a-multimodal |
| **Relate Abstract Variables** | Plot any variable against any other variable to reveal relationships, freed from geographic or temporal constraints (scatterplot) | ch1b-text-only, ch1b-multimodal, ch3-4a-text-only |
| **Integrate Multiple Variables** | Present multivariate data in a unified graphic that allows relationships among several variables to be perceived simultaneously | ch1b-text-only, ch1b-multimodal |
| **Sequential Variable Tracking** | Connect a series of bivariate scatters through marginal projections, enabling tracing of observations through transformations (rugplot) | ch5-6b-text-only, ch5-6b-multimodal |
| **Reveal Interaction Effects** | Show how the effect of one variable depends on the level of another variable, making interaction patterns visually apparent | ch7a-multimodal, ch8-9a-multimodal |

### Aggregative

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Maximize Data Density** | Present many numbers in a small space, achieving information efficiency | ch1a-text-only, ch1a-multimodal, ch7b-text-only, ch7b-multimodal, ch8-9a-text-only, ch8-9a-multimodal |
| **Synthesize Multiple Sources** | Bring together findings from many separate studies or measurements into a single display enabling comparison | ch1b-text-only, ch1b-multimodal |
| **Decompose Signal from Noise** | Separate complex data into constituent components to reveal underlying patterns hidden by fluctuations | ch1b-multimodal |

### Instructional

| Intent Name | Definition | Source Chunks |
|-------------|------------|---------------|
| **Direct Attention to Substance** | Focus viewer cognition on the meaning of the data rather than on graphic technique, methodology, or decoration | ch1a-text-only, ch1a-multimodal, ch3-4a-multimodal |
| **Integrate Text and Graphics** | Treat data graphics as paragraphs about data, seamlessly weaving quantitative information into textual narrative | ch8-9b-text-only, ch8-9b-multimodal |

---

## Filtered Out

### Meta-Qualities (do not guide specific design choices)

| Item | Reason |
|------|--------|
| Efficiency | Meta-quality about all graphics, not specific guidance |
| Clarity | Meta-quality, achieved through specific techniques |
| Elegance | Aesthetic quality, not communicative purpose |
| Precision | Meta-quality, not actionable intent |
| Create Memorable Impressions | Outcome goal, not design intent |
| Data-Ink Ratio Maximization | Design principle, not communicative intent |
| Information Density | Subsumed under Maximize Data Density |
| Graphical Elegance | Aesthetic meta-quality |
| Design Efficiency Beyond Information | Meta-principle about tradeoffs |
| Audience Capability Assumption | Designer stance, not intent |
| Professional Quantitative Judgment | About who makes graphics, not what they communicate |
| Apply Principles Flexibly | Meta-principle about applying other principles |

### Anti-Patterns (stated as negatives, belong in separate anti-catalog)

| Item | Reason |
|------|--------|
| Decoration Without Purpose | Anti-pattern, not positive intent |
| Methodology Exhibition | Anti-pattern |
| Theory Projection | Anti-pattern |
| Avoid Chartjunk | Negative formulation |
| Avoid Moire Vibration | Negative formulation |
| Avoid Puzzle Graphics | Negative formulation |

### Vague Principles (do not guide specific design choices)

| Item | Reason |
|------|--------|
| Truth-Telling | Too abstract; subsumed under Preserve Data Integrity |
| Honest Decoration | Edge case, not core intent |
| Table-Graph Selection | About format choice, not visualization intent |
| Serve Clear Purpose | Meta-statement |
| Condensation of Sensations | Aesthetic aspiration |
| Reveal Complexity | Too abstract; subsumed under specific distributional intents |

---

## Merge Log

| Consolidated Intent | Merged Source Names |
|--------------------|---------------------|
| **Show the Data** | "Show the Data", "Data Revelation", "Reveal Data", "Data Primacy", "Data-First Presentation", "Above All Else Show the Data" |
| **Enable Comparison** | "Enable Comparison", "Encourage Comparison", "Comparison Facilitation", "Comparative Display", "Within-View Comparison" |
| **Preserve Data Integrity** | "Preserve Data Integrity", "Truth-Telling", "Veridical Representation", "Representational Fidelity", "Proportional Encoding", "Proportional Representation", "Baseline Integrity", "Magnitude Preservation", "Truthful Magnitude Representation", "Dimensional Correspondence", "Scale Consistency", "Honest Magnitude Representation" |
| **Maximize Data Density** | "Maximize Data Density", "Communicate Density", "Data Density Maximization", "Information Density", "Dense Information Display" |
| **Enable Multi-Level Reading** | "Enable Multi-Level Reading", "Support Multi-Level Reading", "Multi-depth Viewing", "Multiple Viewing Depths" |
| **Tell a Story Over Time** | "Tell a Story Over Time", "Communicate Temporal Change", "Temporal Narrative", "Create Narrative Through Sequence" |
| **Relate Abstract Variables** | "Relate Abstract Variables", "Relational Graphics", "Reveal Relationship Between Variables", "Explain Relationships" |
| **Integrate Multiple Variables** | "Integrate Multiple Variables", "Multivariate Integration", "Show Multivariate Complexity", "Multivariate Revelation" |
| **Direct Attention to Substance** | "Direct Attention to Substance", "Draw Attention to Sense and Substance", "Data Primacy Over Decoration", "Authentic Representation" |
| **Display Distribution Summary** | "Show Distribution Shape", "Distributional Display", "Distribution Summary", "Five-Number Display", "Quartile Display", "Quartile Plot" |
| **Small Multiples** | "Small Multiples", "Repeat Design for Comparison", "Comparative Juxtaposition", "Maintain Design Constancy Across Frames" |
| **Contextual Comparison** | "Contextual Comparison", "Contextualization", "Contextual Completeness", "Provide Context Through Reference Structures" |
| **Support Causal Investigation** | "Support Causal Investigation", "Generate Hypotheses", "Reveal Causal Mechanism", "Convey Causal Evidence" |
| **Show Deviation from Expected** | "Show Deviation from Norm", "Reveal Divergence from Expected Pattern", "Detect Deviation from Baseline" |
| **Identify Outliers** | "Identify Outliers", "Identify Outliers and Anomalies", "Stranger Detection" |
| **Range-Frame** | "Range Display", "Range-Frame", "Show Data Range Precisely", "Range-Labels" |
| **Show Marginal Distributions** | "Marginal Distribution Display", "Dot-Dash-Plot", "Show Marginal Distributions Through Label Positioning" |
| **Annotate with Contextual Events** | "Contextual Annotation", "Event Annotation", "Tie Reference Grid to Significant Events", "Label Important Events" |
| **Integrate Text and Graphics** | "Integrate with Verbal Description", "Data-Text Integration", "Integrate Words, Numbers, and Drawing" |
