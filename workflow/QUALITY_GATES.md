# Quality Gates

Quality gates define when work can move from one stage to the next.

## Planning Gate

Before implementation:

- The objective is clear.
- Scope and non-scope are stated.
- Risks and assumptions are visible.
- Verification and review steps are defined.
- The plan is approved for nontrivial work.

## New-Project Initialization Gate

When this scaffold is copied into a real research project, first establish:

- Research objective.
- Project type.
- Data access class and storage/location convention.
- Software or runtime expectations.
- Reproducibility target.
- Intended output registry or output-location convention.
- Collaboration rules, if relevant.
- Known constraints.

Record these in `PROJECT_STATE.md`, a requirements specification, or project-specific documentation before substantive research work begins.

## Implementation Gate

Before claiming implementation is done:

- For nontrivial work or whenever an approved plan exists, changes match the approved plan.
- Unrelated files are not modified.
- Important assumptions are documented.
- The implementation is ready for verification.

## Verification Gate

Before review:

- Relevant checks have been run where possible.
- Evidence has been recorded.
- Reproducibility evidence includes environment, data, command, configuration, output, and known non-reproducible-step details where relevant.
- Tables, figures, derived datasets, and reported results are freshness-verified or explicitly marked `not freshness-verified`.
- Failures are fixed or explicitly documented.
- Unverified areas are identified.

## Review Gate

Before finalization:

- Review findings have been addressed or accepted as residual risk.
- Important research assumptions and reproducibility concerns have been considered.
- Evidence supports the completion claim.

## Handoff Gate

Before ending substantial work:

- `PROJECT_STATE.md` is updated if project state changed.
- Plans, logs, reviews, specs, or checkpoints are saved when appropriate.
- The final summary states changes, evidence, and residual uncertainty.

## Research-Specific Gate

For academic research work, also check:

- Data provenance is noted.
- Sample construction or calibration assumptions are visible.
- Outputs can be reproduced from recorded commands, environment details, data identifiers, and configuration where feasible.
- Tables, figures, and derived datasets have freshness evidence or are labeled `not freshness-verified`.
- Numerical results have basic sanity checks.
- Claims are tied to evidence rather than memory or intuition.
