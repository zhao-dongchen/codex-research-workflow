---
name: review-stata
description: "Use as the Stata review rubric for empirical pipelines, do-files, logs, sample construction, merges, specifications, tables, figures, and reproducibility evidence. This skill defines review standards; the independent reviewer actor should be the `stata_reviewer` subagent when authorized and available."
---

# Review Stata

Use this skill as the Stata-specific review rubric. It defines what to inspect, how to rank findings, and what a Stata review report should contain.

Prefer running this rubric through the read-only `stata_reviewer` subagent when an independent reviewer is requested or runtime-authorized. If no subagent is authorized and available, the main agent may use this rubric for a self-review, but should label it as not independent.

## Review Report

For substantial reviews, produce a `Stata Review Report` with findings first:

- Severity: `Blocker`, `Major`, `Minor`, or `Note`
- Evidence: file, line, log excerpt, output path, command, or observed artifact
- Issue: concise description
- Why it matters: research, reproducibility, interpretation, or code-quality consequence
- Suggested fix or decision

If no issues are found, say so clearly and list remaining verification gaps.

## Review Priorities

Prioritize:

- code that does not run or silently hides failures
- stale, missing, or untraceable outputs
- undocumented sample restrictions
- incorrect merge relationships or unchecked duplicate keys
- silent changes to variable definitions or transformations
- incorrect fixed effects, clustering, weights, or controls
- output tables or figures that do not match current code
- claims not supported by visible results
- fragile paths, globals, or environment assumptions
- missing logs, seeds, version information, or command evidence

## Empirical Specification Review

Check whether each reported specification clearly states:

- outcome
- main explanatory variable or treatment
- sample and unit of observation
- controls
- fixed effects
- clustering
- weights
- time window or event structure
- interpretation and limitations

Flag any mismatch between code, table labels, notes, and written interpretation.

## Data And Sample Review

Check:

- source files and data access status
- observation unit
- identifiers and time variables
- duplicate checks
- missingness checks
- restriction sequence
- sample counts after each major restriction
- whether restrictions are necessary, optional, or interpretation-changing
- whether zero, missing, and extended Stata missing values are handled correctly

## Merge Review

For merges, check:

- intended merge relationship
- uniqueness of keys on each side
- time alignment
- whether unmatched observations are expected
- match rates overall and by relevant groups or periods
- whether `m:m` is avoided unless explicitly justified
- whether `_merge` or equivalent diagnostics are preserved long enough to inspect

## Output Freshness Review

Before accepting tables, figures, or derived datasets as current, look for freshness evidence:

- successful rerun from current code and inputs
- current log showing output creation
- timestamps plus input/output hashes when appropriate
- build-system evidence if the project uses one

If freshness is not established, mark outputs `not freshness-verified`.

## Reproducibility Review

Check whether another researcher can rerun the work from recorded information:

- Stata version if available
- commands or do-file entrypoints
- path conventions and required inputs
- logs
- generated output paths
- seeds or stochastic settings
- package dependencies
- known manual or non-reproducible steps

## Boundaries

Do not edit files while applying this rubric.

Do not approve a silent empirical-specification change. Require the main agent or user to state the consequence and decision.

Do not treat a clean-looking table as evidence that the code ran unless logs or reproducibility evidence support it.
