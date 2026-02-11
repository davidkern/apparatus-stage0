# Discovery Prompts

Recording prompts used for intent discovery passes, for future reference and
potential automation.

---

## Discovery 007: Legal/Contractual Language

**Date**: 2026-02-10

**Hypothesis**: Legal language has formalized and named communicative purposes
that exist informally in everyday communication but aren't explicitly labeled.
By examining legal vocabulary, we may surface the *roots* of general-purpose
intents rather than specialist leaves.

**Framing**: Extract general communicative purposes, not domain-specific
applications. Focus on what legal precision reveals about informal communication.

**Prompt**:

```
You are researching communicative intents — the semantic purposes that
authors have when presenting information to an audience.

First, read the framework document to understand what an "intent" is:
/work/apparatus/catalog/framework.md

Then research legal and contractual language — contract drafting conventions,
legislative drafting, legal interpretation principles, deontic logic as applied
to legal texts, and the vocabulary of legal speech acts.

Your goal is NOT to catalog legal-specific intents (like "indemnification" as
a specialist term). Instead, look for **general communicative purposes that
legal language has formalized**.

Legal practice has needed to make explicit what casual communication leaves
ambiguous. When everyday speech says "you should," it's vague between suggestion,
recommendation, and obligation. Legal language forces precision: "shall" vs
"may" vs "should" have distinct meanings.

For each intent you identify:
1. Name it (the general-purpose name, not the legal term)
2. How legal language formalizes it (the precise legal vocabulary)
3. How it appears informally in everyday/technical communication
4. The ambiguity that legal precision resolves
5. Containment relationships
6. Which existing framework categories it might belong to

Focus especially on:
- Deontic modality (obligation, permission, prohibition)
- Conditionality and exceptions
- Commitment and accountability
- Scope limitation and definition
- Temporal aspects of obligations (ongoing vs one-time, duration, triggers)

Write findings to:
/work/apparatus/catalog/intents/discovery/legal-language.md
```

**Expected coverage**: Deontic intents (obligation/permission/prohibition),
commitment types, conditionality, scope limitation, accountability structures.

---
