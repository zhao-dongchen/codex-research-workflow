# Stata Review Protocol Reference

This is a reference file for Stata review. Independent Stata review is performed by `.codex/agents/stata_reviewer.toml`, which should read this file before reviewing empirical Stata work.

If the main agent applies this checklist itself, the review must be labeled non-independent. Review does not replace verification. Review does not replace scoring. Review findings should inform quality scoring when scoring applies.

## Review Report Structure

Report findings first and separate:

- blockers
- major issues
- minor issues
- verification gaps
- score implications
- recommended fixes or decisions

For each finding, include severity, evidence, why it matters, and a suggested fix or decision. Distinguish directly verified facts, inferences, assumptions, and missing evidence.

## Checklist

### Data Provenance And Dataset Boundaries

- Identify raw, intermediate, and final analysis datasets.
- Check whether generated datasets are traceable to source inputs and code.
- Flag unclear data access status, undocumented external data, or hidden manual steps.
- Confirm raw data are not overwritten by cleaning or analysis scripts.

### Sample Construction

- Check the observation unit, target population, time window, and baseline universe.
- Inspect the sequence of restrictions and sample counts after major restrictions.
- Distinguish mechanically necessary restrictions from analysis-specific choices.
- Flag restrictions that change interpretation, especially if undocumented.

### Merge Logic And Diagnostics

- Check intended merge relationships, keys, uniqueness, and time alignment.
- Flag unjustified `m:m` merges or merges that can create accidental row expansion.
- Inspect match rates overall and by important groups or periods when available.
- Confirm merge indicators or diagnostics are preserved long enough to review.

### Variable Definitions And Transformations

- Check source variables, generated variables, labels, transformations, winsorization, trimming, and recoding.
- Flag silent changes in definitions across code, outputs, table notes, and paper text.
- Check whether zeros, missing values, and extended Stata missing values are treated deliberately.

### Missingness And Units

- Inspect missingness for key variables by relevant groups or periods when evidence is available.
- Check units, scales, nominal versus real values, percentages versus fractions, and logged versus level variables.
- Flag ambiguous labels, value ranges, or unit conversions.

### Weights

- Check whether weights are used, which weight type is used, and whether that choice matches the empirical design.
- Flag mismatches between code, table notes, and interpretation.
- Check whether unweighted and weighted interpretations are kept distinct.

### Fixed Effects

- Check that fixed effects match the intended specification and unit/time structure.
- Flag fixed effects that absorb the identifying variation or differ from table labels.
- Check whether singleton or collinearity handling affects interpretation.

### Clustering

- Check clustering level against the treatment, sampling, or error-correlation structure.
- Flag mismatches between code, table notes, and interpretation.
- Check whether too few clusters or nested clustering issues are acknowledged.

### Regression Specifications

- For each reported specification, check outcome, main explanatory variable or treatment, sample, controls, fixed effects, clustering, weights, and time or event structure.
- Confirm table labels and notes match the executed code.
- Flag unsupported causal language or identification claims.

### Descriptive Evidence

- Check that descriptive statistics, distributions, coverage checks, and sample-composition evidence support the empirical setup.
- Flag missing descriptive evidence needed to understand sample construction or key variables.

### Table And Figure Output Freshness

- Check whether tables, figures, derived datasets, and logs were regenerated from current code and inputs.
- Use logs, timestamps, hashes, build output, or command evidence when available.
- Mark outputs `not freshness-verified` when current-generation evidence is missing.

### Logs And Output Evidence

- Check for successful logs, command entrypoints, error handling, output manifests, and generated paths.
- Flag `capture` or suppressed errors that hide failed commands.
- Confirm reported outputs exist and correspond to the relevant run.

### Hardcoded Paths

- Flag private absolute paths, machine-specific globals, and undocumented external locations.
- Check whether path conventions are reproducible or documented.

### Reproducibility

- Check Stata version when available, package dependencies, seeds, entrypoint do-files, path setup, logs, and generated outputs.
- Distinguish rerunnable work from manual, partial, or environment-dependent steps.

### Interpretation And Caveats

- Check that claims match the design: descriptive, associational, predictive, mechanism-suggestive, or causal.
- Flag overclaims and missing caveats.
- Identify decisions that need user confirmation because they alter research interpretation.

### Consistency Between Code, Outputs, And Paper Claims

- Compare do-files, logs, tables, figures, notes, and written claims.
- Flag mismatched sample sizes, variable names, model labels, controls, fixed effects, clustering, weights, coefficient signs, or reported magnitudes.
- State when paper-claim consistency could not be checked because drafts or outputs were unavailable.
