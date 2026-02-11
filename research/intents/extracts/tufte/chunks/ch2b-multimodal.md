# Intent Extraction: Tufte Chapter 2b (pp. 66-78)

Source: Edward Tufte, "The Visual Display of Quantitative Information," Chapter 2 "Graphical Integrity," pages 66-78.

## Extracted Communicative Intents

---

### 1. Represent Magnitude Truthfully

**Name:** Truthful Magnitude Representation

**Definition:** The communicative purpose of ensuring that the physical size of graphical elements corresponds proportionally to the numerical quantities they represent, so viewers perceive accurate magnitudes.

**How Tufte articulates it:**
- States as explicit principle: "The representation of numbers, as physically measured on the surface of the graphic itself, should be directly proportional to the numerical quantities represented."
- Introduces the concept of "Lie Factor" to quantify violations of this intent
- Demonstrates through extensive counter-examples where this intent is violated

**Examples from these pages:**
- New York State budget graphic using parallelepipeds that create false impression of towering recent budgets over older ones (pp. 66-68)
- "Shrinking Family Doctor" graphic with Lie Factor of 2.8 (p. 69)
- Oil barrel graphic with Lie Factor of 9.4 (surface area) or 59.4 (volume) (p. 71)
- "Purchasing Power of the Diminishing Dollar" showing currency shrinking in two dimensions for one-dimensional data (p. 70)

**Framework category:** Evidential (concerns the accurate representation of claims through visual evidence)

---

### 2. Match Visual Dimensions to Data Dimensions

**Name:** Dimensional Correspondence

**Definition:** The communicative purpose of using the appropriate number of visual dimensions to represent data, ensuring that one-dimensional data uses one-dimensional encoding (length), not area or volume.

**How Tufte articulates it:**
- States as explicit principle: "The number of information-carrying (variable) dimensions depicted should not exceed the number of dimensions in the data."
- Describes the "shrinking dollar fallacy" where two dimensions encode one-dimensional change
- Notes perceptual ambiguities when people convert 2D area perception to 1D numerical understanding

**Examples from these pages:**
- French auto exports graphic using irregular polygonal areas for 1D export quantities (p. 69)
- "Shrinking Family Doctor" using 2D figure size for 1D percentage (p. 69)
- Oil barrel graphic using 3D volume for 1D price data (p. 71)
- Playfair's circles representing city populations via area (noted as problematic, p. 73)
- Italian postal savings visualization using area correctly to show two-dimensional product (number x average = total) (p. 72)

**Framework category:** Comparative (the intent is to enable accurate comparison of magnitudes)

---

### 3. Standardize Units for Fair Comparison

**Name:** Unit Standardization

**Definition:** The communicative purpose of adjusting monetary and population data to enable meaningful comparison across time by accounting for inflation and population changes.

**How Tufte articulates it:**
- States as explicit principle: "In time-series displays of money, deflated and standardized units of monetary measurement are nearly always better than nominal units."
- Shows how failing to deflate "mixes up changes in the value of money with changes in the budget"
- Demonstrates that per-capita constant-dollar analysis reveals "the real news story" that nominal graphics obscure

**Examples from these pages:**
- New York State budget: nominal dollars show apparent growth, but constant-dollar per-capita analysis shows budget relatively flat from 1970-1976 and declining in 1977 (p. 68)
- Federal spending graphic from Congress: Keystone failing to discount for inflation and population (p. 66)
- References Playfair's 1786 work as early example of proper deflation

**Framework category:** Temporal (specifically addresses time-series comparison integrity)

---

### 4. Provide Sufficient Context for Comparison

**Name:** Contextual Completeness

**Definition:** The communicative purpose of including enough data points and comparison cases to answer the implicit question "Compared to what?" and prevent misleading interpretations.

**How Tufte articulates it:**
- States as explicit principle: "Graphics must not quote data out of context."
- Declares that graphics must address "the question at the heart of quantitative thinking: 'Compared to what?'"
- Notes that "data-thin design should always provoke suspicion, for graphics often lie by omission"

**Examples from these pages:**
- Connecticut traffic deaths: 2-point before/after graphic (1955-1956) suggests enforcement effect
- Same data extended to 1951-1959 shows the 1955-1956 drop is part of normal variation
- Adding adjacent states (Massachusetts, Rhode Island, New York) reveals regional decline pattern, undermining the enforcement-effect interpretation (pp. 74-75)
- Hypothetical time-paths diagram showing how different surrounding contexts would change interpretation (p. 75)

