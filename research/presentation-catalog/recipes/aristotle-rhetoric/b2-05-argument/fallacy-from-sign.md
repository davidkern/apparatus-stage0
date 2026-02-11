---
name: Apparent Enthymeme from Non-Necessary Sign
slug: fallacy-from-sign
source:
  work: Rhetoric
  author: Aristotle
  location: "Book 2, Chapter 24, 1401b14-19"
  original_term: ek tou sēmeiou

intent: Recognize when a fallible sign is treated as proof
direction: recognition

components:
  - element: sign-observed
    encodes: The evidence being cited
    required: true
  - element: conclusion-claimed
    encodes: What the sign supposedly proves
    required: true
  - element: missing-necessity
    encodes: The logical gap between sign and conclusion
    required: true

parameters:
  sign_type: "correlational | exemplary"

related: []  # TBD: see also semeion in b1-01-definition

warnings:
  - "This is a FALLACIOUS form - recognize to avoid deception"
  - "Signs indicate possibility, not necessity"
  - "The sign relationship is not convertible"

extensions:
  fallacious_form:
    name: "non-sequitur from sign"
    description: "Treating fallible sign as conclusive proof"
  aristotle_fallacy_number: 4
---

## Description

The fourth type of apparent enthymeme argues from a non-necessary sign (sēmeion). A sign suggests something but doesn't prove it - the connection is probable, not necessary. The fallacy treats such signs as if they were conclusive.

The logical problem: signs are not convertible. If all A's are B's, it doesn't follow that all B's are A's. A sign that is true of some cases doesn't prove it's true of this case.

## Examples

> "Another is from a [non-necessary] sign; for this, too, is non-syllogistic." (1401b14-15)

Aristotle notes that sign-reasoning is inherently non-syllogistic - it doesn't produce necessary conclusions.

> "For example, if someone were to say, 'Lovers benefit cities; for the love of Harmodius and Aristogeiton destroyed the tyrant Hipparchus.'" (1401b15-17)

The argument:
- Sign: Harmodius and Aristogiton's love led to tyrannicide
- Conclusion: Lovers benefit cities

But one example doesn't establish a general rule. Their love had this particular effect; it doesn't follow that love generally benefits cities.

> "Or if someone were to say that Dionysius is a thief; for he is wicked. This is certainly non-syllogistic: not every wicked man is a thief, but every thief is wicked." (1401b17-19)

The logical structure:
- All thieves are wicked (true)
- Dionysius is wicked (given)
- Therefore Dionysius is a thief? (INVALID)

This is the fallacy of affirming the consequent. Wickedness is a sign of possible theft, but it doesn't prove theft. Many wicked people are not thieves.

## Usage

**For recognition:**
- Notice when single examples are used to establish general claims
- Check whether the sign relationship is convertible
- Ask: "Does this sign PROVE the conclusion, or merely SUGGEST it?"

**Key distinction:**
- Necessary signs (tekmēria): Prove conclusions - e.g., fever proves illness
- Fallible signs (sēmeia): Indicate possibility - e.g., looking pale suggests illness

**Logical test:**
- If A then B (all thieves are wicked)
- Does NOT entail: If B then A (all wicked people are thieves)

## Notes

This fallacy relates to Aristotle's discussion of signs in Book 1 (1.2.14-18), where he distinguishes between necessary signs (tekmēria) and fallible signs (sēmeia). The fallacy occurs when fallible signs are treated as necessary.

The Harmodius and Aristogiton example is notable: their assassination of Hipparchus in 514 BCE was celebrated in Athens, but even this famous case doesn't prove a general principle about lovers benefiting cities.
