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
- Tests, builds, linters, or parse checks.
- File existence and content checks.
- Data provenance checks.
- Numerical sanity checks.
- Output comparisons.
- Manual artifact inspection.

For research work, verification should pay special attention to data inputs, sample definitions, model assumptions, intermediate outputs, and final reported results.

## Reporting

Verification notes should state:

- What was checked.
- How it was checked.
- What passed.
- What failed.
- What remains unverified.

Record substantial verification evidence in session logs, checkpoints, or review reports under `quality_reports/`.
