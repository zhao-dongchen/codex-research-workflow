---
name: stata-data-analysis
description: "Use for Stata-based empirical analysis that produces artifacts: inspect data access, understand datasets and Stata pipelines, construct samples, write or revise do-files, generate summary statistics, figures, tables, and regression outputs, and report verified findings. This is the producer skill for Stata empirical work, not a read-only audit skill. For review of existing Stata code, merges, regressions, tables, logs, or reproducibility, use review-stata."
---

# Stata Data Analysis

Use this skill as the Stata empirical producer workflow. The user-facing job is to analyze data in Stata and produce empirical artifacts with clear assumptions, readable code, and evidence-based summaries.

Use this skill for requests such as:

- Analyze this Stata dataset.
- Build summary statistics and figures.
- Prepare regression tables.
- Write or revise a do-file to construct an analysis sample.
- Produce first-pass empirical outputs for a research question.

For read-only review or audit of existing Stata do-files, pipelines, merges, sample restrictions, regressions, tables, figures, logs, or reproducibility, use `review-stata` instead.

## Expected Deliverables

Deliverables should match the task and available data. For substantial work, produce or update:

- Data-access status.
- Pre-flight data report.
- `Data Orientation`.
- Sample-flow notes.
- Stata do-file(s).
- Logs if run.
- Summary statistics.
- Tables.
- Figures.
- Regression outputs when appropriate.
- Final analysis summary.
- Verification and review notes.

Before finalizing substantial empirical outputs, call or recommend a `review-stata` pass so code, sample logic, merges, tables, figures, and reproducibility claims receive read-only review before they are treated as final.

## Producer Workflow

1. Inspect local instructions, project state, Stata code, documentation, path conventions, codebooks, logs, outputs, and relevant paper or notes files.
2. Determine data-access status before claiming to inspect data.
3. Produce a concise pre-flight report for substantial tasks: available data/code, intended analysis unit, likely run order, missing access, and immediate risks.
4. Orient the data and variables before constructing outputs.
5. Propose a plan before nontrivial code changes, sample construction, or output generation.
6. Implement after approval when the task is nontrivial or changes durable project artifacts.
7. Run Stata or provide runnable commands when execution is possible; otherwise label outputs and claims as unverified.
8. Verify generated files, logs, tables, figures, and regression outputs before claiming completion.
9. Summarize what was produced, what was verified, what was inferred, and what remains unresolved.

## Data Access And External Data

Do not assume datasets are stored in the current repo. Determine the data-access status before claiming to inspect data:

- Data inside the current repo or workspace.
- Data stored locally but outside the repo.
- Remote, licensed, proprietary, restricted, or confidential data.
- Data referenced by code but not currently accessible.
- User-uploaded sample, extract, or excerpt only.

Required behavior:

- Inspect existing Stata scripts, globals, locals, macros, path files, config files, README files, codebooks, logs, and documentation to infer intended data locations when possible.
- Ask the user for the needed path or access information when exact external data locations are required but not visible.
- Request permission before reading outside the workspace when required by the environment or data-governance rules.
- Never copy restricted, proprietary, licensed, confidential, or human-subject data into the repo unless the project explicitly permits it.
- If data are inaccessible, remain useful by reading code/docs, identifying what needs inspection, proposing diagnostic Stata commands, preparing a data-inspection plan, and clearly labeling what remains unverified.
- Distinguish `data directly inspected` from `data structure inferred from code or documentation`.

## Data Orientation

For substantial first-pass data work, produce a concise `Data Orientation` in chat:

- What the dataset appears to be, including identity and source when known.
- Likely observation unit.
- Key identifiers and time dimensions.
- Cross-sectional, panel, time-series, or event-level structure.
- Coverage over time and across relevant entities.
- Candidate variables relevant to the user goal.
- Variable labels, value labels, codebooks, units, scales, and ambiguities.
- Sample size, duplicates, expected uniqueness violations, suspicious values, and impossible ranges.
- What remains uncertain.
- Recommended next step.

Useful Stata diagnostics often include `describe`, `codebook`, `notes`, `label list`, `datasignature`, `count`, `isid`, `duplicates report`, `tab`, `tabstat`, `summarize, detail`, and coverage checks by identifier and time.

## Variables, Units, And Missingness

Ask not only what is missing, but why it might be missing. Distinguish:

- Variable absent from the dataset.
- Variable present under a different or nonobvious name.
- Variable sparsely populated.
- Structurally undefined values.
- Missingness created by merges.
- Missingness driven by time coverage.
- Missingness created by transformations.
- Stata missing-value coding issues, including extended missing values.
- True zero versus missing ambiguity.

Diagnose whether missingness is concentrated by year, unit, group, source file, merge status, or constructed sample. Flag when missingness could meaningfully alter the empirical sample or interpretation.

Check units and definitions before interpreting magnitudes:

- Units of measurement and scale conventions.
- Nominal versus real values when relevant.
- Percentage versus fraction.
- Annual versus quarterly or other frequency.
- Stock versus flow.
- Level versus transformed variable.

