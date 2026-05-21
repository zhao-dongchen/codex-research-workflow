# Empirical Plan Standards

This reference preserves the detailed planning checklist for `empirical-analysis-planner`. Use it when the empirical design is substantial, ambiguous, or likely to affect interpretation.

## Inputs To Inspect

- User research question or project description.
- `AGENTS.md`, `PROJECT_PROFILE.md`, and `PROJECT_STATE.md`.
- Paper drafts, notes, slides, theory/model files, and literature notes.
- Data orientation or exploration reports.
- Variable dictionaries, codebooks, labels, and metadata.
- Existing do-files, logs, tables, figures, and previous empirical results.

## Research Question To Data Mapping

For each key concept, identify:

- candidate variable
- source dataset
- measurement unit
- required transformation
- missingness or coverage concern
- whether it is directly observed, constructed, proxied, or unavailable
- whether the proxy changes the interpretation

Do not assume that a variable answers the research question because it has a plausible name.

## Sample And Unit Plan

State:

- intended unit of observation
- time frequency
- target population
- minimal baseline sample
- essential and optional restrictions
- restrictions that change interpretation
- whether a balanced panel, event sample, or matched sample is necessary

Prefer the broadest defensible baseline sample unless the empirical design requires otherwise.

## Descriptive Evidence Plan

Before complex regressions, consider:

- summary statistics
- coverage over time
- missingness by year or group
- distributions and outlier checks
- time-series patterns
- group comparisons and cross-tabs
- binned relationships
- event-time plots, if relevant
- sample composition changes

Each descriptive exercise should serve the research question or diagnose feasibility.

## Baseline Specification Ladder

For each proposed specification, state:

- outcome variable
- main explanatory variable or treatment
- sample and unit of observation
- controls
- fixed effects
- clustering
- weights
- interpretation
- whether the specification is descriptive, associational, predictive, or causal

Start simple, then add complexity transparently. Do not invent a causal identification strategy when the design is not established.

## Tables And Figures

A coherent sequence might include:

- sample summary statistics
- data coverage or key time-series pattern
- distribution of key variables
- baseline correlations or regressions
- robustness or heterogeneity
- sample construction or alternative definitions in appendices

Avoid large output plans that do not clearly serve the research question.

## Robustness And Sensitivity

Suggest checks only when they address a real risk:

- alternative sample restrictions
- alternative variable definitions
- alternative weights
- alternative fixed effects
- alternative clustering
- outlier handling
- balanced versus unbalanced panels
- time-window changes
- placebo or falsification exercises, if design-appropriate
- heterogeneity or subgroup checks
- alternative merge or matching decisions

## Interpretation Discipline

State what each analysis can support:

- descriptive fact
- correlation or association
- predictive relationship
- mechanism-suggestive evidence
- causal effect, only if the design supports it

If the analysis cannot answer the research question directly, say what it can answer and what additional data or design would be needed.
