---
name: stata-data-prep-exploration
description: "Use when the user wants to understand, inspect, clean, merge, or explore raw or partially processed data for a Stata-based empirical project before formal analysis. Produces data orientation, variable/unit/missingness/coverage diagnostics, merge diagnosis, minimal cleaning plans, and optional clean-data do-files."
---

# Stata Data Prep And Exploration

Use this skill when Codex should understand raw or partially processed Stata data before formal analysis: structure, unit of observation, identifiers, time coverage, variable meaning, missingness, merge feasibility, and minimal cleaning needs.

This skill prepares the ground for analysis. It is not the main workflow for final regressions, paper-ready outputs, independent review, or claim validation.

## Deliverables

Depending on scope, produce:

- data access status
- data orientation report
- variable, unit, coverage, and missingness diagnosis
- candidate key variables list
- merge diagnosis
- minimal sample and cleaning plan
- diagnostic Stata commands
- clean-data do-file or output manifest, only when requested or approved
- unresolved data questions

For detailed standards, read `references/stata-data-prep-standards.md` when the task involves substantial data orientation, cleaning, missingness, sample construction, or merges.

## Workflow

1. Clarify the empirical goal if provided.
2. Determine data access status without assuming data are inside the repository.
3. Inspect available data, do-files, logs, codebooks, metadata, and documentation.
4. Identify the observation unit, identifiers, time variables, and coverage.
5. Diagnose variable meanings, labels, units, scales, and missingness.
6. Check duplicates, uniqueness, impossible values, and suspicious ranges.
7. Evaluate candidate merges when relevant.
8. Propose a minimal cleaning and sample construction plan.
9. Write or modify cleaning code only when the task calls for it and the plan is clear.
10. Summarize what was directly inspected, inferred, assumed, and unresolved.

## Data And Code Rules

- Do not copy restricted, proprietary, licensed, confidential, or human-subject data into the repo unless explicitly permitted.
- Request permission before reading outside the workspace when required.
- Do not overwrite raw data.
- Start from the broadest defensible dataset and separate raw universe, usable observations, cleaned sample, and analysis-specific sample.
- Explain restrictions, merge choices, and variable constructions when they affect interpretation.
- Use logs for substantive diagnostics when running Stata.
- Preserve existing project style where possible.

## Boundaries And Routing

- Use `empirical-analysis-planner` to choose empirical strategy.
- Use `stata-data-analysis` for formal Stata implementation, regressions, tables, figures, and output generation.
- Use `stata_reviewer` for independent Stata pipeline review when authorized and available; it applies `.codex/agents/references/stata-review-protocol.md`.
- Use `verifier` for generated files, logs, outputs, and freshness claims when available.
- Use `critical_reviewer` for independent argument or claim review when useful.

If the main agent applies a review checklist itself, label that review non-independent. Review does not replace verification or scoring.

## Final Response Standard

End substantial tasks with what was directly inspected, what was inferred, what data issues were found, what files were created, what remains unverified, and the next empirical step.
