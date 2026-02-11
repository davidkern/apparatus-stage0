# Intents from Scientific Writing and Data Presentation

This document explores communicative intents derived from scientific writing conventions,
statistical reporting standards, data visualization best practices, and uncertainty
communication research. The focus is on intents related to measurement, precision,
uncertainty, confidence, reproducibility, and quantitative claims.

## Sources

Research drawn from:
- [PMC: Error bars in experimental biology](https://pmc.ncbi.nlm.nih.gov/articles/PMC2064100/)
- [Scribbr: Reporting Statistics in APA Style](https://www.scribbr.com/apa-style/numbers-and-statistics/)
- [Purdue OWL: APA Numbers and Statistics](https://owl.purdue.edu/owl/research_and_citation/apa_style/apa_formatting_and_style_guide/apa_numbers_statistics.html)
- [NIST Technical Note 1297: Guidelines for Evaluating Uncertainty](https://emtoolbox.nist.gov/publications/nisttechnicalnote1297s.pdf)
- [IEEE Transactions on Instrumentation and Measurement](https://ieee-ims.org/publication/ieee-tim)
- [CDC: GRADE Criteria for Certainty of Evidence](https://www.cdc.gov/acip-grade-handbook/hcp/chapter-7-grade-criteria-determining-certainty-of-evidence/index.html)
- [Wikipedia: Hierarchy of evidence](https://en.wikipedia.org/wiki/Hierarchy_of_evidence)
- [PMC: Statistical Significance versus Clinical Relevance](https://pmc.ncbi.nlm.nih.gov/articles/PMC11633268/)
- [PMC: The academic hedge - Modal tuning in research writing](https://pmc.ncbi.nlm.nih.gov/articles/PMC7138759/)
- [San Francisco Edit: Figure and Table Legends](https://www.sfedit.net/figure-legend-table-legend/)
- [NCBI: Understanding Reproducibility and Replicability](https://www.ncbi.nlm.nih.gov/books/NBK547546/)
- [USC: Limitations of the Study](https://libguides.usc.edu/writingguide/limitations)
- [BIPM: SI Prefixes](https://www.bipm.org/en/measurement-units/si-prefixes)
- [PMC: Power Analysis and Sample Size](https://pmc.ncbi.nlm.nih.gov/articles/PMC7162597/)
- [PMC: Uncertainty Visualization in Biological Data](https://pmc.ncbi.nlm.nih.gov/articles/PMC9580861/)

---

## New Intent Category: Quantification

Scientific writing reveals a category of intents focused on communicating numerical
values with appropriate precision and context. Unlike raw data display, these intents
carry semantic meaning about measurement quality, uncertainty, and comparability.

### Intent: Measurement

**Definition**: Reporting a numerical value obtained through observation or
instrumentation, with its associated unit.

**Semantic Purpose**: The author wants the audience to understand a quantity
that was empirically determined, not merely asserted or calculated.

**Examples**:
- "The sample weighed 10.12 kg"
- "Latency was measured at 47 ms"
- "The temperature reached 98.6°F"
- "We observed a concentration of 3.2 mmol/L"

**Notation patterns**:
- Value + unit: "47 ms", "10.12 kg"
- Value + unit with precision indicated by significant figures

**Containment**:
- Contains: (the value and unit)
- Contained by: Observation, Result, Finding

**Relationship to Existing Categories**: Related to State (describes current
situation) but specifically about empirically-obtained quantities. Distinct from
Calculation or Assertion.

**Forms**:
- *Typographic*: Numeric with unit, possibly in table cell
- *Auditory*: Spoken value with unit, emphasis on number
- *Visual*: Data point on chart, labeled mark

---

### Intent: Measurement-with-Uncertainty

**Definition**: Reporting a measured value together with bounds on its uncertainty.

**Semantic Purpose**: The author wants the audience to understand both the
central estimate and the range within which the true value likely falls,
enabling proper interpretation and comparison.

**Examples**:
- "10.12 ± 0.04 kg" (plus-minus notation)
- "47 ms (95% CI [42, 52])" (confidence interval)
- "3.2 ± 0.2 mmol/L (SD)" (with uncertainty type specified)
- "The mass was 1.67262192595(52) × 10⁻²⁷ kg" (parenthetical uncertainty)
- "Latency: 47 ms [42-52]" (range notation)

**Notation patterns**:
- Plus-minus: "value ± uncertainty unit"
- Confidence interval: "value (95% CI [lower, upper])"
- Parenthetical: "value(uncertainty) × 10ⁿ unit"
- Range: "value [lower-upper]"

**Containment**:
- Contains: Measurement, Uncertainty-Bound
- Contained by: Result, Finding, Comparison

**Relationship to Existing Categories**: Extends the existing Uncertainty intent
(Evidential category) with specific measurement context. Also related to
Confidence.

**Forms**:
- *Typographic*: ± notation inline, CI in parentheses or brackets
- *Auditory*: "ten point one two plus or minus zero point zero four kilograms"
- *Visual*: Error bars on data points, shaded confidence bands

---

### Intent: Precision-Statement

**Definition**: Explicitly communicating the level of precision of a measurement
or calculation, beyond what significant figures alone convey.

**Semantic Purpose**: The author wants the audience to understand the resolution
or granularity of the reported value, distinguishing between "we measured it
to three decimal places" and "we only know it to the nearest whole number."

**Examples**:
- "Measured to ±0.01 mm precision"
- "Values are reported to two decimal places"
- "Precision: 0.1%" or "Accuracy: 0.01 g"
- "Resolution of 0.001 seconds"

**Containment**:
- Contains: (precision specification)
- Contained by: Measurement, Methodology

**Relationship to Existing Categories**: No direct analog. Related to
Measurement-with-Uncertainty but about the measurement instrument/method
capability rather than the specific result's uncertainty.

**Forms**:
- *Typographic*: Specification in methodology section or table footnote
- *Auditory*: Stated as part of methodology description
- *Visual*: Indicated through axis tick resolution, table column precision

---

### Intent: Significant-Figures

**Definition**: Implicitly communicating precision through the number of
digits reported.

**Semantic Purpose**: The author wants the audience to infer precision from
notation, following the convention that trailing digits indicate meaningful
precision.

**Examples**:
- "5.00 m" vs "5 m" (two decimal places vs whole number precision)
- "1.300 × 10³" vs "1.3 × 10³" (four vs two significant figures)
- "0.0500" (three significant figures, precision to thousandths)
- "47.0 kΩ ±5%" (explicit precision on a value with sig figs)

**Containment**:
- Contains: (implicit in number representation)
- Contained by: Measurement, Calculation

**Relationship to Existing Categories**: Related to Precision-Statement but
implicit rather than explicit. A form of encoded meaning in notation.

**Forms**:
- *Typographic*: Number representation itself encodes precision
- *Auditory*: May require explicit verbalization ("five point zero zero meters")
- *Visual*: Number on axis label or data point

---

## New Intent Category: Statistical-Claim

Scientific reporting requires communicating not just what was observed, but
the inferential strength of conclusions drawn from data.

### Intent: Statistical-Significance-Statement

**Definition**: Asserting whether an observed effect is unlikely to be due
to chance, based on a threshold criterion.

**Semantic Purpose**: The author wants the audience to understand that a
result meets a conventional threshold for inferential confidence (typically
p < 0.05).

**Examples**:
- "The difference was statistically significant (p = .006)"
- "Results were not significant, p = .23"
- "t(32) = 2.94, p = .006"
- "F(2, 47) = 4.32, p < .05"
- "*p < .05, **p < .01, ***p < .001" (table notation)

**Notation patterns**:
- Inline: "p = .006" or "p < .001"
- Full test result: "t(df) = value, p = value"
- Table footnotes with asterisk convention

**Containment**:
- Contains: Test statistic, p-value
- Contained by: Finding, Result, Comparison

**Relationship to Existing Categories**: Related to Claim+Evidence and
Confidence (Evidential) but with specific statistical formalism.

**Forms**:
- *Typographic*: Inline parenthetical, table cells with asterisks
- *Auditory*: "The difference was statistically significant at p equals point zero zero six"
- *Visual*: Asterisks on bar charts, significance brackets

---

### Intent: Effect-Size-Statement

**Definition**: Reporting the magnitude of an observed effect in standardized
terms, independent of sample size.

**Semantic Purpose**: The author wants the audience to understand how large
or meaningful an effect is, not just whether it is statistically detectable.
Addresses the distinction between statistical and practical significance.

**Examples**:
- "d = 0.81" (Cohen's d)
- "The effect size was large (d = 0.81, 95% CI [0.6, 1.02])"
- "η² = 0.14" (eta squared)
- "r = .42" (correlation coefficient as effect size)
- "OR = 2.3 [1.5, 3.4]" (odds ratio with CI)

**Notation patterns**:
- Standardized: "d = value", "η² = value"
- With confidence interval: "d = value, 95% CI [lower, upper]"
- Named magnitude: "small/medium/large effect"

**Containment**:
- Contains: Effect size metric, (optionally) CI
- Contained by: Finding, Result

**Relationship to Existing Categories**: Distinct from Statistical-Significance.
Related to Deviation (Comparative) but standardized and about inferred effects.

**Forms**:
- *Typographic*: Inline with significance results, dedicated table column
- *Auditory*: "Cohen's d equals zero point eight one"
- *Visual*: Effect size forest plots, magnitude indicators

---

### Intent: Confidence-Interval

**Definition**: Reporting a range of values within which the true population
parameter is estimated to fall, with a stated confidence level.

**Semantic Purpose**: The author wants the audience to understand the
uncertainty in a point estimate and the range of plausible true values.

**Examples**:
- "95% CI [2.47, 2.99]"
- "M = 4.5, 95% CI [4.1, 4.9]"
- "The mean difference was 2.3 (90% CI [1.1, 3.5])"
- "HR = 1.45 [1.12-1.88]" (hazard ratio with CI)

**Notation patterns**:
- Bracketed: "95% CI [lower, upper]"
- Parenthetical: "(CI: lower-upper)"
- Inline with estimate: "M = value, 95% CI [lower, upper]"

**Containment**:
- Contains: Confidence level, lower bound, upper bound
- Contained by: Effect-Size-Statement, Statistical-Significance-Statement

**Relationship to Existing Categories**: Related to Measurement-with-Uncertainty
but for inferred parameters rather than measured values.

**Forms**:
- *Typographic*: Brackets with confidence level, forest plot notation
- *Auditory*: "ninety-five percent confidence interval from two point four seven to two point nine nine"
- *Visual*: Error bars, confidence bands, forest plot horizontal lines

---

### Intent: Sample-Size-Statement

**Definition**: Reporting the number of observations or participants on which
a finding is based.

**Semantic Purpose**: The author wants the audience to understand the
evidential basis for a claim, enabling assessment of statistical power
and generalizability.

**Examples**:
- "N = 150"
- "n = 47 per group"
- "The sample included 1,024 participants"
- "Based on 10,000 trials"
- "k = 12 studies" (for meta-analyses)

**Notation patterns**:
- Total: "N = value"
- Per-condition: "n = value per group"
- In prose: "N participants"

**Containment**:
- Contains: (count)
- Contained by: Methodology, Finding

**Relationship to Existing Categories**: Related to Count (Aggregative) but
specifically about the evidential basis for inference.

**Forms**:
- *Typographic*: Inline "N = value", table header, parenthetical
- *Auditory*: "with N equals one hundred fifty participants"
- *Visual*: Sample size legend on plots, bubble size in meta-analysis

---

### Intent: Power-Statement

**Definition**: Reporting the statistical power of a study or analysis.

**Semantic Purpose**: The author wants the audience to understand the
study's ability to detect an effect if one exists, addressing the risk
of false negatives.

**Examples**:
- "The study was powered at 80% to detect a medium effect"
- "Power analysis indicated N = 64 per group was required"
- "Post-hoc power was 0.92"
- "With α = .05 and power = .80, the minimum detectable effect was d = 0.4"

**Containment**:
- Contains: Power value, (optionally) effect size, sample size
- Contained by: Methodology, Limitation

**Relationship to Existing Categories**: Related to Sample-Size-Statement and
Effect-Size-Statement. Part of a constellation of intents about inferential quality.

**Forms**:
- *Typographic*: Methodology section prose, power analysis table
- *Auditory*: Stated as part of methodology
- *Visual*: Power curves showing sample size vs. detectable effect

---

## New Intent Category: Evidence-Grading

Scientific discourse requires communicating not just claims, but the quality
and strength of evidence supporting them.

### Intent: Evidence-Level-Statement

**Definition**: Categorizing the type and strength of evidence according to
a hierarchy (e.g., RCT > observational > expert opinion).

**Semantic Purpose**: The author wants the audience to understand where
evidence falls in a quality hierarchy, enabling appropriate weight to be
given to conclusions.

**Examples**:
- "Level 1a evidence from systematic review"
- "Based on observational studies (Level 2)"
- "Expert consensus (Level 5)"
- "GRADE: High certainty"
- "This recommendation is based on low-quality evidence"

**Notation patterns**:
- Numbered levels: "Level 1a", "Level 2b"
- Named grades: "High/Moderate/Low/Very Low"
- Quality ratings: "A/B/C/D recommendations"

**Containment**:
- Contains: Evidence classification
- Contained by: Claim, Recommendation

**Relationship to Existing Categories**: Related to Confidence (Evidential) but
about the nature of evidence rather than certainty in a specific claim.

**Forms**:
- *Typographic*: Inline parenthetical, summary of evidence tables
- *Auditory*: "This is based on level one A evidence"
- *Visual*: Pyramid diagrams, evidence grading icons

---

### Intent: Study-Design-Statement

**Definition**: Identifying the type of research design that produced a finding.

**Semantic Purpose**: The author wants the audience to understand the
methodological basis for a claim, enabling assessment of potential biases
and appropriate interpretation.

**Examples**:
- "In a randomized controlled trial..."
- "This cross-sectional survey found..."
- "Meta-analysis of 23 studies revealed..."
- "Case-control study (N = 450)"
- "Prospective cohort design"

**Containment**:
- Contains: Design type, (optionally) sample size
- Contained by: Methodology, Finding

**Relationship to Existing Categories**: Related to Provenance (Evidential) but
specifically about research methodology rather than general source.

**Forms**:
- *Typographic*: Methods section prose, PRISMA diagrams
- *Auditory*: Stated as methodological context
- *Visual*: Study design icons in evidence summaries

---

## New Intent Category: Epistemic-Hedging

Scientific writing requires calibrating certainty in claims. This category
covers intents that modulate the strength of assertions.

### Intent: Hedge

**Definition**: Expressing uncertainty, tentativeness, or qualification about
a claim using linguistic markers.

**Semantic Purpose**: The author wants to signal appropriate epistemic caution,
avoiding overclaiming while still communicating findings.

**Examples**:
- "The results suggest that..." (vs. "The results prove that...")
- "This may indicate..."
- "Possibly due to..."
- "It appears that..."
- "Our findings are consistent with..."
- "There seems to be..."

**Hedging markers**:
- Modal verbs: may, might, could, would
- Epistemic verbs: suggest, appear, seem, indicate
- Epistemic adverbs: possibly, probably, perhaps, likely
- Approximators: approximately, roughly, about

**Containment**:
- Contains: (the hedge marker)
- Contained by: Claim, Finding, Interpretation

**Relationship to Existing Categories**: Related to Confidence and Uncertainty
(Evidential) but realized through language rather than numerical bounds.
Distinct from statistical confidence intervals.

**Forms**:
- *Typographic*: Word choice in prose
- *Auditory*: Prosodic cues may accompany hedging (lower certainty, rising intonation)
- *Visual*: N/A (hedging is primarily linguistic)

---

### Intent: Boost

**Definition**: Expressing increased certainty or emphasis about a claim
using linguistic markers.

**Semantic Purpose**: The author wants to signal confidence in a claim,
distinguishing strong from tentative findings.

**Examples**:
- "The results clearly demonstrate..."
- "We conclusively show..."
- "This definitively establishes..."
- "It is evident that..."
- "Without doubt..."
- "The data strongly support..."

**Boosting markers**:
- Intensifiers: clearly, definitely, certainly
- Strong verbs: prove, demonstrate, establish, confirm
- Emphatic adverbs: strongly, conclusively, evidently

**Containment**:
- Contains: (the boost marker)
- Contained by: Claim, Finding

**Relationship to Existing Categories**: Inverse of Hedge. Related to Emphasis
category but specifically about epistemic weight rather than importance.

**Forms**:
- *Typographic*: Word choice in prose
- *Auditory*: Emphatic prosody, stress on key words
- *Visual*: N/A (boosting is primarily linguistic)

---

### Intent: Caveat

**Definition**: Explicitly stating a condition, limitation, or exception
that qualifies a claim.

**Semantic Purpose**: The author wants to prevent overgeneralization by
specifying the boundaries within which a claim holds.

**Examples**:
- "Under the conditions tested..."
- "This finding applies only to..."
- "With the caveat that..."
- "Assuming normal distribution..."
- "When controlling for age..."
- "In the absence of confounders..."

**Containment**:
- Contains: Condition, Scope-Limit
- Contained by: Claim, Finding, Interpretation

**Relationship to Existing Categories**: Related to Limitation and Assumption
but realized inline with claims rather than in separate sections.

**Forms**:
- *Typographic*: Subordinate clause, parenthetical
- *Auditory*: Prosodic marking of conditional status
- *Visual*: Footnotes on figures, conditional annotations

---

## New Intent Category: Methodology-Transparency

Scientific communication requires enabling others to evaluate and reproduce
work. This category covers intents about how research was conducted.

### Intent: Reproducibility-Information

**Definition**: Providing details sufficient for independent replication
of methods and analysis.

**Semantic Purpose**: The author wants to enable verification and extension
of the work by providing complete procedural information.

**Examples**:
- "Code is available at [repository URL]"
- "Following the protocol of Smith et al. (2020)..."
- "Analysis was performed using R version 4.2.1"
- "Raw data are deposited at [DOI]"
- "Experiments were conducted at 25°C ± 0.5°C"

**Containment**:
- Contains: Procedure-Details, Tool-Versions, Data-Location
- Contained by: Methodology section

**Relationship to Existing Categories**: Related to Procedure (Instruction) but
specifically for verification rather than direct execution.

**Forms**:
- *Typographic*: Methods section, supplementary materials, code blocks
- *Auditory*: Detailed methodology narration
- *Visual*: Flowcharts of experimental design, CONSORT diagrams

---

### Intent: Assumption-Statement

**Definition**: Explicitly stating premises that are taken as true for the
analysis, which may or may not be verifiable.

**Semantic Purpose**: The author wants to be transparent about the foundations
of the analysis, enabling readers to evaluate whether conclusions hold if
assumptions are violated.

**Examples**:
- "Assuming normality of residuals..."
- "Under the assumption of independence..."
- "Given that participants responded honestly..."
- "Assuming no unmeasured confounders..."
- "The model assumes constant variance"

**Containment**:
- Contains: (the assumption)
- Contained by: Methodology, Analysis

**Relationship to Existing Categories**: Distinct from Caveat (which qualifies
claims) and from Limitation (which describes constraints). Assumptions are
premises, not constraints.

**Forms**:
- *Typographic*: Methodology prose, model specification sections
- *Auditory*: Conditional framing in spoken methods
- *Visual*: Model diagrams with assumption annotations

---

### Intent: Limitation-Statement

**Definition**: Acknowledging constraints on the study that affect the
interpretation or generalizability of findings.

**Semantic Purpose**: The author wants to be transparent about weaknesses,
enabling appropriate interpretation and guiding future research.

**Examples**:
- "This study is limited by its cross-sectional design"
- "Our sample may not generalize to..."
- "We were unable to control for..."
- "The retrospective nature of the data limits..."
- "Due to time constraints, we could not..."

**Containment**:
- Contains: Constraint-Type, Implication
- Contained by: Discussion section, Methodology

**Relationship to Existing Categories**: Related to Caveat but typically
in a dedicated section rather than inline. Related to Coherence-Maintenance
from instructional design (explicit scoping).

**Forms**:
- *Typographic*: Dedicated "Limitations" subsection
- *Auditory*: Explicit limitation acknowledgment in discussion
- *Visual*: Study design figures with limitation annotations

---

### Intent: Scope-Statement

**Definition**: Explicitly defining what the study does and does not address.

**Semantic Purpose**: The author wants to establish clear boundaries for
the investigation, preventing misinterpretation of the work's claims.

**Examples**:
- "This review focuses on randomized trials published since 2015"
- "We examined only adult populations"
- "The analysis covers the period 2010-2020"
- "Excluded from this analysis are..."
- "The scope is limited to Western European countries"

**Containment**:
- Contains: Inclusion-Criteria, Exclusion-Criteria
- Contained by: Methodology, Introduction

**Relationship to Existing Categories**: Related to Delimitation. Related to
Coherence-Maintenance and Advance-Organizer from instructional design but
specific to research scope.

**Forms**:
- *Typographic*: Introduction and methods sections, PRISMA inclusion criteria
- *Auditory*: Framing statements at outset
- *Visual*: Inclusion/exclusion flowcharts

---

## Intent Category: Visual-Data-Presentation

Scientific figures carry specific intents about how data relationships
should be understood.

### Intent: Figure-Caption

**Definition**: Providing a self-contained description that enables
understanding of a figure without reference to main text.

**Semantic Purpose**: The author wants the audience to understand what the
figure shows, how to interpret its elements, and what to conclude from it.

**Examples**:
- "Figure 1. Mean response time by condition. Error bars indicate 95% CI. N = 47 per group."
- "Figure 2. (A) Experimental setup. (B) Time course of response. Shaded region indicates SEM."
- "Figure 3. Forest plot of effect sizes. Diamond indicates pooled estimate."

**Components**:
- Figure number and title
- Axis/element descriptions
- Statistical annotations (error bar type, N, significance)
- Legend/key explanations

**Containment**:
- Contains: Figure-Title, Legend-Explanation, Statistical-Annotation
- Contained by: Figure

**Relationship to Existing Categories**: Related to Table-Caption (Accessibility)
but for visual data displays. Combines Description with Statistical-Context.

**Forms**:
- *Typographic*: Caption below figure
- *Auditory*: Full figure description for accessibility
- *Visual*: The figure itself with integrated legend

---

### Intent: Axis-Label

**Definition**: Identifying what a dimension of a visualization represents,
including units.

**Semantic Purpose**: The author wants the audience to understand the scale
and meaning of visual positions/dimensions.

**Examples**:
- "Time (seconds)"
- "Response Accuracy (%)"
- "Concentration (mmol/L)"
- "Temperature (°C)"
- "Log₁₀ Frequency"

**Notation patterns**:
- Variable (unit): "Distance (m)"
- Variable [unit]: "Distance [m]"
- Transformed variable: "Log₁₀ Population"

**Containment**:
- Contains: Variable-Name, Unit-Specification
- Contained by: Figure

**Relationship to Existing Categories**: Specialized form of labeling.
Related to Header-Data-Association for tables.

**Forms**:
- *Typographic*: Text along axis
- *Auditory*: Announced when describing figure
- *Visual*: Rotated text along axis lines

---

### Intent: Legend

**Definition**: Explaining the mapping between visual encodings and data categories.

**Semantic Purpose**: The author wants the audience to decode visual symbols,
colors, or patterns into their data meanings.

**Examples**:
- "Blue = Treatment, Orange = Control"
- "Solid line: Observed; Dashed: Predicted"
- "● Male ○ Female"
- "Shading intensity indicates p-value"

**Containment**:
- Contains: Symbol-Meaning pairs
- Contained by: Figure

**Relationship to Existing Categories**: Related to Definition (mapping from
symbol to meaning). Distinct from Figure-Caption (which describes the whole).

**Forms**:
- *Typographic*: Legend box within or near figure, caption text
- *Auditory*: Announced as part of figure description
- *Visual*: Legend box with symbol examples

---

### Intent: Error-Bar-Specification

**Definition**: Explicitly stating what error bars represent in a figure.

**Semantic Purpose**: The author wants to prevent misinterpretation of
uncertainty displays, which vary widely in meaning (SD, SE, 95% CI).

**Examples**:
- "Error bars indicate ± 1 SD"
- "Bars show 95% confidence intervals"
- "Whiskers represent SEM"
- "Shaded region: interquartile range"

**Containment**:
- Contains: Error-Type, Error-Coverage
- Contained by: Figure-Caption, Legend

**Relationship to Existing Categories**: Related to Measurement-with-Uncertainty
but specifically about visual encoding of uncertainty.

**Forms**:
- *Typographic*: Caption text, legend entry
- *Auditory*: Stated in figure description
- *Visual*: Error bars themselves with legend

---

## Intent Category: Attribution

Scientific writing requires careful attribution of ideas, methods, and data
to their sources.

### Intent: Citation

**Definition**: Identifying the source of information, ideas, or methods.

**Semantic Purpose**: The author wants to acknowledge intellectual debt,
enable verification, and situate work within existing literature.

**Examples**:
- "(Smith et al., 2020)"
- "[1, 2, 3]" (numbered style)
- "as shown by Smith (2020)"
- "following the method of Smith et al."
- "adapted from Fig. 1 in Smith (2020)"

**Citation styles**:
- Author-date: (Author, Year)
- Numbered: [N]
- Footnotes: superscript with foot reference

**Containment**:
- Contains: Author, Year, (optionally) Page/Figure
- Contained by: Claim, Method, Figure

**Relationship to Existing Categories**: Related to Provenance (Evidential)
but specifically about academic attribution.

**Forms**:
- *Typographic*: Inline parenthetical, bracketed number, footnote
- *Auditory*: "according to Smith and colleagues, twenty twenty"
- *Visual*: Citation annotations on adapted figures

---

### Intent: Direct-Quote

**Definition**: Reproducing another author's exact words, marked as such.

**Semantic Purpose**: The author wants to present precise language from a
source when that specific wording is important or authoritative.

**Examples**:
- "Smith (2020) states that 'the effect was robust' (p. 42)"
- "As the authors note: '...'"
- Block quotes for passages > 40 words

**Notation patterns**:
- Inline: "quoted text" (Author, Year, p. N)
- Block: Indented paragraph with citation

**Containment**:
- Contains: Quoted-Text, Citation, Page-Reference
- Contained by: Argument, Evidence

**Relationship to Existing Categories**: Specialized form of Citation with
additional semantic weight (exact words matter).

**Forms**:
- *Typographic*: Quotation marks, block indent for long quotes
- *Auditory*: "Quote... end quote" framing, citation spoken
- *Visual*: Distinct formatting for quoted text

---

### Intent: Paraphrase-Attribution

**Definition**: Restating another's ideas in new words while attributing.

**Semantic Purpose**: The author wants to incorporate source ideas while
demonstrating understanding and integration into their argument.

**Examples**:
- "Smith (2020) found that the effect persisted across conditions"
- "Previous research suggests... (Smith, 2020)"
- "This aligns with earlier findings (Smith, 2020; Jones, 2019)"

**Containment**:
- Contains: Paraphrased-Content, Citation
- Contained by: Argument, Literature-Review

**Relationship to Existing Categories**: Related to Citation but the restated
content is the primary focus, not the exact source words.

**Forms**:
- *Typographic*: Prose with parenthetical or narrative citation
- *Auditory*: Attribution phrase integrated into speech
- *Visual*: N/A (paraphrase is textual)

---

## Summary: Proposed New Categories

Based on scientific writing conventions and data presentation practices, the
following new categories are warranted:

| Category | What it communicates | Distinct from existing? |
|----------|---------------------|------------------------|
| **Quantification** | Measured values with precision/uncertainty | Yes—specific notation systems |
| **Statistical-Claim** | Inferential findings with formal tests | Yes—standardized reporting |
| **Evidence-Grading** | Quality/strength of supporting evidence | Extends Evidential |
| **Epistemic-Hedging** | Calibrated certainty in claims | Yes—linguistic modulation |
| **Methodology-Transparency** | Reproducibility and scope information | Yes—research-specific |
| **Visual-Data-Presentation** | Figure/chart semantic elements | Extends visual forms |
| **Attribution** | Source acknowledgment patterns | Extends Provenance |

### Recommended Additions to Existing Categories

Some discovered intents fit existing categories:

| Intent | Recommended Category | Notes |
|--------|---------------------|-------|
| Measurement | State or new Quantification | Empirical value |
| Hedge/Boost | Evidential/Confidence | Linguistic certainty markers |
| Caveat | Explanation (extends Aside) | Inline qualification |
| Citation | Evidential/Provenance | Academic attribution |

### Intents Requiring New Categories or Substantial Expansion

| Intent | Proposed Category |
|--------|------------------|
| Measurement-with-Uncertainty | Quantification |
| Precision-Statement | Quantification |
| Significant-Figures | Quantification (encoded) |
| Statistical-Significance-Statement | Statistical-Claim |
| Effect-Size-Statement | Statistical-Claim |
| Confidence-Interval | Statistical-Claim |
| Sample-Size-Statement | Statistical-Claim |
| Power-Statement | Statistical-Claim |
| Evidence-Level-Statement | Evidence-Grading |
| Study-Design-Statement | Evidence-Grading |
| Hedge | Epistemic-Hedging |
| Boost | Epistemic-Hedging |
| Caveat | Epistemic-Hedging |
| Reproducibility-Information | Methodology-Transparency |
| Assumption-Statement | Methodology-Transparency |
| Limitation-Statement | Methodology-Transparency |
| Scope-Statement | Methodology-Transparency |
| Figure-Caption | Visual-Data-Presentation |
| Axis-Label | Visual-Data-Presentation |
| Legend | Visual-Data-Presentation |
| Error-Bar-Specification | Visual-Data-Presentation |
| Direct-Quote | Attribution |
| Paraphrase-Attribution | Attribution |

---

## Cross-Cutting Observations

### 1. Precision as Encoded Information

Scientific notation encodes meaning in form. The number "5.00" communicates
something different from "5"—not just numerically but epistemically. This
suggests some intents are realized through notation conventions rather than
explicit markers.

### 2. Confidence as a Spectrum

Scientific writing reveals multiple mechanisms for expressing confidence:
- Linguistic hedges ("may suggest")
- Statistical bounds (95% CI)
- Evidence hierarchies (Level 1a)
- Precision notation (±0.01)

These form a confidence continuum that the existing single "Confidence" intent
may need to differentiate.

### 3. The Reproducibility Imperative

Scientific communication has a meta-intent: enabling verification and
replication. This manifests across many specific intents (Methodology,
Scope, Limitation, Data-Availability) that together serve the higher-order
purpose of transparent, verifiable science.

### 4. Visual Uncertainty is Distinct

Communicating uncertainty in visualizations (error bars, confidence bands,
density plots) requires its own vocabulary. The meaning of an error bar is
not self-evident—it could be SD, SE, or 95% CI—and the specification of
what it represents is itself an intent.

### 5. Hedging is Cultural and Disciplinary

The appropriate level of hedging varies by field and culture. Physics uses
hedges less than psychology; English academic writing hedges more than German.
This suggests hedging intent may need field-specific treatment.

---

## Open Questions

1. **Is Quantification a category or a form?** Measurement values are data;
   the uncertainty bounds are metadata about the data. Should this be in the
   intent layer or the data layer?

2. **Where do units belong?** Units are essential for meaning but are they
   part of the intent or part of the encoding? "47 ms" vs "47" + "ms label"?

3. **Relationship to existing Uncertainty intent**: The framework has
   Uncertainty in Evidential. Scientific writing reveals much richer
   uncertainty vocabulary. Is this expansion or replacement?

4. **Statistical notation as form or intent?** "p = .006" is a notation
   convention. Is the intent "significance claim" with the form being
   "p-value notation"? Or is the notation itself the intent?

5. **How should encoded precision (sig figs) be handled?** When precision
   is encoded in notation (5.00 vs 5), is this an implicit intent or a
   form convention? Can it be transformed across media (how does text-to-speech
   handle "5.00")?

6. **Should methodology intents be under Instruction?** Methodology sections
   tell readers how research was done. Is this instruction (how to reproduce)
   or description (what was done)?

---

## Cross-Reference with Other Discovery Documents

Several intents appear across investigations:

| Scientific Writing | Instructional Design | Accessibility | Notes |
|-------------------|---------------------|---------------|-------|
| Caveat | Coherence-Maintenance | — | Scoping and qualification |
| Limitation-Statement | — | — | Research-specific |
| Scope-Statement | Advance-Organizer | — | Both establish boundaries |
| Hedge | Confidence-Building | — | Opposite ends of certainty |
| Figure-Caption | — | Text-Alternative | Different purposes, similar form |
| Legend | — | — | Scientific-specific |
| Citation | Provenance | — | Attribution patterns |

### Unique to Scientific Writing

The following intents appear specific to scientific/technical communication:

- Measurement-with-Uncertainty (±notation, CI)
- Statistical-Significance-Statement
- Effect-Size-Statement
- Power-Statement
- Evidence-Level-Statement
- Study-Design-Statement
- Error-Bar-Specification

These represent the distinct communicative conventions of empirical research.