**Framework category:** Evidential (providing evidence for claims by establishing adequate comparison base)

---

### 5. Show Data Variation, Not Design Variation

**Name:** Data Primacy Over Decoration

**Definition:** The communicative purpose of ensuring that visual variation in a graphic reflects actual variation in the underlying data, not arbitrary design choices or embellishments.

**How Tufte articulates it:**
- States as explicit principle: "Show data variation, not design variation."
- Critiques "chartjunk" that creates visual activity without data meaning
- Notes how design elements (3D parallelepipeds, perspective, varying type sizes, directional arrows) create false impressions of change

**Examples from these pages:**
- New York State budget graphic: compressed type at left creates impression of "squeezed-down budgets back in the good old days" (p. 67)
- Three parallelepipeds placed on optical plane "in front of" others creating false towering effect (p. 67)
- Horizontal arrows at left vs. vertical arrows at right emphasize "recent growth" (p. 67)
- Corrected version ("calmer view") removes design variation to show actual minimal change (p. 67)

**Framework category:** Comparative (the intent is accurate visual comparison)

---

### 6. Label Thoroughly to Defeat Ambiguity

**Name:** Explanatory Labeling

**Definition:** The communicative purpose of using clear, detailed labels and annotations to explain data, identify important events, and prevent misinterpretation.

**How Tufte articulates it:**
- States as principle: "Clear, detailed, and thorough labeling should be used to defeat graphical distortion and ambiguity. Write out explanations of the data on the graphic itself. Label important events in the data."
- Argues against the defense that "actual numbers are printed on the graphic" as justification for visual distortion

**Examples from these pages:**
- Implied by critique of graphics that use design to mislead even when numbers are present
- The corrected per-capita constant-dollar budget chart includes clear axis labels and units (p. 68)
- Connecticut traffic deaths chart with multiple states includes clear legend and axis labels (p. 75)

**Framework category:** Instructional (guiding viewer interpretation through explicit communication)

---

### 7. Reveal the True Story in the Data

**Name:** Narrative Truth-Telling

**Definition:** The communicative purpose of designing graphics so that the visual narrative matches the actual story in the data, rather than creating false impressions of trends or changes.

**How Tufte articulates it:**
- Criticizes graphics that "falsified the real news in the data"
- Points to the corrected NY budget analysis: "That is the real news story of these data, and it was completely missed by the Graph of the Magical Parallelepipeds"
- Argues that numbers have "magnitude as well as an order" and graphics should display "the quantitative size of changes as well as their direction"

**Examples from these pages:**
- The "real news" in NY budget data: 20% increase 1967-1970, flat 1970-1976, declining 1977 - opposite of the original graphic's impression (p. 68)
- Pravda School of Ordinal Graphics: "crystal clear direction coupled with fantasy magnitudes" as anti-pattern (p. 76)
- Fifteen-fold lies "too large to be described as approximately correct" (p. 76)

**Framework category:** Evidential (the graphic as honest evidence for claims)

---

### 8. Encode Multivariate Relationships Appropriately

**Name:** Multivariate Encoding

**Definition:** The communicative purpose of representing multiple data dimensions in ways that preserve their mathematical relationships (e.g., using area when two quantities multiply to form a third).

**How Tufte articulates it:**
- Notes the Italian postal savings graphic as "nearly consistent" with dimensional principle because "the number of postal savings books issued and the average size of deposits multiplying up to total deposits"
- Distinguishes legitimate 2D encoding (when data is genuinely 2D) from illegitimate (when 1D data is puffed up)

**Examples from these pages:**
- Italian postal savings graphic (Gabaglio, 1888): rectangular bars where width = number of books, height = average deposit, area = total deposits - a legitimate multivariate display (p. 72)

**Framework category:** Relational (showing how multiple quantities relate mathematically)

---

## Summary of Principles (as stated by Tufte, p. 77)

1. The representation of numbers, as physically measured on the surface of the graphic itself, should be directly proportional to the numerical quantities represented.

2. Clear, detailed, and thorough labeling should be used to defeat graphical distortion and ambiguity. Write out explanations of the data on the graphic itself. Label important events in the data.

3. Show data variation, not design variation.

4. In time-series displays of money, deflated and standardized units of monetary measurement are nearly always better than nominal units.

5. The number of information-carrying (variable) dimensions depicted should not exceed the number of dimensions in the data.

6. Graphics must not quote data out of context.

---

