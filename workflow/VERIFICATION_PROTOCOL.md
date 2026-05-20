# Verification Protocol

Verification means collecting evidence, not asserting confidence.

## Verification Goals

- Confirm the requested behavior or artifact exists.
- Confirm outputs are reproducible where possible.
- Confirm important assumptions are visible.
- Confirm generated results are plausible and internally consistent.
- Identify what could not be verified.

## Evidence Types

Use the evidence appropriate to the task:

- Commands run and their outcomes.
- Relevant software or runtime versions.
- Package, library, or toolbox versions where relevant.
- Data snapshot identifiers, vintages, releases, extract dates, or hashes where feasible.
- Seeds, configuration files, parameters, or options that affect results.
- Generated output paths.
- Known non-reproducible steps.
- Tests, builds, linters, or parse checks.
- File existence and content checks.
- Data provenance checks.
- Numerical sanity checks.
- Output comparisons.
- Manual artifact inspection.

For research work, verification should pay special attention to data inputs, sample definitions, model assumptions, intermediate outputs, and final reported results.

## Output Freshness

Tables, figures, derived datasets, and reported results should be freshness-verified before being called current.

Freshness evidence may include:

- A clean rebuild from current code and inputs.
- A successful target check from the project's build or workflow tool.
- Timestamps plus input and output hashes where appropriate.
- A documented comparison showing the output was generated from the current code, data, and configuration.

If an output was not rebuilt or checked against current code and inputs, state `not freshness-verified`.

## Reporting

Verification notes should state:

- What was checked.
- How it was checked.
- What passed.
- What failed.
- What remains unverified.
- Whether substantive outputs are freshness-verified or `not freshness-verified`.

Record substantial verification evidence in session logs, checkpoints, or review reports under `quality_reports/`.
