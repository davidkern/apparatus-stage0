# Intent Extraction: Tufte Chapter 2 "Graphical Integrity" (pp. 53-65)

Source: Text extraction from "The Visual Display of Quantitative Information"
Extraction method: Text-only (figures not visible)

---

## Extracted Communicative Intents

### 1. Truth-Telling (Representational Fidelity)

**Definition**: Communicating data accurately such that the visual representation corresponds faithfully to the underlying numerical quantities.

**How Tufte articulates it**:
- "Graphical excellence begins with telling the truth about the data."
- "A graphic does not distort if the visual representation of the data is consistent with the numerical representation."
- "The representation of numbers, as physically measured on the surface of the graphic itself, should be directly proportional to the numerical quantities represented."

**Examples referenced**:
- Day Mines, Inc. 1974 Annual Report (disappearing baseline hiding negative income)
- New York Times 1978 travel agent commission graphic (comparing 6 months to full year)
- Pittsburgh Civic Commission 1911 chart (forgetting magnitude, showing only order)

**Framework category mapping**: **Evidential** - relates to confidence and provenance; honest representation establishes trust in the data's credibility.

---

### 2. Lie Detection / Distortion Measurement

**Definition**: Quantifying the degree to which a graphic misrepresents data, enabling systematic identification of graphical deception.

**How Tufte articulates it**:
- Introduces the "Lie Factor" metric: `Lie Factor = size of effect shown in graphic / size of effect in data`
- "Lie Factors greater than 1.05 or less than .95 indicate substantial distortion"
- "The logarithm of the Lie Factor can be taken in order to compare overstating (log LF > 0) with understating (log LF < 0) errors"

**Examples referenced**:
- Fuel Economy Standards graphic (New York Times, Aug 9, 1978): Lie Factor = 14.8
- Time magazine oil price barrel graphic: Lie Factor = 9.4
- Washington Post oil prices graphic: Lie Factor = 9.5

**Framework category mapping**: **Evidential** - provides a mechanism for assessing the reliability and trustworthiness of visual evidence.

---

### 3. Contextualization

**Definition**: Placing data within a meaningful reference frame that enables proper interpretation of values.

**How Tufte articulates it**:
- The corrected fuel economy graphic "puts the data in a context by comparing the new car standards with the mileage achieved by the mix of cars actually on the road"
- "Clear, detailed, and thorough labeling should be used to defeat graphical distortion and ambiguity. Write out explanations of the data on the graphic itself. Label important events in the data."

**Examples referenced**:
- Redesigned fuel economy chart showing 1978 and 1985 average mileage for all cars on road (13.7 mpg and 19.1 mpg)
- Playfair's second debt chart showing "real and not in nominal millions"

**Framework category mapping**: **Comparative** - contextual data enables comparison between the primary values and meaningful reference points.

---

### 4. Data Variation Revelation

**Definition**: Making visible the inherent patterns, changes, and structure within the data itself, rather than variations introduced by graphic design choices.

**How Tufte articulates it**:
- "Show data variation, not design variation."
- "The confounding of design variation with data variation over the surface of a graphic leads to ambiguity and deception, for the eye may mix up changes in the design with changes in the data."
- "A steady canvas makes for a clearer picture."

**Examples referenced**:
- Nobel Prize chart with irregular 4-year final interval creating false decline
- OPEC oil prices chart with five different vertical scales and two horizontal scales
- The corrected Nobel Prize chart with consistent 10-year intervals

**Framework category mapping**: **Temporal** / **Distributional** - revealing authentic temporal progression and distributional patterns in the data.

---

### 5. Proportional Encoding

**Definition**: Ensuring that visual quantities (lengths, areas, volumes) scale proportionally to the numerical quantities they represent.

**How Tufte articulates it**:
- "The representation of numbers, as physically measured on the surface of the graphic itself, should be directly proportional to the numerical quantities represented."
- Discussion of perceptual issues: "the perceived area of a circle probably grows somewhat more slowly than the actual (physical, measured) area"

**Examples referenced**:
- Fuel economy road graphic where 0.6 inch represents 18 mpg and 5.3 inches represents 27.5 mpg
- Pittsburgh hospital costs graphic showing only order, not magnitude

**Framework category mapping**: **Distributional** - accurate proportional encoding is fundamental to showing the true shape and spread of data.

---

### 6. Scale Consistency

**Definition**: Maintaining uniform measurement scales across the entire graphic surface to prevent misinterpretation from scale shifts.

**How Tufte articulates it**:
- "A scale moving in regular intervals... is expected to continue its march to the very end in a consistent fashion, without the muddling or trickery of non-uniform changes."
- Example of OPEC graphic: "As the two scales shift simultaneously, the distortion takes on multiplicative force."

**Examples referenced**:
- Nobel Prize chart with 10-year intervals then 4-year interval
- OPEC oil chart with five vertical scales ($8.00/inch to $3.92/inch) and two horizontal scales (3.8 years/inch to 0.57 years/inch)

