---
name: Apparent Enthymeme from Omitting When and How
slug: fallacy-omitting-when-how
source:
  work: Rhetoric
  author: Aristotle
  location: "Book 2, Chapter 24, 1402a10-19"
  original_term: para tēn elleipsin tou pote kai pōs

intent: Recognize when arguments omit crucial qualifications of time or manner
direction: recognition

components:
  - element: general-claim
    encodes: The unqualified assertion being made
    required: true
  - element: omitted-qualification
    encodes: The when, how, or under-what-circumstances that would limit the claim
    required: true
  - element: false-conclusion
    encodes: What seems to follow from the unqualified claim
    required: true

parameters:
  omission_type: "temporal | modal | conditional"

related: []  # TBD: see also fallacy-from-combination-division

warnings:
  - "This is a FALLACIOUS form - recognize to avoid deception"
  - "Claims true at one time may not be true at another"
  - "Claims true in one manner may not be true in another"

extensions:
  fallacious_form:
    name: "fallacy of omitted qualification"
    description: "Suppressing when, how, or under what conditions a claim holds"
  aristotle_fallacy_number: 8
---

## Description

The eighth type of apparent enthymeme omits consideration of when and how (para tēn elleipsin tou pote kai pōs). A claim may be true under certain conditions, at certain times, or in certain ways - but the speaker presents it without these qualifications, making it seem universally applicable.

## Examples

> "Another is by omission of consideration of when and how." (1402a10)

Aristotle identifies the core move: suppressing relevant qualifications.

> "For example, [the argument] that Alexander took Helen justly; for free choice [of a husband] had been given her by her father. [This is fallacious;] for presumably [the choice was] not for all time, only for the first time; for the father's authority only lasts to that point." (1402a10-15)

The argument for Paris:
- Helen's father gave her free choice of husband
- Helen chose Paris
- Therefore Paris took Helen justly

The omission: The free choice applied to her FIRST marriage (to Menelaus). It didn't extend indefinitely to allow her to change husbands whenever she wished. The temporal qualification is suppressed.

> "Or if someone were to say that it is hybris to beat those who are free; [this is fallacious;] for it is not true, only when someone strikes the first blow." (1402a15-19)

The argument:
- It is hybris (outrage) to beat free people
- X beat a free person
- Therefore X committed hybris

The omission: Beating someone who struck FIRST is not hybris - it's self-defense or retaliation. The claim about hybris only applies "when someone strikes the first blow." Omitting this qualification makes the claim seem absolute when it's actually conditional.

## Usage

**For recognition:**
- Check whether claims are qualified by time ("always"? "at first"? "under these circumstances"?)
- Check whether manner/conditions are specified
- Ask: "Does this hold universally, or only in certain cases?"

**Common omissions:**
- Temporal limits: A right that applied once doesn't apply forever
- Circumstantial limits: A principle true in normal cases may have exceptions
- First-mover considerations: Who initiated changes the moral calculus

**Defense against this fallacy:**
- Supply the missing qualification
- Show the claim only holds under specific conditions
- Demonstrate the current case differs from the qualified case

## Notes

The Paris and Helen example is rich: it involves property rights (a father's authority over his daughter), time limits (the scope of granted freedom), and the complexity of ancient marriage customs. The fallacy works by abstracting away from these specifics.

The hybris example shows how moral claims often have implicit qualifications. "It's wrong to strike people" is generally true, but most moral systems allow exceptions for self-defense. Omitting this qualification makes the rule seem absolute.