If units or definitions are ambiguous, say so before interpreting coefficients, magnitudes, tables, or figures.

## Sample Construction

Start from the broadest defensible analysis sample and impose only minimal necessary restrictions first. Add stronger restrictions only with explicit reasons.

Distinguish:

- Mechanically necessary exclusions, such as unusable identifiers or undefined outcomes.
- Analysis-specific restrictions required by the stated design or comparison.
- Discretionary restrictions that may affect interpretation.

Use sample-flow logic:

- Raw source universe.
- Mechanically usable observations.
- Minimal analysis sample.
- Additional restrictions, if later justified.

For substantial sample construction, explain the intended unit of analysis, what each restriction does, why it is imposed, how much data it removes when data are available, and whether the resulting sample changes the target population or interpretation.

## Merge Diagnosis For Producer Work

When writing or revising a merge, reason through:

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

For substantial merge tasks, produce a concise `Merge Diagnosis` in chat covering intended merge relationship, keys, uniqueness checks, match rates if data are available, interpretation of match rates, remaining risks, and recommended next checks.

Avoid `merge m:m` unless the user explicitly intends a Cartesian-style expansion and the empirical meaning is clear.

## Empirical Outputs

Treat exploratory analysis as part of learning the data, not just output generation. Before sophisticated modeling, produce or propose:

- Summary statistics.
- Missingness tables.
- Coverage tables or figures.
- Unconditional distributions.
- Subgroup comparisons.
- Time-series figures.
- Simple correlations or binned relationships when useful.
- Sanity checks on whether key variables behave plausibly.

For goal-directed analysis, match the analysis to the user's stated goal. Move from descriptive evidence to simple regressions and then richer regressions only when warranted.

Before writing or running regressions, state:

- Outcome variable.
- Main explanatory variable or treatment.
- Observation unit.
- Sample.
- Weights, if any.
- Fixed effects, if any.
- Clustering level, if any.
- Whether the analysis is descriptive, associational, or intended to support a causal interpretation.

Do not casually invent a causal identification strategy. If the user asks for causal analysis and the design is not specified, identify what remains needed.

## Human-Readable Stata Code

Stata code should communicate the empirical logic to the user. Preserve the project's existing style when possible, but avoid overly compressed or clever code that obscures meaning.

When writing or revising code:

- Use clear section headers.
- Comment on the empirical purpose of major blocks.
- Explain why sample restrictions are imposed.
- Explain variable construction where economic or empirical meaning matters.
- State the observation unit before reshaping, collapsing, or merging.
- Explain merge intent and post-merge checks in code or adjacent comments.
- Explain regression blocks by research purpose and comparison logic.
- Avoid trivial comments that narrate obvious syntax.

When reporting back, explain what the code does, what empirical decisions the changes reflect, what was learned from data or code, what assumptions were made, and what remains uncertain or unverified.

## Tables, Figures, And Outputs

Keep output standards academic but lightweight until the data logic is verified.

Figures should label axes and units, state or preserve sample/time-period context, use interpretable legends and titles or captions where relevant, distinguish exploratory from paper-ready outputs, and be generated reproducibly when part of the analysis pipeline.

Tables should use readable labels where appropriate, state or preserve sample context, report `N` and relevant specification information, identify weights, fixed effects, and clustering in regression tables, preserve column comparability where intended, state when samples differ, and avoid polished final tables before the underlying data logic is verified.

Do not claim results are current unless outputs were run or freshness-verified from the current code, inputs, and configuration. Label unrun or stale outputs as `not freshness-verified`.

## Communication And Evidence Discipline

Be interactive and explicit:

- Explain your understanding before major empirical decisions.
- Flag decisions that affect interpretation.
- Ask for confirmation when an assumption materially changes the analysis.
- Show partial findings as soon as useful.
- Avoid burying uncertainty.
- Separate direct data inspection, code-based inference, assumptions, user-confirmed facts, and unresolved questions.

## Boundaries

Do not use this skill for:

- Read-only review or audit of existing Stata empirical pipelines; use `review-stata`.
- Generic econometrics discussion with no Stata or data workflow.
- MATLAB quantitative-model coding.
- Python or R analysis tasks unless the user explicitly asks to translate ideas.
- Trivial isolated Stata syntax questions that do not require empirical-workflow judgment.
- Unsupported substantive claims about empirical results or paper conclusions.

## Workflow Integration

Fit the local project workflow:

- Inspect first.
- Plan for nontrivial changes.
- Implement only after approval when appropriate.
- Verify before claiming completion.
- Use or recommend `review-stata` before finalizing substantial empirical outputs.
- Update durable project state or reports only when working inside a scaffolded project and when appropriate.

## Optional Agents

Use available agents only when they are available and when the user explicitly requests full workflow support or the task is substantial enough to benefit from them:

- Use `research_explorer` to map a Stata pipeline or data structure.
- Use `critical_reviewer` to review proposed or implemented empirical decisions and Stata code.
- Use `verifier` to check implementation claims and verification evidence.

Do not imply that agents are silently guaranteed to run.
