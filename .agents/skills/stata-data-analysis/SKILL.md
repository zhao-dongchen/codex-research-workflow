---
name: stata-data-analysis
description: "Use for producing empirical Stata work after data structure and analysis goals are sufficiently defined: write or revise .do files, implement data construction, run regressions, produce tables or figures, document outputs, and perform basic self-checks before handoff. This is a producer skill, not an independent reviewer."
---

# Stata Data Analysis

Use this skill when the user wants Codex to produce or modify empirical Stata work.

This is a producer skill. It is for writing, revising, and running analysis code, not for independent audit. If the data are not yet understood, use `stata-data-prep-exploration` first. If the empirical design is not settled, use `empirical-analysis-planner` first.

## Producer Deliverables

Depending on scope, produce:

- Stata implementation plan
- new or revised `.do` files
- data-construction steps
- sample construction and restriction code
- merge code and merge diagnostics
- regression or descriptive-analysis code
- generated tables, figures, logs, or derived outputs
- output manifest
- basic self-check notes
- unresolved empirical or data questions

## Producer Workflow

For substantial Stata production tasks:

1. Read `AGENTS.md`, `PROJECT_STATE.md`, and any task-relevant local references.
2. Inspect existing do-files, logs, data references, metadata, codebooks, tables, and figures.
3. Confirm the empirical goal, data access status, output paths, and reproducibility target.
4. Identify the broadest defensible baseline sample and required restrictions.
5. Map requested concepts to variables, units, and transformations.
6. Write or revise readable Stata code for data construction, regressions, tables, figures, logs, and output documentation.
7. Run Stata code where execution is available, or provide exact commands when execution is not available.
8. Perform basic self-checks before handoff.
9. In full workflow mode, request independent review and verification rather than relying on this skill's self-check.
10. Fix findings, re-run relevant checks, and report evidence and residual risks.

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
- prefer project-relative paths where feasible
- check required files before use where practical
- use `capture` sparingly and never to hide important failures
- show sample counts after major restrictions
- show merge diagnostics after merges
- label generated variables where useful
- write tables and figures to documented output paths
- document generated outputs and how to reproduce them

## Self-Check Before Handoff

Before presenting producer work as ready for review, check:

- do-files have a clear entrypoint
- logs are generated or exact commands are provided
- required outputs are written to documented paths
- sample sizes are printed after major restrictions
- merge diagnostics are visible when merges are used
- key variables have plausible ranges, units, and missingness
- tables and figures are either freshness-verified or explicitly marked `not freshness-verified`

This self-check is not independent review. In full workflow mode, use `stata-data-analysis` for implementation, use the `stata_reviewer` subagent for independent Stata review when authorized and available, and use `verifier` when authorized and available for output freshness, reproducibility, and evidence checks. The Stata reviewer applies `.codex/agents/references/stata-review-protocol.md`.

## Boundaries

Do not use this skill as the primary tool for:

- raw data orientation before the data structure is understood
- choosing the empirical design from scratch
- independent read-only review
- verifying freshness as an independent checker
- validating whether written paper claims are supported by results

Use `stata-data-prep-exploration` for raw data understanding and cleaning plans.

Use `empirical-analysis-planner` for analysis design.

Use the `stata_reviewer` subagent for independent Stata review. If the main agent applies `.codex/agents/references/stata-review-protocol.md` itself, label that review non-independent.

Use `verifier` for independent output, log, freshness, and reproducibility checks.

## Final Response Standard

End with:

- what Stata code changed
- what was run or directly verified
- what outputs were generated or checked
- what self-checks passed
- what remains unverified
- what independent review, verification, or score step is still needed
