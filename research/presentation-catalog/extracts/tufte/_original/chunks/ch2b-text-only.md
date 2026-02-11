# Communicative Intents from Tufte Ch2b (pp. 66-78)

Source: Tufte, "Visual Display of Quantitative Information" Chapter 2: Graphical Integrity
Pages 66-78, text extraction only (figures not visible)

---

## Extracted Intents

### 1. Honest Magnitude Representation

**Definition:** Communicate the true quantitative size of changes, not just their direction, ensuring physical representation is proportional to numerical quantities.

**How Tufte articulates it:**
> "It is the special character of numbers that they have a magnitude as well as an order; numbers measure quantity. Graphics can display the quantitative size of changes as well as their direction."

> "The representation of numbers, as physically measured on the surface of the graphic itself, should be directly proportional to the numerical quantities represented."

**Examples referenced:**
- New York State budget graphic with "magical parallelepipeds" that falsely exaggerated growth
- "Pravda School of Ordinal Graphics" that get direction right but not magnitude
- Federal spending chart with distorted aspect ratio (2.7 times taller than wide)

**Framework category:** **Evidential** (confidence/accuracy in claims) or potentially new: **Proportional/Quantitative Integrity**

---

### 2. Contextual Comparison

**Definition:** Present data within sufficient comparative context to answer "Compared to what?" - the fundamental question of quantitative thinking.

**How Tufte articulates it:**
> "To be truthful and revealing, data graphics must bear on the question at the heart of quantitative thinking: 'Compared to what?'"

> "Graphics must not quote data out of context."

**Examples referenced:**
- Connecticut traffic deaths: Two-point display (1955-1956) vs. fuller time series (1951-1959)
- Same data with adjacent state comparisons (Massachusetts, Rhode Island, New York)
- Alternative hypothetical time-paths showing how different contexts yield different interpretations

**Framework category:** **Comparative** (difference, before/after, deviation)

---

### 3. Inflation/Population Adjustment

**Definition:** When showing monetary data over time, normalize for inflation and population changes to reveal real change rather than nominal artifacts.

**How Tufte articulates it:**
> "In time-series displays of money, deflated and standardized units of monetary measurement are nearly always better than nominal units."

> "Computing expenditures in constant (real) dollars per capita reveals a quite different—and far more accurate—picture."

**Examples referenced:**
- New York State budget chart showing apparent continuous increase vs. corrected per-capita constant-dollar view showing 20% increase 1967-1970 then flat, with 1977 decline
- Federal spending chart failing to discount for inflation and population growth
- Reference to Playfair's 1786 work which correctly deflated money units

**Framework category:** **Temporal** (when/sequence) - specifically for time-series monetary data

---

### 4. Dimensional Correspondence

**Definition:** Match the number of visual dimensions to the number of dimensions in the data; do not use 2D or 3D representations for 1D data.

**How Tufte articulates it:**
> "The number of information-carrying (variable) dimensions depicted should not exceed the number of dimensions in the data."

> "The use of two (or three) varying dimensions to show one-dimensional data is a weak and inefficient technique, capable of handling only very small data sets, often with error in design and ambiguity in perception."

**Examples referenced:**
- "Shrinking dollar" fallacy charts where currency shrinks on two dimensions for one-dimensional inflation data
- "Shrinking Family Doctor" graphic with Lie Factor of 2.8
- Oil barrel price chart with Lie Factor of 9.4 (by surface area) or 59.4 (by volume) - described as "a record"
- French automobile export chart using varying areas
- Playfair's circles showing city populations (noted as inconsistent with principle)
- "4,340 pound chicken" cartoon (noted as possible exception for cartoon graphics)

**Framework category:** **Distributional** or potentially new: **Dimensional Integrity**

---

### 5. Truthful Labeling

**Definition:** Use clear, detailed, thorough labeling to defeat graphical distortion and ambiguity, including explanations and annotations of important events.

**How Tufte articulates it:**
> "Clear, detailed, and thorough labeling should be used to defeat graphical distortion and ambiguity. Write out explanations of the data on the graphic itself. Label important events in the data."

**Examples referenced:**
- Implicitly contrasted against the "magical parallelepipeds" chart with its misleading type clusters and arrows
- Charts with printed numbers that allegedly "justify" visual lies (Tufte rejects this defense)

**Framework category:** **Instructional** (what to understand) or **Evidential** (provenance/transparency)

---

### 6. Data Variation over Design Variation

**Definition:** Ensure that visual variation in a graphic reflects actual variation in the data, not decorative or arbitrary design choices.

**How Tufte articulates it:**
> "Show data variation, not design variation."

**Examples referenced:**
- NY State budget chart where three parallelepipeds placed on optical plane in front create false impression of newer budgets towering over older ones
- Type clusters and arrows creating emphasis unrelated to data values
- "Chartjunk" and "hyperactive design" that created "thoroughly false impression"

**Framework category:** **Evidential** or potentially new: **Design Integrity**

---

### 7. Exposing Graphical Lies

**Definition:** Identify and critique graphics that systematically distort data through predictable techniques, typically exaggerating recent change.

**How Tufte articulates it:**
> "Lying graphics cheapen the graphical art everywhere."

> "The lies are systematic and quite predictable, nearly always exaggerating the rate of recent change."

**Examples referenced:**
- NY Times charts, Time magazine charts, Los Angeles Times, Washington Post examples
- Television graphics (lies "tens of millions of times over")
- "Fifteenfold lies" too large to be "approximately correct"
- Pravda charts as exemplar of direction-without-magnitude