**Framework category mapping**: **Temporal** - scale consistency is particularly critical for time-series where viewers expect uniform temporal progression.

---

### 7. Inflation Adjustment (Real vs. Nominal)

**Definition**: Expressing monetary values in constant-dollar terms to enable meaningful comparison across time periods.

**How Tufte articulates it**:
- "The only way to think clearly about money over time is to make comparisons using inflation-adjusted units of money."
- "Thus in sweeping from left to right over the surface of the graphic, the vertical scale in effect changes—design variation—because the value of money changes over the years shown."
- Playfair's 1786 work: "This is in real and not in nominal millions"

**Examples referenced**:
- Business Week, Sunday Times (London), and The Economist graphics using real dollars
- Playfair's interest on national debt shown "in real and not in nominal millions"

**Framework category mapping**: **Temporal** / **Comparative** - enables valid comparison of monetary quantities across different time periods.

---

### 8. Graphical Reasoning

**Definition**: Using graphics as analytical instruments for exploring and understanding quantitative relationships, not merely for decoration or presentation.

**How Tufte articulates it**:
- "[John Tukey] using [graphics] effectively to explore complex data... graphics were used as instruments for reasoning about quantitative information."
- "At the core of the preoccupation with deceptive graphics was the assumption that data graphics were mainly devices for showing the obvious to the ignorant."
- Contrasts this with Tukey's approach: "a world-class data analyst spinning off half a dozen new designs"

**Examples referenced**:
- Tukey's graphical work (referenced generally)
- The corrected fuel economy chart revealing "a side of the data disguised and mispresented in the original display: the fuel economy standards require gradual improvement at start-up, followed by a doubled rate from 1980 to 1983, and flattening out after that"

**Framework category mapping**: **Relational** - using graphics to discover and communicate relationships within data.

---

### 9. Revelation of Non-Obvious Patterns

**Definition**: Making visible data patterns that would not be apparent from raw numbers or that are hidden by poor graphic design.

**How Tufte articulates it**:
- "The two sources of design variation covered up an intriguing, non-obvious aspect of the data: in the four years prior to the 1979-1980 increases, the real price of oil had declined. Busy with decoration, the graphic had missed the news."

**Examples referenced**:
- Economist, Sunday Times, and Business Week charts revealing real oil price decline 1974-1978
- Corrected fuel economy chart revealing rate changes in standards

**Framework category mapping**: **Temporal** / **Distributional** - exposing underlying patterns in temporal sequences and distributions.

---

### 10. Baseline Integrity

**Definition**: Maintaining honest, visible, and consistent baselines from which data values are measured.

**How Tufte articulates it**:
- "the case of the disappearing baseline"
- Description of Day Mines chart where "the bars begin at the bottom at approximately minus $4,200,000"

**Examples referenced**:
- Day Mines, Inc. 1974 Annual Report hiding 1970 negative income

**Framework category mapping**: **Comparative** / **Distributional** - baselines establish the reference point for comparing magnitudes.

---

### 11. Labeling and Annotation

**Definition**: Providing textual explanations, event markers, and clarifying labels directly on the graphic to prevent misinterpretation.

**How Tufte articulates it**:
- "Clear, detailed, and thorough labeling should be used to defeat graphical distortion and ambiguity."
- "Write out explanations of the data on the graphic itself."
- "Label important events in the data."

**Examples referenced**:
- Corrected fuel economy chart with labeled reference values (13.7 mpg, 19.1 mpg averages)

**Framework category mapping**: **Evidential** / **Instructional** - labels guide interpretation and provide evidentiary context.

---

### 12. Magnitude Preservation

**Definition**: Representing not just the order (ranking) of values but also their true relative magnitudes.

**How Tufte articulates it**:
- "And sometimes the fact that numbers have a magnitude as well as an order is simply forgotten"

**Examples referenced**:
- Pittsburgh Civic Commission chart comparing per capita costs ($147, $172, $213, $214) without proportional representation

**Framework category mapping**: **Comparative** - comparing values requires showing both order and magnitude.

---

### 13. Honest Decoration

**Definition**: Using decorative elements that enhance without distorting the data measures.

**How Tufte articulates it**:
- "Sometimes decoration can help editorialize about the substance of the graphic."
- "But it is wrong to distort the data measures—the ink locating values of numbers—in order to make an editorial comment or fit a decorative scheme."
- "It is also a sure sign of the Graphical Hack at work."

**Examples referenced**:
- Redesigned fuel economy chart with car illustrations that preserve accurate proportions
- Contrast with original road-perspective fuel economy chart

**Framework category mapping**: **Instructional** - decoration can serve pedagogical or editorial purposes when it does not corrupt data representation.

---

### 14. Table-Graph Selection

**Definition**: Choosing the appropriate presentation form (table vs. graphic) based on data characteristics and communication goals.

