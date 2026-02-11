---
name: Apparent Enthymeme from Combination or Division
slug: fallacy-from-combination-division
source:
  work: Rhetoric
  author: Aristotle
  location: "Book 2, Chapter 24, 1401a24-1401b9"
  original_term: to diērēmenon syntithenta

intent: Recognize when arguments illegitimately combine or divide claims to reach false conclusions
direction: recognition

components:
  - element: original-state
    encodes: How the premises actually stand (combined or divided)
    required: true
  - element: manipulation
    encodes: The combining or dividing that creates the fallacy
    required: true
  - element: false-conclusion
    encodes: What appears to follow but doesn't
    required: true

parameters:
  form: "illicit-combination | illicit-division | omission"

related: []  # TBD: see also topic-09-from-division

warnings:
  - "This is a FALLACIOUS form - recognize to avoid deception"
  - "What is true separately may not be true together, and vice versa"

extensions:
  fallacious_form:
    name: "fallacy of composition/division"
    description: "Combining separate truths as if they were one, or dividing unified claims"
  aristotle_fallacy_number: 2
---

## Description

The second type of apparent enthymeme involves combining what is divided or dividing what is combined. Things that are not the same can seem the same when combined; truths that hold separately may not hold when combined, and vice versa.

A related fallacy is omission (elleipsis) - leaving out a crucial element that would change the conclusion.

## Examples

> "Another is for the speaker to combine what is divided or divide what is combined; for since what is not the same often seems to be the same, whichever is more useful should be done." (1401a24-27)

The principle: combination and division can create false appearances of identity or difference.

> "This was Euthydemus' form of argument, for example, his claim to know there was a trireme at the Peiraeus because he knew each of the terms." (1401a27-29)

Euthydemus combined:
- Knowledge of "trireme" (what it is)
- Knowledge of "Peiraeus" (what it is)
- Conclusion: Knowledge that there is a trireme at the Peiraeus

But knowing the terms separately doesn't equal knowing the combined fact.

> "And that by knowing the letters, he 'knew' the word; for the word is the same thing [as the letters]." (1401a29-31)

Knowing letters A, B, C individually doesn't mean knowing the word ABC - the combination has properties the parts lack.

> "And since twice as much of a thing induces illness, one can say that a single portion is not healthful either; for it would be odd if two goods equaled one evil." (1401a31-33)

Illicit reasoning:
- Two portions = illness (bad)
- Therefore one portion = half an illness = also not good?

But this combines quantities illicitly - one good doesn't become bad by being half of too much.

> "Again, what Polycrates said in regard to Thrasybulus, that he deposed thirty tyrants; for he combines them." (1401a35-1401b1)

Thrasybulus ended the rule of the Thirty Tyrants - one collective tyranny by thirty individuals. Polycrates combines them to claim he deposed THIRTY SEPARATE tyrants, perhaps claiming thirty times the reward.

> "Or what is in the Orestes of Theodectes; for it is from division: 'It is just,' for this woman to die, 'who has killed a husband' and for the son to avenge the father; so then these things have been [justly] done. But perhaps when they are combined it is no longer just." (1401b1-6)

Division fallacy:
- It is just for a wife-murderer to die
- It is just for a son to avenge his father
- DIVIDED: Both seem true
- COMBINED: Orestes justly killed his mother? The combination creates a problem neither premise has alone.

> "This would also be [a fallacy] by omission; for it ignores the [just] agent." (1401b6-7)

The argument omits WHO should execute justice - that the son is the wrong agent for this justice.

## Usage

**For recognition:**
- Check whether premises are combined that should remain separate
- Check whether unified claims are artificially divided
- Look for omitted elements (who, when, how) that would change the conclusion

**Common patterns:**
- Combining separate pieces of knowledge as if knowing them together
- Treating collective entities as multiple individuals
- Dividing complex moral situations into simple components
- Omitting crucial qualifications

## Notes

Kennedy identifies Euthydemus as "a sophist, best known from Plato's dialogue named for him. A fuller version of this fallacy is discussed in Sophistic Refutations 177b12-13."

The Orestes example shows how division can make morally complex situations seem simple: each premise is acceptable, but the combination reveals a problem.
