# Evaluation: 001-check-initial-state

*Predates formalized experiment procedure. Reconstructed from original README notes, round 1 findings, and round 2 researcher reflection.*

## Conditions

Apparatus at commit `4f8a36e`: three-file structure (spec.md, infrastructure.md, bootstrap.md). All three documents given to the agent. The agent was asked to evaluate executability, not to execute.

## Findings from agent

All four findings are legitimate infrastructure gaps:

- **F1**: Procedures don't enumerate all required frontmatter fields for child artifact creation. Practitioner must cross-reference schema sections.
- **F2**: No procedure for Design waiting → open transition when Investigation completes.
- **F3**: Experiment `running` status in schema but no procedure sets it and spec doesn't define it.
- **F4**: Document maturity defined in spec but no frontmatter field or procedure maps it. Existing documents use `status: specified` which is a maturity value, contradicting the lifecycle status schemas.

## Researcher observations

After reviewing the agent's findings and the documents ourselves, two meta-observations emerged:

### Over-engineering risk

We are frontloading details into the bootstrap that aren't needed to get through stage 1. Experiments, trace links, evidence thresholds, maturity axis -- these are features of the system we want *eventually*, not things needed to get through the door. The bootstrap documents contain more specification than needed for the actual bootstrapping purpose.

### Observational method flaw

We were giving the practitioner the study design (bootstrap.md with exit criteria and findings) alongside the process documents. The agent's evaluation was primed by knowing what we expected to find.

Insight: bootstrap.md is for us as researchers. The spec and infrastructure mapping are for the practitioner. By giving the agent all three, we conflated the researcher role with the practitioner role.

## Actions taken

- Separated researcher content (research-guide.md) from practitioner content (apparatus.md)
- Merged spec.md and infrastructure.md into single apparatus.md (no abstract/concrete split needed when implementation is "markdown files")
- Moved bootstrap.md content into research guide
- Removed from apparatus.md: document maturity axis, evidence rule thresholds, trace links, provenance, gap analysis, proportionality discussion
- Fixed F1 (procedures now enumerate all frontmatter fields), F2 (complete/abandon procedures now update parent Design), F3 (removed `running` from experiment status)
- F4 resolved by removing maturity axis from practitioner document entirely
