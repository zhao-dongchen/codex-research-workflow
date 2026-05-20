---
name: stata-data-prep-exploration
description: "Use when the user wants to understand, inspect, clean, merge, or explore raw or partially processed data for a Stata-based empirical project before formal analysis. Produces data orientation, variable/unit/missingness/coverage diagnostics, merge diagnosis, minimal cleaning plans, and optional clean-data do-files. Do not use as the main regression-analysis producer, code reviewer, or argument validator."
---

# Stata Data Prep And Exploration

Use this skill when the user wants Codex to behave like a careful empirical research assistant opening raw or partially processed data for the first time.

The purpose is to understand the dataset before analysis: what it contains, how it is structured, what variables mean, what is missing, what can be merged, what unit of observation is appropriate, and what minimal cleaning is needed.

This skill is not primarily for producing final regressions or paper-ready results. It prepares the ground for later analysis.

## Core Deliverables

Depending on the task, produce some combination of:

- Data Access Status
- Data Orientation Report
- Variable and Unit Diagnosis
- Coverage and Missingness Report
- Candidate Key Variables List
- Merge Diagnosis, if relevant
- Minimal Sample and Cleaning Plan
- Diagnostic Stata Commands
- Clean-data do-file, only after approval
- Clean dataset path or output manifest, if generated
- Unresolved Data Questions

## Default Workflow

For substantial data-preparation tasks, follow this sequence:

1. Clarify the user’s empirical goal, if provided.
2. Determine data access status.
3. Inspect available data, code, codebooks, metadata, logs, and documentation.
4. Identify the observation unit, identifiers, time variables, and coverage.
5. Diagnose variables, labels, units, scales, and missingness.
6. Check duplicates, uniqueness, impossible values, and suspicious ranges.
7. Evaluate candidate merges, if relevant.
8. Propose a minimal cleaning and sample construction plan.
9. Write or modify cleaning code only after approval when the task is nontrivial.
10. Summarize what is directly verified, inferred, assumed, and unresolved.

## Data Access Status

Do not assume datasets are stored in the current repository.

Classify the data access situation:

- Data inside the current repo or workspace.
- Data stored locally but outside the repo.
- Remote, licensed, proprietary, restricted, or confidential data.
- Data referenced in Stata code but not currently accessible.
- User-uploaded sample, extract, or excerpt only.

Required behavior:

- Inspect Stata scripts, globals, locals, macros, path files, config files, README files, logs, codebooks, and documentation to infer intended data locations.
- Ask the user for paths or access information when exact external locations are required but not visible.
- Request permission before reading outside the workspace when required.
- Never copy restricted, proprietary, licensed, confidential, or human-subject data into the repo unless the project explicitly permits it.
- If data are inaccessible, remain useful by reading code and documentation, proposing diagnostic Stata commands, and clearly labeling unverified points.
- Distinguish `data directly inspected` from `data structure inferred from code or documentation`.

## Documentation And Metadata Research

When variable meanings, units, source coverage, or dataset design are unclear, search available documentation before guessing.

Relevant sources may include:

- Codebooks.
- Data dictionaries.
- README files.
- Vendor documentation.
- Survey questionnaires.
- PDF documentation.
- Web pages.
- Existing paper appendices.
- Stata labels and notes.
- Prior cleaning scripts and logs.

When documentation is incomplete, state what is known, what is inferred, and what needs user confirmation.

If web or PDF research is needed and available in the environment, use it to understand source definitions, but do not overstate documentation-based inference as direct data inspection.

## Data Orientation Report

For substantial tasks, produce a concise `Data Orientation Report` in chat or, in scaffolded projects, as a durable report if requested.

Include:

1. Dataset identity and source, if known.
2. Data access status.
3. Likely observation unit.
4. Identifiers and time variables.
5. Cross-sectional, panel, repeated cross-section, event-level, transaction-level, or other structure.
6. Coverage over time and across relevant units.
7. Candidate key variables for the user’s research goal.
8. Variable labels, value labels, codebooks, and documentation status.
9. Units and scales.
10. Missingness and coverage concerns.
11. Duplicate or uniqueness issues.
12. Suspicious values or impossible ranges.
13. Merge possibilities or risks, if relevant.
14. Recommended next step.
15. Unresolved questions.

## Variable And Unit Diagnosis

For variables likely to matter, identify:

- Raw variable name.
- Label or documented meaning.
- Source definition.
- Measurement unit.
- Scale.
- Frequency.
- Whether the variable is a stock, flow, rate, share, count, category, or identifier.
- Whether it is nominal or real, if monetary.
- Whether values are levels, logs, percentages, or fractions.
- Whether the variable is raw, cleaned, imputed, constructed, or merged.

Flag ambiguity before interpreting magnitudes.

Examples of ambiguity to flag:

