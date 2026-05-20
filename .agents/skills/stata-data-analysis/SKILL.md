---
name: stata-data-analysis
description: "Use for implementing Stata empirical analysis after data structure and analysis goals are sufficiently defined: write or revise do-files, run diagnostics, produce tables or figures, record logs, and summarize verification evidence. This is the Stata producer skill, not the read-only reviewer."
---

# Stata Data Analysis

Use this skill when the user wants Codex to produce or modify Stata empirical analysis code, diagnostics, tables, figures, logs, or related reproducible outputs.

This skill assumes the data structure and empirical goal are sufficiently clear. If the data are not yet understood, use `stata-data-prep-exploration` first. If the specification has not been chosen, use `empirical-analysis-planner` first.

## Core Deliverables

Depending on scope, produce:

- Stata implementation plan
- do-file edits or new do-file structure
- diagnostic commands
- generated logs
- generated tables, figures, or derived outputs
- sample-count and missingness checks
- output manifest
- verification summary
- unresolved empirical or data questions

## Producer Workflow

For substantial Stata tasks:

1. Read `AGENTS.md`, `PROJECT_STATE.md`, and relevant workflow protocols.
2. Inspect existing do-files, logs, data references, metadata, codebooks, tables, and figures.
3. Confirm the empirical goal, data access status, output paths, and reproducibility target.
4. Identify the broadest defensible baseline sample and any required restrictions.
5. Map requested concepts to variables and transformations.
6. Implement readable Stata code with explicit paths, logs, sample checks, and output creation.
7. Run available checks or provide exact commands when execution is not possible.
8. Verify output existence, freshness, row counts, and key sanity checks where possible.
9. Request independent review using `stata_reviewer` when authorized and available; otherwise apply the `review-stata` rubric as a non-independent self-review and label it that way.
10. Fix review findings, re-verify, and produce a final evidence summary.

## Empirical Integrity Rules

Do not silently change:

- sample definitions
- merge keys or merge relationships
- variable definitions or transformations
- weights
- fixed effects
- clustering
- controls
- winsorization, trimming, or outlier rules
- treatment timing or event windows
- table or figure interpretation

If a change is needed, state the interpretive consequence before making it.

## Stata Code Standards

Prefer do-files that are readable and rerunnable:

- use clear section headers
- open and close logs deliberately
- define path conventions visibly
- check required files before use where practical
- avoid fragile absolute paths unless the project uses them intentionally
- use `capture` sparingly and never to hide important failures
- show sample counts after major restrictions
- show merge diagnostics after merges
- label generated variables where useful
- write tables and figures to documented output paths

## Verification Expectations

Where Stata execution is available, verify:

- do-files run without relevant errors
- logs are current
- required outputs exist
- sample sizes match expectations
- merges have documented match diagnostics
- key variables have plausible ranges and missingness
- tables and figures are freshness-verified or marked `not freshness-verified`

Where Stata execution is not available, provide exact commands for the user or a future agent to run and clearly mark unverified claims.

## Boundaries

Do not use this skill as the primary tool for:

- raw data orientation before the data structure is understood
- choosing the empirical design from scratch
- independent read-only review
- validating whether written paper claims are supported by results

Use `stata-data-prep-exploration` for raw data understanding and cleaning plans.

Use `empirical-analysis-planner` for analysis design.

Use `review-stata` as the review rubric and `stata_reviewer` as the independent reviewer actor when authorized and available. If only the rubric is used by the main agent, label the result as non-independent self-review.

## Final Response Standard

End with:

- what changed
- what was run or directly verified
- what outputs were generated or checked
- what remains unverified
- review or score status when applicable
