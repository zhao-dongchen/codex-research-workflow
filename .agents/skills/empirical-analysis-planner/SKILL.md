---
name: empirical-analysis-planner
description: "Use when the user wants to decide what empirical analyses to run given a research question, project context, and available data evidence. Produces an empirical analysis plan with research-question mapping, variables, samples, descriptive evidence, baseline specifications, tables/figures, robustness checks, and risks. Do not use to run Stata code, clean raw data, or verify outputs."
---

# Empirical Analysis Planner

Use this skill when the user wants to decide what to analyze, how to analyze it, and what evidence would best serve the project.

This skill is for planning empirical strategy. It should use available project context and data-preparation evidence, but it should not be the main skill for cleaning data, writing code, running regressions, or verifying outputs.

## Core Deliverables

Depending on the task, produce:

- Empirical Analysis Plan
- Research Question to Data Mapping
- Variable and Sample Plan
- Descriptive Evidence Plan
- Baseline Specification Ladder
- Tables and Figures Plan
- Robustness and Sensitivity Plan
- Identification and Interpretation Caveats
- Data Gaps and Feasibility Risks
- Recommended Implementation Sequence

## Inputs To Inspect

When available, inspect:

- User’s research question or project description.
- `AGENTS.md`, `PROJECT_PROFILE.md`, and `PROJECT_STATE.md`.
- Paper drafts, notes, slides, or theory/model files.
- Data Orientation Reports.
- Data-prep or exploration reports.
- Variable dictionaries or codebooks.
- Existing do-files, logs, tables, and figures.
- Previous empirical results.
- Relevant literature notes if present.

Distinguish direct evidence from inference.

## Default Workflow

For substantial planning tasks:

1. Restate the research question or empirical goal.
2. Identify the available data and its limitations.
3. Map research concepts to observable variables.
4. Identify the relevant unit of observation.
5. Propose the broadest defensible baseline sample.
6. Design initial descriptive evidence.
7. Propose baseline empirical specifications.
8. Propose robustness and sensitivity checks.
9. Propose tables and figures.
10. Clarify interpretation limits.
11. Recommend an implementation sequence.
12. List unresolved questions and data needs.

## Research Question To Data Mapping

Map each research concept to available or needed data.

For each key concept, identify:

- Candidate variable.
- Source dataset.
- Measurement unit.
- Required transformation.
- Missingness or coverage concern.
- Whether the variable is directly observed, constructed, proxied, or unavailable.
- Whether the proxy changes the interpretation.

Do not assume that a variable answers the research question just because it has a plausible name.

## Sample And Unit Plan

State:

- Intended unit of observation.
- Time frequency.
- Target population.
- Minimal baseline sample.
- Essential restrictions.
- Optional restrictions.
- Restrictions that would change interpretation.
- Whether a balanced panel, event sample, or matched sample is necessary.

Prefer a broad baseline sample unless the empirical design requires otherwise.

If the data are not yet sufficiently understood, recommend `stata-data-prep-exploration` before finalizing the plan.

## Descriptive Evidence Plan

Before proposing complex regressions, identify useful descriptive evidence:

- Summary statistics.
- Variable coverage over time.
- Missingness by year or group.
- Distributions.
- Time-series patterns.
- Group comparisons.
- Cross-tabs.
- Binned relationships.
- Event-time plots, if relevant.
- Sample composition changes.

Explain why each descriptive exercise is useful for the research question.

## Baseline Specification Ladder

When regressions are appropriate, propose a staged specification ladder.

For each proposed specification, state:

- Outcome variable.
- Main explanatory variable or treatment.
- Sample.
- Unit of observation.
- Controls.
- Fixed effects.
- Clustering.
- Weights.
- Interpretation.
- Whether the specification is descriptive, associational, or intended to support causal interpretation.

Start simple, then add complexity transparently.

Avoid inventing a causal identification strategy when the research design is not established.

## Tables And Figures Plan

Propose a coherent output sequence.

Examples:

- Table 1: sample summary statistics.
- Figure 1: data coverage or key time-series pattern.
- Figure 2: distribution of key variable.
- Table 2: baseline correlations or regressions.
- Table 3: robustness or heterogeneity.
- Appendix table: sample construction or alternative definitions.

Explain what each table or figure contributes to the argument.

Avoid producing a large output plan that does not clearly serve the research question.

## Robustness And Sensitivity Plan

Suggest robustness checks that are relevant to the empirical goal.

Possible checks include:

- Alternative sample restrictions.
- Alternative variable definitions.
- Alternative weights.
- Alternative fixed effects.
- Alternative clustering.
- Outlier handling.
- Balanced versus unbalanced panels.
- Different time windows.
- Placebo or falsification exercises, if design-appropriate.
- Heterogeneity or subgroup checks.
- Alternative merge or matching decisions.

Do not add robustness checks mechanically. Explain what risk each check addresses.

## Interpretation Discipline

For every proposed analysis, state what kind of claim it can support:

- Descriptive fact.
- Correlation or association.
- Predictive relationship.
- Mechanism suggestive evidence.
- Causal effect, only if design supports it.

Flag overclaiming risks.

If the analysis cannot answer the user’s research question directly, say what it can answer and what additional data/design would be needed.

## Deliverable Format

For substantial tasks, organize the final plan as:

1. Research goal.
2. Current data basis.
3. Key variables and sample.
4. Descriptive evidence to produce first.
5. Baseline analysis.
6. Tables and figures.
7. Robustness and sensitivity.
8. Interpretation boundaries.
9. Implementation sequence.
10. Unresolved questions.

## Boundaries

Do not use this skill to:

- Clean raw data.
- Run Stata, MATLAB, Python, or R code.
- Produce final empirical outputs.
- Review a do-file in detail.
- Verify whether outputs exist or are fresh.
- Validate whether completed results support a written claim.

Use `stata-data-prep-exploration` for raw data understanding and cleaning.

Use `stata-data-analysis` to implement empirical analysis in Stata.

Use the `stata_reviewer` subagent for independent Stata review when authorized and available. The Stata reviewer applies `.codex/agents/references/stata-review-protocol.md`. If the main agent applies that checklist itself, label the review non-independent.

Use `verifier` to check files, logs, output existence, and freshness when an independent verification actor is available.

Use `critical_reviewer` to assess whether completed results support the intended claim when an independent argument review is needed.

## Optional Agents

Use subagents only when authorized, available, and useful:

- Use `research_explorer` to map project context.
- Use `critical_reviewer` to critique proposed empirical strategy.
- Use `verifier` only for checking concrete artifacts, not for conceptual planning.

Do not imply that subagents are guaranteed to run.

## Final Response Standard

End with:

- Recommended empirical path.
- What should be done first.
- What should wait.
- What depends on unresolved data questions.
- What risks or interpretation limits matter most.