- The label suggests percent but values appear between 0 and 1.
- Monetary variables may be in dollars, thousands, or millions.
- A value of zero may mean true zero or missing encoded as zero.
- The same variable name may change meaning across files or years.

## Missingness Diagnosis

Ask not only what is missing, but why it may be missing.

Distinguish:

- Variable absent from the source.
- Variable present under another name.
- Variable sparsely populated.
- Structurally undefined values.
- Missingness due to time coverage.
- Missingness due to merge failure.
- Missingness created by transformations.
- Missingness due to sample restrictions.
- Stata missing-value coding issues, including extended missing values.
- True zero versus missing ambiguity.

Where data are available, diagnose missingness by:

- Year or time period.
- Unit type.
- Group.
- Source file.
- Merge status.
- Sample restriction step.
- Relevant economic category.

State whether missingness could materially affect the analysis sample or interpretation.

## Minimal Cleaning And Sample Construction

Start from the broadest defensible dataset.

Separate:

- Raw source universe.
- Mechanically usable observations.
- Minimal cleaned sample.
- Analysis-specific sample.
- Optional stricter restrictions.

Mechanically necessary exclusions may include:

- Missing core identifiers.
- Impossible dates or time periods.
- Duplicates that violate required uniqueness and cannot be resolved.
- Observations outside the documented source universe.
- Variables needed for a requested diagnostic that are fully unavailable.

Avoid imposing narrow sample restrictions before the empirical goal requires them.

For each proposed restriction, explain:

- What it removes.
- Why it is necessary or optional.
- How much data it removes, when data are available.
- Whether it changes the target population or interpretation.

## Merge Diagnosis

When a merge is needed, treat it as a conceptual data-design problem, not merely a Stata command.

Before merging, determine:

- What each dataset represents.
- The observation unit of each dataset.
- The intended post-merge observation unit.
- Candidate merge keys.
- Whether keys are unique where required.
- Whether time variables are aligned.
- Whether the merge should be `1:1`, `1:m`, `m:1`, or something else.
- Whether `m:m` would create an unintended Cartesian expansion.

For substantial merge tasks, produce a `Merge Diagnosis` covering:

1. Intended merge relationship.
2. Key variables.
3. Uniqueness checks.
4. Expected match rate given source universes.
5. Observed match rate, if data are available.
6. Match rate by time or group, if relevant.
7. Whether unmatched observations are systematic.
8. Possible reasons for low or high match rates.
9. Remaining risks.
10. Recommended next checks.

A low merge rate is not automatically wrong. A high merge rate is not automatically correct. Interpret match rates relative to the source universes and intended overlap.

## Exploratory Diagnostics

Before formal analysis, produce or propose diagnostics such as:

- Observation counts by year or group.
- Number of unique units over time.
- Missingness tables.
- Summary statistics.
- Percentiles and outlier checks.
- Distribution plots.
- Cross-tabs for categorical variables.
- Coverage plots.
- Before/after cleaning counts.
- Merge status summaries.
- Variable support and impossible-value checks.

Keep exploratory output focused on understanding data quality and feasibility.

## Stata Code Standards

When writing or revising cleaning/exploration code:

- Use clear section headers.
- Define paths and macros transparently.
- Do not overwrite raw data.
- Save cleaned outputs separately.
- Comment why each cleaning step exists.
- Explain sample restrictions.
- Explain variable construction when meaning matters.
- Check uniqueness before merges.
- Inspect `_merge` or equivalent merge diagnostics.
- Use logs when running substantive diagnostics.
- Preserve the project’s existing style where possible.
- Avoid overly clever code that hides data logic.

Comments should explain empirical and data-design logic, not obvious Stata syntax.

## Boundaries

Do not use this skill as the main tool for:

- Final regression analysis.
- Paper-ready table or figure production.
- Read-only review of an existing Stata pipeline.
- Validating whether results support a paper’s argument.
- MATLAB, Python, or R workflows unless only cross-language data dependencies are being noted.
- Generic econometrics discussion without a concrete dataset or Stata workflow.

For formal Stata analysis, use `stata-data-analysis`.

For read-only Stata code or pipeline review, use `review-stata`.

For deciding what empirical strategy to pursue, use `empirical-analysis-planner`.

For checking whether results support a claim, use `validate-empirical-argument`.

## Optional Agents

Use available agents only when available and useful:

- Use `research_explorer` to map a complex project or data pipeline.
- Use `verifier` to check generated files, logs, outputs, and freshness claims.
- Use a future data-documentation or empirical reviewer agent if one exists.

Do not imply that subagents are guaranteed to run.

## Final Response Standard

End substantial tasks with:

- What was directly inspected.
- What was inferred.
- What data issues were found.
- What clean or diagnostic files were created, if any.
- What remains unverified.
- What the next empirical step should be.