## Intent Sources Classification

### From Explicit Prose Statements

These intents were directly articulated as principles in Tufte's text:

1. **Truthful Magnitude Representation** - Explicitly stated as first principle (p. 77)
2. **Dimensional Correspondence** - Explicitly stated as fifth principle (p. 71, 77)
3. **Unit Standardization** - Explicitly stated as fourth principle (p. 68, 77)
4. **Contextual Completeness** - Explicitly stated as sixth principle (p. 74, 77)
5. **Data Primacy Over Decoration** - Explicitly stated as third principle (p. 77)
6. **Explanatory Labeling** - Explicitly stated as second principle (p. 77)

### From Visual Examples I Could See

These intents emerged from examining the specific graphics in the PDF:

1. **Narrative Truth-Telling** - Demonstrated through the NY budget example where the "real news story" is revealed only through proper transformation of data (p. 68). The visual contrast between the misleading 3D parallelepiped chart and the honest line graph makes this intent visible.

2. **Design Manipulation Detection** - The annotated NY State budget graphic (p. 67) with callouts showing "squeezed-down block of type," "parallelepipeds placed on optical plane in front of the other eight," and "arrows pointing straight up" reveals how design choices create false impressions. This decomposition is only visible in the figure.

3. **Multivariate Encoding** - The Italian postal savings circular diagram (p. 72) demonstrates legitimate use of area where the spiral of rectangles encodes three related variables. The visual form reveals how 2D can be appropriate when data is genuinely multivariate.

### Discoveries from Visual Examination Not Named in Text

These intents emerged from patterns I observed across multiple figures that Tufte does not explicitly name:

1. **Perceptual Depth Manipulation** - The 3D parallelepipeds, oil barrels, and oil derrick graphics all use perspective and depth cues to amplify perceived differences. While Tufte mentions "three dimensions," he does not explicitly name the intent to avoid perceptual depth manipulation as a distinct principle. The visual examination of these figures reveals how pseudo-3D representation systematically exaggerates.

2. **Temporal Spacing Integrity** - In the NY budget graphic, the visual examination reveals that years are unevenly spaced along the horizontal axis, and the Connecticut traffic deaths example shows how the same data with different temporal density can support different interpretations. Tufte does not state a principle about temporal spacing, but the figures demonstrate its importance.

3. **Iconic Metaphor Hazards** - The shrinking doctor, shrinking dollar, and oil barrel figures all use iconic representations (recognizable objects) to show quantities. The visual examination reveals that iconic metaphors almost inevitably introduce dimensional mismatches (a doctor figure is inherently 2D/3D, making 1D data difficult to encode). This is a distinct concern from abstract area/volume encoding.

4. **Annotation as Diagnosis** - Tufte's annotated version of the NY budget graphic (p. 67) represents a meta-intent: using annotation to expose graphical manipulation. This technique of revealing design choices through critical annotation is demonstrated but not named as a communicative purpose.

---

## Framework Integration Notes

### Mapping to Existing Categories

| Extracted Intent | Primary Framework Category | Secondary Category |
|------------------|---------------------------|-------------------|
| Truthful Magnitude Representation | Evidential | Comparative |
| Dimensional Correspondence | Comparative | Evidential |
| Unit Standardization | Temporal | Comparative |
| Contextual Completeness | Evidential | Comparative |
| Data Primacy Over Decoration | Comparative | - |
| Explanatory Labeling | Instructional | Evidential |
| Narrative Truth-Telling | Evidential | - |
| Multivariate Encoding | Relational | Aggregative |

### Potential New Category: Integrity

Several of these intents cluster around a concept not explicitly named in the framework: **graphical integrity** as a meta-intent. This could be understood as:

- A constraint that applies across all other intents
- A distinct category focused on the ethics of visual representation
- An "anti-category" - intents defined by what graphics should NOT do

Tufte's chapter title "Graphical Integrity" suggests this may warrant its own framework treatment, perhaps as a cross-cutting concern rather than a separate intent category.

### Relationship to Lie Factor

The "Lie Factor" (size of effect shown in graphic / size of effect in data) is a quantitative diagnostic rather than an intent, but it operationalizes several intents:

- Lie Factor = 1.0 satisfies Truthful Magnitude Representation
- Lie Factor deviations indicate violations of Dimensional Correspondence
- Large Lie Factors indicate failure of Narrative Truth-Telling

This suggests the framework might benefit from diagnostic metrics that test whether intents are satisfied.