**Framework category:** **Evidential** (confidence/claims) - specifically as anti-pattern recognition

---

### 8. Professional Quantitative Judgment

**Definition:** Graphics communicating quantitative information require creators with quantitative skills and experience analyzing data, not just artistic training.

**How Tufte articulates it:**
> "Lurking behind the inept graphic is a lack of judgment about quantitative evidence. Nearly all those who produce graphics for mass publication are trained exclusively in the fine arts and have had little experience with the analysis of data."

> "Such experience is essential for achieving precision and grace in the presence of statistics."

**Examples referenced:**
- Time magazine's first full-time chart specialist (art-school graduate) quoted as prioritizing "visual idea" over "tedious parade of numbers"
- Jan White's "Graphic Idea Notebook" asking "Why are statistics so boring?"
- American Statistical Association committee findings on declining training in graphic presentation

**Framework category:** **Instructional** (meta-level: about how graphics should be created)

---

### 9. Multivariate Consistency

**Definition:** When using multiple visual dimensions, ensure they correspond to actual multiplicative relationships in the data.

**How Tufte articulates it:**
> "This multivariate history of the Italian post office uses two dimensions in a way nearly consistent with this principle, with the number of postal savings books issued and the average size of deposits multiplying up to total deposits."

**Examples referenced:**
- Italian postal savings visualization (1876-1881) - presented as positive example of dimensional consistency
- Contrasted with Playfair's city population circles which violated the principle

**Framework category:** **Relational** (showing how quantities relate) or **Aggregative** (how parts compose wholes)

---

## Summary Table

| Intent | Framework Category | Source Type |
|--------|-------------------|-------------|
| Honest Magnitude Representation | Evidential/New: Proportional Integrity | Explicit principle |
| Contextual Comparison | Comparative | Explicit principle |
| Inflation/Population Adjustment | Temporal | Explicit principle |
| Dimensional Correspondence | Distributional/New: Dimensional Integrity | Explicit principle |
| Truthful Labeling | Instructional/Evidential | Explicit principle |
| Data Variation over Design Variation | Evidential/New: Design Integrity | Explicit principle |
| Exposing Graphical Lies | Evidential (anti-pattern) | Inferred from critique |
| Professional Quantitative Judgment | Instructional (meta) | Inferred from prose |
| Multivariate Consistency | Relational/Aggregative | Inferred from example description |

---

## Provenance Notes

### Intents from Explicit Prose

The following intents are directly stated as principles by Tufte:

1. **Honest Magnitude Representation** - Tufte's first principle of graphical integrity
2. **Contextual Comparison** - "Graphics must not quote data out of context"
3. **Inflation/Population Adjustment** - Explicit principle about monetary time-series
4. **Dimensional Correspondence** - "The number of information-carrying dimensions..."
5. **Truthful Labeling** - "Clear, detailed, and thorough labeling..."
6. **Data Variation over Design Variation** - "Show data variation, not design variation"

These six are Tufte's explicit principles summarized at the chapter's end (pp. 76-77).

### Intents Inferred from Descriptions of Unseen Graphics

7. **Exposing Graphical Lies** - Inferred from Tufte's critique methodology; the chapter's rhetorical purpose is to teach readers to identify lying graphics
8. **Professional Quantitative Judgment** - Inferred from the "Sources of Graphical Integrity" section discussing why lying graphics are produced
9. **Multivariate Consistency** - Inferred from the description of the Italian postal savings chart as "nearly consistent" with principles; the specific visual representation is not visible

### Limitations from Lacking Visual Access

1. **Lie Factor calculations cannot be verified** - Tufte reports specific Lie Factors (2.8, 9.4, 59.4) but without the images, these remain claims about unseen graphics

2. **Positive examples are description-only** - The Italian postal savings chart and the corrected NY State budget chart (per-capita constant dollars) are described but not seen; their intent-realization cannot be studied

3. **The "magical parallelepipeds" distortions are described but not visible** - Tufte's detailed annotations of the NY Times chart (optical planes, type clusters, arrows) rely on visual demonstration

4. **Comparative graphics are especially impacted** - The Connecticut traffic deaths example relies on seeing four different visualizations (two-point, time-series, hypothetical alternatives, multi-state comparison) to understand how context changes interpretation

5. **Cannot assess whether described graphics actually violate principles as claimed** - The Pravda chart, Los Angeles Times shrinking doctor, Washington Post shrinking dollar, etc. are taken on Tufte's authority

6. **Playfair's circles cannot be examined** - Described as violating dimensional correspondence, but the actual visual is not available

7. **The "4,340 pound chicken" humor is lost** - Tufte suggests cartoon graphics might be exempt from strict principles, but the visual evidence is absent

### Framework Implications

Several intents suggest a possible new category: **Integrity** or **Proportional**
- Honest Magnitude Representation
- Dimensional Correspondence
- Data Variation over Design Variation
- Truthful Labeling

These cluster around a meta-concern not explicitly in the current framework: ensuring that the visual encoding faithfully represents the underlying data rather than distorting it. This might be:
- A sub-category of **Evidential** (the evidence is faithfully presented)
- A new top-level category: **Integrity** (the representation is accurate)
- A cross-cutting concern that applies to all visual forms rather than a distinct intent

The current framework categories seem oriented toward *what* is being communicated (distribution, comparison, relationship, etc.), while Tufte's graphical integrity concerns are about *how faithfully* any of these are communicated. This suggests a quality dimension orthogonal to the intent taxonomy.
