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

## Existing Project Onboarding Gate

When this scaffold is copied into a pre-existing research project, recommend or initiate onboarding before substantial Codex-assisted implementation work unless project-specific orientation is already established.

Before substantial work begins, the project should have:

- A reviewed `PROJECT_PROFILE.md` or equivalent orientation.
- Project-specific agent instructions.
- An initial or updated `PROJECT_STATE.md`.
- A clear record of what is evidence-backed, inferred, assumed, user-confirmed, and unresolved.

This gate should not block narrow, immediate tasks that the user explicitly requests, but missing orientation should be surfaced when it affects safety, reproducibility, or interpretation.

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

Before scoring or finalization:

- Review findings have been addressed or accepted as residual risk.
- Important research assumptions and reproducibility concerns have been considered.
- Evidence supports the completion claim.

## Score Gate

Before finalization for substantial research-code or research-output tasks:

- `workflow/QUALITY_SCORE_PROTOCOL.md` has been applied.
- The score threshold is met, or the user has explicitly accepted the residual risk.
- Any below-threshold override is recorded with the reason and unresolved risks.
- The score is presented as a governance signal, not proof of correctness.

## Handoff Gate

Before ending substantial work:

- `PROJECT_STATE.md` is updated if project state changed.
- Plans, logs, reviews, specs, score reports, or checkpoints are saved when appropriate.
- The final summary states changes, evidence, and residual uncertainty.

## Research-Specific Gate

For academic research work, also check:

- Data provenance is noted.
- Sample construction or calibration assumptions are visible.
- Outputs can be reproduced from recorded commands, environment details, data identifiers, and configuration where feasible.
- Tables, figures, and derived datasets have freshness evidence or are labeled `not freshness-verified`.
- Numerical results have basic sanity checks.
- Claims are tied to evidence rather than memory or intuition.