**How Tufte articulates it**:
- "Tables usually outperform graphics in reporting on small data sets of 20 numbers or less."
- "The special power of graphics comes in the display of large data sets."

**Examples referenced**:
- General principle stated; no specific example in this section

**Framework category mapping**: **Aggregative** - choosing between tabular and graphical aggregation/presentation based on data scale.

---

## Anti-Pattern Intents (What Graphics Should NOT Do)

### A1. Pseudo-Decline Manufacturing

**Definition**: Creating the false visual appearance of decline through design manipulation when the underlying data shows no decline or shows increase.

**Examples**:
- Travel agent commissions comparing 6 months to full year
- Nobel Prize chart with truncated final interval
- Fuel economy standards with perspective distortion

---

### A2. Decorative Exaggeration

**Definition**: Adding visual embellishment that amplifies perceived data effects beyond their actual magnitude.

**How Tufte articulates it**:
- "graphics had to be 'alive,' 'communicatively dynamic,' overdecorated and exaggerated"
- Describes this as a "fruitless path" of the "graphically barren years from 1930 to 1970"

---

### A3. Perspective Distortion

**Definition**: Using three-dimensional perspective effects that confound data representation with spatial illusion.

**Examples**:
- Fuel economy road graphic where "the future is in front of us, toward the horizon" creating exaggeration
- Dates remaining constant size while moving toward horizon
- Numbers shrinking from both value change and perspective change simultaneously

---

## Summary of Extraction Sources

### Intents from Explicit Prose:
1. Truth-Telling (Representational Fidelity)
2. Lie Detection / Distortion Measurement
4. Data Variation Revelation ("Show data variation, not design variation")
5. Proportional Encoding
6. Scale Consistency
7. Inflation Adjustment
8. Graphical Reasoning
11. Labeling and Annotation
14. Table-Graph Selection

### Intents Inferred from Descriptions of Unseen Graphics:
3. Contextualization (inferred from description of corrected fuel economy chart)
9. Revelation of Non-Obvious Patterns (inferred from description of what good oil charts showed)
10. Baseline Integrity (inferred from description of Day Mines chart)
12. Magnitude Preservation (inferred from Pittsburgh chart description)
13. Honest Decoration (inferred from comparison of fuel economy charts)

---

## Limitations from Lacking Visual Access

1. **Cannot verify Lie Factor calculations**: The text provides calculated values (14.8, 9.4, 9.5) but without seeing the graphics, I cannot independently verify measurements or identify additional distortion mechanisms.

2. **Lost visual comparison power**: Tufte's method relies heavily on showing a flawed graphic alongside a corrected version. The text describes both but the pedagogical impact of side-by-side comparison is lost.

3. **Cannot assess visual hierarchy**: How Tufte uses size, position, and proximity to emphasize certain graphics over others is invisible.

4. **Missing Playfair originals**: The 1786 debt graphics are described but their actual visual treatment—an early historical example of both problematic and improved design—cannot be analyzed.

5. **Perceptual psychology illustrations**: The section discusses circle area perception experiments with an illustration from The New Yorker; the humor and point of this illustration is lost.

6. **Scale shift mechanics**: The OPEC oil price graphic's five-scale distortion is described numerically ($8.00/inch to $3.92/inch) but the visual impact of this shift cannot be observed.

7. **"Good" exemplar details**: Business Week, Sunday Times, and Economist graphics are praised but their specific design features enabling honest representation cannot be analyzed.

8. **Decorative vs. distorting distinction**: The "honest decoration" fuel economy redesigns are described but distinguishing precisely where decoration ends and data-ink begins requires visual inspection.

---

## Framework Category Distribution

| Category | Intents Mapped |
|----------|----------------|
| Evidential | Truth-Telling, Lie Detection, Labeling |
| Comparative | Contextualization, Baseline Integrity, Magnitude Preservation |
| Temporal | Data Variation Revelation, Scale Consistency, Inflation Adjustment, Pattern Revelation |
| Distributional | Data Variation Revelation, Proportional Encoding, Pattern Revelation |
| Relational | Graphical Reasoning |
| Aggregative | Table-Graph Selection |
| Instructional | Labeling, Honest Decoration |

**Note**: Several intents map to multiple categories, reflecting Tufte's integrated approach where integrity concerns cut across different data presentation contexts.

---

## Potential New Category: Integrity

This chapter suggests a meta-category not explicitly in the framework: **Integrity** or **Fidelity**. This would encompass intents concerned with the relationship between visual representation and underlying data, including:

- Truth-Telling
- Lie Detection
- Proportional Encoding
- Scale Consistency
- Baseline Integrity
- Magnitude Preservation

These are not about *what* to communicate (distributional, relational, temporal patterns) but about *how faithfully* any communication preserves data meaning. This could be considered a constraint layer that applies across all other intent categories.
