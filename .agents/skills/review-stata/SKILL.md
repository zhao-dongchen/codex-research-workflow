---
name: review-stata
description: "Use for read-only review of Stata empirical code and pipelines: do-files, raw-data loading, external-data assumptions, merges, appends, reshapes, collapses, sample restrictions, variable construction, regressions, tables, figures, logs, output freshness, and reproducibility. Produce a severity-ranked Stata Review Report. Do not use as the primary producer skill for new empirical outputs, and do not edit code by default."
---

# Review Stata

Use this skill for read-only diagnosis of Stata empirical code, data pipelines, outputs, and reproducibility. The user-facing job is a severity-ranked Stata Review Report, not new empirical output production.

## Default Behavior

- Default to read-only diagnosis and findings first.
- Do not modify code unless the user asks for fixes or approves a follow-up implementation plan.
- Inspect relevant project instructions, Stata code, logs, outputs, documentation, path conventions, codebooks, and paper or notes files when present.
- Distinguish direct evidence from inference, assumptions, user-confirmed facts, and unresolved questions.
- If data, logs, or outputs are inaccessible, review code and documentation anyway, but label any unverified claims clearly.

## Review Scope

Review the parts of the Stata workflow relevant to the request:

- Raw-data loading and path handling.
- External-data assumptions and access constraints.
- Merges, appends, reshapes, collapses, and run order.
- Sample construction, restrictions, and missingness handling.
- Variable construction, labels, units, and scale conventions.
- Weights, fixed effects, clustering, and regression comparability.
- Table and figure generation.
- Logs, seeds, output freshness, and reproducibility.
- Human-readable code structure and comments.

## Stata Review Report

For substantial reviews, produce a concise `Stata Review Report` with:

- What the code appears to do.
- What appears correct.
- Critical findings.
- Major findings.
- Minor findings.
- Why each issue matters empirically.
- Suggested fixes or checks.
- What remains unverified.

Findings should be severity-ranked. For each finding, include evidence from files, code, logs, outputs, or the absence of necessary evidence; explain the empirical or reproducibility consequence.

## Merge Review Discipline

When reviewing a merge, reason through:

- What each dataset represents conceptually.
- Observation unit of each dataset.
- Intended post-merge observation unit.
- Whether the intended merge is truly `1:1`, `1:m`, `m:1`, or suspiciously `m:m`.
- Whether merge keys are unique where they should be.
- Whether time/date variables are aligned.
- Expected match rate given source universes.
- Whether low or high match rates are plausible.
- Whether match rates vary by year, group, source, or another meaningful dimension.
- Whether unmatched observations are systematic.
- Whether poor merge performance could reflect wrong keys, identifier mismatch, crosswalk problems, universe differences, timing mismatch, or legitimate partial overlap.

Flag `merge m:m` unless the code clearly intends a Cartesian-style expansion and the empirical meaning is explicit.

## Sample, Missingness, And Variable Review

Check whether the pipeline clearly defines:

- The intended unit of analysis.
- The raw source universe.
- Mechanically necessary exclusions.
- Analysis-specific restrictions.
- Discretionary restrictions that affect interpretation.
- Missingness introduced by source coverage, merges, transformations, or sample restrictions.
- True zero versus missing ambiguity.
- Stata extended missing-value handling where relevant.
- Variable units, scales, labels, and transformations.

Flag restrictions or transformations that could materially change the target population, interpretation, or comparability of outputs.

## Regression And Table Review

For regressions, tables, and figures, check:

- Outcome and main explanatory variables.
- Sample stability across columns or panels.
- Weights, fixed effects, clustering, and standard-error logic.
- Whether coefficient interpretation matches variable units and transformations.
- Whether estimates are descriptive, associational, or tied to an explicit research design.
- Whether tables state `N`, sample context, weights, fixed effects, clustering, and other necessary specification details.
- Whether figure axes, units, sample, and time-period context are clear.
- Whether polished outputs are being presented before underlying data logic is verified.

Do not invent a causal interpretation when the design is not supported by code, documentation, or user-confirmed facts.

## Output Freshness And Reproducibility

Do not claim results are current unless outputs were run or freshness-verified from the current code, inputs, and configuration.

Review:

- Whether logs exist and correspond to the current code.
- Whether outputs can be regenerated from recorded commands.
- Whether table and figure timestamps, file paths, or logs support freshness.
- Whether seeds or random components are controlled where needed.
- Whether restricted data, private paths, credentials, or sensitive values appear in durable outputs or logs.

Mark stale, unrun, or unsupported outputs as `not freshness-verified`.

## Human-Readable Code Review

Assess whether the Stata code communicates empirical logic:

- Clear section headers.
- Comments explaining the empirical purpose of major blocks.
- Rationale for sample restrictions.
- Variable construction comments where empirical meaning matters.
- Observation unit stated before reshaping, collapsing, or merging.
- Merge intent and post-merge checks explained in code or adjacent comments.
- Regression blocks explained by research purpose and comparison logic.
- Avoidance of overly compressed or clever code that obscures meaning.

Do not require trivial comments that narrate obvious syntax.

## Boundaries

Do not use this skill to:

- Produce new empirical analysis or outputs by default; use `stata-data-analysis`.
- Edit code by default.
- Claim results are current without verification evidence.
- Make unsupported substantive claims about empirical results or paper conclusions.
- Review MATLAB, Python, or R code except to note visible cross-language dependencies affecting the Stata workflow.
- Answer generic econometrics questions with no Stata code, data pipeline, or output-review task.

## Optional Agents

Use available agents only when they are available and when the user explicitly requests full workflow support or the review is substantial enough to benefit from them:

- Use `critical_reviewer` to challenge findings, empirical reasoning, severity, and missing evidence.
- Use `verifier` to check file state, logs, output freshness, command evidence, and completion claims.

Do not imply that agents are silently guaranteed to run.
