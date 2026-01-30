# Apparatus Researcher Notes

Directory for me to keep my notes while building The Apparatus.

## Starting commit: 4f8a36e 29 Jan 2026

After extracting the apparatus from the gregarious project I've added a minimal set
of tooling to run claude-code and integrate it with devenv. I've not read through what
has been extracted yet by the claude-code with full gregarious context; before I do
that I'll prompt stage0-check.md on an agent isolated to this directory.

[Experiment 001](experiments/001-check-initial-state)

The conversation indicates that the artifacts are generally coherent, however work was not completed on disambiguating lifecycle and maturity. These two terms are confused together and the implementation lacks a mechanism to set the fields properly.

I will now read the artifacts myself based on the feedback of the conversation and align terminology and procedure before running the check again.

After reviewing the documents myself, I come away wondering if we are frontloading too many details into our bootstrapping stages? To use our own terminology, we the researchers are currently in an "investigation phase" trying to answer the open question "what does the bootstrap specification look like to create the apparatus?"

Each round of edits we make is us refining our hypothesis of the answer to that question, and each round with an unaware agent is us performing an experiment and analyzing the results. We ourselves do not need the formalism for this stage - we just need to keep copious notes and keep trying things out.

Our observational method is flawed. Not only are we giving the participant the study design, we're also giving them the research notes!
